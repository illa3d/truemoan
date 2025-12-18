-- Version 1.0 by illa3d

function ResetPose(human)
	human.Pose(StandUp())
	human.Pose(FaceNeutral())
	game.RemoveAnim(human)
	game.RemoveAnim(human.chestNames)
	game.RemoveAnim(human.breastNames)
	game.RemoveAnim(human.forearmNames)
	game.RemoveAnim(human.handNames)
	game.RemoveAnim(human.m_mouth)
	game.RemoveAnim(human.headNames)
	game.RemoveAnim(human.Anus)
	game.RemoveAnim(human.footNames)
	game.RemoveAnim(human.thighNames)
	human.Penis.Interaction.AutoActive = false
	human.Mouth.Fucker.Penis.Interaction.AutoActive = false
end

function SetInteractionSpeed(interaction, speed)
	speed = math.max(sexspeedmin, math.min(speed, sexspeedmax)) -- clamp min max
	interaction.AutoActive = true
	interaction.m_autoSpeed = speed
end

function SetInteractionSpeedStep(interaction, increase)
	local speed = interaction.m_autoSpeed
	local increment = 1 + (0.05 / (speed ^ 0.6)) -- 1 + (speed multiplier / (speed / curve))
	if increase then speed = speed * increment
	else speed = speed / increment end
	speed = math.max(sexspeedmin, math.min(speed, sexspeedmax)) -- clamp min max
	interaction.AutoActive = true
	interaction.m_autoSpeed = speed
end