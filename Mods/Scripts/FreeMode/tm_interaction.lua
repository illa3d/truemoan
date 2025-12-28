-- TrueMoan v1.3 by illa3d
-- Tween enums
TMIE_SpeedPenis = "m_autoSpeed"
TMIE_SpeedHand = "m_autoHandSpeed"
TMIE_ThrustPenis = "m_autoThrustWeight"
TMIE_ThrustHand = "m_autoHandThrustWeight"
TMIE_WeightPenis = "AutoPenisWeight" -- no hand weight
TMIE_DepthStart = "m_autoStartDepth"
TMIE_DepthEnd = "m_autoEndDepth"

-------------------------------------------------------------------------------------------------
-- TWEENING
-------------------------------------------------------------------------------------------------
local activeTweens = {}

function TMGetTargetValue(object, paramName)
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
function TMTweenTo(object, paramName, targetValue, duration)
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

function TMUpdateTweens(deltaTime)
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
-- (PENIS/HAND) INTERACTION SPEED (0.001 - 2)
-------------------------------------------------------------------------------------------------
function ClampInteractionSpeed(value) return ClampValue(value, 0.001, 2) end -- speed value range

function GetInteractionSpeed(interaction, isHand)
	return isHand and interaction.m_autoHandSpeed or interaction.m_autoSpeed
end

function GetInteractionSpeedTarget(interaction, isHand)
	local paramName = isHand and TMIE_SpeedHand or TMIE_SpeedPenis
	return TMGetTargetValue(interaction, paramName)
end

function SetInteractionSpeedRandom(interaction, isHand)
	return SetInteractionSpeed(interaction, GetRandomFloat(0.1, 1), isHand)
end

function SetInteractionSpeedStep(interaction, speedStep, increase, isHand)
	local speed = GetInteractionSpeedTarget(interaction, isHand) -- Use Target Value to prevent dampening
	local increment = 1 + (speedStep / (speed ^ 0.6)) -- 1 + (speed multiplier / (speed / curve))
	if increase then speed = speed * increment
	else speed = speed / increment end
	return SetInteractionSpeed(interaction, speed, isHand)
end

function SetInteractionSpeed(interaction, speed, isHand)
	speed = ClampInteractionSpeed(speed)
	SetInteractionActive(interaction, true, isHand)
	if TM_TweenSex then
		local paramName = (isHand and TMIE_SpeedHand or TMIE_SpeedPenis)
		TMTweenTo(interaction, paramName, speed, TM_TweenDuration)
	else
		if isHand then interaction.m_autoHandSpeed = speed
		else interaction.m_autoSpeed = speed end
	end
	return speed
end


-------------------------------------------------------------------------------------------------
-- (PENIS) INTERACTION WEIGHT (GIVER VS GETTER) (0-1)
-------------------------------------------------------------------------------------------------
function GetInteractionPenisWeight(interaction, isHand)
	return (isHand) and 0 or interaction.AutoPenisWeight -- no interaction weight in handjobs
end

function GetInteractionPenisWeightTarget(interaction, isHand)
	if isHand then return 0 end
	return TMGetTargetValue(interaction, TMIE_WeightPenis)
end

function SetInteractionPenisWeightRandom(interaction, isHand)
	return SetInteractionPenisWeight(interaction, GetRandomFloat01(), isHand)
end

function SetInteractionPenisWeightStep(interaction, weightStep, increase, isHand)
	local weight = GetInteractionPenisWeightTarget(interaction, isHand) -- Use Target Value to prevent dampening
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	return SetInteractionPenisWeight(interaction, weight, isHand)
end

function SetInteractionPenisWeight(interaction, weight, isHand)
	if isHand then return end -- no interaction weight in handjobs
	weight = Clamp01(weight)
	SetInteractionActive(interaction, true, isHand)
	if TM_TweenSex then
		TMTweenTo(interaction, TMIE_WeightPenis, weight, TM_TweenDuration)
	else
		interaction.AutoPenisWeight = weight
	end
	return weight
end


-------------------------------------------------------------------------------------------------
-- (PENIS/HAND) INTERACTION THRUST WEIGHT (normalized 0-1 to actual 1-3)
-------------------------------------------------------------------------------------------------
function ClampInteractionThrustWeight(weight) return ClampValue(weight, 1, 3) end -- thrust value range

function GetInteractionThrustWeight(interaction, isHand)
	return NormalizeValue(isHand and interaction.m_autoHandThrustWeight or interaction.m_autoThrustWeight, 1, 3) -- normalized
end

function GetInteractionThrustWeightTarget(interaction, isHand)
	local paramName = isHand and TMIE_ThrustHand or TMIE_ThrustPenis
	local rawVal = TMGetTargetValue(interaction, paramName)
	return NormalizeValue(rawVal, 1, 3)
end

function SetInteractionThrustWeightRandom(interaction, isHand)
	return SetInteractionThrustWeight(interaction, GetRandomFloat(0,0.6), isHand)
end

function SetInteractionThrustWeightStep(interaction, weightStep, increase, isHand)
	local weight = GetInteractionThrustWeightTarget(interaction, isHand) -- Use Target Value to prevent dampening
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	return SetInteractionThrustWeight(interaction, weight, isHand)
end

function SetInteractionThrustWeight(interaction, weight, isHand)
	weight = ClampInteractionThrustWeight(DenormalizeValue(weight, 1, 3)) -- denormalized
	SetInteractionActive(interaction, true, isHand)
	if TM_TweenSex then
		local paramName = isHand and TMIE_ThrustHand or TMIE_ThrustPenis
		TMTweenTo(interaction, paramName, weight, TM_TweenDuration)
	else
		if isHand then interaction.m_autoHandThrustWeight = weight
		else interaction.m_autoThrustWeight = weight end
	end
	return weight
end


-------------------------------------------------------------------------------------------------
-- (PENIS/HAND) INTERACTION THRUST DEPTH (0-1)
-------------------------------------------------------------------------------------------------
function ClampInteractionDepth(depth, isStartDepth)
	if isStartDepth then return ClampValue(depth, 0, 0.95) -- start depth value range
	else return ClampValue(depth, 0.05,1) end -- end depth value range
end

function GetInteractionDepth(interaction, isStartDepth)
	if isStartDepth then return interaction.m_autoStartDepth
	else return interaction.m_autoEndDepth end
end

function GetInteractionDepthTarget(interaction, isStartDepth)
	local paramName = isStartDepth and TMIE_DepthStart or TMIE_DepthEnd
	return TMGetTargetValue(interaction, paramName)
end

function SetInteractionDepthRandom(interaction, isHand)
	local startValue = SetInteractionDepth(interaction, GetRandomFloat(0.2, 0.6), isHand, true)
	local endValue = SetInteractionDepth(interaction, GetRandomFloat(startValue + 0.05, 1), isHand, false)
	return startValue, endValue
end

function SetInteractionDepthStep(interaction, depthStep, increase, isHand, isStartDepth)
	local depth = GetInteractionDepthTarget(interaction, isStartDepth) -- Use Target Value to prevent dampening
	if increase then depth = depth + depthStep
	else depth = depth - depthStep end
	return SetInteractionDepth(interaction, depth, isHand, isStartDepth)
end

function SetInteractionDepth(interaction, depth, isHand, isStartDepth)
	depth = ClampInteractionDepth(depth, isStartDepth)
	SetInteractionActive(interaction, true, isHand)
	if TM_TweenSex then
		local paramName = isStartDepth and TMIE_DepthStart or TMIE_DepthEnd
		TMTweenTo(interaction, paramName, depth, TM_TweenDuration)
	else
		if isStartDepth then interaction.m_autoStartDepth = depth
		else interaction.m_autoEndDepth = depth	end
	end
	return depth
end