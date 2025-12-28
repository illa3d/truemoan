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

-- CONFIGURATION
local TWEEN_DURATION = 1.0 -- Time in seconds to transition between values

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

function SetInteractionSpeedRandom(interaction, isHand)
	return SetInteractionSpeed(interaction, GetRandomFloat(0.1, 1), isHand)
end

function SetInteractionSpeedStep(interaction, speedStep, increase, isHand)
	local speed = isHand and interaction.m_autoHandSpeed or interaction.m_autoSpeed
	local increment = 1 + (speedStep / (speed ^ 0.6)) -- 1 + (speed multiplier / (speed / curve))
	if increase then speed = speed * increment
	else speed = speed / increment end
	return SetInteractionSpeed(interaction, speed, isHand)
end

function SetInteractionSpeed(interaction, speed, isHand)
	speed = ClampInteractionSpeed(speed)
	SetInteractionActive(interaction, true, isHand)
	--if isHand then interaction.m_autoHandSpeed = speed
	--else interaction.m_autoSpeed = speed end
	local paramName = isHand and "m_autoHandSpeed" or "m_autoSpeed"
	TweenTo(interaction, paramName, speed, TWEEN_DURATION)
	return speed
end

-------------------------------------------------------------------------------------------------
-- (PENIS) INTERACTION WEIGHT (GIVER VS GETTER) (0-1)
-------------------------------------------------------------------------------------------------
function GetInteractionPenisWeight(interaction, isHand)
	return (isHand) and 0 or interaction.AutoPenisWeight -- no interaction weight in handjobs
end

function SetInteractionPenisWeightRandom(interaction, isHand)
	return SetInteractionPenisWeight(interaction, GetRandomFloat01(), isHand)
end

function SetInteractionPenisWeightStep(interaction, weightStep, increase, isHand)
	local weight = GetInteractionPenisWeight(interaction, isHand)
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	return SetInteractionPenisWeight(interaction, weight, isHand)
end

function SetInteractionPenisWeight(interaction, weight, isHand)
	if isHand then return end -- no interaction weight in handjobs
	weight = Clamp01(weight)
	SetInteractionActive(interaction, true, isHand)
	--interaction.AutoPenisWeight = weight
	TweenTo(interaction, "AutoPenisWeight", weight, TWEEN_DURATION)
	return weight
end

-------------------------------------------------------------------------------------------------
-- (PENIS/HAND) INTERACTION THRUST WEIGHT (normalized 0-1 to actual 1-3)
-------------------------------------------------------------------------------------------------
function ClampInteractionThrustWeight(weight) return ClampValue(weight, 1, 3) end -- thrust value range

function GetInteractionThrustWeight(interaction, isHand)
	return NormalizeValue(isHand and interaction.m_autoHandThrustWeight or interaction.m_autoThrustWeight, 1, 3) -- normalized
end

function SetInteractionThrustWeightRandom(interaction, isHand)
	return SetInteractionThrustWeight(interaction, GetRandomFloat(0,0.6), isHand)
end

function SetInteractionThrustWeightStep(interaction, weightStep, increase, isHand)
	local weight = GetInteractionThrustWeight(interaction, isHand)
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	return SetInteractionThrustWeight(interaction, weight, isHand)
end

function SetInteractionThrustWeight(interaction, weight, isHand)
	weight = ClampInteractionThrustWeight(DenormalizeValue(weight, 1, 3)) -- denormalized
	SetInteractionActive(interaction, true, isHand)
	--if isHand then interaction.m_autoHandThrustWeight = weight
	--else interaction.m_autoThrustWeight = weight end
	local paramName = isHand and "m_autoHandThrustWeight" or "m_autoThrustWeight"
	TweenTo(interaction, paramName, weight, TWEEN_DURATION)
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

function SetInteractionDepthRandom(interaction, isHand)
	local startValue = SetInteractionDepth(interaction, GetRandomFloat(0.2, 0.6), isHand, true)
	local endValue = SetInteractionDepth(interaction, GetRandomFloat(startValue + 0.05, 1), isHand, false)
	return startValue, endValue
end

function SetInteractionDepthStep(interaction, depthStep, increase, isHand, isStartDepth)
	local depth = GetInteractionDepth(interaction, isStartDepth)
	if increase then depth = depth + depthStep
	else depth = depth - depthStep end
	return SetInteractionDepth(interaction, depth, isHand, isStartDepth)
end

function SetInteractionDepth(interaction, depth, isHand, isStartDepth)
	depth = ClampInteractionDepth(depth, isStartDepth)
	SetInteractionActive(interaction, true, isHand)
	--if isStartDepth then interaction.m_autoStartDepth = depth
	--else interaction.m_autoEndDepth = depth	end
	local paramName = isStartDepth and "m_autoStartDepth" or "m_autoEndDepth"
	TweenTo(interaction, paramName, depth, TWEEN_DURATION)
	return depth
end

-------------------------------------------------------------------------------------------------
-- TWEENING
-------------------------------------------------------------------------------------------------

local activeTweens = {}

function OnInteractionFrameUpdate()
	local deltaTime = Timer("TMDT")
	ResetTimer("TMDT")
	
	-- Update active tweens
	UpdateTweens(deltaTime)
end

-- Start a tween on a specific property of the interaction object
function TweenTo(object, paramName, targetValue, duration)
	-- Remove existing tween for this parameter if it exists to avoid conflicts
	for i = #activeTweens, 1, -1 do
		local t = activeTweens[i]
		if t.object == object and t.param == paramName then
			table.remove(activeTweens, i)
		end
	end

	-- Start new tween
	local startValue = object[paramName]
	
	-- If duration is effectively zero, set immediately
	if duration <= 0.001 then
		object[paramName] = targetValue
		return
	end

	table.insert(activeTweens, {
		object = object,
		param = paramName,
		startVal = startValue,
		targetVal = targetValue,
		duration = duration,
		elapsed = 0
	})
end

function UpdateTweens(dt)
	for i = #activeTweens, 1, -1 do
		local t = activeTweens[i]
		t.elapsed = t.elapsed + dt
		
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