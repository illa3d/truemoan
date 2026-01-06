-- TrueMoan v1.9 by illa3d
-------------------------------------------------------------------------------------------------
-- INTERACTION BETWEEN HUMANS, HOLES AND PENISES, INTERACTION PARAMETERS AND THEIR TWEENS
-------------------------------------------------------------------------------------------------
-- ACUTUAL GAME FUNCTIONS AND LIMITS
-------------------------------------------------------------------------------------------------
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
--  interaction.m_autoStartDepth = depth (0-1.25)
--  interaction.m_autoEndDepth = depth (0.05-1.3)
--  interaction.m_autoHandStartDepth = depth (0-1.25)
--  interaction.m_autoHandEndDepth = depth (0.05-1.3)
-- WEIGHT, MALE VS FEMALE/GIVER VS GETTER (penis)
--  interaction.AutoPenisWeight = weight (0-1)
-------------------------------------------------------------------------------------------------

-- Sex Tweens
-- Active tweens list (for update loop)
local actActiveTweens = {}
-- Fast lookup map: act -> param -> tween
local actActiveTweenMap = {}

-- TweenParams
local ActTweenTimeMinMax = { Min = 0.1, Max = 3 } -- seconds (time for parameter tween duration)

-------------------------------------------------------------------------------------------------

-- BODY HOLE ENUM
ActBody = {
	PenisHand = "PenisHand",
	PenisHole = "PenisHole",
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

-------------------------------------------------------------------------------------------------

-- GAME PARAMETER NAME ENUM - Act (interaction) Parameters (actual names of values in interaction)
local ActValueParamMap = {
	[ActValue.Active] =		{ penis = "AutoActive",			hand = "m_autoHandActive" },
	[ActValue.Speed] =		{ penis = "m_autoSpeed",		hand  = "m_autoHandSpeed" },
	[ActValue.Thrust] =		{ penis = "m_autoThrustWeight",	hand  = "m_autoHandThrustWeight", },
	[ActValue.DepthStart] =	{ penis = "m_autoStartDepth",	hand  = "m_autoHandStartDepth", },
	[ActValue.DepthEnd] =	{ penis = "m_autoEndDepth",		hand  = "m_autoHandEndDepth", },
	[ActValue.Weight] =		{ penis = "AutoPenisWeight" }-- no hand weight
}

-- GAME PARAMETER VALUE LIMITS (values as they are in TrueFacials)
ActValueMinMax_Raw = {
	[ActValue.Speed] =		{ Min = 0.001, Max = 2 },
	[ActValue.Weight] =		{ Min = 0, Max = 1 },
	[ActValue.Thrust] =		{ Min = 1, Max = 3 }, -- raw thrust values
	[ActValue.DepthStart] =	{ Min = 0, Max = 1.2 },
	[ActValue.DepthEnd] =	{ Min = 0.1, Max = 1.3 }
}

-- TRUEMOAN PARAMETER VALUE LIMITS (values with thrust normalized)
ActValueMinMax = {
	[ActValue.Speed] =		{ Min = 0.1, Max = 1 },
	[ActValue.Weight] =		{ Min = 0, Max = 1 },
	[ActValue.Thrust] =		{ Min = 0, Max = 0.6 },
	[ActValue.DepthStart] =	{ Min = 0.2, Max = 0.6 },
	[ActValue.DepthEnd] =	{ Min = 0.5, Max = 1.1 },
}

-------------------------------------------------------------------------------------------------
-- CONFIG VALUES CLAMPING
-------------------------------------------------------------------------------------------------

function SexTweenAllow() return TM_TweenSex and SexTweenTime() > 0 end
function SexTweenTime() return ClampValue(TM_TweenTime, ActTweenTimeMinMax.Min , ActTweenTimeMinMax.Max) end

-------------------------------------------------------------------------------------------------
-- SEX PARTNER (fucker)
-------------------------------------------------------------------------------------------------

function HasSexPartner_Any(human)
	return HasSexPartner(human, ActBody.PenisHand) or HasSexPartner(human, ActBody.PenisHole) or 
	HasSexPartner(human, ActBody.Mouth) or HasSexPartner(human, ActBody.Anus) or HasSexPartner(human, ActBody.Vagina) end
function HasSexPartner_HoleAny(human)
	return HasSexPartner(human, ActBody.Mouth) or HasSexPartner(human, ActBody.Anus) or HasSexPartner(human, ActBody.Vagina) end
function HasSexPartner_PenisHand(human)
	return HasSexPartner(human, ActBody.PenisHand) end
function HasSexPartner_PenisHole(human)
	return HasSexPartner(human, ActBody.PenisHole) end
function HasSexPartner(human, body)
	if human == nil then return false end
	if body == ActBody.PenisHand and human.Penis.m_holdDepth ~= 0 then return true
	elseif body == ActBody.PenisHole and human.Penis.Hole ~= nil then return true
	elseif body == ActBody.Mouth and human.Mouth.Fucker ~= nil then return true
	elseif body == ActBody.Anus and human.Anus.Fucker ~= nil then return true
	elseif body == ActBody.Vagina and human.Vagina.Fucker ~= nil then return true
	else return false end
end

function SexPartner_Get(human, body)
	if human == nil then return nil end
	if body == ActBody.Mouth and human.Mouth.Fucker ~= nil then return human.Mouth.Fucker
	elseif body == ActBody.Anus and human.Anus.Fucker ~= nil then return human.Anus.Fucker
	elseif body == ActBody.Vagina and human.Vagina.Fucker ~= nil then return human.Vagina.Fucker
	else return nil end
end

function SexPartners_Get(human)
	local partners = {}
	if human == nil then return partners end
	for _, body in pairs(ActBody) do
		if HasSexPartner(human, body) then
			local partner = SexPartner_Get(human, body)
			if partner ~= nil then table.insert(partners, partner) end
		end
	end return partners
end

-------------------------------------------------------------------------------------------------
-- SEX
-------------------------------------------------------------------------------------------------

function IsSexActive_Any(human)
	return IsSexActive(human, ActBody.PenisHand) or IsSexActive(human, ActBody.PenisHole) or 
	IsSexActive(human, ActBody.Mouth) or IsSexActive(human, ActBody.Anus) or IsSexActive(human, ActBody.Vagina) end
function IsSexActive_HoleAny(human)
	return IsSexActive(human, ActBody.Mouth) or IsSexActive(human, ActBody.Anus) or IsSexActive(human, ActBody.Vagina) end
function IsSexActive_PenisHand(human)
	return IsSexActive(human, ActBody.PenisHand) end
function IsSexActive_PenisHole(human)
	return IsSexActive(human, ActBody.PenisHole) end

function IsSexActive(human, body)
	if human == nil or not HasSexPartner(human, body) then return false end
	local interaction = ActGet(human, body)
	if not interaction then return false end
	local isHand = body == ActBody.PenisHand
	return ActActiveGet(interaction, isHand) == true
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

function WetSet(girl, value, actBody)
	if girl == nil or value == nil  or actBody == nil or girl.m_isMale == true then return end
	if actBody == ActBody.Mouth then girl.m_mouth.m_wetness = value
	elseif actBody == ActBody.Anus then girl.m_anus.m_wetness = value
	elseif actBody == ActBody.Vagina then girl.m_vagina.m_wetness = value end
end

function WetAllReset(girl)
	WetSet(girl, 0, ActBody.Vagina)
	WetSet(girl, 0, ActBody.Anus)
	WetSet(girl, 0, ActBody.Mouth)
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- INTERACTION
--===============================================================================================
-------------------------------------------------------------------------------------------------

-- Get interaction from human and body part
function ActGet(human, body)
	if not HasSexPartner(human, body) then return nil end
	if body == ActBody.PenisHand then return human.Penis.Interaction
	elseif body == ActBody.PenisHole then return human.Penis.Interaction
	elseif body == ActBody.Mouth then return human.Mouth.Fucker.Penis.Interaction
	elseif body == ActBody.Anus then return human.Anus.Fucker.Penis.Interaction
	elseif body == ActBody.Vagina then return human.Vagina.Fucker.Penis.Interaction
	else return nil end
end

-------------------------------------------------------------------------------------------------
-- (NORMALIZED) INTERACTION PARAMETER VALUE (Speed, Thrust, DepthStart, DepthEnd, Weight)
-------------------------------------------------------------------------------------------------

-- PARAMETER VALUES
function ActValueGet(interaction, actValue, isHand)
	if not interaction or not actValue then return 0 end
	if actValue == ActValue.Active then return ActActiveGet(interaction, isHand) and 1 or 0 -- unify bool returns as rest
	elseif actValue == ActValue.Speed then return ActSpeedGet(interaction, isHand)
	elseif actValue == ActValue.Weight then return ActWeightGet(interaction, isHand)
	elseif actValue == ActValue.Thrust then return ActThrustGet(interaction, isHand)
	elseif actValue == ActValue.DepthStart then return ActDepthGet(interaction, isHand, true)
	elseif actValue == ActValue.DepthEnd then return ActDepthGet(interaction, isHand, false) end
	return 0
end

function ActValueGet_ByBody(human, actBody, actValue)
	local isHand = actBody == ActBody.PenisHand
	if actValue == ActValue.Active then return ActActiveGet(ActGet(human, actBody), isHand) and 1 or 0 -- unify bool returns as rest
	elseif actValue == ActValue.Speed then return ActSpeedGet(ActGet(human, actBody), isHand)
	elseif actValue == ActValue.Thrust then return ActThrustGet(ActGet(human, actBody), isHand)
	elseif actValue == ActValue.Weight then return ActWeightGet(ActGet(human, actBody), isHand)
	elseif actValue == ActValue.DepthStart then return ActDepthGet(ActGet(human, actBody), isHand, true)
	elseif actValue == ActValue.DepthEnd then return ActDepthGet(ActGet(human, actBody), isHand, false) end
end

-- RANDOM QUICK PARAMETER VALUE (new generated value, used in menu, "quick wide random" for responsive "FeelingLucky")
function ActValueGen_Random(actValue)
	local r = ActValueMinMax[actValue]
	return r and GetRandomFloat(r.Min, r.Max) or 0
end

-------------------------------------------------------------------------------------------------
-- (RAW) INTERACTION PARAMETER VALUE (Speed, Thrust, DepthStart, DepthEnd, Weight)
-------------------------------------------------------------------------------------------------
-- MAIN RAW PARAMETER VALUE (from interaction or tween target (where it's ending up afer tween))
function ActValueGet_RawOrTween(act, actValue, isHand)
	if not act then return nil end
	local param = ActValueParamNameGet(actValue, isHand)
	if not param then return nil end
	local map = actActiveTweenMap[act]
	local t = map and map[param]
	-- A) Return tween target value (where the value will be when tween ends)
	if t then return t.targetVal end
	-- B) No tween found, return the interaction value
	return act[param]
end

function ActValueSet_RawOrTween(act, actValue, isHand, value)
	if SexTweenAllow() then ActTweenTo(act, ActValueParamNameGet(actValue, isHand), value, SexTweenTime() )
	else ActValueSet_Raw(act, actValue, isHand, value) end
end

-- RAW PARAMETER VALUE CLAMP (Clamp to actual game value, might be tweened, tween target is "new value" tween is going to)
function ActValueClamp_Raw(value, actValue)
	local mm = ActValueMinMax_Raw[actValue]
	return mm and ClampValue(value, mm.Min, mm.Max) or value
end

-------------------------------------------------------------------------------------------------
-- RAW PARAMETER VALUE (possibly being tweened)

-- Set Interaction value directly to character
function ActValueSet_Raw(act, actValue, isHand, value)
	local param = ActValueParamNameGet(actValue, isHand)
	if act and param then act[param] = value end
end

-- Get Interaction value from interaction (if object is tweening will get value "on the way to the target")
function ActValueGet_Raw(act, actValue, isHand)
	local param = ActValueParamNameGet(actValue, isHand)
	return act and param and act[param] or nil
end

-- Get Interaction parameter
function ActValueParamNameGet(actValue, isHand)
	local entry = ActValueParamMap[actValue]
	if not entry then return nil end
	return isHand and entry.hand or entry.penis
end

--===============================================================================================
-- INTERACTION PARAMS (Active, Speed, Weight, Thrust, Depth)
--===============================================================================================

-------------------------------------------------------------------------------------------------
-- INTERACTION ACTIVE
-------------------------------------------------------------------------------------------------
function ActActiveGet(interaction, isHand) return ActValueGet_RawOrTween(interaction, ActValue.Active, isHand) end
function ActActiveSet(interaction, isHand, isActive) ActValueSet_Raw(interaction, ActValue.Active, isHand, isActive) end
function ActActiveSet_Human(human, actBody, isActive) ActActiveSet(ActGet(human, actBody), actBody == ActBody.PenisHand, isActive) end
function ActActiveSetAll_Human(human, isActive)
	if IsSexActive(human, ActBody.PenisHand) then ActActiveSet(ActGet(human, ActBody.PenisHand), true, isActive) end
	if IsSexActive(human, ActBody.PenisHole) then ActActiveSet(ActGet(human, ActBody.PenisHole), false, isActive) end
	if IsSexActive(human, ActBody.Mouth) then ActActiveSet(ActGet(human, ActBody.Mouth), false, isActive) end
	if IsSexActive(human, ActBody.Vagina) then ActActiveSet(ActGet(human, ActBody.Vagina), false, isActive) end
	if IsSexActive(human, ActBody.Anus) then ActActiveSet(ActGet(human, ActBody.Anus), false, isActive) end
end

-------------------------------------------------------------------------------------------------
-- INTERACTION SPEED (PENIS/HAND) (0.001 - 2), UI ALLOWS ONLY (0.001 - 0.5)
-------------------------------------------------------------------------------------------------
-- GET
function ActSpeedGet_Raw(interaction, isHand) return ActValueGet_Raw(interaction, ActValue.Speed, isHand) end
function ActSpeedGet(interaction, isHand) return ActValueGet_RawOrTween(interaction, ActValue.Speed, isHand) end

-- SET
function ActSpeedSet_MenuRandom(interaction, isHand) ActSpeedSet(interaction, ActValueGen_Random(ActValue.Speed), isHand) end
function ActSpeedSet_Step(interaction, speedStep, increase, isHand)
	local speed = ActSpeedGet(interaction, isHand) -- Use Target Value to prevent dampening
	local increment = 1 + (speedStep / (speed ^ 0.6)) -- 1 + (speed multiplier / (speed / curve))
	if increase then speed = speed * increment
	else speed = speed / increment end
	ActSpeedSet(interaction, speed, isHand)
end

function ActSpeedSet(interaction, speed, isHand)
	ActActiveSet(interaction, isHand, true)
	local speed = ActValueClamp_Raw(speed, ActValue.Speed)
	ActValueSet_RawOrTween(interaction, ActValue.Speed, isHand, speed)
end

-------------------------------------------------------------------------------------------------
-- INTERACTION WEIGHT (PENIS) (GIVER VS GETTER) (0-1)
-------------------------------------------------------------------------------------------------

-- GET
function ActWeightGet_Raw(interaction, isHand) return ActValueGet_Raw(interaction, ActValue.Weight, isHand) end
function ActWeightGet(interaction, isHand) return isHand and 0 or ActValueGet_RawOrTween(interaction, ActValue.Weight, false) end

-- SET
function ActWeightSet_MenuRandom(interaction, isHand) ActWeightSet(interaction, ActValueGen_Random(ActValue.Weight), isHand) end
function ActWeightSet_Step(interaction, weightStep, increase, isHand)
	local weight = ActWeightGet(interaction, isHand) -- Use Target Value to prevent dampening
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	ActWeightSet(interaction, weight, isHand)
end
function ActWeightSet(interaction, weight, isHand)
	if isHand then return end -- no interaction weight in handjobs
	ActActiveSet(interaction, false, true)
	local weight = ActValueClamp_Raw(weight, ActValue.Weight)
	ActValueSet_RawOrTween(interaction, ActValue.Weight, false, weight)
end

-------------------------------------------------------------------------------------------------
-- INTERACTION THRUST (PENIS/HAND) (normalized 0-1 to actual 1-3)
-------------------------------------------------------------------------------------------------
function ActThrust_Norm(weight) return NormalizeValue(weight, 1, 3) end
function ActThrust_Denorm(weight) return ActValueClamp_Raw(DenormalizeValue(Clamp01(weight), 1, 3), ActValue.Thrust) end

-- GET
function ActThrustGet_Raw(interaction, isHand) return ActThrust_Norm(ActValueGet_Raw(interaction, ActValue.Thrust, isHand)) end
function ActThrustGet(interaction, isHand) return ActThrust_Norm(ActValueGet_RawOrTween(interaction, ActValue.Thrust, isHand)) end

-- SET
function ActThrustSet_MenuRandom(interaction, isHand) ActThrustSet(interaction, ActValueGen_Random(ActValue.Thrust), isHand) end
function ActThrustSet_Step(interaction, weightStep, increase, isHand)
	local weight = ActThrustGet(interaction, isHand) -- Use Target Value to prevent dampening
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	ActThrustSet(interaction, weight, isHand)
end
function ActThrustSet(interaction, weight, isHand)
	ActActiveSet(interaction, isHand, true)
	local weight = ActThrust_Denorm(weight)
	ActValueSet_RawOrTween(interaction, ActValue.Thrust, isHand, weight)
end

-------------------------------------------------------------------------------------------------
-- INTERACTION THRUST DEPTH (PENIS/HAND) (0-1)
-------------------------------------------------------------------------------------------------
-- GET
function ActDepthGet_Raw(interaction, isHand, isStartDepth)
	return ActValueGet_Raw(interaction, isStartDepth and ActValue.DepthStart or ActValue.DepthEnd, isHand)
end
function ActDepthGet(interaction, isHand, isStartDepth)
	return ActValueGet_RawOrTween(interaction, isStartDepth and ActValue.DepthStart or ActValue.DepthEnd, isHand)
end

-- SET RANDOM
function ActDepthStartSet_MenuRandom(interaction, isHand) ActDepthSet_Start(interaction, ActValueGen_Random(ActValue.DepthStart), isHand) end
function ActDepthEndSet_MenuRandom(interaction, isHand) ActDepthSet_End(interaction, ActValueGen_Random(ActValue.DepthEnd), isHand) end
function ActDepthSet_MenuRandom(interaction, isHand)
	ActDepthSet_Start(interaction, ActValueGen_Random(ActValue.DepthStart), isHand)
	ActDepthSet_End(interaction, ActValueGen_Random(ActValue.DepthEnd), isHand)
end

-- SET STEP
function ActDepthSet_Step(interaction, depthStep, increase, isHand, isStartDepth)
	local depth = ActDepthGet(interaction, isHand, isStartDepth) -- Use Target Value to prevent dampening
	if increase then depth = depth + depthStep
	else depth = depth - depthStep end
	if isStartDepth then ActDepthSet_Start(interaction, depth, isHand)
	else ActDepthSet_End(interaction, depth, isHand) end
end

-- SET
function ActDepthSet_StartEnd(interaction, depthStart, depthEnd, isHand)
	ActDepthSet_Start(interaction, depthStart, isHand)
	ActDepthSet_End(interaction, depthEnd, isHand)
end
function ActDepthSet_Start(interaction, depth, isHand)
	ActActiveSet(interaction, isHand, true)
	depth = ActValueClamp_Raw(depth, ActValue.DepthStart)
	ActValueSet_RawOrTween(interaction, ActValue.DepthStart, isHand, depth)
end
function ActDepthSet_End(interaction, depth, isHand)
	ActActiveSet(interaction, isHand, true)
	depth = ActValueClamp_Raw(depth, ActValue.DepthEnd)
	ActValueSet_RawOrTween(interaction, ActValue.DepthEnd, isHand, depth)
end

-------------------------------------------------------------------------------------------------
-- Function definitions after they've been defined up there

ActParamFunctionsSet = {
	[ActValue.Speed] = ActSpeedSet,
	[ActValue.Weight] = ActWeightSet,
	[ActValue.Thrust] = ActThrustSet,
	[ActValue.DepthStart] = ActDepthSet_Start,
	[ActValue.DepthEnd] = ActDepthSet_End,
}

-------------------------------------------------------------------------------------------------
-- QUICK COMMANDS
-------------------------------------------------------------------------------------------------

function ActAll_WeightSwitch(human, isHand)
	local function DoWeightSwitch(interaction)
		if ActWeightGet(interaction, isHand) < 0.5 then ActWeightSet(interaction, 0.9, isHand)
		else ActWeightSet(interaction, 0.1, isHand) end
	end
	local act = ActGet(human, ActBody.PenisHand) if act then DoWeightSwitch(act, true) end
	act = ActGet(human, ActBody.PenisHole) if act then DoWeightSwitch(act, false) end
	act = ActGet(human, ActBody.Mouth) if act then DoWeightSwitch(act, false) end
	act = ActGet(human, ActBody.Anus) if act then DoWeightSwitch(act, false) end
	act = ActGet(human, ActBody.Vagina) if act then DoWeightSwitch(act, false) end
end

function ActDeeper(human)
	local act = ActGet(human, ActBody.PenisHand) if act then ActDepthSet_Step(act, TM_SexDeeperStep, true, false, false) end
	act = ActGet(human, ActBody.PenisHole) if act then ActDepthSet_Step(act, TM_SexDeeperStep, true, false, false) end
	act = ActGet(human, ActBody.Mouth) if act then ActDepthSet_Step(act, TM_SexDeeperStep, true, false, false) end
	act = ActGet(human, ActBody.Anus) if act then ActDepthSet_Step(act, TM_SexDeeperStep, true, false, false) end
	act = ActGet(human, ActBody.Vagina) if act then ActDepthSet_Step(act, TM_SexDeeperStep, true, false, false) end
end


-------------------------------------------------------------------------------------------------
--===============================================================================================
-- TWEENING
--===============================================================================================
-------------------------------------------------------------------------------------------------

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
	if duration <= 0.001 then act[param] = targetValue return end -- Equivalent of ActValueSet_Raw
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
	actMap[param] = tween -- Equivalent of ActValueSet_Raw
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