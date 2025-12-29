-- TrueMoan v1.3 by illa3d
-- Variables
TMI_AutoSex = false

Body = {
	Hand = "Hand",
	Penis = "Penis",
	Mouth = "Mouth",
	Anus = "Anus",
	Vagina = "Vagina",
}

-- Tween enums
TMIE_SpeedPenis = "m_autoSpeed"
TMIE_SpeedHand = "m_autoHandSpeed"
TMIE_ThrustPenis = "m_autoThrustWeight"
TMIE_ThrustHand = "m_autoHandThrustWeight"
TMIE_WeightPenis = "AutoPenisWeight" -- no hand weight
TMIE_DepthStart = "m_autoStartDepth"
TMIE_DepthEnd = "m_autoEndDepth"

-------------------------------------------------------------------------------------------------
-- BODY / SEX / INTERACTION
-------------------------------------------------------------------------------------------------

-- PENIS/VAGINA
function HasPenis(human)
	return human.Penis.IsActive
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

function GetAct(human, body) -- returns: interaction, ishand
	if not HasSex(human, body) then return nil, false end 
	if body == Body.Hand then return human.Penis.Interaction, true
	elseif body == Body.Penis then return human.Penis.Interaction, false
	elseif body == Body.Mouth then return human.Mouth.Fucker.Penis.Interaction, false
	elseif body == Body.Anus then return human.Anus.Fucker.Penis.Interaction, false
	elseif body == Body.Vagina then return human.Vagina.Fucker.Penis.Interaction, false
	else return nil, false end
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
	TMI_AutoSex = true
	if human.Penis.m_holdDepth ~= 0 and human.Penis.Interaction ~= nil then  StartAutoHandAct(human.Penis.Interaction)  end
	if human.Penis.Hole ~= nil then  StartAutoPenisAct(human.Penis.Interaction) end
	if human.Mouth.Fucker ~= nil then StartAutoPenisAct(human.Mouth.Fucker.Penis.Interaction) end
	if human.Anus.Fucker ~= nil then StartAutoPenisAct(human.Anus.Fucker.Penis.Interaction) end
	if human.Vagina.Fucker ~= nil then StartAutoPenisAct(human.Vagina.Fucker.Penis.Interaction) end
end

function StopAutoSex()
	TMI_AutoSex = false
end

function StartAutoHandAct(interaction)
	-- if not TMI_AutoSex or not interaction.m_autoHandActive then return end
	if not TMI_AutoSex then return end
	StartRandomLoop(SetActSpeedRandom, interaction, true)
	StartRandomLoop(SetActThrustRandom, interaction, true)
	StartRandomLoop(SetActDepthRandom, interaction, true)
end

function StartAutoPenisAct(interaction)
	-- if not TMI_AutoSex or not interaction.AutoActive then return end
	if not TMI_AutoSex then return end
	StartRandomLoop(SetActSpeedRandom, interaction, false)
	StartRandomLoop(SetActThrustRandom, interaction, false)
	StartRandomLoop(SetActWeightRandom, interaction, false)
	StartRandomLoop(SetActDepthRandom, interaction, false)
end

function StartRandomLoop(randomFunc, interaction, isHand)
	if not TMI_AutoSex then return end
	-- if isHand and not interaction.m_autoHandActive then return end
	-- if not isHand and not interaction.AutoActive then return end
	randomFunc(interaction, isHand)
	Delayed(GetRandom(TM_AutoSexTimeMin, TM_AutoSexTimeMax), function() StartRandomLoop(randomFunc, interaction, isHand) end)
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

function SetInteractionActive(interaction, isActive, isHand)
	if isHand then interaction.m_autoHandActive = isActive
	else interaction.AutoActive = isActive end
end

-------------------------------------------------------------------------------------------------
-- (PENIS/HAND) INTERACTION SPEED (0.001 - 2), UI ALLOWS ONLY (0.001 - 0.5)
-------------------------------------------------------------------------------------------------
function ClampActSpeed(value) return ClampValue(value, 0.001, 2) end -- speed value range

function GetActSpeed(interaction, isHand)
	return isHand and interaction.m_autoHandSpeed or interaction.m_autoSpeed
end

function GetActSpeedTarget(interaction, isHand)
	local paramName = isHand and TMIE_SpeedHand or TMIE_SpeedPenis
	return GetActTargetValue(interaction, paramName)
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
	speed = ClampActSpeed(speed)
	SetInteractionActive(interaction, true, isHand)
	if TM_TweenSex then
		local paramName = (isHand and TMIE_SpeedHand or TMIE_SpeedPenis)
		TweenActTo(interaction, paramName, speed, TM_TweenTime)
	else
		if isHand then interaction.m_autoHandSpeed = speed
		else interaction.m_autoSpeed = speed end
	end
	return speed
end

-------------------------------------------------------------------------------------------------
-- (PENIS) INTERACTION WEIGHT (GIVER VS GETTER) (0-1)
-------------------------------------------------------------------------------------------------
function GetActWeight(interaction, isHand)
	return (isHand) and 0 or interaction.AutoPenisWeight -- no interaction weight in handjobs
end

function GetActWeightTarget(interaction, isHand)
	if isHand then return 0 end
	return GetActTargetValue(interaction, TMIE_WeightPenis)
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
	weight = Clamp01(weight)
	SetInteractionActive(interaction, true, isHand)
	if TM_TweenSex then
		TweenActTo(interaction, TMIE_WeightPenis, weight, TM_TweenTime)
	else
		interaction.AutoPenisWeight = weight
	end
	return weight
end

-------------------------------------------------------------------------------------------------
-- (PENIS/HAND) INTERACTION THRUST WEIGHT (normalized 0-1 to actual 1-3)
-------------------------------------------------------------------------------------------------
function ClampActThrust(weight) return ClampValue(weight, 1, 3) end -- thrust value range

function GetActThrust(interaction, isHand)
	return NormalizeValue(isHand and interaction.m_autoHandThrustWeight or interaction.m_autoThrustWeight, 1, 3) -- normalized
end

function GetActThrustTarget(interaction, isHand)
	local paramName = isHand and TMIE_ThrustHand or TMIE_ThrustPenis
	local rawVal = GetActTargetValue(interaction, paramName)
	return NormalizeValue(rawVal, 1, 3)
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
	weight = ClampActThrust(DenormalizeValue(weight, 1, 3)) -- denormalized
	SetInteractionActive(interaction, true, isHand)
	if TM_TweenSex then
		local paramName = isHand and TMIE_ThrustHand or TMIE_ThrustPenis
		TweenActTo(interaction, paramName, weight, TM_TweenTime)
	else
		if isHand then interaction.m_autoHandThrustWeight = weight
		else interaction.m_autoThrustWeight = weight end
	end
	return weight
end

-------------------------------------------------------------------------------------------------
-- (PENIS/HAND) INTERACTION THRUST DEPTH (0-1)
-------------------------------------------------------------------------------------------------
function ClampActDepth(depth, isStartDepth)
	if isStartDepth then return ClampValue(depth, 0, 0.95) -- start depth value range
	else return ClampValue(depth, 0.05,1) end -- end depth value range
end

function GetActDepth(interaction, isStartDepth)
	if isStartDepth then return interaction.m_autoStartDepth
	else return interaction.m_autoEndDepth end
end

function GetActDepthTarget(interaction, isStartDepth)
	local paramName = isStartDepth and TMIE_DepthStart or TMIE_DepthEnd
	return GetActTargetValue(interaction, paramName)
end

function SetActDepthRandom(interaction, isHand)
	local startValue = SetActDepth(interaction, GetRandomFloat(0.1, 0.4), isHand, true)
	local endValue = SetActDepth(interaction, GetRandomFloat(0.6, 0.9), isHand, false)
	return startValue, endValue
end

function SetActDepthStep(interaction, depthStep, increase, isHand, isStartDepth)
	local depth = GetActDepthTarget(interaction, isStartDepth) -- Use Target Value to prevent dampening
	if increase then depth = depth + depthStep
	else depth = depth - depthStep end
	return SetActDepth(interaction, depth, isHand, isStartDepth)
end

function SetActDepth(interaction, depth, isHand, isStartDepth)
	depth = ClampActDepth(depth, isStartDepth)
	SetInteractionActive(interaction, true, isHand)
	if TM_TweenSex then
		local paramName = isStartDepth and TMIE_DepthStart or TMIE_DepthEnd
		TweenActTo(interaction, paramName, depth, TM_TweenTime)
	else
		if isStartDepth then interaction.m_autoStartDepth = depth
		else interaction.m_autoEndDepth = depth	end
	end
	return depth
end

-------------------------------------------------------------------------------------------------
-- TWEENING
-------------------------------------------------------------------------------------------------
local activeTweens = {}

function GetActTargetValue(object, paramName)
	-- SCENARIO A: A tween is currently running.
	-- We loop through the list to find it.
	for i = 1, #activeTweens do
		local t = activeTweens[i]
		if t.object == object and t.param == paramName then
			-- We found a tween! Return where it is GOING (Target), 
			-- not where it is right now.
			return t.targetVal 
		end
	end

	-- SCENARIO B: No tween found. 
	-- (Either the UI just opened, or the tween finished and was removed).
	-- We return the underlying value directly from the object.
	return object[paramName]
end

-- Start a tween on a specific property of the interaction object
function TweenActTo(object, paramName, targetValue, duration)
	-- Remove existing tween for this parameter if it exists to avoid conflicts
	for i = #activeTweens, 1, -1 do
		local t = activeTweens[i]
		if t.object == object and t.param == paramName then
			table.remove(activeTweens, i)
		end
	end
	-- Start new tween
	local startValue = object[paramName]
	-- Fallback if duration is somehow nil, preventing crash
	duration = duration or 0.5 
	-- If duration is effectively zero, set immediately
	if duration <= 0.001 then object[paramName] = targetValue return end
	table.insert(activeTweens, {
		object = object,
		param = paramName,
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