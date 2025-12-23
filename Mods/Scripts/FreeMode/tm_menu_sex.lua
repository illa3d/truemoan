-- TrueMoan v0.9 by illa3d
-- Variables
cumevery = 0
-- Sex speed decimals
sdec = 3

label TMMenuSex(human)
	+ "Auto Thrust" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == false]
		--function GradualSpeedUpAutoThrusting(human, duration, step, startSpeed, endSpeed, startDepth, endDepth, autoDisableAfter)
		GradualSpeedUpAutoThrusting(human, 30, 0, 0.6, 0.3, 0.1, 1, 30)
		Return()
	+ "Auto Sucking" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == false and activeAutoBJ == false]
		--function GradualSpeedUpAutoBJ(human, duration, step, startSpeed, endSpeed, startDepth, endDepth, autoDisableAfter)
		human.Mouth.Fucker.Penis.Interaction.AutoPenisWeight = 0
		GradualSpeedUpAutoBJ(human, 30, 0, 0.35, 0.1, 0.3, 1.5, 25)
		activeAutoBJ = true
		Return()
	+ "Thrust.. | " .. ValueLabel(human.Penis.Interaction.m_autoSpeed, sdec) [if human.Penis.Hole ~= nil] [gold]
		+ "5 Max"
			SetInteractionSpeed(human.Penis.Interaction, 2);
			Return()
		+ "4 Fast"
			SetInteractionSpeed(human.Penis.Interaction, 0.9)	
			Return()
		+ "3 Normal"
			SetInteractionSpeed(human.Penis.Interaction, 0.5)
			Return()
		+ "2 Medium"
			SetInteractionSpeed(human.Penis.Interaction, 0.25)
			Return()
		+ "1 Slow"
			SetInteractionSpeed(human.Penis.Interaction, 0.1)
			Return()
		+ "Faster >"
			SetInteractionSpeedStep(human.Penis.Interaction, true)
			Return()
		+ "< Slower"
			SetInteractionSpeedStep(human.Penis.Interaction, false)
			Return()
		+ "STOP | " .. ValueLabel(human.Penis.Interaction.m_autoSpeed, sdec) [gold]
			SetInteractionSpeed(human.Penis.Interaction, 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Suck.. | " .. ValueLabel(human.Mouth.Fucker.Penis.Interaction.m_autoSpeed, sdec) [if human.Mouth.Fucker ~= nil] [gold]
		+ "5 Max"
			SetInteractionSpeed(human.Mouth.Fucker.Penis.Interaction, 2);
			Return()
		+ "4 Fast"
			SetInteractionSpeed(human.Mouth.Fucker.Penis.Interaction, 0.9)	
			Return()
		+ "3 Normal"
			SetInteractionSpeed(human.Mouth.Fucker.Penis.Interaction, 0.5)	
			Return()
		+ "2 Medium"
			SetInteractionSpeed(human.Mouth.Fucker.Penis.Interaction, 0.25)	
			Return()
		+ "1 Slow"
			SetInteractionSpeed(human.Mouth.Fucker.Penis.Interaction, 0.1)	
			Return()
		+ "Faster >"
			SetInteractionSpeedStep(human.Mouth.Fucker.Penis.Interaction, true)
			Return()
		+ "< Slower"
			SetInteractionSpeedStep(human.Mouth.Fucker.Penis.Interaction, false)
			Return()
		+ "STOP | " .. ValueLabel(human.Mouth.Fucker.Penis.Interaction.m_autoSpeed, sdec) [gold]
			SetInteractionSpeed(human.Mouth.Fucker.Penis.Interaction, 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Start Thrusting" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == false]
		human.Penis.Interaction.AutoActive = true
		human.Penis.Interaction.AutoPenisWeight = 1
		Return()
	+ "Stop Thrusting" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == true]
		human.Penis.Interaction.AutoActive = false
		Return()
	+ "Start Sucking" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == false and activeAutoBJ == false]
		human.Mouth.Fucker.Penis.Interaction.AutoActive = true
		human.Mouth.Fucker.Penis.Interaction.AutoPenisWeight = 0
		Return()
	+ "Stop Sucking" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == true and activeAutoBJ == false]
		human.Mouth.Fucker.Penis.Interaction.AutoActive = false
		Return()
	+ "Stop Sucking" [if human.Mouth.Fucker ~= nil and activeAutoBJ == true]
		--human.Mouth.Fucker.Penis.Interaction.AutoActive = false
		StopAutoBJ(human)
		activeAutoBJ = false
		Return()
	+ "Start handjob" [if human.Penis.m_holdDepth ~= 0 and human.Penis.Interaction.m_autoHandActive == false]
		human.Penis.Interaction.m_autoHandActive = true
		Return()
	+ "Stop handjob" [if human.Penis.m_holdDepth ~= 0 and human.Penis.Interaction.m_autoHandActive == true]
		human.Penis.Interaction.m_autoHandActive = false
		Return()
	+ if human.Penis.IsActive == true
		+ "Cum.. | " .. WordLabel(cumevery .. "s") [gold]
			+ "Cum every 1 sec"
				cumevery = 1
				game.AddRepeatAnim(1, || human.Shoot(), human.Penis)
				Return(2)
			+ "Cum every 2 sec"
				cumevery = 2
				game.AddRepeatAnim(2, || human.Shoot(), human.Penis)
				Return(2)
			+ "Cum every 4 sec"
				cumevery = 4
				game.AddRepeatAnim(4, || human.Shoot(), human.Penis)
				Return(2)
			+ "Cum every 8 sec"
				cumevery = 8
				game.AddRepeatAnim(8, || human.Shoot(), human.Penis)
				Return(2)
			+ "Cum every 16 sec"
				cumevery = 16
				game.AddRepeatAnim(16, || human.Shoot(), human.Penis)
				Return(2)
			+ "Cum every 32 sec"
				cumevery = 32
				game.AddRepeatAnim(32, || human.Shoot(), human.Penis)
				Return(2)
			+ MenuBack
				Return(2)
			+ MenuClose
		+ if game.HasAnim(human.Penis)
			+ "Stop Cumming"
				cumevery = 0
				game.RemoveAnim(human.Penis)
				Return()
		+ else
			+ "Start Cumming"
				cumevery = 4
				game.AddRepeatAnim(4, || human.Shoot(), human.Penis)
				Return()
	+ if human.Penis.IsActive == false
		+ "Wet.. | V" .. human.m_vagina.m_wetness .. " | A" ..human.m_anus.m_wetness.. " | M" .. human.m_mouth.m_wetness [gold]
			+ "3 Squirt"
				SetGirlWetness(human, 10000, "Vagina")
				Return()
			+ "2 Wet"
				SetGirlWetness(human, 2000, "Vagina")
				Return()
			+ "1 Default"
				SetGirlWetness(human, 500, "Vagina")
				Return()
			+ "Wetness >"
				wett = human.m_vagina.m_wetness + WetnessStep
				SetGirlWetness(human, wett, "Vagina")
				Return()
			+ "< Wetness"
				wett = human.m_vagina.m_wetness - WetnessStep
				if wett < 0
					wett = 0
				SetGirlWetness(human, wett, "Vagina")
				Return()
			+ "RESET | V" .. human.m_vagina.m_wetness .. " | A" ..human.m_anus.m_wetness.. " | M" .. human.m_mouth.m_wetness [gold]
				ResetGirlWetness(human)	
				Return()
			+ MenuBack
				Return(2)
			+ MenuClose
		+ if human.m_vagina.m_wetness > 0 or human.m_anus.m_wetness > 0 or human.m_mouth.m_wetness > 0
			+ "Stop Wetness"
				ResetGirlWetness(human)	
				Return()
		+ else
			+ "Start Squirting"
				SetGirlWetness(human, 10000, "Vagina")
				Return()
	+ MenuBack
		Return(2)
	+ MenuClose
stop