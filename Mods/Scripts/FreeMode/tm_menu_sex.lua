-- TrueMoan v1.3 by illa3d
-- Variables
tmCumevery = 0
-- Sex speed decimals
tmSdec = 3

-- SEX CONTROL (in many menus)
label TMSexControl(human, interaction, isHand)
	+ "• Max"
		SetInteractionSpeed(interaction, TM_SexSpeedMax, isHand)
		Return()
	+ "• Fast"
		SetInteractionSpeed(interaction, TM_SexSpeedFast, isHand)
		Return()
	+ "• Normal"
		SetInteractionSpeed(interaction, TM_SexSpeedNormal, isHand)
		Return()
	+ "• Medium"
		SetInteractionSpeed(interaction, TM_SexSpeedMedium, isHand)
		Return()
	+ "• Slow"
		SetInteractionSpeed(interaction, TM_SexSpeedSlow, isHand)
		Return()
	+ TM_UP.."Speed"
		SetInteractionSpeedStep(interaction, TM_SexSpeedStep, true, isHand)
		Return()
	+ TM_DN.."Speed"
		SetInteractionSpeedStep(interaction, TM_SexSpeedStep, false, isHand)
		Return()
	+ "RESET Speed	| " .. AccNum(GetInteractionSpeed(interaction, isHand), tmSdec)
		SetInteractionSpeed(interaction, 0, isHand)
		Return()
	+ "Random Speed" [gold]
		SetInteractionSpeedRandom(interaction, isHand)
		Return()
	+ "Feeling lucky" [gold]
		--SetInteractionSpeedRandom(interaction, isHand) -- random speed control is above
		SetInteractionThrustWeightRandom(interaction, isHand)
		SetInteractionPenisWeightRandom(interaction, isHand)
		SetInteractionDepthRandom(interaction, isHand)
		Return()
	+ if TM_ShowSexStyleControl
		-- THRUST (handjob)
		+ if human.Penis.m_holdDepth ~= 0
			+ "Thrust »	| T" .. AccNum(GetInteractionThrustWeight(interaction, isHand), tmSdec) [gold]
				+ TM_UP.."Thrust"
					SetInteractionThrustWeightStep(interaction, TM_SexThrustStep, true, isHand)
					Return()
				+ TM_DN.."Thrust"
					SetInteractionThrustWeightStep(interaction, TM_SexThrustStep, false, isHand)
					Return()
				+ "RESET Thrust | " .. AccNum(GetInteractionThrustWeight(interaction, isHand), tmSdec)
					SetInteractionThrustWeight(interaction, 0, isHand)
					Return()
				+ "Random" [gold]
					SetInteractionThrustWeightRandom(interaction, isHand)
				+ TM_MenuBack
					Return(2)
				+ TM_MenuClose

		-- THRUST / PENIS WEIGHT (oral/vaginal/anal)
		+ else 
			+ "Thrust »	| T" .. AccNum(GetInteractionThrustWeight(interaction, isHand), tmSdec) .. " | M" .. AccNum(GetInteractionPenisWeight(interaction), tmSdec) [gold]
				+ "• Max"
					SetInteractionThrustWeight(interaction, 1)
					Return()
				+ "• Insane"
					SetInteractionThrustWeight(interaction, 0.6)
					Return()
				+ "• Strong"
					SetInteractionThrustWeight(interaction, 0.3)
					Return()
				+ "• Normal"
					SetInteractionThrustWeight(interaction, 0)
					Return()
				+ TM_UP.."Thrust"
					SetInteractionThrustWeightStep(interaction, TM_SexThrustStep, true)
					Return()
				+ TM_DN.."Thrust"
					SetInteractionThrustWeightStep(interaction, TM_SexThrustStep, false)
					Return()
				+ "RESET Thrust | " .. AccNum(GetInteractionThrustWeight(interaction, isHand), tmSdec)
					SetInteractionThrustWeight(interaction, 0)
					Return()
				+ TM_UP.."Male"
					SetInteractionPenisWeightStep(interaction, TM_SexMaleStep, true)
					Return()
				+ TM_DN.."Male"
					SetInteractionPenisWeightStep(interaction, TM_SexMaleStep, false)
					Return()
				+ "RESET Male | " .. AccNum(GetInteractionPenisWeight(interaction), tmSdec)
					SetInteractionPenisWeight(interaction, 0)
					Return()
				+ "Random" [gold]
					SetInteractionThrustWeightRandom(interaction, isHand)
					SetInteractionPenisWeightRandom(interaction, isHand)
					Return()
				+ TM_MenuBack
					Return(2)
				+ TM_MenuClose
		-- START / END (handjob/oral/vaginal/anal)
		+ "Depth »	| S" .. AccNum(GetInteractionDepth(interaction, true), tmSdec) .. " | E" .. AccNum(GetInteractionDepth(interaction, false), tmSdec) [gold]
			+ "• Deep"
				SetInteractionDepth(interaction, 0.5, isHand, true)
				SetInteractionDepth(interaction, 0.9, isHand, false)
				Return()
			+ "• Full"
				SetInteractionDepth(interaction, 0.2, isHand, true)
				SetInteractionDepth(interaction, 0.8, isHand, false)
				Return()
			+ "• Shallow"
				SetInteractionDepth(interaction, 0.1, isHand, true)
				SetInteractionDepth(interaction, 0.5, isHand, false)
			+ "• Tease"
				SetInteractionDepth(interaction, 0.1, isHand, true)
				SetInteractionDepth(interaction, 0.3, isHand, false)
				Return()
			+ TM_UP.."Start"
				SetInteractionDepthStep(interaction, TM_SexDepthStep, true, isHand, true)
				Return()
			+ TM_DN.."Start"
				SetInteractionDepthStep(interaction, TM_SexDepthStep, false, isHand, true)
				Return()
			+ "RESET Start | " .. AccNum(GetInteractionDepth(interaction, true), tmSdec)
				SetInteractionDepth(interaction, 0.2, isHand, true)
				Return()
			+ TM_UP.."End"
				SetInteractionDepthStep(interaction, TM_SexDepthStep, true, isHand, false)
				Return()
			+ TM_DN.."End"
				SetInteractionDepthStep(interaction, TM_SexDepthStep, false, isHand, false)
				Return()
			+ "RESET End | " .. AccNum(GetInteractionDepth(interaction, false), tmSdec)
				SetInteractionDepth(interaction, 0.8, isHand, false)
				Return()
			+ "Random" [gold]
				SetInteractionDepthRandom(interaction, isHand)
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
	-- SEX CONTROL
	-- GETTER HANDJOB
	+ "Handjob control »	| " .. AccNum(human.Penis.Interaction.m_autoSpeed, tmSdec) [if human.Penis.m_holdDepth ~= 0] [gold]
		TMSexControl(human, human.Penis.Interaction, true)
	-- GIVER (MOUTH, VAGINA, ANUS)
	+ "Sex control »	| " .. AccNum(human.Penis.Interaction.m_autoSpeed, tmSdec) [if human.Penis.Hole ~= nil] [gold]
		TMSexControl(human, human.Penis.Interaction)
	-- GETTER MOUTH
	+ "Oral control »	| " .. AccNum(human.Mouth.Fucker.Penis.Interaction.m_autoSpeed, tmSdec) [if human.Mouth.Fucker ~= nil] [gold]
		TMSexControl(human, human.Mouth.Fucker.Penis.Interaction)
	-- GETTER ANUS
	+ "Anal control »	| " .. AccNum(human.Anus.Fucker.Penis.Interaction.m_autoSpeed, tmSdec) [if human.Anus.Fucker ~= nil] [gold]
		TMSexControl(human, human.Anus.Fucker.Penis.Interaction)
	-- GETTER VAGINA
	+ "Pussy control »	| " .. AccNum(human.Vagina.Fucker.Penis.Interaction.m_autoSpeed, tmSdec) [if human.Vagina.Fucker ~= nil] [gold]
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
	+ "Oral start" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == false]
		human.Mouth.Fucker.Penis.Interaction.AutoActive = true
		human.Mouth.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Oral STOP" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == true]
		human.Mouth.Fucker.Penis.Interaction.AutoActive = false
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
	+ "Pussy start" [if human.Vagina.Fucker ~= nil and human.Vagina.Fucker.Penis.Interaction.AutoActive == false]
		human.Vagina.Fucker.Penis.Interaction.AutoActive = true
		human.Vagina.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Pussy STOP" [if human.Vagina.Fucker ~= nil and human.Vagina.Fucker.Penis.Interaction.AutoActive == true]
		human.Vagina.Fucker.Penis.Interaction.AutoActive = false
		Return()

	-- HAS PENIS
	+ if human.Penis.IsActive == true
		+ "Cum control »	| " .. AccStr(tmCumevery .. "s") [gold]
			+ "• Cum every 1 sec"
				tmCumevery = HumanCumEvery(human, 1)
				Return(2)
			+ "• Cum every 2 sec"
				tmCumevery = HumanCumEvery(human, 2)
				Return(2)
			+ "• Cum every 4 sec"
				tmCumevery = HumanCumEvery(human, 4)
				Return(2)
			+ "• Cum every 8 sec"
				tmCumevery = HumanCumEvery(human, 8)
				Return(2)
			+ "• Cum every 16 sec"
				tmCumevery = HumanCumEvery(human, 16)
				Return(2)
			+ "• Cum every 32 sec"
				tmCumevery = HumanCumEvery(human, 32)
				Return(2)
			+ "• Random" [gold]
				tmCumevery = HumanCumEvery(human, GetRandom(1,32))
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
		+ "Wet control »	| " .. AccTextNum3("V",human.m_vagina.m_wetness, "A", human.m_anus.m_wetness, "M", human.m_mouth.m_wetness) [gold]
			+ "• Squirt"
				HumanWetSet(human, 10000, "Vagina")
				Return()
			+ "• Wet"
				HumanWetSet(human, 2000, "Vagina")
				Return()
			+ "• Default"
				HumanWetSet(human, 500, "Vagina")
				Return()
			+ TM_UP.."Wetness"
				wett = human.m_vagina.m_wetness + TM_WetnessStep
				HumanWetSet(human, wett, "Vagina")
				Return()
			+ TM_DN.."Wetness"
				wett = human.m_vagina.m_wetness - TM_WetnessStep
				if wett < 0
					wett = 0
				HumanWetSet(human, wett, "Vagina")
				Return()
			+ "RESET | " .. AccTextNum3("V",human.m_vagina.m_wetness, "A", human.m_anus.m_wetness, "M", human.m_mouth.m_wetness)
				HumanWetReset(human)	
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose
		+ if human.m_vagina.m_wetness > 0 or human.m_anus.m_wetness > 0 or human.m_mouth.m_wetness > 0
			+ "Wet STOP"
				HumanWetReset(human)	
				Return()
		+ else
			+ "Squirt start"
				HumanWetSet(human, 10000, "Vagina")
				Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop