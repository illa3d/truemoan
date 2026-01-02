-- TrueMoan v1.8 by illa3d
-------------------------------------------------------------------------------------------------
-- AUTOSEX DEFINITIONS (Act = Interaction)
-------------------------------------------------------------------------------------------------
-- ACUTUAL GAME FUNCTIONS AND LIMITS
-- ACTIVE (penis, hand)
--  interaction.AutoActive = true
--  interaction.m_autoHandActive = true
-- SPEED (penis, hand)
--  interaction.m_autoSpeed = speed (0.001 - 2)
--  interaction.m_autoHandSpeed = speed (0.001 - 2)
-- THRUST (penis, hand)
--  interaction.m_autoThrustWeight = weight (1-3)
--  interaction.m_autoHandThrustWeight = weight (1-3)
-- DEPTH (penis, hand)
--  interaction.m_autoStartDepth = depth (0-0.1.25)
--  interaction.m_autoEndDepth = depth (0.05-1.3)
--  interaction.m_autoHandStartDepth = depth (0-1.25)
--  interaction.m_autoHandEndDepth = depth (0.05-1.3)
-- WEIGHT, MALE VS FEMALE/GIVER VS GETTER (penis)
--  interaction.AutoPenisWeight = weight (0-1)

-- Sex Tweens
-- Active tweens list (for update loop)
local actActiveTweens = {}
-- Fast lookup map: act -> param -> tween
local actActiveTweenMap = {}

-- AutoSexParams
ActAutoSexTimers = ActAutoSexTimers or {}
ActAutoSexTickTime = 0.5 -- seconds (game timer frequency)
ActAutoSexTimerClamp = { Min = 1, Max = 20 } -- seconds (timer to allow new random sex parameter)
-- TweenParams
ActTweenTimeMinMax = { Min = 0.1, Max = 3 } -- seconds (time for parameter tween duration)

-- BODY HOLE ENUM
ActBody = {
	Hand = "Hand",
	Penis = "Penis",
	Mouth = "Mouth",
	Anus = "Anus",
	Vagina = "Vagina",
}

-- INTERACTION PARAMETER ENUM
ActValue = {
	Active = "Active",
	Speed = "Speed",
	Weight = "Weight", -- no hand weight
	Thrust = "Thrust",
	DepthStart = "DepthStart",
	DepthEnd = "DepthEnd",
}

-- GAME PARAMETER VALUE LIMITS (values as they are in TrueFacials)
ActRawMinMax = {
	Speed = { Min = 0.001, Max = 2 },
	Weight = { Min = 0, Max = 1 },
	Thrust = { Min = 1, Max = 3 }, -- raw thrust values
	DepthStart = { Min = 0, Max = 1.2 },
	DepthEnd = { Min = 0.1, Max = 1.3 }
}

-- TRUEMOAN LIPARAMETER VALUE LIMITS (values with thrust normalized)
ActMenuMinMax = {
	Speed = { Min = 0.1, Max = 1 },
	Weight = { Min = 0, Max = 1 },
	Thrust = { Min = 0, Max = 0.6 },
	DepthStart = { Min = 0.2, Max = 0.6 },
	DepthEnd = { Min = 0.5, Max = 1.1 },
}

-- AUTOSEX PARAMETER VALUE LIMITS (values with thrust normalized. bias is minimum move)
ActAutoSexMinMax = {
	Speed = { Min = 0.1, Max = 1.9, Bias = 0.1 },
	Weight = { Min = 0.1, Max = 0.9, Bias = 0.03 },
	Thrust = { Min = 0.1, Max = 0.9, Bias = 0.05 }, -- normalized thrust values
	DepthStart = { Min = 0, Max = 0.5, Bias = 0.1 },
	DepthEnd = { Min = 0.6, Max = 1.2, Bias = 0.1 },
}

-- GAME PARAMETER NAME ENUM - Act (interaction) Parameters (actual names of values in interaction)
ActParam = {
	ActivePenis = "AutoActive",
	ActiveHand = "m_autoHandActive",
	SpeedPenis = "m_autoSpeed",
	SpeedHand = "m_autoHandSpeed",
	ThrustPenis = "m_autoThrustWeight",
	ThrustHand = "m_autoHandThrustWeight",
	WeightPenis = "AutoPenisWeight", -- no hand weight
	DepthStartPenis = "m_autoStartDepth",
	DepthStartHand = "m_autoHandStartDepth",
	DepthEndPenis = "m_autoEndDepth",
	DepthEndHand = "m_autoHandEndDepth",
}

ActAutoSexParams = {
	Speed = { ActValue.Speed, "ActSpeedSet_AutoSexRandom", true },
	Thrust = { ActValue.Thrust, "ActThrustSet_AutoSexRandom", true },
	DepthStart = { ActValue.DepthStart,"ActDepthStartSet_AutoSexRandom", true },
	DepthEnd = { ActValue.DepthEnd, "ActDepthEndSet_AutoSexRandom", true },
	Weight = { ActValue.Weight, "ActWeightSet_AutoSexRandom", false } -- hands dont have weight
}

-------------------------------------------------------------------------------------------------
-- CONFIG VALUES CLAMPING
-------------------------------------------------------------------------------------------------
function SexTweenAllow() return TM_TweenSex and SexTweenTime() > 0 end
function SexTweenTime() return ClampValue(TM_TweenTime, ActTweenTimeMinMax.Min , ActTweenTimeMinMax.Max) end
function AutoSexMinTime() return ClampValue(TM_AutoSexTimeMin, ActAutoSexTimerClamp.Min , ActAutoSexTimerClamp.Max) end
function AutoSexMaxTime() return ClampValue(TM_AutoSexTimeMax, ActAutoSexTimerClamp.Min , ActAutoSexTimerClamp.Max) end
function AutoSexDrift(actValue)
	if actValue == ActValue.Speed then return Clamp01(TM_AutoSexSpeedDrift)
	elseif actValue == ActValue.Thrust then return Clamp01(TM_AutoSexThrustDrift)
	elseif actValue == ActValue.Weight then return Clamp01(TM_AutoSexWeightDrift)
	elseif actValue == ActValue.DepthStart then return Clamp01(TM_AutoSexDepthStartDrift)
	elseif actValue == ActValue.DepthEnd then return Clamp01(TM_AutoSexDepthEndDrift)
	else return 0 end
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- BODY / SEX / INTERACTION
--===============================================================================================
-------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------
-- SEX / BODY HOLES / SEXPARTNER(fucker)
-------------------------------------------------------------------------------------------------
function HasSexPartnerHoles(human) return HasSexPartner(human, ActBody.Mouth) or HasSexPartner(human, ActBody.Anus) or HasSexPartner(human, ActBody.Vagina) end
function HasSexPartnerHand(human) return HasSexPartner(human, ActBody.Hand) end
function HasSexPartnerPenis(human) return HasSexPartner(human, ActBody.Penis) end

function HasSexPartner(human, body)
	if human == nil then return false end
	if body == ActBody.Hand and human.Penis.m_holdDepth ~= 0 then return true
	elseif body == ActBody.Penis and human.Penis.Hole ~= nil then return true
	elseif body == ActBody.Mouth and human.Mouth.Fucker ~= nil then return true
	elseif body == ActBody.Anus and human.Anus.Fucker ~= nil then return true
	elseif body == ActBody.Vagina and human.Vagina.Fucker ~= nil then return true
	else return false end
end

function GetSexPartner(human, body)
	if human == nil then return nil end
	if body == ActBody.Mouth and human.Mouth.Fucker ~= nil then return human.Mouth.Fucker
	elseif body == ActBody.Anus and human.Anus.Fucker ~= nil then return human.Anus.Fucker
	elseif body == ActBody.Vagina and human.Vagina.Fucker ~= nil then return human.Vagina.Fucker
	else return nil end
end

function GetSexPartners(human)
	local partners = {}
	if human == nil then return partners end
	for _, body in pairs(ActBody) do
		if HasSexPartner(human, body) then
			local partner = GetSexPartner(human, body)
			if partner ~= nil then table.insert(partners, partner) end
		end
	end return partners
end

function IsSexActive(human, body)
	if human == nil or not HasSexPartner(human, body) or ActGet(human, body) == nil then return false end
	if body == ActBody.Hand and human.Penis.Interaction.m_autoHandActive == true then return true
	elseif body == ActBody.Penis and human.Penis.Interaction.AutoActive == true then return true
	elseif body == ActBody.Mouth and human.Mouth.Fucker.Penis.Interaction.AutoActive == true then return true
	elseif body == ActBody.Anus and human.Anus.Fucker.Penis.Interaction.AutoActive == true then return true
	elseif body == ActBody.Vagina and human.Vagina.Fucker.Penis.Interaction.AutoActive == true then return true
	else return false end
end

function IsAutoSexPartner(human, body)
	if human == nil or not HasSexPartner(human, body) then return false
	if body == ActBody.Mouth and IsAutoSex(human.Mouth.Fucker) then return true
	elseif body == ActBody.Anus and IsAutoSex(human.Anus.Fucker) then return true
	elseif body == ActBody.Vagina and IsAutoSex(human.Vagina.Fucker) then return true
	else return false end
end

-------------------------------------------------------------------------------------------------
-- WETNESS
-------------------------------------------------------------------------------------------------
function IsWet(human) return IsWetBody(human, ActBody.Mouth) or IsWetBody(human, ActBody.Anus) or IsWetBody(human, ActBody.Vagina) end

function IsWetBody(human, body)
	if body == ActBody.Mouth and human.m_mouth.m_wetness > 0 then return true
	elseif body == ActBody.Anus and human.m_anus.m_wetness > 0 then return true
	elseif body == ActBody.Vagina and human.m_vagina.m_wetness > 0 then return true
	else return false end
end

function WetGet(human, body)
	if body == ActBody.Mouth then return human.m_mouth.m_wetness
	elseif body == ActBody.Anus then return human.m_anus.m_wetness
	elseif body == ActBody.Vagina then return human.m_vagina.m_wetness
	else return 0 end
end

function WetReset(girl)
	WetSet(girl, 0, ActBody.Vagina)
	WetSet(girl, 0, ActBody.Anus)
	WetSet(girl, 0, ActBody.Mouth)
end

function WetSet(girl, value, actBody)
	if girl == nil or value == nil  or actBody == nil or girl.m_isMale == true then return end
	if actBody == ActBody.Mouth then girl.m_mouth.m_wetness = value
	elseif actBody == ActBody.Anus then girl.m_anus.m_wetness = value
	elseif actBody == ActBody.Vagina then girl.m_vagina.m_wetness = value end
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- INTERACTION CONVERSIONS
--===============================================================================================
-------------------------------------------------------------------------------------------------
-- Get Interaction parameter
function ActValueParamNameGet(actValue, isHand)
	if actValue == ActValue.Active then return isHand and ActParam.ActiveHand or ActParam.ActivePenis
	elseif actValue == ActValue.Speed then return isHand and ActParam.SpeedHand or ActParam.SpeedPenis
	elseif actValue == ActValue.Thrust then return isHand and ActParam.ThrustHand or ActParam.ThrustPenis
	elseif actValue == ActValue.DepthStart then return isHand and ActParam.DepthStartHand or ActParam.DepthStartPenis
	elseif actValue == ActValue.DepthEnd then return isHand and ActParam.DepthEndHand or ActParam.DepthEndPenis
	elseif actValue == ActValue.Weight then return ActParam.WeightPenis
	else return nil end
end

-- Set Interaction value
function ActValueSet_Raw(act, actValue, isHand, value) act[ActValueParamNameGet(actValue, isHand)] = value end

-- Get Interaction value from interaction
function ActValueGet_Raw(act, actValue, isHand)
	local function GetActParamValue(act, param) return act[param] end
	if actValue == ActValue.Active then return GetActParamValue(act, ActValueParamNameGet(ActValue.Active, isHand))
	elseif actValue == ActValue.Speed then return GetActParamValue(act, ActValueParamNameGet(ActValue.Speed, isHand))
	elseif actValue == ActValue.Thrust then return GetActParamValue(act, ActValueParamNameGet(ActValue.Thrust, isHand))
	elseif actValue == ActValue.DepthStart then return GetActParamValue(act, ActValueParamNameGet(ActValue.DepthStart, isHand))
	elseif actValue == ActValue.DepthEnd then return GetActParamValue(act, ActValueParamNameGet(ActValue.DepthEnd, isHand))
	elseif actValue == ActValue.Weight then return GetActParamValue(act, ActParam.WeightPenis)
	else return nil end
end

-- Get interaction from human and body part
function ActGet(human, body)
	if not HasSexPartner(human, body) then return nil end
	if body == ActBody.Hand then return human.Penis.Interaction
	elseif body == ActBody.Penis then return human.Penis.Interaction
	elseif body == ActBody.Mouth then return human.Mouth.Fucker.Penis.Interaction
	elseif body == ActBody.Anus then return human.Anus.Fucker.Penis.Interaction
	elseif body == ActBody.Vagina then return human.Vagina.Fucker.Penis.Interaction
	else return nil end
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- INTERACTION PARAMETER VALUE (Speed, Thrust, DepthStart, DepthEnd, Weight)
--===============================================================================================
-------------------------------------------------------------------------------------------------
-- ACTUAL PARAMETER VALUE (actual game value, If tween exists, target is the next destination of the value. If not, just take raw value from the game)
function ActValueGet_Current(interaction, actValue, isHand)
	if not interaction then return 0 end
	if actValue == ActValue.Active then return ActTweenOrValueGet(interaction, ActValueParamNameGet(actValue, isHand)) and 1 or 0 end
	if actValue == ActValue.Weight and isHand then return 0 end
	if actValue == ActValue.Thrust then return NormalizeValue(ActTweenOrValueGet(interaction, ActValueParamNameGet(actValue, isHand)),1,3) end-- IMPORTANT: return NORMALIZED thrust (0-1)
	return ActTweenOrValueGet(interaction, ActValueParamNameGet(actValue, isHand))
end

-- RAW PARAMETER VALUE (actual game value, might be tweened, tween target is "new value" tween is going to)
function ActValueGet_RawMinMax(value, actValue)
	local mm = ActRawMinMax[actValue]
	return mm and ClampValue(value, mm.Min, mm.Max) or value
end

-- RANDOM QUICK PARAMETER VALUE (new generated value, used in menu, "quick wide random" for responsive "FeelingLucky")
function ActValueGet_MenuMinMax(actValue)
	local r = ActMenuMinMax[actValue] return r and GetRandomFloat(r.Min, r.Max) or 0
end

-- RANDOM SLOW PARAMETER VALUE (new generated value, used in AutoSex, slowly drifts around so user can define new starting point)
function ActValueGet_AutoSexMinMax(interaction, actValue, isHand)
	local rn = ActAutoSexMinMax[actValue] if not rn then return 0 end
	return GetRandomFloatNear(ActValueGet_Current(interaction, actValue, isHand), AutoSexDrift(actValue), rn.Min, rn.Max, rn.Bias )
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- AUTO SEX
--===============================================================================================
-------------------------------------------------------------------------------------------------
function AutoSexToggle(human) AutoSex(human, not IsAutoSex(human)) end
function AutoSexStart(human) AutoSex(human, true) end
function AutoSexStop(human) AutoSex(human, false) end
function AutoSex(human, active)
	if active then game.AddRepeatAnim(ActAutoSexTickTime, || AutoSexOnTick(human), human.calfNames)
	else game.RemoveAnim(human.calfNames) end 
end
function IsAutoSex(human) return human and game.HasAnim(human.calfNames) end -- faunalabs took most of the assignments, this is one that exists lol

-- CALLED FROM GAME REPEATING ANIMATION SYSTEM (game.AddRepeatAnim)
-- Randomize all active interactions
function AutoSexOnTick(human)
	if human == nil then return end
	if IsSexActive(human, ActBody.Hand) then AutoSexBodyParamSet(ActGet(human, ActBody.Hand), true) end
	if IsSexActive(human, ActBody.Penis) then AutoSexBodyParamSet(ActGet(human, ActBody.Penis), false) end
	-- prevent multiple actors setting autosex on same interactions
	if IsSexActive(human, ActBody.Mouth) and not IsAutoSexPartner(human, ActBody.Mouth) then AutoSexBodyParamSet(ActGet(human, ActBody.Mouth), false) end
	if IsSexActive(human, ActBody.Anus) and not IsAutoSexPartner(human, ActBody.Anus) then AutoSexBodyParamSet(ActGet(human, ActBody.Anus), false) end
	if IsSexActive(human, ActBody.Vagina) and not IsAutoSexPartner(human, ActBody.Vagina) then AutoSexBodyParamSet(ActGet(human, ActBody.Vagina), false) end
end

-- START INTERACTION PARAMETER SET (Calculate timer against ticker and fire events for each active interaction)
function AutoSexBodyParamSet(interaction, isHand)
	if not interaction then return end
	-- Pre-init timers once per interaction
	local timers = ActAutoSexTimers[interaction]
	if not timers then
		timers = { [true] = {}, [false] = {} }
		ActAutoSexTimers[interaction] = timers
	end
	local timer = timers[isHand]
	for key, p in pairs(ActAutoSexParams) do
		local actValue, funcName, allowHand = p[1], p[2], p[3]
		-- If AutoSex drift is 0, don't animate parameters
		if AutoSexDrift(actValue) > 0 and (not isHand or allowHand) then
			-- Subtract small value
			timer[key] = (timer[key] or 0) - ActAutoSexTickTime
			if timer[key] <= 0 then
				local f = _G[funcName]
				-- START RANDOM TWEEN/RAW INTERACTION PARAMETER VALUE (ActAutoSexParams: Speed, Thrust, DepthStart, DepthEnd, Weight)
				-- If SexTweenAllow() is allowed, this is where the tween starts. If not, raw value is changed directly
				if f then f(interaction, isHand) end
				-- Next execution time: Add a timer for how long this parameter will not be fired again
				timer[key] = GetRandom(AutoSexMinTime(), AutoSexMaxTime())
			end
		end
	end
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- INTERACTION
--===============================================================================================
-------------------------------------------------------------------------------------------------
function ActActiveSet(interaction, isHand, isActive) ActValueSet_Raw(interaction, ActValue.Active, isHand, isActive) end
function ActActiveSet_Human(human, actBody, isActive) ActActiveSet(ActGet(human, actBody), actBody == ActBody.Hand, isActive) end
function ActActiveSetAll_Human(human, isActive)
	if IsSexActive(human, ActBody.Hand) then ActActiveSet(ActGet(human, ActBody.Hand), true, isActive) end
	if IsSexActive(human, ActBody.Penis) then ActActiveSet(ActGet(human, ActBody.Penis), false, isActive) end
	if IsSexActive(human, ActBody.Mouth) then ActActiveSet(ActGet(human, ActBody.Mouth), false, isActive) end
	if IsSexActive(human, ActBody.Vagina) then ActActiveSet(ActGet(human, ActBody.Vagina), false, isActive) end
	if IsSexActive(human, ActBody.Anus) then ActActiveSet(ActGet(human, ActBody.Anus), false, isActive) end
end

function ActValueGet_ByBody(human, body, actValue)
	local isHand = body == ActBody.Hand
	if actValue == ActValue.Speed then return ActSpeedGet(ActGet(human, body), isHand)
	elseif actValue == ActValue.Thrust then return ActThrustGet(ActGet(human, body), isHand)
	elseif actValue == ActValue.Weight then return ActWeightGet(ActGet(human, body), isHand)
	elseif actValue == ActValue.DepthStart then return ActDepthGet(ActGet(human, body), isHand, true)
	elseif actValue == ActValue.DepthEnd then return ActDepthGet(ActGet(human, body), isHand, false)
	elseif actValue == ActValue.Active then return IsSexActive(human, body) and 1 or 0 end
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- INTERACTION PARAMS (Speed, Weight, Thrust, Depth)
--===============================================================================================
-------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------
-- INTERACTION SPEED (PENIS/HAND) (0.001 - 2), UI ALLOWS ONLY (0.001 - 0.5)
-------------------------------------------------------------------------------------------------
-- GET
function ActSpeedGet_Raw(interaction, isHand) return ActValueGet_Raw(interaction, ActValue.Speed, isHand) end
function ActSpeedGet(interaction, isHand) return ActTweenOrValueGet(interaction, ActValueParamNameGet(ActValue.Speed, isHand)) end

-- RANDOM
function ActSpeedSet_MenuRandom(interaction, isHand) return ActSpeedSet(interaction, ActValueGet_MenuMinMax(ActValue.Speed), isHand) end
function ActSpeedSet_AutoSexRandom(interaction, isHand)
	return ActSpeedSet(interaction, ActValueGet_AutoSexMinMax(interaction, ActValue.Speed, isHand), isHand )
end

-- SET
function ActSpeedSet_Step(interaction, speedStep, increase, isHand)
	local speed = ActSpeedGet(interaction, isHand) -- Use Target Value to prevent dampening
	local increment = 1 + (speedStep / (speed ^ 0.6)) -- 1 + (speed multiplier / (speed / curve))
	if increase then speed = speed * increment
	else speed = speed / increment end
	return ActSpeedSet(interaction, speed, isHand)
end
function ActSpeedSet(interaction, speed, isHand)
	local speed = ActValueGet_RawMinMax(speed, ActValue.Speed)
	ActActiveSet(interaction, isHand, true)
	if SexTweenAllow() then ActTweenTo(interaction, ActValueParamNameGet(ActValue.Speed, isHand), speed, SexTweenTime())
	else ActValueSet_Raw(interaction, ActValue.Speed, isHand, speed) end
	return speed
end

-------------------------------------------------------------------------------------------------
-- INTERACTION WEIGHT (PENIS) (GIVER VS GETTER) (0-1)
-------------------------------------------------------------------------------------------------

-- GET
function ActWeightGet_Raw(interaction, isHand) return ActValueGet_Raw(interaction, ActValue.Weight, isHand) end
function ActWeightGet(interaction, isHand) return isHand and 0 or ActTweenOrValueGet(interaction, ActParam.WeightPenis) end

-- RANDOM
function ActWeightSet_MenuRandom(interaction, isHand) return ActWeightSet(interaction, ActValueGet_MenuMinMax(ActValue.Weight), isHand) end
function ActWeightSet_AutoSexRandom(interaction, isHand)
	return ActWeightSet(interaction, ActValueGet_AutoSexMinMax(interaction, ActValue.Weight, false), false) -- ignore isHand (hands don't have weights)
end

-- SET
function ActWeightSet_Step(interaction, weightStep, increase, isHand)
	local weight = ActWeightGet(interaction, isHand) -- Use Target Value to prevent dampening
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	return ActWeightSet(interaction, weight, isHand)
end
function ActWeightSet(interaction, weight, isHand)
	if isHand then return end -- no interaction weight in handjobs
	local weight = ActValueGet_RawMinMax(weight, ActValue.Weight)
	ActActiveSet(interaction, false, true)
	if SexTweenAllow() then ActTweenTo(interaction, ActParam.WeightPenis, weight, SexTweenTime())
	else ActValueSet_Raw(interaction, ActValue.Weight, false, weight) end
	return weight
end

-------------------------------------------------------------------------------------------------
-- INTERACTION THRUST (PENIS/HAND) (normalized 0-1 to actual 1-3)
-------------------------------------------------------------------------------------------------
-- GET
function ActThrustGet_Raw(interaction, isHand) return NormalizeValue(ActValueGet_Raw(interaction, ActValue.Thrust, isHand), 1, 3) end
function ActThrustGet(interaction, isHand) return NormalizeValue(ActTweenOrValueGet(interaction, ActValueParamNameGet(ActValue.Thrust, isHand)), 1, 3) end

-- RANDOM
function ActThrustSet_MenuRandom(interaction, isHand) return ActThrustSet(interaction, ActValueGet_MenuMinMax(ActValue.Thrust), isHand) end
function ActThrustSet_AutoSexRandom(interaction, isHand)
	return ActThrustSet(interaction, ActValueGet_AutoSexMinMax(interaction, ActValue.Thrust, isHand), isHand)
end

-- SET
function ActThrustSet_Step(interaction, weightStep, increase, isHand)
	local weight = ActThrustGet(interaction, isHand) -- Use Target Value to prevent dampening
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	return ActThrustSet(interaction, weight, isHand)
end
function ActThrustSet(interaction, weight, isHand)
	local weight = DenormalizeValue(Clamp01(weight), 1, 3)
	ActActiveSet(interaction, isHand, true)
	if SexTweenAllow() then ActTweenTo(interaction, ActValueParamNameGet(ActValue.Thrust, isHand), weight, SexTweenTime())
	else ActValueSet_Raw(interaction, ActValue.Thrust, isHand, weight) end
	return weight
end

-------------------------------------------------------------------------------------------------
-- INTERACTION THRUST DEPTH (PENIS/HAND) (0-1)
-------------------------------------------------------------------------------------------------
-- GET
function ActDepthGet_Raw(interaction, isHand, isStartDepth)
	return ActValueGet_Raw(interaction, isStartDepth and ActValue.DepthStart or ActValue.DepthEnd, isHand)
end
function ActDepthGet(interaction, isHand, isStartDepth)
	local param = ActValueParamNameGet(isStartDepth and ActValue.DepthStart or ActValue.DepthEnd, isHand)
	return ActTweenOrValueGet(interaction, param)
end

-- RANDOM SPLIT
function ActDepthStartSet_MenuRandom(interaction, isHand) return ActDepthSet(interaction, ActValueGet_MenuMinMax(ActValue.DepthStart), isHand, true) end
function ActDepthStartSet_AutoSexRandom(interaction, isHand)
	return ActDepthSet(interaction, ActValueGet_AutoSexMinMax(interaction, ActValue.DepthStart, isHand), isHand, true)
end
function ActDepthEndSet_MenuRandom(interaction, isHand) return ActDepthSet(interaction, ActValueGet_MenuMinMax(ActValue.DepthEnd), isHand, false) end
function ActDepthEndSet_AutoSexRandom(interaction, isHand)
	return ActDepthSet(interaction, ActValueGet_AutoSexMinMax(interaction, ActValue.DepthEnd, isHand), isHand, false)
end

-- RANDOM TOGETHER
function ActDepthSet_MenuRandom(interaction, isHand)
	local startValue = ActDepthSet(interaction, ActValueGet_MenuMinMax(ActValue.DepthStart), isHand, true)
	local endValue = ActDepthSet(interaction, ActValueGet_MenuMinMax(ActValue.DepthEnd), isHand, false)
	return startValue, endValue
end
function ActDepthSet_AutoSexRandom(interaction, isHand)
	ActDepthSet_StartEnd(interaction, ActValueGet_AutoSexMinMax(interaction, ActValue.DepthStart, isHand), ActValueGet_AutoSexMinMax(interaction, ActValue.DepthEnd, isHand), isHand)
end

-- SET STEP
function ActDepthSet_Step(interaction, depthStep, increase, isHand, isStartDepth)
	local depth = ActDepthGet(interaction, isHand, isStartDepth) -- Use Target Value to prevent dampening
	if increase then depth = depth + depthStep
	else depth = depth - depthStep end
	return ActDepthSet(interaction, depth, isHand, isStartDepth)
end
-- SET TOGETHER
function ActDepthSet_StartEnd(interaction, depthStart, depthEnd, isHand)
	ActDepthSet(interaction, depthStart, isHand, true)
	ActDepthSet(interaction, depthEnd, isHand, false)
end
-- SET SPLIT
function ActDepthSet(interaction, depth, isHand, isStartDepth)
	depth = ActValueGet_RawMinMax(depth, isStartDepth and ActValue.DepthStart or ActValue.DepthEnd )
	ActActiveSet(interaction, isHand, true)
	if SexTweenAllow() then
		local paramName = ActValueParamNameGet(isStartDepth and ActValue.DepthStart or ActValue.DepthEnd, isHand)
		ActTweenTo(interaction, paramName, depth, SexTweenTime())
	elseif isStartDepth then ActValueSet_Raw(interaction, ActValue.DepthStart, isHand, depth)
	else ActValueSet_Raw(interaction, ActValue.DepthEnd, isHand, depth) end
	return depth
end


-------------------------------------------------------------------------------------------------
--===============================================================================================
-- TWEENING
--===============================================================================================
-------------------------------------------------------------------------------------------------

-- Gets value from TWEEN TARGET or RAW
-- If a tween exists, return its TARGET (not interpolated value)
function ActTweenOrValueGet(act, param)
	-- SCENARIO A: A tween is currently running.
	-- We loop through the list to find it.
	local actMap = actActiveTweenMap[act]
	if actMap then
		local t = actMap[param]
		if t then
			-- We found a tween! Return where it is GOING (Target), 
			-- not where it is right now.
			return t.targetVal
		end
	end
	-- SCENARIO B: No tween found. 
	-- (Either the UI just opened, or the tween finished and was removed).
	-- We return the underlying value directly from the object.
	return act[param]
end

-- Start a tween on a specific property of the interaction object
function ActTweenTo(act, param, targetValue, duration)
	if not act or not param then return end
	-- Initialize map for this interaction
	actActiveTweenMap[act] = actActiveTweenMap[act] or {}
	local actMap = actActiveTweenMap[act]
	-- Remove existing tween for this parameter
	local existing = actMap[param]
	if existing then
		for i = #actActiveTweens, 1, -1 do
			if actActiveTweens[i] == existing then
				actActiveTweens[i] = actActiveTweens[#actActiveTweens]
				actActiveTweens[#actActiveTweens] = nil
				break
			end
		end
		actMap[param] = nil
	end
	-- Duration fallback
	duration = duration or 0.5
	-- Instant set
	if duration <= 0.001 then act[param] = targetValue return
	end
	-- Create tween
	local tween = {
		object = act,
		param = param,
		startVal = act[param],
		targetVal = targetValue,
		duration = duration,
		elapsed = 0
	}
	table.insert(actActiveTweens, tween)
	actMap[param] = tween
end

-- Update all active tweens
function OnUpdate_ActTweens(deltaTime)
	if not SexTweenAllow() or #actActiveTweens == 0 then return end
	for i = #actActiveTweens, 1, -1 do
		local t = actActiveTweens[i]
		t.elapsed = t.elapsed + deltaTime
		if t.elapsed >= t.duration then
			-- finish
			t.object[t.param] = t.targetVal
			local actMap = actActiveTweenMap[t.object]
			if actMap then
				actMap[t.param] = nil
				if next(actMap) == nil then
					actActiveTweenMap[t.object] = nil
				end
			end
			-- swap-remove
			actActiveTweens[i] = actActiveTweens[#actActiveTweens]
			actActiveTweens[#actActiveTweens] = nil
		else
			local p = t.elapsed / t.duration
			-- EASING - https://easings.net
			-- local ease = p * p * (3 - 2 * p) --SmoothStep
			local ease = 1 - (1 - p) * (1 - p) --OutQuad
			t.object[t.param] = t.startVal + (t.targetVal - t.startVal) * ease
		end
	end
end