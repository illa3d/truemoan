-- TrueMoan vSexSpeedFast by illa3d
-- Variables
tmCumevery = 0
-- Sex speed decimals
tmSdec = 3

-- SEX CONTROL (in many menus)
label TMSexControl(human, interaction, ishand)
	+ "• Max"
		SetInteractionSpeed(interaction, TM_SexSpeedMax, ishand)
		Return()
	+ "• Fast"
		SetInteractionSpeed(interaction, TM_SexSpeedFast, ishand)
		Return()
	+ "• Normal"
		SetInteractionSpeed(interaction, TM_SexSpeedNormal, ishand)
		Return()
	+ "• Medium"
		SetInteractionSpeed(interaction, TM_SexSpeedMedium, ishand)
		Return()
	+ "• Slow"
		SetInteractionSpeed(interaction, TM_SexSpeedSlow, ishand)
		Return()
	+ "| Speed >"
		SetInteractionSpeedStep(interaction, TM_SexSpeedStep, true, ishand)
		Return()
	+ "| < Speed"
		SetInteractionSpeedStep(interaction, TM_SexSpeedStep, false, ishand)
		Return()
	+ "RESET Speed | " .. TMValueLabel(GetInteractionSpeed(interaction, ishand), tmSdec)
		SetInteractionSpeed(interaction, 0, ishand)
		Return()
	
	-- handjob
	+ if human.Penis.m_holdDepth ~= 0
		+ "Style control.. | T" .. TMValueLabel(GetInteractionThrustWeight(interaction, ishand), tmSdec) [if TM_SexShowStyleControl] [gold]
			+ "| Thrust >"
				SetInteractionThrustWeightStep(interaction, TM_SexThrustStep, true, ishand)
				Return()
			+ "| < Thrust"
				SetInteractionThrustWeightStep(interaction, TM_SexThrustStep, false, ishand)
				Return()
			+ "RESET Thrust | " .. TMValueLabel(GetInteractionThrustWeight(interaction, ishand), tmSdec)[gold]
				SetInteractionThrustWeight(interaction, 0, ishand)
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose

	-- oral/vaginal/anal
	+ else 
		+ "Style control.. | M" .. TMValueLabel(GetInteractionWeight(interaction, ishand), tmSdec) .. " | T" .. TMValueLabel(GetInteractionThrustWeight(interaction, ishand), tmSdec) [if TM_SexShowStyleControl] [gold]
			+ "| Thrust >"
				SetInteractionThrustWeightStep(interaction, TM_SexThrustStep, true, ishand)
				Return()
			+ "| < Thrust"
				SetInteractionThrustWeightStep(interaction, TM_SexThrustStep, false, ishand)
				Return()
			+ "RESET Thrust | " .. TMValueLabel(GetInteractionThrustWeight(interaction, ishand), tmSdec)
				SetInteractionThrustWeight(interaction, 0, ishand)
				Return()
			+ "| Male >"
				SetInteractionWeightStep(interaction, TM_SexMaleStep, true, ishand)
				Return()
			+ "| < Male"
				SetInteractionWeightStep(interaction, TM_SexMaleStep, false, ishand)
				Return()
			+ "RESET Male | " .. TMValueLabel(GetInteractionWeight(interaction, ishand), tmSdec)
				SetInteractionWeight(interaction, 0, ishand)
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose

	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- SEX MENU
label TMMenuSex(human)
	-- `Natural AutoBJ AutoThrust` @masterchief_87971
	+ "Sex auto" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == false]
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
	+ "Handjob control.. | " .. TMValueLabel(human.Penis.Interaction.m_autoSpeed, tmSdec) [if human.Penis.m_holdDepth ~= 0] [gold]
		TMSexControl(human, human.Penis.Interaction, true)
	-- GIVER (MOUTH, VAGINA, ANUS)
	+ "Sex control.. | " .. TMValueLabel(human.Penis.Interaction.m_autoSpeed, tmSdec) [if human.Penis.Hole ~= nil] [gold]
		TMSexControl(human, human.Penis.Interaction)
	-- GETTER MOUTH
	+ "Oral control.. | " .. TMValueLabel(human.Mouth.Fucker.Penis.Interaction.m_autoSpeed, tmSdec) [if human.Mouth.Fucker ~= nil] [gold]
		TMSexControl(human, human.Mouth.Fucker.Penis.Interaction)
	-- GETTER ANUS
	+ "Anal control.. | " .. TMValueLabel(human.Anus.Fucker.Penis.Interaction.m_autoSpeed, tmSdec) [if human.Anus.Fucker ~= nil] [gold]
		TMSexControl(human, human.Anus.Fucker.Penis.Interaction)
	-- GETTER VAGINA
	+ "Vagi control.. | " .. TMValueLabel(human.Vagina.Fucker.Penis.Interaction.m_autoSpeed, tmSdec) [if human.Vagina.Fucker ~= nil] [gold]
		TMSexControl(human, human.Vagina.Fucker.Penis.Interaction)

	-- START / STOP
	-- GETTER HANDJOB
	+ "Handjob start" [if human.Penis.m_holdDepth ~= 0 and human.Penis.Interaction.m_autoHandActive == false]
		human.Penis.Interaction.m_autoHandActive = true
		Return()
	+ "Handjob STOP" [if human.Penis.m_holdDepth ~= 0 and human.Penis.Interaction.m_autoHandActive == true]
		human.Penis.Interaction.m_autoHandActive = false
		Return()
	-- GIVER (MOUTH, VAGINA, ANUS)
	+ "Sex start" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == false]
		human.Penis.Interaction.AutoActive = true
		human.Penis.Interaction.AutoPenisWeight = 0.8
		Return()
	+ "Sex STOP" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == true]
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
	+ "Vagi start" [if human.Vagina.Fucker ~= nil and human.Vagina.Fucker.Penis.Interaction.AutoActive == false]
		human.Vagina.Fucker.Penis.Interaction.AutoActive = true
		human.Vagina.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Vagi STOP" [if human.Vagina.Fucker ~= nil and human.Vagina.Fucker.Penis.Interaction.AutoActive == true]
		human.Vagina.Fucker.Penis.Interaction.AutoActive = false
		Return()

	-- HAS PENIS
	+ if human.Penis.IsActive == true
		+ "Cum control.. | " .. TMWordLabel(tmCumevery .. "s") [gold]
			+ "Cum every 1 sec"
				cumevery = SetCumEvery(human, 1)
				Return(2)
			+ "Cum every 2 sec"
				tmCumevery = SetCumEvery(human, 2)
				Return(2)
			+ "Cum every 4 sec"
				tmCumevery = SetCumEvery(human, 4)
				Return(2)
			+ "Cum every 8 sec"
				tmCumevery = SetCumEvery(human, 8)
				Return(2)
			+ "Cum every 16 sec"
				tmCumevery = SetCumEvery(human, 16)
				Return(2)
			+ "Cum every 32 sec"
				tmCumevery = SetCumEvery(human, 32)
				Return(2)
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose
		+ if game.HasAnim(human.Penis)
			+ "Cum STOP"
				tmCumevery = 0
				game.RemoveAnim(human.Penis)
				Return()
		+ else
			+ "Cum start"
				tmCumevery = 4
				game.AddRepeatAnim(4, || human.Shoot(), human.Penis)
				Return()

	-- HAS NO PENIS
	+ if not human.Penis.IsActive
		+ "Wet control.. | " .. TMValueLabel2("V",human.m_vagina.m_wetness, "A", human.m_anus.m_wetness) .. " | " .. TMValueLabel1("M", human.m_mouth.m_wetness) [gold]
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
				wett = human.m_vagina.m_wetness + TM_WetnessStep
				SetGirlWetness(human, wett, "Vagina")
				Return()
			+ "< Wetness"
				wett = human.m_vagina.m_wetness - TM_WetnessStep
				if wett < 0
					wett = 0
				SetGirlWetness(human, wett, "Vagina")
				Return()
			+ "RESET | " .. TMValueLabel2("V",human.m_vagina.m_wetness, "A", human.m_anus.m_wetness) .. " | " .. TMValueLabel1("M", human.m_mouth.m_wetness) [gold]
				ResetGirlWetness(human)	
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose
		+ if human.m_vagina.m_wetness > 0 or human.m_anus.m_wetness > 0 or human.m_mouth.m_wetness > 0
			+ "Wet STOP"
				ResetGirlWetness(human)	
				Return()
		+ else
			+ "Squirt start"
				SetGirlWetness(human, 10000, "Vagina")
				Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop