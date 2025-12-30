-- TrueMoan v1.7 by illa3d
-------------------------------------------------------------------------------------------------
-- AUTOSEX DEFINITIONS (Act = Interaction)
-------------------------------------------------------------------------------------------------
-- Sex Tweens
local actActiveTweens = {}

-- Body enums
ActBody = {
	Hand = "Hand",
	Penis = "Penis",
	Mouth = "Mouth",
	Anus = "Anus",
	Vagina = "Vagina",
}

ActValue = {
	Active = "Active",
	Speed = "Speed",
	Weight = "Weight", -- no hand weight
	Thrust = "Thrust",
	DepthStart = "DepthStart",
	DepthEnd = "DepthEnd",
}

ActMinMax = {
	Speed = { Min = 0.001, Max = 2 },
	Weight = { Min = 0, Max = 1 },
	Thrust = { Min = 1, Max = 3 },
	DepthStart = { Min = 0, Max = 1.2 },
	DepthEnd = { Min = 0.1, Max = 1.3 }
}

ActRandomNear = {
	Speed = { Min = 0.1, Max = 1.9, Bias = 0.1 },
	Weight = { Min = 0.1, Max = 0.9, Bias = 0.03 },
	Thrust = { Min = 0.1, Max = 0.9, Bias = 0.05 },
	DepthStart = { Min = 0, Max = 0.5, Bias = 0.1 },
	DepthEnd = { Min = 0.6, Max = 1.2, Bias = 0.1 },
}


-- Act (interaction) Parameters (actual names of values in interaction)
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
-- Act Parameters descriptions
-- ENABLE (penis, hand)
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
-- GIVER VS GETTER (penis)
--  interaction.AutoPenisWeight = weight (0-1)

-- AutoSexParams
ActAutoSexTimers = ActAutoSexTimers or {}
ActAutoSexTickTime = 0.25
ActAutoSexParams = {
	Speed = { ActValue.Speed, "ActSpeedSet_RandomNear", true },
	Thrus = { ActValue.Thrust, "ActThrustSet_RandomNear", true },
	DeptS = { ActValue.DepthStart,"ActDepthStartSet_RandomNear", true },
	DeptE = { ActValue.DepthEnd, "ActDepthEndSet_RandomNear", true },
	Weigh = { ActValue.Weight, "ActWeightSet_RandomNear", false } -- hands dont have weight
}

-------------------------------------------------------------------------------------------------
-- CONFIG VALUES CLAMPING
-------------------------------------------------------------------------------------------------
function SexTweenAllow() return TM_TweenSex and SexTweenTime() > 0 end
function SexTweenTime() return ClampValue(TM_TweenTime, 0.1, 3) end
function AutoSexMinTime() return ClampValue(TM_AutoSexTimeMin,1,20) end
function AutoSexMaxTime() return ClampValue(TM_AutoSexTimeMax,1,20) end
function AutoSexDrift(actValue)
	if actValue == ActValue.Speed then return Clamp01(TM_AutoSexSpeedDrift)
	elseif actValue == ActValue.Thrust then return Clamp01(TM_AutoSexThrustDrift)
	elseif actValue == ActValue.Weight then return Clamp01(TM_AutoSexWeightDrift)
	elseif actValue == ActValue.DepthStart then return Clamp01(TM_AutoSexDepthStartDrift)
	elseif actValue == ActValue.DepthEnd then return Clamp01(TM_AutoSexDepthEndDrift)
	else return 0.5 end
end

-------------------------------------------------------------------------------------------------
-- BODY / SEX / INTERACTION
-------------------------------------------------------------------------------------------------

-- SEX
function HasSex(human, body)
	if human == nil then return false
	if body == ActBody.Hand and human.Penis.m_holdDepth ~= 0 then return true
	elseif body == ActBody.Penis and human.Penis.Hole ~= nil then return true
	elseif body == ActBody.Mouth and human.Mouth.Fucker ~= nil then return true
	elseif body == ActBody.Anus and human.Anus.Fucker ~= nil then return true
	elseif body == ActBody.Vagina and human.Vagina.Fucker ~= nil then return true
	else return false end
end

function IsSexActive(human, body)
	if human == nil or not HasSex(human, body) or ActGet(human, body) == nil then return false end
	if body == ActBody.Hand and human.Penis.Interaction.m_autoHandActive == true then return true
	elseif body == ActBody.Penis and human.Penis.Interaction.AutoActive == true then return true
	elseif body == ActBody.Mouth and human.Mouth.Fucker.Penis.Interaction.AutoActive == true then return true
	elseif body == ActBody.Anus and human.Anus.Fucker.Penis.Interaction.AutoActive == true then return true
	elseif body == ActBody.Vagina and human.Vagina.Fucker.Penis.Interaction.AutoActive == true then return true
	else return false end
end

function IsAutoSexPartner(human, body)
	if human == nil or not HasSex(human, body) then return false
	if body == ActBody.Mouth and IsAutoSex(human.Mouth.Fucker) then return true
	elseif body == ActBody.Anus and IsAutoSex(human.Anus.Fucker) then return true
	elseif body == ActBody.Vagina and IsAutoSex(human.Vagina.Fucker) then return true
	else return false end
end

-- WETNESS
function IsWet(human) return IsWetBody(human, ActBody.Mouth) or IsWetBody(human, ActBody.Anus) or IsWetBody(human, ActBody.Vagina) end

function IsWetBody(human, body)
	if body == ActBody.Mouth and human.m_mouth.m_wetness > 0 then return true
	elseif body == ActBody.Anus and human.m_anus.m_wetness > 0 then return true
	elseif body == ActBody.Vagina and human.m_vagina.m_wetness > 0 then return true
	else return false end
end

function WetValue(human, body)
	if body == ActBody.Mouth then return human.m_mouth.m_wetness
	elseif body == ActBody.Anus then return human.m_anus.m_wetness
	elseif body == ActBody.Vagina then return human.m_vagina.m_wetness
	else return 0 end
end

-------------------------------------------------------------------------------------------------
-- INTERACTION CONVERSIONS
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
	if not HasSex(human, body) then return nil end
	if body == ActBody.Hand then return human.Penis.Interaction
	elseif body == ActBody.Penis then return human.Penis.Interaction
	elseif body == ActBody.Mouth then return human.Mouth.Fucker.Penis.Interaction
	elseif body == ActBody.Anus then return human.Anus.Fucker.Penis.Interaction
	elseif body == ActBody.Vagina then return human.Vagina.Fucker.Penis.Interaction
	else return nil end
end

-------------------------------------------------------------------------------------------------
-- VALUE (Tweened or Raw) - CLAMPED / RANDOM / RANDOMNEAR INTERACTION GETTERS
-------------------------------------------------------------------------------------------------

function ActValueGet_Current(interaction, actValue, isHand)
	if not interaction then return 0 end
	if actValue == ActValue.Active then return ActTweenOrValueGet(interaction, ActValueParamNameGet(actValue, isHand)) and 1 or 0 end
	if actValue == ActValue.Weight and isHand then return 0 end -- no hand
	return ActTweenOrValueGet(interaction, ActValueParamNameGet(actValue, isHand))
end

function ActValueGet_MinMax(value, actValue)
	local mm = ActMinMax[actValue]
	return mm and ClampValue(value, mm.Min, mm.Max) or value
end

function ActValueGet_RandomNear(interaction, actValue, isHand)
	local rn = ActRandomNear[actValue] if not rn then return 0 end
	return GetRandomFloatNear(ActValueGet_Current(interaction, actValue, isHand), AutoSexDrift(actValue), rn.Min, rn.Max, rn.Bias )
end

-------------------------------------------------------------------------------------------------
-- AUTO SEX
-------------------------------------------------------------------------------------------------
function AutoSexToggle(human) AutoSex(human, not IsAutoSex(human)) end
function AutoSexStart(human) AutoSex(human, true) end
function AutoSexStop(human) AutoSex(human, false) end
function AutoSex(human, active)
	if active then game.AddRepeatAnim(ActAutoSexTickTime, || AutoSexTick(human), human.calfNames)
	else game.RemoveAnim(human.calfNames) end 
end
function IsAutoSex(human) return human and game.HasAnim(human.calfNames) end -- faunalabs took most of the assignments, this is one that exists lol

-- Randomize all active interactions
function AutoSexTick(human)
	if human == nil then return end
	if IsSexActive(human, ActBody.Hand) then AutoSexAct(ActGet(human, ActBody.Hand), true) end
	if IsSexActive(human, ActBody.Penis) then AutoSexAct(ActGet(human, ActBody.Penis), false) end
	-- prevent multiple actors setting autosex on same interactions
	if IsSexActive(human, ActBody.Mouth) and not IsAutoSexPartner(human, ActBody.Mouth) then AutoSexAct(ActGet(human, ActBody.Mouth), false) end
	if IsSexActive(human, ActBody.Anus) and not IsAutoSexPartner(human, ActBody.Anus) then AutoSexAct(ActGet(human, ActBody.Anus), false) end
	if IsSexActive(human, ActBody.Vagina) and not IsAutoSexPartner(human, ActBody.Anus) then AutoSexAct(ActGet(human, ActBody.Vagina), false) end
end

-- Calculate timer against ticker and fire events for each active interaction
function AutoSexAct(interaction, isHand)
	if not interaction then return end
	-- BLOWJOB STOPS HANDJOB
	-- local timer = ActAutoSexTimers[interaction]
	-- if not timer then timer = {} ActAutoSexTimers[interaction] = timer end
	-- BLOWJOB AND HANDJOB TOGETHER
	ActAutoSexTimers[interaction] = ActAutoSexTimers[interaction] or {}
	local timer = ActAutoSexTimers[interaction][isHand]
	if not timer then timer = {} ActAutoSexTimers[interaction][isHand] = timer end
	-- end of choice
	for key, p in pairs(ActAutoSexParams) do
		local actValue, funcName, allowHand = p[1], p[2], p[3]
		if AutoSexDrift(actValue) > 0 and (not isHand or allowHand) then
			timer[key] = (timer[key] or 0) - ActAutoSexTickTime
			if timer[key] <= 0 then
				_G[funcName](interaction, isHand)
				timer[key] = GetRandom(AutoSexMinTime(), AutoSexMaxTime())
			end
		end
	end
end

-------------------------------------------------------------------------------------------------
-- INTERACTION
-------------------------------------------------------------------------------------------------
function ActActiveSet(interaction, isHand, isActive) ActValueSet_Raw(interaction, ActValue.Active, isHand, isActive) end
function ActActiveSet_Human(human, actBody, isActive) ActActiveSet(ActGet(human, actBody), actBody == ActBody.Hand, isActive) end
function ActActiveSetAll_Human(human, isActive)
	if IsSexActive(human, ActBody.Hand) then ActActiveSet(ActGet(human, body.Mouth), true, isActive) end
	if IsSexActive(human, ActBody.Penis) then ActActiveSet(ActGet(human, body.Penis), false, isActive) end
	if IsSexActive(human, ActBody.Mouth) then ActActiveSet(ActGet(human, body.Mouth), false, isActive) end
	if IsSexActive(human, ActBody.Vagina) then ActActiveSet(ActGet(human, body.Mouth), false, isActive) end
	if IsSexActive(human, ActBody.Anus) then ActActiveSet(ActGet(human, body.Mouth), false, isActive) end
end

function ActValueGet_ByBody(human, body, actValue)
	local isHand = body == ActBody.Hand
	if actValue == ActValue.Speed then return ActSpeedGet(ActGet(human, body), isHand)
	elseif actValue == ActValue.Thrust then return ActThrustGet(ActGet(human, body), isHand)
	elseif actValue == ActValue.Weight then return ActWeightGet(ActGet(human, body), isHand)
	elseif actValue == ActValue.DepthStart then return ActDepthGet(ActGet(human, body), isHand, true)
	elseif actValue == ActValue.DepthEnd then return ActDepthGet(ActGet(human, body), isHand, false)
	else return 0 end
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
function ActSpeedSet_RandomNear(interaction, isHand)
	return ActSpeedSet(interaction, ActValueGet_RandomNear(interaction, ActValue.Speed, isHand), isHand )
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
	local speed = ActValueGet_MinMax(speed, ActValue.Speed)
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
function ActWeightSet_RandomNear(interaction, isHand)
	return ActWeightSet(interaction, ActValueGet_RandomNear(interaction, ActValue.Weight, false), false) -- ignore isHand (hands don't have weights)
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
	local weight = ActValueGet_MinMax(weight, ActValue.Weight)
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
function ActThrustSet_RandomNear(interaction, isHand)
	return ActThrustSet(interaction, ActValueGet_RandomNear(interaction, ActValue.Thrust, isHand), isHand)
end

-- SET
function ActThrustSet_Step(interaction, weightStep, increase, isHand)
	local weight = ActThrustGet(interaction, isHand) -- Use Target Value to prevent dampening
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	return ActThrustSet(interaction, weight, isHand)
end
function ActThrustSet(interaction, weight, isHand)
	local weight = DenormalizeValue(ActValueGet_MinMax(weight, ActValue.Thrust),1,3)
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
function ActDepthStartSet_RandomNear(interaction, isHand)
	return ActDepthSet(interaction, ActValueGet_RandomNear(interaction, ActValue.DepthStart, isHand), isHand, true)
end
function ActDepthEndSet_RandomNear(interaction, isHand)
	return ActDepthSet(interaction, ActValueGet_RandomNear(interaction, ActValue.DepthEnd, isHand), isHand, false)
end

-- RANDOM TOGETHER
function ActDepthSet_RandomNear(interaction, isHand)
	ActDepthStartEndSet(interaction, ActValueGet_RandomNear(interaction, ActValue.DepthStart, isHand), ActValueGet_RandomNear(interaction, ActValue.DepthEnd, isHand), isHand)
end

-- SET STEP
function ActDepthSet_Step(interaction, depthStep, increase, isHand, isStartDepth)
	local depth = ActDepthGet(interaction, isHand, isStartDepth) -- Use Target Value to prevent dampening
	if increase then depth = depth + depthStep
	else depth = depth - depthStep end
	return ActDepthSet(interaction, depth, isHand, isStartDepth)
end
-- SET TOGETHER
function ActDepthStartEndSet(interaction, depthStart, depthEnd, isHand)
	ActDepthSet(interaction, depthStart, isHand, true)
	ActDepthSet(interaction, depthEnd, isHand, false)
end
-- SET SPLIT
function ActDepthSet(interaction, depth, isHand, isStartDepth)
	depth = ActValueGet_MinMax(depth, isStartDepth and ActValue.DepthStart or ActValue.DepthEnd )
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
-- If the tween is runnin, value is fetched from the target, since RAW is being animated
function ActTweenOrValueGet(act, param)
	-- SCENARIO A: A tween is currently running.
	-- We loop through the list to find it.
	for i = 1, #actActiveTweens do
		local t = actActiveTweens[i]
		if t.object == act and t.param == param then
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
	-- Remove existing tween for this parameter if it exists to avoid conflicts
	for i = #actActiveTweens, 1, -1 do
		local t = actActiveTweens[i]
		if t.object == act and t.param == param then
			table.remove(actActiveTweens, i)
		end
	end
	-- Start new tween
	local startValue = act[param]
	-- Fallback if duration is somehow nil, preventing crash
	duration = duration or 0.5 
	-- If duration is effectively zero, set immediately
	if duration <= 0.001 then act[param] = targetValue return end
	table.insert(actActiveTweens, {
		object = act,
		param = param,
		startVal = startValue,
		targetVal = targetValue,
		duration = duration,
		elapsed = 0
	})
end

function ActTweensUpdate(deltaTime)
	if not SexTweenAllow() then return end
	for i = #actActiveTweens, 1, -1 do
		local t = actActiveTweens[i]
		t.elapsed = t.elapsed + deltaTime
		local progress = t.elapsed / t.duration
		if progress >= 1 then
			-- Finished
			t.object[t.param] = t.targetVal
			table.remove(actActiveTweens, i)
		else
			-- Interpolate (using SmoothStep / EaseInOut)
			local ease = progress * progress * (3 - 2 * progress)
			local currentVal = t.startVal + (t.targetVal - t.startVal) * ease
			t.object[t.param] = currentVal
		end
	end
end