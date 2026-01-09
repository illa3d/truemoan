-- TrueMoan v2.1 by illa3d
-- Sex speed decimals
tmSdecSpd = 1
tmSdec = 0

-- function TMIsAutoSexTurboNeeded(interaction, isHand) return not TM_AutoSexTurbo and ActSpeedGet(interaction, isHand) > ActAutoSexNormalMinMax.Speed.Max end
-- function TMIsAutoSexNormalNeeded(interaction, isHand) return TM_AutoSexTurbo and ActSpeedGet(interaction, isHand) < ActAutoSexNormalMinMax.Speed.Max end

-- SEX CONTROL (in many menus)
label TMSexControl(human, interaction, isHand)
	+ "• Max"
		ActSpeedSet(interaction, AutoSexTierConfig[AutoSexTier.Max].Mid, isHand)
		AutoSexTierSet_BySpeed(human, AutoSexTierConfig[AutoSexTier.Max].Mid)
		Return()
	+ "• Wild"
		ActSpeedSet(interaction, AutoSexTierConfig[AutoSexTier.Wild].Mid, isHand)
		AutoSexTierSet_BySpeed(human, AutoSexTierConfig[AutoSexTier.Wild].Mid)
		Return()
	+ "• Faster"
		ActSpeedSet(interaction, AutoSexTierConfig[AutoSexTier.Faster].Mid, isHand)
		AutoSexTierSet_BySpeed(human, AutoSexTierConfig[AutoSexTier.Faster].Mid)
		Return()
	+ "• Fast"
		ActSpeedSet(interaction, AutoSexTierConfig[AutoSexTier.Fast].Mid, isHand)
		AutoSexTierSet_BySpeed(human, AutoSexTierConfig[AutoSexTier.Fast].Mid)
		Return()
	+ "• Normal"
		ActSpeedSet(interaction, AutoSexTierConfig[AutoSexTier.Normal].Mid, isHand)
		AutoSexTierSet_BySpeed(human, AutoSexTierConfig[AutoSexTier.Normal].Mid)
		Return()
	+ "• Slow"
		ActSpeedSet(interaction, AutoSexTierConfig[AutoSexTier.Slow].Mid, isHand)
		AutoSexTierSet_BySpeed(human, AutoSexTierConfig[AutoSexTier.Slow].Mid)
		Return()
	+ TM_UP.."Speed"
		ActSpeedSet_Step(interaction, TM_SexSpeedStep, true, isHand)
		AutoSexTierSet_BySpeed(human, ActSpeedGet(interaction, isHand))
		Return()
	+ TM_DN.."Speed"
		ActSpeedSet_Step(interaction, TM_SexSpeedStep, false, isHand)
		AutoSexTierSet_BySpeed(human, ActSpeedGet(interaction, isHand))
		Return()
	+ "RESET Speed	| " .. AccNumPC(ActSpeedGet(interaction, isHand), tmSdecSpd) .. " | " .. TMMLabel_AutoSex(human)
		ActSpeedSet(interaction, 0, isHand)
		AutoSexTierSet_BySpeed(human, ActSpeedGet(interaction, isHand))
		Return()
	+ "Random Speed" [gold]
		ActSpeedSet_MenuRandom(interaction, isHand)
		AutoSexTierSet_BySpeed(human, ActSpeedGet(interaction, isHand))
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
			+ "| Thrust »	|T " .. AccNumPC(ActThrustGet(interaction, isHand), tmSdec) [gold]
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
				+ "RESET Thrust | " .. AccNumPC(ActThrustGet(interaction, isHand), tmSdec)
					ActThrustSet(interaction, 0, isHand)
					Return()
				+ "Random" [gold]
					ActThrustSet_MenuRandom(interaction, isHand)
					Return()
				+ TM_MenuBack
					Return(2)
				+ TM_MenuClose

		-- THRUST / PENIS WEIGHT (oral/vaginal/anal)
		+ else 
			+ "| Thrust »	|T " .. AccNumPC(ActThrustGet(interaction, isHand), tmSdec) .. " |M " .. AccNumPC(ActWeightGet(interaction, isHand), tmSdec) [gold]
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
				+ "RESET Thrust | " .. AccNumPC(ActThrustGet(interaction, isHand), tmSdec)
					ActThrustSet(interaction, 0)
					Return()
				+ TM_UP.."Male"
					ActWeightSet_Step(interaction, TM_SexMaleStep, true)
					Return()
				+ TM_DN.."Male"
					ActWeightSet_Step(interaction, TM_SexMaleStep, false)
					Return()
				+ "TOGGLE Male | " .. AccNumPC(ActWeightGet(interaction, isHand), tmSdec)
					ActWeightSet_Toggle(interaction)
					Return()
				+ "Random" [gold]
					ActThrustSet_MenuRandom(interaction, isHand)
					ActWeightSet_MenuRandom(interaction, isHand)
					Return()
				+ TM_MenuBack
					Return(2)
				+ TM_MenuClose

		-- START / END (handjob/oral/vaginal/anal)
		+ "| Depth »	|S " .. AccNumPC(ActDepthGet(interaction, isHand, true), tmSdec) .. " |E " .. AccNumPC(ActDepthGet(interaction, isHand, false), tmSdec) [gold]
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
			+ "RESET Start | " .. AccNumPC(ActDepthGet(interaction, isHand, true), tmSdec)
				ActDepthSet_Start(interaction, 0.2, isHand)
				Return()
			+ TM_UP.."End"
				ActDepthSet_Step(interaction, TM_SexDepthStep, true, isHand, false)
				Return()
			+ TM_DN.."End"
				ActDepthSet_Step(interaction, TM_SexDepthStep, false, isHand, false)
				Return()
			+ "RESET End | " .. AccNumPC(ActDepthGet(interaction, isHand, false), tmSdec)
				ActDepthSet_End(interaction, 1, isHand)
				Return()
			+ "Random" [gold]
				ActDepthSet_MenuRandom(interaction, isHand)
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose

	+ TM_MenuBack
		Return(2)
	+ TM_MenuCloseArousal(human)
stop

-- SEX MENU
label TMMenuSex(human)
	+ "Stats " .. AccStr(human.Name) .. " »" [gold]
		TMMenuHumanStats(human)

	+ if HasSexPartner_Any(human) and IsSexActive_Any(human)
		-- Quick commands
		+ "• Switch!" [if not HasSexPartner_PenisHand(human)]
			ActAll_WeightSwitch(human)
			Return()
		+ "• Deeper!"
			ActAll_Deeper(human)
			Return()

	-- GETTER HANDJOB
	+ "Handjob start" [if HasSexPartner(human,ActBody.PenisHand) and not IsSexActive(human,ActBody.PenisHand)]
		human.Penis.Interaction.m_autoHandActive = true
		Return()
	+ "Handjob " ..AccStr("stop") [if HasSexPartner(human,ActBody.PenisHand) and IsSexActive(human,ActBody.PenisHand)]
		human.Penis.Interaction.m_autoHandActive = false
		Return()
	-- GIVER (MOUTH, VAGINA, ANUS)
	+ "Penis start" [if HasSexPartner(human,ActBody.PenisHole) and not IsSexActive(human,ActBody.PenisHole)]
		human.Penis.Interaction.AutoActive = true
		human.Penis.Interaction.AutoPenisWeight = 0.8
		Return()
	+ "Penis " ..AccStr("stop") [if HasSexPartner(human,ActBody.PenisHole) and IsSexActive(human,ActBody.PenisHole)]
		human.Penis.Interaction.AutoActive = false
		Return()
	-- GETTER MOUTH
	+ "Oral start" [if HasSexPartner(human,ActBody.Mouth) and not IsSexActive(human,ActBody.Mouth)]
		human.Mouth.Fucker.Penis.Interaction.AutoActive = true
		human.Mouth.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Oral " ..AccStr("stop") [if HasSexPartner(human,ActBody.Mouth) and IsSexActive(human,ActBody.Mouth)]
		human.Mouth.Fucker.Penis.Interaction.AutoActive = false
		Return()
	-- GETTER ANUS
	+ "Anal start" [if HasSexPartner(human,ActBody.Anus) and not IsSexActive(human,ActBody.Anus)]
		human.Anus.Fucker.Penis.Interaction.AutoActive = true
		human.Anus.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Anal " ..AccStr("stop") [if HasSexPartner(human,ActBody.Anus) and IsSexActive(human,ActBody.Anus)]
		human.Anus.Fucker.Penis.Interaction.AutoActive = false
		Return()
	-- GETTER VAGINA
	+ "Pussy start" [if HasSexPartner(human,ActBody.Vagina) and not IsSexActive(human,ActBody.Vagina)]
		human.Vagina.Fucker.Penis.Interaction.AutoActive = true
		human.Vagina.Fucker.Penis.Interaction.AutoPenisWeight = 0.2
		Return()
	+ "Pussy " ..AccStr("stop") [if HasSexPartner(human,ActBody.Vagina) and IsSexActive(human,ActBody.Vagina)]
		human.Vagina.Fucker.Penis.Interaction.AutoActive = false
		Return()
	-- PENIS
	+ if human.Penis.IsActive == true
		+ if game.HasAnim(human.Penis)
			+ "Cum " ..AccStr("stop")
				TMHumanCumStop(human)
				Return()
		+ else
			+ "Cum start"
				TMHumanCumEvery(human, 5, true)
				Return()
	-- VAGINA
	+ else 
		+ if IsWet(human)
			+ "Wet " ..AccStr("stop")
				WetAllReset(human)	
				Return()
		+ else
			+ "Wet start"
				WetSet(human, 10000, ActBody.Vagina)
				Return()

	+ "Refresh"
		Return()

	-- GIVER (HAND)
	+ "| Handjob »	|S " .. AccNumPC(ActValueGet_ByBody(human, ActBody.PenisHand, ActParam.Speed), tmSdecSpd) [if HasSexPartner(human,ActBody.PenisHand)] [gold]
		TMSexControl(human, ActGet(human,ActBody.PenisHand), true)
	-- GIVER (MOUTH, VAGINA, ANUS)
	+ "| Penis »	|S " .. AccNumPC(ActValueGet_ByBody(human, ActBody.PenisHole, ActParam.Speed), tmSdecSpd) [if HasSexPartner(human,ActBody.PenisHole)] [gold]
		TMSexControl(human, ActGet(human,ActBody.PenisHole), false)
	-- GETTER MOUTH
	+ "| Oral »	|S " .. AccNumPC(ActValueGet_ByBody(human, ActBody.Mouth, ActParam.Speed), tmSdecSpd) [if HasSexPartner(human,ActBody.Mouth)] [gold]
		TMSexControl(human, ActGet(human,ActBody.Mouth), false)
	-- GETTER ANUS
	+ "| Anal »	|S " .. AccNumPC(ActValueGet_ByBody(human, ActBody.Anus, ActParam.Speed), tmSdecSpd) [if HasSexPartner(human,ActBody.Anus)] [gold]
		TMSexControl(human, ActGet(human,ActBody.Anus), false)
	-- GETTER VAGINA
	+ "| Pussy »	|S " .. AccNumPC(ActValueGet_ByBody(human, ActBody.Vagina, ActParam.Speed), tmSdecSpd) [if HasSexPartner(human,ActBody.Vagina)] [gold]
		TMSexControl(human, ActGet(human,ActBody.Vagina), false)
	-- AUTOSEX

	-- PENIS
	+ "| Cum »	| " .. TMMLabel_Cum(human) [if HumanHasPenis(human)] [gold]
		+ "• Cum every 60 sec"
			TMHumanCumEvery(human, 60)
			Return()
		+ "• Cum every 30 sec"
			TMHumanCumEvery(human, 30)
			Return()
		+ "• Cum every 10 sec"
			TMHumanCumEvery(human, 10)
			Return()
		+ "• Cum every 5 sec"
			TMHumanCumEvery(human, 5)
			Return()
		+ "• Cum every 2 sec"
			TMHumanCumEvery(human, 2)
			Return()
		+ "• Cum every 1 sec"
			TMHumanCumEvery(human, 1)
			Return()
		+ "RESET | " .. TMMLabel_Cum(human)
			TMHumanCumStop(human)
			Return()
		+ "Random" [gold]
			TMHumanCumEvery(human, 5, true)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose

	-- VAGINA
	+ "| Wet »	|" .. AccTextNum3("V", WetGet(human,ActBody.Vagina), "A", WetGet(human,ActBody.Anus), "M", WetGet(human,ActBody.Mouth)) [if not HumanHasPenis(human)] [gold]
		+ "• Squirt"
			WetSet(human, 10000, ActBody.Vagina)
			Return()
		+ "• Wet"
			WetSet(human, 2000, ActBody.Vagina)
			Return()
		+ "• Default"
			WetSet(human, 500, ActBody.Vagina)
			Return()
		+ TM_UP.."Wetness"
			wett = human.m_vagina.m_wetness + TM_WetnessStep
			WetSet(human, wett, ActBody.Vagina)
			Return()
		+ TM_DN.."Wetness"
			wett = human.m_vagina.m_wetness - TM_WetnessStep
			if wett < 0
				wett = 0
			WetSet(human, wett, ActBody.Vagina)
			Return()
		+ "RESET |" .. AccTextNum3("V", WetGet(human,ActBody.Vagina), "A", WetGet(human,ActBody.Anus), "M", WetGet(human,ActBody.Mouth))
			WetAllReset(human)	
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "Auto sex	| " .. TMMLabel_AutoSex(human)
		if TM_AutoSex
			AutoSexToggle(human)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuCloseArousal(human)
stop
