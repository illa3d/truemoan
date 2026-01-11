-- TrueMoan v2.2 by illa3d
TMEyesOpen = true

label TMMenuHumanStats(human)
	+ "Auto sex	| " .. AccBool(TMHStatsGet(human).AutoSex)
		Return()
	+ "Sex tier	| " .. AccStr(TMHStatsGet(human).AutoSexTier)
		Return()
	+ "Is in sex	| " .. AccBoolYN(TMHStatsGet(human).IsSexActive)
		Return()
	+ TMMLabel_Holes(human) [if TMHStatsGet(human).IsSexActive]
		Return()
	+ "Cumming	| " .. TMMLabel_Cum(human)
		Return()
	+ "Feeling cum	| " .. AccBoolYN(TMHStatsGet(human):IsFeelingCum())
		Return()
	+ "Cumflating	| " .. AccBoolYN(TMHStatsGet(human):IsCumflating())
		Return()
	+ "Arousal	| " .. AccNumPC(TMHStatsGet(human).Arousal, 2)
		Return()
	+ "Climax		| " .. AccBoolYN(TMHStatsGet(human).Climax)
		Return()
	+ "Allow moaning	| " .. AccBoolYN(TMHStatsGet(human).AllowMoaning)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose_AutoSexStats(human)
stop

label TMMenuHeyHuman(human)
	+ "Stats " .. AccStr(human.Name) .. " »" [gold]
		TMMenuHumanStats(human)

	+ "DELETE ".. AccStr(human.Name)
		+ AccStr("may crash the game If")
			Return()
		+ AccStr("actor is interacting!")
			Return()
		+ "Delete " .. AccStr(human.Name) .. "?"
			Return()
		+ TM_MenuOk
			HumanRemove(human)
			Return(2)
		+ TM_MenuCancel
			Return(2)
		Return()
	+ "RESET ".. AccStr(human.Name)
		TMHumanReset(human)
		Return()
	+ "Penetration	| " .. AccBool(not human.m_isMale)
		HumanMaleSet(human, not human.m_isMale)
		Return()
	+ if not human.m_isMale
		+ "Penis		| " .. AccBool(human.Penis.IsActive)
			HumanPenisSet(human, not human.Penis.IsActive)
			Return(2)
	+ "Moaning	| " .. AccBool(TMHStatsGet(human).AllowMoaning)
		TMHStatsGet(human):AllowMoaningToggle()
		Return()
	+ "Look at »" [gold]
		+ "• Look at " .. AccStr("cam")
			HumanLookAt(human, CameraPos())
			Return()
		+ "• Face " .. AccStr("cam")
			HumanLookAt(human, CameraPos())
			HumanFaceAt(human, CameraPos())
			Return()
		+ "Eyes | " .. AccStr("Closed")  [if not TMEyesOpen]
			TMEyesOpen = HumanEyesOpen(human, true)
			Return()
		+ "Eyes | " .. AccStr("Open") [if TMEyesOpen]
			TMEyesOpen = HumanEyesOpen(human, false)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "Clothes From »" [gold]
		TMMenuList_Clothes(human, TM_Clothes_Custom)
	+ "Clothes " .. AccStr("on")
		HumanClothes(human, true)
		Return()
	+ "Clothes " .. AccStr("off")
		HumanClothes(human, false)	
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose_AutoSexStats(human)
stop