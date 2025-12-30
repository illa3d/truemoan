-- TrueMoan v1.3 by illa3d
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

-- AutoSexParams
AutoSexTimers = AutoSexTimers or {}
AutoSexTickTime = 0.25
AutoSexParams = {
	Speed = { ActValue.Speed, "SetActSpeedRandomClose", true },
	Thrus = { ActValue.Thrust, "SetActThrustRandomClose", true },
	DeptS = { ActValue.DepthStart,"SetActDepthStartRandomClose", true },
	DeptE = { ActValue.DepthEnd, "SetActDepthEndRandomClose", true },
	Weigh = { ActValue.Weight, "SetActWeightRandomClose", false } -- hands dont have weight
}
-------------------------------------------------------------------------------------------------
-- CONFIG VALUES CLAMPING
-------------------------------------------------------------------------------------------------
function AllowSextTweening() return TM_TweenSex and GetTweenTime() > 0 end
function GetTweenTime() return ClampValue(TM_TweenTime, 0.1, 3) end
function AutoSexMinTime() return ClampValue(TM_AutoSexTimeMin,1,20) end
function AutoSexMaxTime() return ClampValue(TM_AutoSexTimeMax,1,20) end
function GetDrift(actvalue)
	if actvalue == ActValue.Speed then return Clamp01(TM_AutoSexSpeedDrift)
	elseif actvalue == ActValue.Thrust then return Clamp01(TM_AutoSexThrustDrift)
	elseif actvalue == ActValue.Weight then return Clamp01(TM_AutoSexWeightDrift)
	elseif actvalue == ActValue.DepthStart then return Clamp01(TM_AutoSexDepthStartDrift)
	elseif actvalue == ActValue.DepthEnd then return Clamp01(TM_AutoSexDepthEndDrift)
	else return 0.5 end
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
function IsAutoSex(human) return game.HasAnim(human) end

function AutoSexToggle(human) AutoSex(human, not IsAutoSex(human)) end
function StartAutoSex(human) AutoSex(human, true) end
function StopAutoSex(human) AutoSex(human, false) end
function AutoSex(human, active)
	if active then game.AddRepeatAnim(AutoSexTickTime, || AutoSexTick(human), human)
	else game.RemoveAnim(human) end
end

-- Randomize all active interactions
function AutoSexTick(human)
	if IsSexActive(human, Body.Hand) then AutoSexAct(GetAct(human, Body.Hand), true) end
	if IsSexActive(human, Body.Penis) then AutoSexAct(GetAct(human, Body.Penis), false) end
	if IsSexActive(human, Body.Mouth) then AutoSexAct(GetAct(human, Body.Mouth), false) end
	if IsSexActive(human, Body.Anus) then AutoSexAct(GetAct(human, Body.Anus), false) end
	if IsSexActive(human, Body.Vagina) then AutoSexAct(GetAct(human, Body.Vagina), false) end
end

-- Calculate timer against ticker and fire events for each active interaction
function AutoSexAct(interaction, isHand)
	if not interaction then return end
	local timer = AutoSexTimers[interaction]
	if not timer then timer = {} AutoSexTimers[interaction] = timer end
	for key, p in pairs(AutoSexParams) do
		local actValue, funcName, allowHand = p[1], p[2], p[3]
		if GetDrift(actValue) > 0 and (not isHand or allowHand) then
			timer[key] = (timer[key] or 0) - AutoSexTickTime
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
-- DEPTH (penis)
--  interaction.m_autoStartDepth = depth (0-0.1.25)
--  interaction.m_autoEndDepth = depth (0.05-1.3)
-- DEPTH (hand)
--  interaction.m_autoHandStartDepth = depth (0-1.25)
--  interaction.m_autoHandEndDepth = depth (0.05-1.3)

function SetInteractionActive(interaction, isHand, isActive) SetActValue(interaction, ActValue.Active, isHand, isActive) end

-------------------------------------------------------------------------------------------------
-- (PENIS/HAND) INTERACTION SPEED (0.001 - 2), UI ALLOWS ONLY (0.001 - 0.5)
-------------------------------------------------------------------------------------------------
function ClampActSpeed(value) return ClampValue(value, 0.001, 2) end -- speed value range

-- GET
function GetActSpeed(interaction, isHand)
	return GetActValue(interaction, ActValue.Speed, isHand)
end
function GetActSpeedTarget(interaction, isHand)
	return GetActTargetValue(interaction, GetActParam(ActValue.Speed, isHand))
end

-- RANDOM
function SetActSpeedRandom(interaction, isHand)
	return SetActSpeed(interaction, GetRandomFloat(0.1, 0.5), isHand)
end
function SetActSpeedRandomClose(interaction, isHand)
	return SetActSpeed(interaction, GetRandomFloatCloseMinMaxDelta(GetActSpeedTarget(interaction, isHand), GetDrift(ActValue.Speed), 0.1, 1.9, 0.1), isHand) -- percent, min, max, minDelta
end

-- SET
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
	if AllowSextTweening() then TweenActTo(interaction, GetActParam(ActValue.Speed, isHand), speed, GetTweenTime())
	else SetActValue(interaction, ActValue.Speed, isHand, speed) end 
	return speed
end

-------------------------------------------------------------------------------------------------
-- (PENIS) INTERACTION WEIGHT (GIVER VS GETTER) (0-1)
-------------------------------------------------------------------------------------------------
function GetActWeight(interaction, isHand) return GetActValue(interaction, ActValue.Weight, isHand) end

-- GET
function GetActWeightTarget(interaction, isHand)
	return isHand and 0 or GetActTargetValue(interaction, ActParam.WeightPenis)
end

-- RANDOM
function SetActWeightRandom(interaction, isHand)
	return SetActWeight(interaction, GetRandomFloat(0.2,0.8), isHand)
end
function SetActWeightRandomClose(interaction, isHand)
	return SetActWeight(interaction, GetRandomFloatCloseMinMaxDelta(GetActWeightTarget(interaction, isHand), GetDrift(ActValue.Weight), 0.1, 0.9, 0.03), isHand) -- percent, min, max, minDelta
end

-- SET
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
	if AllowSextTweening() then TweenActTo(interaction, ActParam.WeightPenis, weight, GetTweenTime())
	else SetActValue(interaction, ActValue.Weight, isHand, weight) end 
	return weight
end

-------------------------------------------------------------------------------------------------
-- (PENIS/HAND) INTERACTION THRUST (normalized 0-1 to actual 1-3)
-------------------------------------------------------------------------------------------------
function ClampActThrust(weight) return ClampValue(weight, 1, 3) end -- thrust value range

-- GET
function GetActThrust(interaction, isHand)
	return NormalizeValue(GetActValue(interaction, ActValue.Thrust, isHand), 1, 3)
end
function GetActThrustTarget(interaction, isHand)
	return NormalizeValue(GetActTargetValue(interaction, GetActParam(ActValue.Thrust, isHand)), 1, 3)
end

-- RANDOM
function SetActThrustRandom(interaction, isHand)
	return SetActThrust(interaction, GetRandomFloat(0,0.5), isHand)
end
function SetActThrustRandomClose(interaction, isHand)
	return SetActThrust(interaction, GetRandomFloatCloseMinMaxDelta(GetActThrustTarget(interaction, isHand), GetDrift(ActValue.Thrust), 0.1, 0.9, 0.05), isHand) -- percent, min, max, minDelta
end

-- SET
function SetActThrustStep(interaction, weightStep, increase, isHand)
	local weight = GetActThrustTarget(interaction, isHand) -- Use Target Value to prevent dampening
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	return SetActThrust(interaction, weight, isHand)
end
function SetActThrust(interaction, weight, isHand)
	local weight = ClampActThrust(DenormalizeValue(weight, 1, 3)) -- denormalized
	SetInteractionActive(interaction, isHand, true)
	if AllowSextTweening() then TweenActTo(interaction, GetActParam(ActValue.Thrust, isHand), weight, GetTweenTime())
	else SetActValue(interaction, ActValue.Thrust, isHand, weight) end 
	return weight
end

-------------------------------------------------------------------------------------------------
-- (PENIS/HAND) INTERACTION THRUST DEPTH (0-1)
-------------------------------------------------------------------------------------------------
function ClampActDepth(depth, isStartDepth)
	if isStartDepth then return ClampValue(depth, 0, 1) -- start depth value range
	else return ClampValue(depth, 0.05, 1.3) end -- end depth value range
end

-- GET
function GetActDepth(interaction, isHand, isStartDepth)
	return GetActValue(interaction, isStartDepth and ActValue.DepthStart or ActValue.DepthEnd, isHand)
end
function GetActDepthTarget(interaction, isHand, isStartDepth)
	local param = GetActParam(isStartDepth and ActValue.DepthStart or ActValue.DepthEnd, isHand)
	return GetActTargetValue(interaction, param)
end

-- RANDOM
function SetActDepthStartRandom(interaction, isHand) return  SetActDepth(interaction, GetRandomFloat(0.1, 0.4), isHand, true) end
function SetActDepthStartRandomClose(interaction, isHand)
	return SetActDepth(interaction, GetRandomFloatCloseMinMaxDelta(GetActDepthTarget(interaction, isHand, true), GetDrift(ActValue.DepthStart), 0, 0.5, 0.1), isHand, true) -- percent, min, max, minDelta
end

function SetActDepthEndRandom(interaction, isHand) return SetActDepth(interaction, GetRandomFloat(0.6, 1), isHand, false) end
function SetActDepthEndRandomClose(interaction, isHand)
	return SetActDepth(interaction, GetRandomFloatCloseMinMaxDelta(GetActDepthTarget(interaction, isHand, false), GetDrift(ActValue.DepthEnd), 0.6, 1.2, 0.1), isHand, false) -- percent, min, max, minDelta
end

function SetActDepthRandom(interaction, isHand)
	local startValue = SetActDepth(interaction, GetRandomFloat(0.1, 0.4), isHand, true)
	local endValue = SetActDepth(interaction, GetRandomFloat(0.6, 1), isHand, false)
	return startValue, endValue
end

-- SET
function SetActDepthStep(interaction, depthStep, increase, isHand, isStartDepth)
	local depth = GetActDepthTarget(interaction, isHand, isStartDepth) -- Use Target Value to prevent dampening
	if increase then depth = depth + depthStep
	else depth = depth - depthStep end
	return SetActDepth(interaction, depth, isHand, isStartDepth)
end
function SetActDepthStartEnd(interaction, depthStart, depthEnd, isHand)
	SetActDepth(interaction, depthStart, isHand, true)
	SetActDepth(interaction, depthEnd, isHand, false)
end

function SetActDepth(interaction, depth, isHand, isStartDepth)
	local depth = ClampActDepth(depth, isStartDepth)
	SetInteractionActive(interaction, isHand, true)
	if AllowSextTweening() then
		local paramName = GetActParam(isStartDepth and ActValue.DepthStart or ActValue.DepthEnd, isHand)
		TweenActTo(interaction, paramName, depth, GetTweenTime())
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
	if not AllowSextTweening() then return end
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