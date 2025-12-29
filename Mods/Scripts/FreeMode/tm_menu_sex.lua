-- TrueMoan v1.3 by illa3d
-- Variables
tmCumevery = 0
-- Sex speed decimals
tmSdec = 3

-- SEX CONTROL (in many menus)
label TMSexControl(human, interaction, isHand)
	+ "• Max"
		SetActSpeed(interaction, TM_SexSpeedMax, isHand)
		Return()
	+ "• Fast"
		SetActSpeed(interaction, TM_SexSpeedFast, isHand)
		Return()
	+ "• Normal"
		SetActSpeed(interaction, TM_SexSpeedNormal, isHand)
		Return()
	+ "• Medium"
		SetActSpeed(interaction, TM_SexSpeedMedium, isHand)
		Return()
	+ "• Slow"
		SetActSpeed(interaction, TM_SexSpeedSlow, isHand)
		Return()
	+ TM_UP.."Speed"
		SetActSpeedStep(interaction, TM_SexSpeedStep, true, isHand)
		Return()
	+ TM_DN.."Speed"
		SetActSpeedStep(interaction, TM_SexSpeedStep, false, isHand)
		Return()
	+ "RESET Speed	| " .. AccNum(GetActSpeedTarget(interaction, isHand), tmSdec)
		SetActSpeed(interaction, 0, isHand)
		Return()
	+ "Random Speed" [gold]
		SetActSpeedRandom(interaction, isHand)
		Return()
	+ "Feeling Lucky" [gold]
		--SetInteractionSpeedRandom(interaction, isHand) -- random speed control is above
		SetActThrustRandom(interaction, isHand)
		SetActWeightRandom(interaction, isHand)
		SetActDepthRandom(interaction, isHand)
		Return()
	+ if TM_ShowSexStyleControl
		-- THRUST (handjob)
		+ if human.Penis.m_holdDepth ~= 0
			+ "| Thrust »	| T" .. AccNum(GetActThrustTarget(interaction, isHand), tmSdec) [gold]
				+ "• Max"
					SetActThrust(interaction, 1, isHand)
					Return()
				+ "• Insane"
					SetActThrust(interaction, 0.75, isHand)
					Return()
				+ "• Fierce"
					SetActThrust(interaction, 0.5, isHand)
					Return()
				+ "• Strong"
					SetActThrust(interaction, 0.25, isHand)
					Return()
				+ "• Normal"
					SetActThrust(interaction, 0, isHand)
					Return()
				+ TM_UP.."Thrust"
					SetActThrustStep(interaction, TM_SexThrustStep, true, isHand)
					Return()
				+ TM_DN.."Thrust"
					SetActThrustStep(interaction, TM_SexThrustStep, false, isHand)
					Return()
				+ "RESET Thrust | " .. AccNum(GetActThrustTarget(interaction, isHand), tmSdec)
					SetActThrust(interaction, 0, isHand)
					Return()
				+ "Random" [gold]
					SetActThrustRandom(interaction, isHand)
				+ TM_MenuBack
					Return(2)
				+ TM_MenuClose

		-- THRUST / PENIS WEIGHT (oral/vaginal/anal)
		+ else 
			+ "| Thrust »	| T" .. AccNum(GetActThrustTarget(interaction, isHand), tmSdec) .. " | M" .. AccNum(GetActWeightTarget(interaction, isHand), tmSdec) [gold]
				+ "• Max"
					SetActThrust(interaction, 1)
					Return()
				+ "• Insane"
					SetActThrust(interaction, 0.75)
					Return()
				+ "• Fierce"
					SetActThrust(interaction, 0.5)
					Return()
				+ "• Strong"
					SetActThrust(interaction, 0.25)
					Return()
				+ "• Normal"
					SetActThrust(interaction, 0)
					Return()
				+ TM_UP.."Thrust"
					SetActThrustStep(interaction, TM_SexThrustStep, true)
					Return()
				+ TM_DN.."Thrust"
					SetActThrustStep(interaction, TM_SexThrustStep, false)
					Return()
				+ "RESET Thrust | " .. AccNum(GetActThrustTarget(interaction, isHand), tmSdec)
					SetActThrust(interaction, 0)
					Return()
				+ TM_UP.."Male"
					SetActWeightStep(interaction, TM_SexMaleStep, true)
					Return()
				+ TM_DN.."Male"
					SetActWeightStep(interaction, TM_SexMaleStep, false)
					Return()
				+ "RESET Male | " .. AccNum(GetActWeightTarget(interaction, isHand), tmSdec)
					SetActWeight(interaction, 0)
					Return()
				+ "Random" [gold]
					SetActThrustRandom(interaction, isHand)
					SetActWeightRandom(interaction, isHand)
					Return()
				+ TM_MenuBack
					Return(2)
				+ TM_MenuClose
		-- START / END (handjob/oral/vaginal/anal)
		+ "| Depth »	| S" .. AccNum(GetActDepthTarget(interaction, isHand, true), tmSdec) .. " | E" .. AccNum(GetActDepthTarget(interaction, isHand, false), tmSdec) [gold]
			+ "• Max"
				SetActDepth(interaction, 0.7, isHand, true)
				SetActDepth(interaction, 0.9, isHand, false)
				Return()
			+ "• Deep"
				SetActDepth(interaction, 0.4, isHand, true)
				SetActDepth(interaction, 0.8, isHand, false)
				Return()
			+ "• Full"
				SetActDepth(interaction, 0.2, isHand, true)
				SetActDepth(interaction, 0.8, isHand, false)
				Return()
			+ "• Shallow"
				SetActDepth(interaction, 0.1, isHand, true)
				SetActDepth(interaction, 0.5, isHand, false)
				Return()
			+ "• Tease"
				SetActDepth(interaction, 0.1, isHand, true)
				SetActDepth(interaction, 0.3, isHand, false)
				Return()
			+ TM_UP.."Start"
				SetActDepthStep(interaction, TM_SexDepthStep, true, isHand, true)
				Return()
			+ TM_DN.."Start"
				SetActDepthStep(interaction, TM_SexDepthStep, false, isHand, true)
				Return()
			+ "RESET Start | " .. AccNum(GetActDepthTarget(interaction, isHand, true), tmSdec)
				SetActDepth(interaction, 0.2, isHand, true)
				Return()
			+ TM_UP.."End"
				SetActDepthStep(interaction, TM_SexDepthStep, true, isHand, false)
				Return()
			+ TM_DN.."End"
				SetActDepthStep(interaction, TM_SexDepthStep, false, isHand, false)
				Return()
			+ "RESET End | " .. AccNum(GetActDepthTarget(interaction, isHand, false), tmSdec)
				SetActDepth(interaction, 0.8, isHand, false)
				Return()
			+ "Random" [gold]
				SetActDepthRandom(interaction, isHand)
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

	-- START / STOP
	-- GETTER HANDJOB
	+ "Handjob start" [if not TMI_AutoSex and HasSex(human,Body.Hand) and not IsSexActive(human,Body.Hand)]
		human.Penis.Interaction.m_autoHandActive = true
		Return()
	+ "Handjob STOP" [if not TMI_AutoSex and HasSex(human,Body.Hand) and IsSexActive(human,Body.Hand)]
		human.Penis.Interaction.m_autoHandActive = false
		Return()
	-- GIVER (MOUTH, VAGINA, ANUS)
	+ "Sex start" [if not TMI_AutoSex and HasSex(human,Body.Penis) and not IsSexActive(human,Body.Penis)]
		human.Penis.Interaction.AutoActive = true
		human.Penis.Interaction.AutoPenisWeight = 0.8
		Return()
	+ "Sex STOP" [if not TMI_AutoSex and HasSex(human,Body.Penis) and IsSexActive(human,Body.Penis)]
		human.Penis.Interaction.AutoActive = false
		Return()
	-- GETTER MOUTH
	+ "Oral start" [if not TMI_AutoSex and HasSex(human,Body.Mouth) and not IsSexActive(human,Body.Mouth)]
		human.Mouth.Fucker.Penis.Interaction.AutoActive = true
		human.Mouth.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Oral STOP" [if not TMI_AutoSex and HasSex(human,Body.Mouth) and IsSexActive(human,Body.Mouth)]
		human.Mouth.Fucker.Penis.Interaction.AutoActive = false
		Return()
	-- GETTER ANUS
	+ "Anal start" [if not TMI_AutoSex and HasSex(human,Body.Anus) and not IsSexActive(human,Body.Anus)]
		human.Anus.Fucker.Penis.Interaction.AutoActive = true
		human.Anus.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Anal STOP" [if not TMI_AutoSex and HasSex(human,Body.Anus) and IsSexActive(human,Body.Anus)]
		human.Anus.Fucker.Penis.Interaction.AutoActive = false
		Return()
	-- GETTER VAGINA
	+ "Pussy start" [if not TMI_AutoSex and HasSex(human,Body.Vagina) and not IsSexActive(human,Body.Vagina)]
		human.Vagina.Fucker.Penis.Interaction.AutoActive = true
		human.Vagina.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Pussy STOP" [if not TMI_AutoSex and HasSex(human,Body.Vagina) and IsSexActive(human,Body.Vagina)]
		human.Vagina.Fucker.Penis.Interaction.AutoActive = false
		Return()

	-- PENIS
	+ if human.Penis.IsActive == true
		+ if game.HasAnim(human.Penis)
			+ "Cum STOP"
				tmCumevery = HumanCumStop(human)
				Return()
		+ else
			+ "Cum start"
				tmCumevery = HumanCumEvery(human, GetRandom(4,8))
				Return()
	-- VAGINA
	+ else 
		+ if IsWetAny(human)
			+ "Wetness STOP"
				HumanWetReset(human)	
				Return()
		+ else
			+ "Squirt start"
				HumanWetSet(human, 10000, "Vagina")
				Return()
		
	-- AUTOSEX
	+ "| Auto Sex	| " .. AccBool(TMI_AutoSex) [if TMI_AutoSex] [gold]
		StopAutoSex(human)
		Return()
	+ "| Auto Sex	| " .. AccBool(TMI_AutoSex) [if not TMI_AutoSex] [gold]
		StartAutoSex(human)
		Return()

	-- SEX CONTROL

	-- GETTER HANDJOB
	+ "| Handjob »	| " .. AccNum(GetActSpeedTarget(GetAct(human,Body.Hand), true), tmSdec) [if HasSex(human,Body.Hand)] [gold]
		TMSexControl(human, GetAct(human,Body.Hand), true)
	-- GIVER (MOUTH, VAGINA, ANUS)
	+ "| Sex  »	| " .. AccNum(GetActSpeedTarget(GetAct(human,Body.Penis), false), tmSdec) [if HasSex(human,Body.Penis)] [gold]
		TMSexControl(human, GetAct(human,Body.Penis), false)
	-- GETTER MOUTH
	+ "| Oral »	| " .. AccNum(GetActSpeedTarget(GetAct(human,Body.Mouth), false), tmSdec) [if HasSex(human,Body.Mouth)] [gold]
		TMSexControl(human, GetAct(human,Body.Mouth), false)
	-- GETTER ANUS
	+ "| Anal »	| " .. AccNum(GetActSpeedTarget(GetAct(human,Body.Anus), false), tmSdec) [if HasSex(human,Body.Anus)] [gold]
		TMSexControl(human, GetAct(human,Body.Anus), false)
	-- GETTER VAGINA
	+ "| Pussy »	| " .. AccNum(GetActSpeedTarget(GetAct(human,Body.Vagina), false), tmSdec) [if HasSex(human,Body.Vagina)] [gold]
		TMSexControl(human, GetAct(human,Body.Vagina), false)

	-- PENIS
	+ "| Cum »	| " .. AccStr(tmCumevery .. "s") [if HasPenis(human)] [gold]
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

	-- VAGINA
	+ "| Wetness »	| " .. AccTextNum3("V", GetWet(human,Body.Vagina), "A", GetWet(human,Body.Anus), "M", GetWet(human,Body.Mouth)) [if not HasPenis(human)] [gold]
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
		+ "RESET | " .. AccTextNum3("V", GetWet(human,Body.Vagina), "A", GetWet(human,Body.Anus), "M", GetWet(human,Body.Mouth))
			HumanWetReset(human)	
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
