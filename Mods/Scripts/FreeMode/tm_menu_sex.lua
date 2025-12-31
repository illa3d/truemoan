-- TrueMoan v1.8 by illa3d
-- Variables
tmCumevery = 0
-- Sex speed decimals
tmSdec = 3

-- SEX CONTROL (in many menus)
label TMSexControl(human, interaction, isHand)
	+ "• Max"
		ActSpeedSet(interaction, TM_SexSpeedMax, isHand)
		Return()
	+ "• Fast"
		ActSpeedSet(interaction, TM_SexSpeedFast, isHand)
		Return()
	+ "• Normal"
		ActSpeedSet(interaction, TM_SexSpeedNormal, isHand)
		Return()
	+ "• Medium"
		ActSpeedSet(interaction, TM_SexSpeedMedium, isHand)
		Return()
	+ "• Slow"
		ActSpeedSet(interaction, TM_SexSpeedSlow, isHand)
		Return()
	+ TM_UP.."Speed"
		ActSpeedSet_Step(interaction, TM_SexSpeedStep, true, isHand)
		Return()
	+ TM_DN.."Speed"
		ActSpeedSet_Step(interaction, TM_SexSpeedStep, false, isHand)
		Return()
	+ "RESET Speed	| " .. AccNum(ActSpeedGet(interaction, isHand), tmSdec)
		ActSpeedSet(interaction, 0, isHand)
		Return()
	+ "Random Speed" [gold]
		ActSpeedSet_MenuRandom(interaction, isHand)
		Return()
	+ "Feeling Lucky" [gold]
		--SetInteractionSpeedRandom(interaction, isHand) -- random speed control is above
		ActThrustSet_MenuRandom(interaction, isHand)
		ActWeightSet_MenuRandom(interaction, isHand)
		ActDepthSet_MenuRandom(interaction, isHand)
		Return()

	+ if TM_ShowSexStyleControl
		-- THRUST (handjob)
		+ if human.Penis.m_holdDepth ~= 0
			+ "| Thrust »	| T" .. AccNum(ActThrustGet(interaction, isHand), tmSdec) [gold]
				+ "• Max"
					ActThrustSet(interaction, 1, isHand)
					Return()
				+ "• Insane"
					ActThrustSet(interaction, 0.75, isHand)
					Return()
				+ "• Fierce"
					ActThrustSet(interaction, 0.5, isHand)
					Return()
				+ "• Strong"
					ActThrustSet(interaction, 0.25, isHand)
					Return()
				+ "• Normal"
					ActThrustSet(interaction, 0, isHand)
					Return()
				+ TM_UP.."Thrust"
					ActThrustSet_Step(interaction, TM_SexThrustStep, true, isHand)
					Return()
				+ TM_DN.."Thrust"
					ActThrustSet_Step(interaction, TM_SexThrustStep, false, isHand)
					Return()
				+ "RESET Thrust | " .. AccNum(ActThrustGet(interaction, isHand), tmSdec)
					ActThrustSet(interaction, 0, isHand)
					Return()
				+ "Random" [gold]
					ActThrustSet_MenuRandom(interaction, isHand)
				+ TM_MenuBack
					Return(2)
				+ TM_MenuClose

		-- THRUST / PENIS WEIGHT (oral/vaginal/anal)
		+ else 
			+ "| Thrust »	| T" .. AccNum(ActThrustGet(interaction, isHand), tmSdec) .. " | M" .. AccNum(ActWeightGet(interaction, isHand), tmSdec) [gold]
				+ "• Max"
					ActThrustSet(interaction, 1)
					Return()
				+ "• Insane"
					ActThrustSet(interaction, 0.75)
					Return()
				+ "• Fierce"
					ActThrustSet(interaction, 0.5)
					Return()
				+ "• Strong"
					ActThrustSet(interaction, 0.25)
					Return()
				+ "• Normal"
					ActThrustSet(interaction, 0)
					Return()
				+ TM_UP.."Thrust"
					ActThrustSet_Step(interaction, TM_SexThrustStep, true)
					Return()
				+ TM_DN.."Thrust"
					ActThrustSet_Step(interaction, TM_SexThrustStep, false)
					Return()
				+ "RESET Thrust | " .. AccNum(ActThrustGet(interaction, isHand), tmSdec)
					ActThrustSet(interaction, 0)
					Return()
				+ TM_UP.."Male"
					ActWeightSet_Step(interaction, TM_SexMaleStep, true)
					Return()
				+ TM_DN.."Male"
					ActWeightSet_Step(interaction, TM_SexMaleStep, false)
					Return()
				+ "RESET Male | " .. AccNum(ActWeightGet(interaction, isHand), tmSdec)
					ActWeightSet(interaction, 0)
					Return()
				+ "Random" [gold]
					ActThrustSet_MenuRandom(interaction, isHand)
					ActWeightSet_MenuRandom(interaction, isHand)
					Return()
				+ TM_MenuBack
					Return(2)
				+ TM_MenuClose

		-- START / END (handjob/oral/vaginal/anal)
		+ "| Depth »	| S" .. AccNum(ActDepthGet(interaction, isHand, true), tmSdec) .. " | E" .. AccNum(ActDepthGet(interaction, isHand, false), tmSdec) [gold]
			+ "• Deeper"
				ActDepthSet_StartEnd(interaction, 0.7, 1.3, isHand)
				Return()
			+ "• Deep"
				ActDepthSet_StartEnd(interaction, 0.4, 1.1, isHand)
				Return()
			+ "• Full"
				ActDepthSet_StartEnd(interaction, 0, 1, isHand)
				Return()
			+ "• Medium"
				ActDepthSet_StartEnd(interaction, 0.3, 1, isHand)
				Return()
			+ "• Shallow"
				ActDepthSet_StartEnd(interaction, 0.1, 0.5, isHand)
				Return()
			+ "• Tease"
				ActDepthSet_StartEnd(interaction, 0, 0.3, isHand)
				Return()
			+ TM_UP.."Start"
				ActDepthSet_Step(interaction, TM_SexDepthStep, true, isHand, true)
				Return()
			+ TM_DN.."Start"
				ActDepthSet_Step(interaction, TM_SexDepthStep, false, isHand, true)
				Return()
			+ "RESET Start | " .. AccNum(ActDepthGet(interaction, isHand, true), tmSdec)
				ActDepthSet(interaction, 0.2, isHand, true)
				Return()
			+ TM_UP.."End"
				ActDepthSet_Step(interaction, TM_SexDepthStep, true, isHand, false)
				Return()
			+ TM_DN.."End"
				ActDepthSet_Step(interaction, TM_SexDepthStep, false, isHand, false)
				Return()
			+ "RESET End | " .. AccNum(ActDepthGet(interaction, isHand, false), tmSdec)
				ActDepthSet(interaction, 1, isHand, false)
				Return()
			+ "Random" [gold]
				ActDepthSet_MenuRandom(interaction, isHand)
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
	+ "Refresh"
		Return()
	-- START / STOP
	-- GETTER HANDJOB
	+ "Handjob start" [if HasSex(human,ActBody.Hand) and not IsSexActive(human,ActBody.Hand)]
		human.Penis.Interaction.m_autoHandActive = true
		Return()
	+ "Handjob " ..AccStr("stop") [if HasSex(human,ActBody.Hand) and IsSexActive(human,ActBody.Hand)]
		human.Penis.Interaction.m_autoHandActive = false
		Return()
	-- GIVER (MOUTH, VAGINA, ANUS)
	+ "Penis start" [if HasSex(human,ActBody.Penis) and not IsSexActive(human,ActBody.Penis)]
		human.Penis.Interaction.AutoActive = true
		human.Penis.Interaction.AutoPenisWeight = 0.8
		Return()
	+ "Penis " ..AccStr("stop") [if HasSex(human,ActBody.Penis) and IsSexActive(human,ActBody.Penis)]
		human.Penis.Interaction.AutoActive = false
		Return()
	-- GETTER MOUTH
	+ "Oral start" [if HasSex(human,ActBody.Mouth) and not IsSexActive(human,ActBody.Mouth)]
		human.Mouth.Fucker.Penis.Interaction.AutoActive = true
		human.Mouth.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Oral " ..AccStr("stop") [if HasSex(human,ActBody.Mouth) and IsSexActive(human,ActBody.Mouth)]
		human.Mouth.Fucker.Penis.Interaction.AutoActive = false
		Return()
	-- GETTER ANUS
	+ "Anal start" [if HasSex(human,ActBody.Anus) and not IsSexActive(human,ActBody.Anus)]
		human.Anus.Fucker.Penis.Interaction.AutoActive = true
		human.Anus.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Anal " ..AccStr("stop") [if HasSex(human,ActBody.Anus) and IsSexActive(human,ActBody.Anus)]
		human.Anus.Fucker.Penis.Interaction.AutoActive = false
		Return()
	-- GETTER VAGINA
	+ "Pussy start" [if HasSex(human,ActBody.Vagina) and not IsSexActive(human,ActBody.Vagina)]
		human.Vagina.Fucker.Penis.Interaction.AutoActive = true
		human.Vagina.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Pussy " ..AccStr("stop") [if HasSex(human,ActBody.Vagina) and IsSexActive(human,ActBody.Vagina)]
		human.Vagina.Fucker.Penis.Interaction.AutoActive = false
		Return()

	-- PENIS
	+ if human.Penis.IsActive == true
		+ if game.HasAnim(human.Penis)
			+ "Cum " ..AccStr("stop")
				tmCumevery = HumanCumStop(human)
				Return()
		+ else
			+ "Cum start"
				tmCumevery = HumanCumEvery(human, GetRandom(4,8))
				Return()
	-- VAGINA
	+ else 
		+ if IsWet(human)
			+ "Wet " ..AccStr("stop")
				HumanWetReset(human)	
				Return()
		+ else
			+ "Wet start"
				HumanWetSet(human, 10000, "Vagina")
				Return()
		
	-- GETTER HANDJOB
	+ "| Handjob »	| " .. AccNum(ActValueGet_ByBody(human,ActBody.Hand, ActValue.Speed), tmSdec) [if HasSex(human,ActBody.Hand)] [gold]
		TMSexControl(human, ActGet(human,ActBody.Hand), true)
	-- GIVER (MOUTH, VAGINA, ANUS)
	+ "| Penis »	| " .. AccNum(ActValueGet_ByBody(human,ActBody.Penis, ActValue.Speed), tmSdec) [if HasSex(human,ActBody.Penis)] [gold]
		TMSexControl(human, ActGet(human,ActBody.Penis), false)
	-- GETTER MOUTH
	+ "| Oral »	| " .. AccNum(ActValueGet_ByBody(human,ActBody.Mouth, ActValue.Speed), tmSdec) [if HasSex(human,ActBody.Mouth)] [gold]
		TMSexControl(human, ActGet(human,ActBody.Mouth), false)
	-- GETTER ANUS
	+ "| Anal »	| " .. AccNum(ActValueGet_ByBody(human,ActBody.Anus, ActValue.Speed), tmSdec) [if HasSex(human,ActBody.Anus)] [gold]
		TMSexControl(human, ActGet(human,ActBody.Anus), false)
	-- GETTER VAGINA
	+ "| Pussy »	| " .. AccNum(ActValueGet_ByBody(human,ActBody.Vagina, ActValue.Speed), tmSdec) [if HasSex(human,ActBody.Vagina)] [gold]
		TMSexControl(human, ActGet(human,ActBody.Vagina), false)
	-- AUTOSEX

	-- PENIS
	+ "| Cum »	| " .. AccStr(tmCumevery .. "s") [if HumanHasPenis(human)] [gold]
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
	+ "| Wet »	| " .. AccTextNum3("V", WetValue(human,ActBody.Vagina), "A", WetValue(human,ActBody.Anus), "M", WetValue(human,ActBody.Mouth)) [if not HumanHasPenis(human)] [gold]
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
		+ "RESET | " .. AccTextNum3("V", WetValue(human,ActBody.Vagina), "A", WetValue(human,ActBody.Anus), "M", WetValue(human,ActBody.Mouth))
			HumanWetReset(human)	
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose

	+ "| Auto sex	| " .. AccBool(IsAutoSex(human))
		AutoSexToggle(human)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
