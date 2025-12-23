-- TrueMoan vSexSpeedFast by illa3d
-- Variables
cumevery = 0
-- Sex speed decimals
sdec = 3

label SexControl(interaction, ishand)
	+ "5 Max"
		SetInteractionSpeed(interaction, SexSpeedMax, ishand)
		Return()
	+ "4 Fast"
		SetInteractionSpeed(interaction, SexSpeedFast, ishand)
		Return()
	+ "3 Normal"
		SetInteractionSpeed(interaction, SexSpeedNormal, ishand)
		Return()
	+ "2 Medium"
		SetInteractionSpeed(interaction, SexSpeedMedium, ishand)
		Return()
	+ "1 Slow"
		SetInteractionSpeed(interaction, SexSpeedSlow, ishand)
		Return()
	+ "Faster >"
		SetInteractionSpeedStep(interaction, SexSpeedStep, true, ishand)
		Return()
	+ "< Slower"
		SetInteractionSpeedStep(interaction, SexSpeedStep, false, ishand)
		Return()
	+ "STOP | " .. ValueLabel((ishand ~= nill and ishand) and interaction.m_autoHandSpeed or interaction.m_autoSpeed, sdec) [gold]
		SetInteractionSpeed(interaction, 0)
		Return()
	+ MenuBack
		Return(2)
	+ MenuClose
stop

label TMMenuSex(human)
	-- `Natural AutoBJ AutoThrust` @masterchief_87971
	+ "Thrust auto" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == false]
		--function GradualSpeedUpAutoThrusting(human, duration, step, startSpeed, endSpeed, startDepth, endDepth, autoDisableAfter)
		GradualSpeedUpAutoThrusting(human, 30, 0, 0.6, 0.3, 0.1, 1, 30)
		Return()
	+ "Oral auto" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == false and activeAutoBJ == false]
		--function GradualSpeedUpAutoBJ(human, duration, step, startSpeed, endSpeed, startDepth, endDepth, autoDisableAfter)
		human.Mouth.Fucker.Penis.Interaction.AutoPenisWeight = 0
		GradualSpeedUpAutoBJ(human, 30, 0, 0.35, 0.1, 0.3, 1.5, 25)
		activeAutoBJ = true
		Return()

	-- SEX CONTROL
	-- GETTER HANDJOB
	+ "Handjob.. | " .. ValueLabel(human.Penis.Interaction.m_autoSpeed, sdec) [if human.Penis.m_holdDepth ~= 0] [gold]
		SexControl(human.Penis.Interaction, true)
	-- GIVER (MOUTH, VAGINA, ANUS)
	+ "Thrust.. | " .. ValueLabel(human.Penis.Interaction.m_autoSpeed, sdec) [if human.Penis.Hole ~= nil] [gold]
		SexControl(human.Penis.Interaction)
	-- GETTER MOUTH
	+ "Oral.. | " .. ValueLabel(human.Mouth.Fucker.Penis.Interaction.m_autoSpeed, sdec) [if human.Mouth.Fucker ~= nil] [gold]
		SexControl(human.Mouth.Fucker.Penis.Interaction)
	-- GETTER ANUS
	+ "Anal.. | " .. ValueLabel(human.Anus.Fucker.Penis.Interaction.m_autoSpeed, sdec) [if human.Anus.Fucker ~= nil] [gold]
		SexControl(human.Anus.Fucker.Penis.Interaction)
	-- GETTER VAGINA
	+ "Sex.. | " .. ValueLabel(human.Vagina.Fucker.Penis.Interaction.m_autoSpeed, sdec) [if human.Vagina.Fucker ~= nil] [gold]
		SexControl(human.Vagina.Fucker.Penis.Interaction)

	-- START / STOP
	-- GETTER HANDJOB
	+ "Handjob start" [if human.Penis.m_holdDepth ~= 0 and human.Penis.Interaction.m_autoHandActive == false]
		human.Penis.Interaction.m_autoHandActive = true
		Return()
	+ "Handjob STOP" [if human.Penis.m_holdDepth ~= 0 and human.Penis.Interaction.m_autoHandActive == true]
		human.Penis.Interaction.m_autoHandActive = false
		Return()
	-- GIVER (MOUTH, VAGINA, ANUS)
	+ "Thrust start" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == false]
		human.Penis.Interaction.AutoActive = true
		human.Penis.Interaction.AutoPenisWeight = 0.8
		Return()
	+ "Thrust STOP" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == true]
		human.Penis.Interaction.AutoActive = false
		Return()
	-- GETTER MOUTH
	+ "Oral start" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == false and activeAutoBJ == false]
		human.Mouth.Fucker.Penis.Interaction.AutoActive = true
		human.Mouth.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Oral STOP" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == true and activeAutoBJ == false]
		human.Mouth.Fucker.Penis.Interaction.AutoActive = false
		Return()
	+ "Oral STOP" [if human.Mouth.Fucker ~= nil and activeAutoBJ == true]
		--human.Mouth.Fucker.Penis.Interaction.AutoActive = false
		StopAutoBJ(human)
		activeAutoBJ = false
		Return()
	-- GETTER ANUS
	+ "Anal start" [if human.Anus.Fucker ~= nil and human.Anus.Fucker.Penis.Interaction.AutoActive == false]
		human.Anus.Fucker.Penis.Interaction.AutoActive = true
		human.Anus.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Anal STOP" [if human.Anus.Fucker ~= nil and human.Anus.Fucker.Penis.Interaction.AutoActive == true]
		human.Anus.Fucker.Penis.Interaction.AutoActive = false
		Return()
	-- GETTER VAGINA
	+ "Sex start" [if human.Vagina.Fucker ~= nil and human.Vagina.Fucker.Penis.Interaction.AutoActive == false]
		human.Vagina.Fucker.Penis.Interaction.AutoActive = true
		human.Vagina.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Sex STOP" [if human.Vagina.Fucker ~= nil and human.Vagina.Fucker.Penis.Interaction.AutoActive == true]
		human.Vagina.Fucker.Penis.Interaction.AutoActive = false
		Return()

	-- HAS PENIS
	+ if human.Penis.IsActive == true
		+ "Cum.. | " .. WordLabel(cumevery .. "s") [gold]
			+ "Cum every 1 sec"
				cumevery = SetCumEvery(human, 1)
				Return(2)
			+ "Cum every 2 sec"
				cumevery = SetCumEvery(human, 2)
				Return(2)
			+ "Cum every 4 sec"
				cumevery = SetCumEvery(human, 4)
				Return(2)
			+ "Cum every 8 sec"
				cumevery = SetCumEvery(human, 8)
				Return(2)
			+ "Cum every 16 sec"
				cumevery = SetCumEvery(human, 16)
				Return(2)
			+ "Cum every 32 sec"
				cumevery = SetCumEvery(human, 32)
				Return(2)
			+ MenuBack
				Return(2)
			+ MenuClose
		+ if game.HasAnim(human.Penis)
			+ "Cum STOP"
				cumevery = 0
				game.RemoveAnim(human.Penis)
				Return()
		+ else
			+ "Cum start"
				cumevery = 4
				game.AddRepeatAnim(4, || human.Shoot(), human.Penis)
				Return()

	-- HAS NO PENIS
	+ if not human.Penis.IsActive
		+ "Wet.. | " .. ValueLabel2("V",human.m_vagina.m_wetness, "A", human.m_anus.m_wetness) .. " | " .. ValueLabel1("M", human.m_mouth.m_wetness) [gold]
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
			+ "RESET | " .. ValueLabel2("V",human.m_vagina.m_wetness, "A", human.m_anus.m_wetness) .. " | " .. ValueLabel1("M", human.m_mouth.m_wetness) [gold]
				ResetGirlWetness(human)	
				Return()
			+ MenuBack
				Return(2)
			+ MenuClose
		+ if human.m_vagina.m_wetness > 0 or human.m_anus.m_wetness > 0 or human.m_mouth.m_wetness > 0
			+ "Wet STOP"
				ResetGirlWetness(human)	
				Return()
		+ else
			+ "Squirt start"
				SetGirlWetness(human, 10000, "Vagina")
				Return()
	+ MenuBack
		Return(2)
	+ MenuClose
stop