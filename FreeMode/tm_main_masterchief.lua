-- written on top of "FreemodeHG version 0.3"
-- https://discord.com/channels/620113492208517120/1312401584910631054/1355675724932972634

-- Variables
activeAutoBJ = false

function GradualSpeedUpAutoBJ(human, duration, step, startSpeed, endSpeed, startDepth, endDepth, autoDisableAfter)
	duration = duration or 30
	step = step or 0
	startSpeed = startSpeed or 0.5
	endSpeed = endSpeed or 0.1
	startDepth = startDepth or 0
	endDepth = endDepth or 1.5
	autoDisableAfter = autoDisableAfter or duration + 1  -- default: disable right after sequence ends

	local fixedEndDepth = 1.0
	local speedStep = (startSpeed - endSpeed) / duration
	local depthStep = (endDepth - startDepth) / duration

	-- Abort if no target
	if human.Mouth == nil or human.Mouth.Fucker == nil or human.Mouth.Fucker.Penis == nil then
		return
	end

	local penis = human.Mouth.Fucker.Penis

	-- On first run, activate and schedule auto-disable
	if step == 0 then
		penis.Interaction.AutoActive = true

		-- Auto disable after X seconds
		Delayed(autoDisableAfter, function()
			if penis.Interaction.AutoActive then
				penis.Interaction.AutoActive = false
			end
		end)
	end

	-- Step progression
	if step <= duration then
		local newSpeed = startSpeed - speedStep * step
		local newStartDepth = startDepth + depthStep * step

		penis.Interaction.m_autoSpeed = newSpeed
		penis.Interaction.m_autoStartDepth = newStartDepth
		penis.Interaction.m_autoEndDepth = fixedEndDepth

		if human.Mouth.Fucker.Penis.Interaction.AutoActive == true then

			Delayed(1, function()
				GradualSpeedUpAutoBJ(human, duration, step + 1, startSpeed, endSpeed, startDepth, endDepth, autoDisableAfter)
			end)
		end
	else
		-- Final clamp
		penis.Interaction.m_autoSpeed = endSpeed
		penis.Interaction.m_autoStartDepth = endDepth
		penis.Interaction.m_autoEndDepth = fixedEndDepth
	end
end

function StopAutoBJ(human)
	if human == nil or human.Mouth == nil or human.Mouth.Fucker == nil then return end

	local penis = human.Mouth.Fucker.Penis
	if penis == nil then return end

	penis.Interaction.AutoActive = false
	penis.Interaction.m_autoSpeed = 0.3
	penis.Interaction.m_autoStartDepth = 0.3
	penis.Interaction.m_autoEndDepth = 0.5
end

function GradualSpeedUpAutoThrusting(human, duration, step, startSpeed, endSpeed, startDepth, endDepth, hasOffsetApplied)
	duration = duration or 30
	step = step or 0
	startSpeed = startSpeed or 0.3
	endSpeed = endSpeed or 1.0
	startDepth = startDepth or 0.3
	endDepth = endDepth or 1.0
	hasOffsetApplied = hasOffsetApplied or false

	if human == nil or human.Penis == nil or human.Penis.Hole == nil then return end
	local penis = human.Penis

	-- Stop if manually deactivated
	if step > 0 and penis.Interaction.AutoActive ~= true then return end

	-- First-time setup
	if step == 0 then
		penis.Interaction.AutoActive = true
		penis.Interaction.AutoPenisWeight = 1
	end

	-- Primary offset conditions (once, after half the duration)
	local offsetZoneStart = math.floor(duration * 0.25)
	if not hasOffsetApplied and step >= offsetZoneStart then
		local shouldOffset = math.random() < 0.5 -- 50% chance
		if shouldOffset then
			local offsetPercent = math.random(15, 50) / 100
			local offsetAmount = math.floor(duration * offsetPercent)
			step = math.max(0, step - offsetAmount)
			hasOffsetApplied = true
		end
	end

	-- Increase the pushback chance as progress advances
	local progress = math.min(step / duration, 1)  -- 0 (start) to 1 (end)
	local backStepChance = 0.05 + 0.25 * progress  -- grows from 0.25 to 0.5

	if math.random() < backStepChance then  
		local pushBack = math.random(2, 8)
		step = math.max(0, step - pushBack)
	end

	-- Recalculate progression values after any offset/pushback
	local speedStep = (endSpeed - startSpeed) / duration
	local depthStep = (endDepth - startDepth) / duration

	local currentDepth = startDepth + depthStep * step
	local currentSpeed = startSpeed + speedStep * step

	-- When the depth is nearly closed, decrease the speed gradually.
	local depthThreshold = startDepth + (endDepth - startDepth) * 0.8
	if currentDepth > depthThreshold then
		local ratio = (currentDepth - depthThreshold) / (endDepth - depthThreshold)
		currentSpeed = endSpeed - (endSpeed - startSpeed) * ratio
	end

	local fixedEndDepth = endDepth

	penis.Interaction.m_autoSpeed = currentSpeed
	penis.Interaction.m_autoStartDepth = currentDepth
	penis.Interaction.m_autoEndDepth = fixedEndDepth

	Delayed(1, function()
		GradualSpeedUpAutoThrusting(human, duration, step + 1, startSpeed, endSpeed, startDepth, endDepth, hasOffsetApplied)
	end)
end
