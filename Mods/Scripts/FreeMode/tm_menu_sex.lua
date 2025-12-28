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
	+ "RESET Speed	| " .. AccNum(GetInteractionSpeedTarget(interaction, isHand), tmSdec)
		SetInteractionSpeed(interaction, 0, isHand)
		Return()
	+ "Random Speed" [gold]
		SetInteractionSpeedRandom(interaction, isHand)
		Return()
	+ "Feeling Lucky" [gold]
		--SetInteractionSpeedRandom(interaction, isHand) -- random speed control is above
		SetInteractionThrustWeightRandom(interaction, isHand)
		SetInteractionPenisWeightRandom(interaction, isHand)
		SetInteractionDepthRandom(interaction, isHand)
		Return()
	+ if TM_ShowSexStyleControl
		-- THRUST (handjob)
		+ if human.Penis.m_holdDepth ~= 0
			+ "| Thrust »	| T" .. AccNum(GetInteractionThrustWeightTarget(interaction, isHand), tmSdec) [gold]
				+ "• Max"
					SetInteractionThrustWeight(interaction, 1)
					Return()
				+ "• Insane"
					SetInteractionThrustWeight(interaction, 0.75)
					Return()
				+ "• Fierce"
					SetInteractionThrustWeight(interaction, 0.5)
					Return()
				+ "• Strong"
					SetInteractionThrustWeight(interaction, 0.25)
					Return()
				+ "• Normal"
					SetInteractionThrustWeight(interaction, 0)
					Return()
				+ TM_UP.."Thrust"
					SetInteractionThrustWeightStep(interaction, TM_SexThrustStep, true, isHand)
					Return()
				+ TM_DN.."Thrust"
					SetInteractionThrustWeightStep(interaction, TM_SexThrustStep, false, isHand)
					Return()
				+ "RESET Thrust | " .. AccNum(GetInteractionThrustWeightTarget(interaction, isHand), tmSdec)
					SetInteractionThrustWeight(interaction, 0, isHand)
					Return()
				+ "Random" [gold]
					SetInteractionThrustWeightRandom(interaction, isHand)
				+ TM_MenuBack
					Return(2)
				+ TM_MenuClose

		-- THRUST / PENIS WEIGHT (oral/vaginal/anal)
		+ else 
			+ "| Thrust »	| T" .. AccNum(GetInteractionThrustWeightTarget(interaction, isHand), tmSdec) .. " | M" .. AccNum(GetInteractionPenisWeightTarget(interaction), tmSdec) [gold]
				+ "• Max"
					SetInteractionThrustWeight(interaction, 1)
					Return()
				+ "• Insane"
					SetInteractionThrustWeight(interaction, 0.75)
					Return()
				+ "• Fierce"
					SetInteractionThrustWeight(interaction, 0.5)
					Return()
				+ "• Strong"
					SetInteractionThrustWeight(interaction, 0.25)
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
				+ "RESET Thrust | " .. AccNum(GetInteractionThrustWeightTarget(interaction, isHand), tmSdec)
					SetInteractionThrustWeight(interaction, 0)
					Return()
				+ TM_UP.."Male"
					SetInteractionPenisWeightStep(interaction, TM_SexMaleStep, true)
					Return()
				+ TM_DN.."Male"
					SetInteractionPenisWeightStep(interaction, TM_SexMaleStep, false)
					Return()
				+ "RESET Male | " .. AccNum(GetInteractionPenisWeightTarget(interaction), tmSdec)
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
		+ "| Depth »	| S" .. AccNum(GetInteractionDepthTarget(interaction, true), tmSdec) .. " | E" .. AccNum(GetInteractionDepthTarget(interaction, false), tmSdec) [gold]
			+ "• Max"
				SetInteractionDepth(interaction, 0.7, isHand, true)
				SetInteractionDepth(interaction, 0.9, isHand, false)
				Return()
			+ "• Deep"
				SetInteractionDepth(interaction, 0.4, isHand, true)
				SetInteractionDepth(interaction, 0.8, isHand, false)
				Return()
			+ "• Full"
				SetInteractionDepth(interaction, 0.2, isHand, true)
				SetInteractionDepth(interaction, 0.8, isHand, false)
				Return()
			+ "• Shallow"
				SetInteractionDepth(interaction, 0.1, isHand, true)
				SetInteractionDepth(interaction, 0.5, isHand, false)
				Return()
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
			+ "RESET Start | " .. AccNum(GetInteractionDepthTarget(interaction, true), tmSdec)
				SetInteractionDepth(interaction, 0.2, isHand, true)
				Return()
			+ TM_UP.."End"
				SetInteractionDepthStep(interaction, TM_SexDepthStep, true, isHand, false)
				Return()
			+ TM_DN.."End"
				SetInteractionDepthStep(interaction, TM_SexDepthStep, false, isHand, false)
				Return()
			+ "RESET End | " .. AccNum(GetInteractionDepthTarget(interaction, false), tmSdec)
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
	+ "| Handjob control »	| " .. AccNum(GetInteractionSpeedTarget(human.Penis.Interaction, true), tmSdec) [if human.Penis.m_holdDepth ~= 0] [gold]
		TMSexControl(human, human.Penis.Interaction, true)
	-- GIVER (MOUTH, VAGINA, ANUS)
	+ "| Sex control »	| " .. AccNum(GetInteractionSpeedTarget(human.Penis.Interaction), tmSdec) [if human.Penis.Hole ~= nil] [gold]
		TMSexControl(human, human.Penis.Interaction)
	-- GETTER MOUTH
	+ "| Oral control »	| " .. AccNum(GetInteractionSpeedTarget(human.Mouth.Fucker.Penis.Interaction), tmSdec) [if human.Mouth.Fucker ~= nil] [gold]
		TMSexControl(human, human.Mouth.Fucker.Penis.Interaction)
	-- GETTER ANUS
	+ "| Anal control »	| " .. AccNum(GetInteractionSpeedTarget(human.Anus.Fucker.Penis.Interaction), tmSdec) [if human.Anus.Fucker ~= nil] [gold]
		TMSexControl(human, human.Anus.Fucker.Penis.Interaction)
	-- GETTER VAGINA
	+ "| Pussy control »	| " .. AccNum(GetInteractionSpeedTarget(human.Vagina.Fucker.Penis.Interaction), tmSdec) [if human.Vagina.Fucker ~= nil] [gold]
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
		+ "| Cum control »	| " .. AccStr(tmCumevery .. "s") [gold]
			+ "• Cum every 60 sec"
				tmCumevery = HumanCumEvery(human, 60)
				Return()
			+ "• Cum every 30 sec"
				tmCumevery = HumanCumEvery(human, 30)
				Return()
			+ "• Cum every 10 sec"
				tmCumevery = HumanCumEvery(human, 10)
				Return()
			+ "• Cum every 5 sec"
				tmCumevery = HumanCumEvery(human, 5)
				Return()
			+ "• Cum every 2 sec"
				tmCumevery = HumanCumEvery(human, 2)
				Return()
			+ "• Cum every 1 sec"
				tmCumevery = HumanCumEvery(human, 1)
				Return()
			+ "RESET | " .. AccStr(tmCumevery .. "s")
				tmCumevery = HumanCumStop(human)
				Return()
			+ "Random" [gold]
				tmCumevery = HumanCumEvery(human, GetRandom(1,120))
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose
		+ if game.HasAnim(human.Penis)
			+ "Cum STOP"
				tmCumevery = HumanCumStop(human)
				Return()
		+ else
			+ "Cum start"
				tmCumevery = HumanCumEvery(human, GetRandom(4,8))
				Return()

	-- HAS NO PENIS
	+ if not human.Penis.IsActive
		+ "| Wet control »	| " .. AccTextNum3("V",human.m_vagina.m_wetness, "A", human.m_anus.m_wetness, "M", human.m_mouth.m_wetness) [gold]
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