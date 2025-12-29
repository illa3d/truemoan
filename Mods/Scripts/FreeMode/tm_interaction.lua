-- TrueMoan v1.3 by illa3d

-- Human states
TM_HumanStates = TM_HumanStates or {}
TM_NextHumanId = TM_NextHumanId or 1

HumanState = {
	ID = nil,
	Name = nil,
	AutoSex = false,
}

-- Body enums
Body = {
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

-------------------------------------------------------------------------------------------------
-- HUMAN STATE
-------------------------------------------------------------------------------------------------
local function CopyTable(src)
	local t = {}
	for k, v in pairs(src) do t[k] = v end
	return t
end

-- must be hooked to OnCreateHuman
function AddHuman(human)
	if not human then return end
	local state = CopyTable(HumanState)
	state.ID = TM_NextHumanId
	TM_NextHumanId = TM_NextHumanId + 1
	state.Name = human.Name
	TM_HumanStates[human] = state
end

-- must be hooked to OnRemoveHuman
function RemoveHuman(human)
	if not human then return end
	TM_HumanStates[human] = nil
end

function GetHumanState(human)
	if not human then return nil end
	return TM_HumanStates[human]
end

-------------------------------------------------------------------------------------------------
-- INTERACTION PARAMETERS/VALUES SET/GET
-------------------------------------------------------------------------------------------------

-- Get Interaction parameter
function GetActParam(actValue, isHand)
	if actValue == ActValue.Active then return isHand and ActParam.ActiveHand or ActParam.ActivePenis
	elseif actValue == ActValue.Speed then return isHand and ActParam.SpeedHand or ActParam.SpeedPenis
	elseif actValue == ActValue.Thrust then return isHand and ActParam.ThrustHand or ActParam.ThrustPenis
	elseif actValue == ActValue.DepthStart then return isHand and ActParam.DepthStartHand or ActParam.DepthStartPenis
	elseif actValue == ActValue.DepthEnd then return isHand and ActParam.DepthEndHand or ActParam.DepthEndPenis
	elseif actValue == ActValue.Weight then return ActParam.WeightPenis
	else return nil end
end

-- Get Interaction value
function GetActValue(act, actValue, isHand)
	local function GetActParamValue(act, param) return act[param] end
	if actValue == ActValue.Active then return GetActParamValue(act, GetActParam(ActValue.Active, isHand))
	elseif actValue == ActValue.Speed then return GetActParamValue(act, GetActParam(ActValue.Speed, isHand))
	elseif actValue == ActValue.Thrust then return GetActParamValue(act, GetActParam(ActValue.Thrust, isHand))
	elseif actValue == ActValue.DepthStart then return GetActParamValue(act, GetActParam(ActValue.DepthStart, isHand))
	elseif actValue == ActValue.DepthEnd then return GetActParamValue(act, GetActParam(ActValue.DepthEnd, isHand))
	elseif actValue == ActValue.Weight then return GetActParamValue(act, ActParam.WeightPenis)
	else return nil end
end

-- Set Interaction value
function SetActValue(act, actValue, isHand, value) act[GetActParam(actValue, isHand)] = value end

-------------------------------------------------------------------------------------------------
-- BODY / SEX / INTERACTION
-------------------------------------------------------------------------------------------------

-- PENIS/VAGINA
function HasPenis(human)
	return human and human.Penis and human.Penis.IsActive
end

-- SEX
function HasSex(human, body)
	if body == Body.Hand and human.Penis.m_holdDepth ~= 0 then return true
	elseif body == Body.Penis and human.Penis.Hole ~= nil then return true
	elseif body == Body.Mouth and human.Mouth.Fucker ~= nil then return true
	elseif body == Body.Anus and human.Anus.Fucker ~= nil then return true
	elseif body == Body.Vagina and human.Vagina.Fucker ~= nil then return true
	else return false end
end

function IsSexActive(human, body)
	if not HasSex(human, body) then return false end
	if body == Body.Hand and human.Penis.Interaction.m_autoHandActive == true then return true
	elseif body == Body.Penis and human.Penis.Interaction.AutoActive == true then return true
	elseif body == Body.Mouth and human.Mouth.Fucker.Penis.Interaction.AutoActive == true then return true
	elseif body == Body.Anus and human.Anus.Fucker.Penis.Interaction.AutoActive == true then return true
	elseif body == Body.Vagina and human.Vagina.Fucker.Penis.Interaction.AutoActive == true then return true
	else return false end
end

function GetAct(human, body)
	if not HasSex(human, body) then return nil end
	if body == Body.Hand then return human.Penis.Interaction
	elseif body == Body.Penis then return human.Penis.Interaction
	elseif body == Body.Mouth then return human.Mouth.Fucker.Penis.Interaction
	elseif body == Body.Anus then return human.Anus.Fucker.Penis.Interaction
	elseif body == Body.Vagina then return human.Vagina.Fucker.Penis.Interaction
	else return nil end
end

-- WETNESS
function IsWetAny(human) return IsWet(human, Body.Mouth) or IsWet(human, Body.Anus) or IsWet(human, Body.Vagina) end

function IsWet(human, body)
	if body == Body.Mouth and human.m_mouth.m_wetness > 0 then return true
	elseif body == Body.Anus and human.m_anus.m_wetness > 0 then return true
	elseif body == Body.Vagina and human.m_vagina.m_wetness > 0 then return true
	else return false end
end

function GetWet(human, body)
	if body == Body.Mouth then return human.m_mouth.m_wetness
	elseif body == Body.Anus then return human.m_anus.m_wetness
	elseif body == Body.Vagina then return human.m_vagina.m_wetness
	else return 0 end
end

-------------------------------------------------------------------------------------------------
-- AUTO SEX
-------------------------------------------------------------------------------------------------
function StartAutoSex(human)
	local state = GetHumanState(human)
	if not state then return end
	state.AutoSex = true
	if HasSex(human, Body.Hand) then StartAutoHandAct(human, human.Penis.Interaction) end
	if HasSex(human, Body.Penis) then StartAutoPenisAct(human, human.Penis.Interaction) end
	if HasSex(human, Body.Mouth) then StartAutoPenisAct(human, human.Mouth.Fucker.Penis.Interaction) end
	if HasSex(human, Body.Anus) then StartAutoPenisAct(human, human.Anus.Fucker.Penis.Interaction) end
	if HasSex(human, Body.Vagina) then StartAutoPenisAct(human, human.Vagina.Fucker.Penis.Interaction) end
end

function StopAutoSex(human)
	local state = GetHumanState(human)
	if state ~= nil then state.AutoSex = false end
end

function StartAutoHandAct(human, interaction)
	if not AllowAutoSex(human) then return end
	StartRandomLoop(human, SetActSpeedRandom, interaction, true)
	StartRandomLoop(human, SetActThrustRandom, interaction, true)
	StartRandomLoop(human, SetActDepthRandom, interaction, true)
end

function StartAutoPenisAct(human, interaction)
	if not AllowAutoSex(human) then return end
	StartRandomLoop(human, SetActSpeedRandom, interaction, false)
	StartRandomLoop(human, SetActThrustRandom, interaction, false)
	StartRandomLoop(human, SetActWeightRandom, interaction, false)
	StartRandomLoop(human, SetActDepthRandom, interaction, false)
end

function StartRandomLoop(human, randomFunc, interaction, isHand)
	if not AllowAutoSex(human) then return end
	randomFunc(interaction, isHand)
	Delayed(GetRandom(TM_AutoSexTimeMin, TM_AutoSexTimeMax), function()
		if GetHumanState(human) then StartRandomLoop(human, randomFunc, interaction, isHand) end
	end)
end

Delayed(GetRandom(TM_AutoSexTimeMin, TM_AutoSexTimeMax), function()
	if GetHumanState(human) then
		StartRandomLoop(human, randomFunc, interaction, isHand)
	end
end)

function AllowAutoSex(human)
	local state = GetHumanState(human)
	return state and state.AutoSex
end

-------------------------------------------------------------------------------------------------
-- INTERACTION
-------------------------------------------------------------------------------------------------
-- ENABLE (penis, hand)
--  interaction.AutoActive = true
--  interaction.m_autoHandActive = true
-- SPEED (penis, hand)
--  interaction.m_autoSpeed = speed (0.001 - 2)
--  interaction.m_autoHandSpeed = speed (0.001 - 2)
-- GIVER VS GETTER (penis)
--  interaction.AutoPenisWeight = weight (0-1)
-- THRUST (penis, hand)
--  interaction.m_autoThrustWeight = weight (1-3)
--  interaction.m_autoHandThrustWeight = weight (1-3)
-- DEPTH (penis, hand)
--  interaction.m_autoStartDepth = depth (0-0.95)
--  interaction.m_autoEndDepth = depth (0.05-1)

function SetInteractionActive(interaction, isHand, isActive) SetActValue(interaction, ActValue.Active, isHand, isActive) end

-------------------------------------------------------------------------------------------------
-- (PENIS/HAND) INTERACTION SPEED (0.001 - 2), UI ALLOWS ONLY (0.001 - 0.5)
-------------------------------------------------------------------------------------------------
function ClampActSpeed(value) return ClampValue(value, 0.001, 2) end -- speed value range

function GetActSpeed(interaction, isHand)
	return GetActValue(interaction, ActValue.Speed, isHand)
end

function GetActSpeedTarget(interaction, isHand)
	return GetActTargetValue(interaction, GetActParam(ActValue.Speed, isHand))
end

function SetActSpeedRandom(interaction, isHand)
	return SetActSpeed(interaction, GetRandomFloat(0.1, 0.5), isHand)
end

function SetActSpeedStep(interaction, speedStep, increase, isHand)
	local speed = GetActSpeedTarget(interaction, isHand) -- Use Target Value to prevent dampening
	local increment = 1 + (speedStep / (speed ^ 0.6)) -- 1 + (speed multiplier / (speed / curve))
	if increase then speed = speed * increment
	else speed = speed / increment end
	return SetActSpeed(interaction, speed, isHand)
end

function SetActSpeed(interaction, speed, isHand)
	local speed = ClampActSpeed(speed)
	SetInteractionActive(interaction, isHand, true)
	if TM_TweenSex then TweenActTo(interaction, GetActParam(ActValue.Speed, isHand), speed, TM_TweenTime)
	else SetActValue(interaction, ActValue.Speed, isHand, speed) end 
	return speed
end

-------------------------------------------------------------------------------------------------
-- (PENIS) INTERACTION WEIGHT (GIVER VS GETTER) (0-1)
-------------------------------------------------------------------------------------------------
function GetActWeight(interaction, isHand) return GetActValue(interaction, ActValue.Weight, isHand) end

function GetActWeightTarget(interaction, isHand)
	return isHand and 0 or GetActTargetValue(interaction, ActParam.WeightPenis)
end

function SetActWeightRandom(interaction, isHand)
	return SetActWeight(interaction, GetRandomFloat01(), isHand)
end

function SetActWeightStep(interaction, weightStep, increase, isHand)
	local weight = GetActWeightTarget(interaction, isHand) -- Use Target Value to prevent dampening
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	return SetActWeight(interaction, weight, isHand)
end

function SetActWeight(interaction, weight, isHand)
	if isHand then return end -- no interaction weight in handjobs
	local weight = Clamp01(weight)
	SetInteractionActive(interaction, isHand, true)
	if TM_TweenSex then TweenActTo(interaction, ActParam.WeightPenis, weight, TM_TweenTime)
	else SetActValue(interaction, ActValue.Weight, isHand, weight) end 
	return weight
end

-------------------------------------------------------------------------------------------------
-- (PENIS/HAND) INTERACTION THRUST (normalized 0-1 to actual 1-3)
-------------------------------------------------------------------------------------------------
function ClampActThrust(weight) return ClampValue(weight, 1, 3) end -- thrust value range

function GetActThrust(interaction, isHand)
	return NormalizeValue(GetActValue(interaction, ActValue.Thrust, isHand), 1, 3)
end

function GetActThrustTarget(interaction, isHand)
	return NormalizeValue(GetActTargetValue(interaction, GetActParam(ActValue.Thrust, isHand)), 1, 3)
end

function SetActThrustRandom(interaction, isHand)
	return SetActThrust(interaction, GetRandomFloat(0,0.4), isHand)
end

function SetActThrustStep(interaction, weightStep, increase, isHand)
	local weight = GetActThrustTarget(interaction, isHand) -- Use Target Value to prevent dampening
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	return SetActThrust(interaction, weight, isHand)
end

function SetActThrust(interaction, weight, isHand)
	local weight = ClampActThrust(DenormalizeValue(weight, 1, 3)) -- denormalized
	SetInteractionActive(interaction, isHand, true)
	if TM_TweenSex then TweenActTo(interaction, GetActParam(ActValue.Thrust, isHand), weight, TM_TweenTime)
	else SetActValue(interaction, ActValue.Thrust, isHand, weight) end 
	return weight
end

-------------------------------------------------------------------------------------------------
-- (PENIS/HAND) INTERACTION THRUST DEPTH (0-1)
-------------------------------------------------------------------------------------------------
function ClampActDepth(depth, isStartDepth)
	if isStartDepth then return ClampValue(depth, 0, 0.95) -- start depth value range
	else return ClampValue(depth, 0.05,1) end -- end depth value range
end

function GetActDepth(interaction, isHand, isStartDepth)
	return GetActValue(interaction, isStartDepth and ActValue.DepthStart or ActValue.DepthEnd, isHand)
end

function GetActDepthTarget(interaction, isHand, isStartDepth)
	local param = GetActParam(isStartDepth and ActValue.DepthStart or ActValue.DepthEnd, isHand)
	return GetActTargetValue(interaction, param)
end

function SetActDepthRandom(interaction, isHand)
	local startValue = SetActDepth(interaction, GetRandomFloat(0.1, 0.4), isHand, true)
	local endValue = SetActDepth(interaction, GetRandomFloat(0.6, 0.9), isHand, false)
	return startValue, endValue
end

function SetActDepthStep(interaction, depthStep, increase, isHand, isStartDepth)
	local depth = GetActDepthTarget(interaction, isHand, isStartDepth) -- Use Target Value to prevent dampening
	if increase then depth = depth + depthStep
	else depth = depth - depthStep end
	return SetActDepth(interaction, depth, isHand, isStartDepth)
end

function SetActDepth(interaction, depth, isHand, isStartDepth)
	local depth = ClampActDepth(depth, isStartDepth)
	SetInteractionActive(interaction, isHand, true)
	if TM_TweenSex then
		local paramName = GetActParam(isStartDepth and ActValue.DepthStart or ActValue.DepthEnd, isHand)
		TweenActTo(interaction, paramName, depth, TM_TweenTime)
	elseif isStartDepth then SetActValue(interaction, ActValue.DepthStart, isHand, depth)
	else SetActValue(interaction, ActValue.DepthEnd, isHand, depth) end
	return depth
end

-------------------------------------------------------------------------------------------------
-- TWEENING
-------------------------------------------------------------------------------------------------
local activeTweens = {}

function GetActTargetValue(act, param)
	-- SCENARIO A: A tween is currently running.
	-- We loop through the list to find it.
	for i = 1, #activeTweens do
		local t = activeTweens[i]
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
function TweenActTo(act, param, targetValue, duration)
	-- Remove existing tween for this parameter if it exists to avoid conflicts
	for i = #activeTweens, 1, -1 do
		local t = activeTweens[i]
		if t.object == act and t.param == param then
			table.remove(activeTweens, i)
		end
	end
	-- Start new tween
	local startValue = act[param]
	-- Fallback if duration is somehow nil, preventing crash
	duration = duration or 0.5 
	-- If duration is effectively zero, set immediately
	if duration <= 0.001 then act[param] = targetValue return end
	table.insert(activeTweens, {
		object = act,
		param = param,
		startVal = startValue,
		targetVal = targetValue,
		duration = duration,
		elapsed = 0
	})
end

function UpdateActTweens(deltaTime)
	if not TM_TweenSex then return end
	for i = #activeTweens, 1, -1 do
		local t = activeTweens[i]
		t.elapsed = t.elapsed + deltaTime
		local progress = t.elapsed / t.duration
		if progress >= 1 then
			-- Finished
			t.object[t.param] = t.targetVal
			table.remove(activeTweens, i)
		else
			-- Interpolate (using SmoothStep / EaseInOut)
			local ease = progress * progress * (3 - 2 * progress)
			local currentVal = t.startVal + (t.targetVal - t.startVal) * ease
			t.object[t.param] = currentVal
		end
	end
end