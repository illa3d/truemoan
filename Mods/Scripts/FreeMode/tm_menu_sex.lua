-- TrueMoan v2.7 by illa3d
-- Sex speed decimals
local tmSdecSpd = 1

-- function TMIsAutoSexTurboNeeded(interaction, isHand) return not TM_AutoSexTurbo and ActSpeedGet(interaction, isHand) > ActAutoSexNormalMinMax.Speed.Max end
-- function TMIsAutoSexNormalNeeded(interaction, isHand) return TM_AutoSexTurbo and ActSpeedGet(interaction, isHand) < ActAutoSexNormalMinMax.Speed.Max end

-- SEX MENU
---@diagnostic disable: exp-in-action, undefined-global, keyword, unknown-symbol, miss-end, miss-symbol, miss-exp, err-nonstandard-symbol, err-assign-as-eq, malformed-number
label TMMenuSex(human)
	+ "Auto sex options »" [gold]
		TMMenuSex_Auto(human, TMHStatsGet(human))

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
	+ if HumanHasPenis(human)
		+ if HumanIsCumming(human)
			+ "Cum " ..AccStr("stop")
				TMHumanCumStop(human)
				Return()
		+ else
			+ "Cum start"
				TMHumanCum(human, 2, 6)
				Return()
	-- VAGINA
	+ elseif not human.m_isMale
		+ if IsWet(human)
			+ "Wet " ..AccStr("stop")
				WetReset_All(human)	
				Return()
		+ else
			+ "Wet start"
				WetSet(human, 10000, ActBody.Vagina)
				Return()

	+ "Refresh"
		Return()

	-- GIVER (HAND)
	+ "| Handjob »	|S " .. AccNumPC(ActValueGet_ByBody(human, ActBody.PenisHand, ActParam.Speed), tmSdecSpd) [if HasSexPartner(human,ActBody.PenisHand)] [gold]
		TMMenuSex_Control(human, ActGet(human, ActBody.PenisHand), ActBody.PenisHand, true)
	-- GIVER (MOUTH, VAGINA, ANUS)
	+ "| Penis »	|S " .. AccNumPC(ActValueGet_ByBody(human, ActBody.PenisHole, ActParam.Speed), tmSdecSpd) [if HasSexPartner(human,ActBody.PenisHole)] [gold]
		TMMenuSex_Control(human, ActGet(human, ActBody.PenisHole), ActBody.PenisHole, false)
	-- GETTER MOUTH
	+ "| Oral »	|S " .. AccNumPC(ActValueGet_ByBody(human, ActBody.Mouth, ActParam.Speed), tmSdecSpd) [if HasSexPartner(human,ActBody.Mouth)] [gold]
		TMMenuSex_Control(human, ActGet(human, ActBody.Mouth), ActBody.Mouth, false)
	-- GETTER ANUS
	+ "| Anal »	|S " .. AccNumPC(ActValueGet_ByBody(human, ActBody.Anus, ActParam.Speed), tmSdecSpd) [if HasSexPartner(human,ActBody.Anus)] [gold]
		TMMenuSex_Control(human, ActGet(human, ActBody.Anus), ActBody.Anus, false)
	-- GETTER VAGINA
	+ "| Pussy »	|S " .. AccNumPC(ActValueGet_ByBody(human, ActBody.Vagina, ActParam.Speed), tmSdecSpd) [if HasSexPartner(human,ActBody.Vagina)] [gold]
		TMMenuSex_Control(human, ActGet(human, ActBody.Vagina), ActBody.Vagina, false)

	-- PENIS
	+ if HumanHasPenis(human)
		+ "| Cum »	| " .. TMMLabel_Cum(human)[gold]
			TMBodyEditHuman(human)
			TMMenuSex_Cum(human)
	-- VAGINA
	+ elseif not human.m_isMale
		+ "| Wet »	|" .. AccTextNum3("V", WetGet(human,ActBody.Vagina), "A", WetGet(human,ActBody.Anus), "M", WetGet(human,ActBody.Mouth))[gold]
			TMMenuSex_Wet(human)
	-- AUTO SEX
	+ "Auto sex	| " .. TMMLabel_AutoSex(human, true) [if TM_AutoSex]
		AutoSexToggle(human)
		Return()
	+ "Auto sex	| " .. TMMLabel_AutoSex(human) [if not TM_AutoSex]
		TMMenuOptions_Sex(human)
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose_AutoSexStats(human)
stop


label TMMenuSex_Auto(human, stats)
	+ "« " .. AccStr(human.Name) .. " »"[gold]
		Return()
	+ if stats.AutoSex
		+ "| Auto sex random »" [gold]
			TMMenuSex_AutoParams(human, stats)
		+ "| Auto climax	| " .. AccBool(stats.AutoSexClimax)
			stats.AutoSexClimax = not stats.AutoSexClimax
			Return()
		+ "| Auto cum		| " .. AccBool(stats.AutoSexCum)
			stats.AutoSexCum = not stats.AutoSexCum
			Return()
	+ "Auto sex		| " .. AccBool(stats.AutoSex)
		stats.AutoSex = not stats.AutoSex
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose_AutoSexStats(human)
stop

label TMMenuSex_AutoParams(human, stats)
	+ "« " .. AccStr(human.Name) .. " »"[gold]
		Return()
	+ "| M vs F		| " .. AccBool(stats.AutoSexWeight)
		stats.AutoSexWeight = not stats.AutoSexWeight
		Return()
	+ "| Speed		| " .. AccBool(stats.AutoSexSpeed)
		stats.AutoSexSpeed = not stats.AutoSexSpeed
		Return()
	+ "| Thrust		| " .. AccBool(stats.AutoSexThrust)
		stats.AutoSexThrust = not stats.AutoSexThrust
		Return()
	+ "| Depth start		| " .. AccBool(stats.AutoSexDepthStart)
		stats.AutoSexDepthStart = not stats.AutoSexDepthStart
		Return()
	+ "| Depth end		| " .. AccBool(stats.AutoSexDepthEnd)
		stats.AutoSexDepthEnd = not stats.AutoSexDepthEnd
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- WETNESS CONTROL
label TMMenuSex_Wet(human)
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
		local wett = human.m_vagina.m_wetness + TM_WetnessStep
		WetSet(human, wett, ActBody.Vagina)
		Return()
	+ TM_DN.."Wetness"
		local wett = human.m_vagina.m_wetness - TM_WetnessStep
		if wett < 0
			wett = 0
		WetSet(human, wett, ActBody.Vagina)
		Return()
	+ "RESET |" .. AccTextNum3("V", WetGet(human,ActBody.Vagina), "A", WetGet(human,ActBody.Anus), "M", WetGet(human,ActBody.Mouth))
		WetReset_All(human)	
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- CUM CONTROL
label TMMenuSex_Cum(human, stats)
	+ "• Sticky"
		TMBodyEdit(human, TMBody.FluidSpeed, 0)
		Return()
	+ "• Normal"
		TMBodyEdit(human, TMBody.FluidSpeed, 0.5)
		Return()
	+ "• Watery"
		TMBodyEdit(human, TMBody.FluidSpeed, 1)
		Return()
	+ TM_UP.."Speed"
		TMBodyEdit_Up(human, TMBody.FluidSpeed, TM_BodyStepA, true)
		Return()
	+ TM_DN.."Speed"
		TMBodyEdit_Down(human, TMBody.FluidSpeed, TM_BodyStepA, true)
		Return()
	+ "RESET Speed | " .. AccNum(TMBodyUI(TMBody.FluidSpeed), TM_Dec_Body)
		TMBodyEdit(human, TMBody.FluidSpeed, TMBD_FluidSpeed)
		Return()
	+ "Random Speed" [gold]
		TMBodyEditRandom(human, TMBody.FluidSpeed)
		Return()
	+ "| Fluid »		|" .. AccTextNum2("A", TMBodyUI(TMBody.FluidAmount), "S", TMBodyUI(TMBody.FluidSpread), TM_Dec_Body) [gold]
		+ "Step	| " .. AccNum(TMB_StepMultiplier, 2) .. "x"
			TMBodyStepMultiplierToggle()
			Return()
		+ TM_UP.."Amount"
			TMBodyEdit_Up(human, TMBody.FluidAmount, TM_BodyStepA, true)
			Return()
		+ TM_DN.."Amount"
			TMBodyEdit_Down(human, TMBody.FluidAmount, TM_BodyStepA, true)
			Return()
		+ "RESET Amount | " .. AccNum(TMBodyUI(TMBody.FluidAmount), TM_Dec_Body)
			TMBodyEdit(human, TMBody.FluidAmount, TMBD_Body)
			Return()
		+ TM_UP.."Spread"
			TMBodyEdit_Up(human, TMBody.FluidSpread, TM_BodyStep, true)
			Return()
		+ TM_DN.."Spread"
			TMBodyEdit_Down(human, TMBody.FluidSpread, TM_BodyStep, true)
			Return()
		+ "RESET Spread | " .. AccNum(TMBodyUI(TMBody.FluidSpread), TM_Dec_Body)
			TMBodyEdit(human, TMBody.FluidSpread, TMBD_Body)
			Return()
		+ "Random" [gold]
			TMBodyEditRandom(human, TMBody.FluidAmount)
			TMBodyEditRandom(human, TMBody.FluidSpread)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Force »		|" .. AccTextNum2("F", TMBodyUI(TMBody.FluidForce), "G", TMBodyUI(TMBody.FluidGravity), TM_Dec_Body) [gold]
		+ "Step	| " .. AccNum(TMB_StepMultiplier, 2) .. "x"
			TMBodyStepMultiplierToggle()
			Return()
		+ TM_UP.."Force"
			TMBodyEdit_Up(human, TMBody.FluidForce, TM_BodyStepA, true)
			Return()
		+ TM_DN.."Force"
			TMBodyEdit_Down(human, TMBody.FluidForce, TM_BodyStepA, true)
			Return()
		+ "RESET Force | " .. AccNum(TMBodyUI(TMBody.FluidForce), TM_Dec_Body)
			TMBodyEdit(human, TMBody.FluidForce, TMBD_Body)
			Return()
		+ TM_UP.."Gravity"
			TMBodyEdit_Up(human, TMBody.FluidGravity, TM_BodyStepA, true)
			Return()
		+ TM_DN.."Gravity"
			TMBodyEdit_Down(human, TMBody.FluidGravity, TM_BodyStepA, true)
			Return()
		+ "RESET Gravity | " .. AccNum(TMBodyUI(TMBody.FluidGravity), TM_Dec_Body)
			TMBodyEdit(human, TMBody.FluidGravity, TMBD_Body)
			Return()
		+ "Random" [gold]
			TMBodyEditRandom(human, TMBody.FluidForce)
			TMBodyEditRandom(human, TMBody.FluidGravity)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Cum every »	| " .. TMMLabel_Cum(human)[gold]
		TMMenuSex_CumEvery(human)
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- CUM EVERY
label TMMenuSex_CumEvery(human)
	+ "• Cum every 60 sec"
		TMHumanCum(human, 60)
		Return()
	+ "• Cum every 30 sec"
		TMHumanCum(human, 30)
		Return()
	+ "• Cum every 10 sec"
		TMHumanCum(human, 10)
		Return()
	+ "• Cum every 5 sec"
		TMHumanCum(human, 5)
		Return()
	+ "• Cum every 2 sec"
		TMHumanCum(human, 2)
		Return()
	+ "RESET | " .. TMMLabel_Cum(human)
		TMHumanCumStop(human)
		Return()
	+ "Random" [gold]
		TMHumanCum(human, GetRandom(2,60), 60)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- SEX CONTROL (in many menus)
label TMMenuSex_Control(human, interaction, actBody, isHand)
	+ "• Max"
		ActSpeedSet(interaction, AutoSexTierConfig[AutoSexTier.Max].Mid, isHand)
		AutoSexSet_TierBySpeed(human, actBody, AutoSexTierConfig[AutoSexTier.Max].Mid)
		Return()
	+ "• Wild"
		ActSpeedSet(interaction, AutoSexTierConfig[AutoSexTier.Wild].Mid, isHand)
		AutoSexSet_TierBySpeed(human, actBody, AutoSexTierConfig[AutoSexTier.Wild].Mid)
		Return()
	+ "• Faster"
		ActSpeedSet(interaction, AutoSexTierConfig[AutoSexTier.Faster].Mid, isHand)
		AutoSexSet_TierBySpeed(human, actBody, AutoSexTierConfig[AutoSexTier.Faster].Mid)
		Return()
	+ "• Fast"
		ActSpeedSet(interaction, AutoSexTierConfig[AutoSexTier.Fast].Mid, isHand)
		AutoSexSet_TierBySpeed(human, AutoSexTierConfig[AutoSexTier.Fast].Mid)
		Return()
	+ "• Normal"
		ActSpeedSet(interaction, AutoSexTierConfig[AutoSexTier.Normal].Mid, isHand)
		AutoSexSet_TierBySpeed(human, actBody, AutoSexTierConfig[AutoSexTier.Normal].Mid)
		Return()
	+ "• Slow"
		ActSpeedSet(interaction, AutoSexTierConfig[AutoSexTier.Slow].Mid, isHand)
		AutoSexSet_TierBySpeed(human, actBody, AutoSexTierConfig[AutoSexTier.Slow].Mid)
		Return()
	+ TM_UP.."Speed"
		ActSpeedSet_Step(interaction, TM_SexSpeedStep, true, isHand)
		AutoSexSet_TierBySpeed(human, actBody, ActSpeedGet(interaction, isHand))
		Return()
	+ TM_DN.."Speed"
		ActSpeedSet_Step(interaction, TM_SexSpeedStep, false, isHand)
		AutoSexSet_TierBySpeed(human, actBody, ActSpeedGet(interaction, isHand))
		Return()
	+ "RESET Speed	| " .. AccNumPC(ActSpeedGet(interaction, isHand), tmSdecSpd) .. " | " .. TMMLabel_AutoSex(human)
		ActSpeedSet(interaction, 0, isHand)
		AutoSexSet_TierBySpeed(human, actBody, ActSpeedGet(interaction, isHand))
		Return()
	+ "Random Speed" [gold]
		ActSpeedSet_MenuRandom(interaction, isHand)
		AutoSexSet_TierBySpeed(human, actBody, ActSpeedGet(interaction, isHand))
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
			+ "| Thrust »	|T " .. AccNumPC(ActThrustGet(interaction, isHand), TM_Dec_Sex) [gold]
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
				+ "RESET Thrust | " .. AccNumPC(ActThrustGet(interaction, isHand), TM_Dec_Sex)
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
			+ "| Thrust »	|T " .. AccNumPC(ActThrustGet(interaction, isHand), TM_Dec_Sex) .. " |M " .. AccNumPC(ActWeightGet(interaction, isHand), TM_Dec_Sex) [gold]
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
				+ "RESET Thrust | " .. AccNumPC(ActThrustGet(interaction, isHand), TM_Dec_Sex)
					ActThrustSet(interaction, 0)
					Return()
				+ TM_UP.."M vs F"
					ActWeightSet_Step(interaction, TM_SexMaleStep, true)
					Return()
				+ TM_DN.."M vs F"
					ActWeightSet_Step(interaction, TM_SexMaleStep, false)
					Return()
				+ "TOGGLE M vs F | " .. AccNumPC(ActWeightGet(interaction, isHand), TM_Dec_Sex)
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
		+ "| Depth »	|S " .. AccNumPC(ActDepthGet(interaction, isHand, true), TM_Dec_Sex) .. " |E " .. AccNumPC(ActDepthGet(interaction, isHand, false), TM_Dec_Sex) [gold]
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
			+ "RESET Start | " .. AccNumPC(ActDepthGet(interaction, isHand, true), TM_Dec_Sex)
				ActDepthSet_Start(interaction, 0.2, isHand)
				Return()
			+ TM_UP.."End"
				ActDepthSet_Step(interaction, TM_SexDepthStep, true, isHand, false)
				Return()
			+ TM_DN.."End"
				ActDepthSet_Step(interaction, TM_SexDepthStep, false, isHand, false)
				Return()
			+ "RESET End | " .. AccNumPC(ActDepthGet(interaction, isHand, false), TM_Dec_Sex)
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
	+ TM_MenuClose_AutoSexStats(human)
stop