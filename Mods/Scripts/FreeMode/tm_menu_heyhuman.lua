-- TrueMoan v2.5 by illa3d
TMEyesOpen = true

---@diagnostic disable: exp-in-action, undefined-global, keyword, unknown-symbol, miss-end, miss-symbol, miss-exp, err-nonstandard-symbol, err-assign-as-eq, malformed-number
label TMMenuHeyHuman(human)
	+ "STATS " .. AccStr(human.Name) .. " »" [gold]
		TMMenuHumanStats(human, TMHStatsGet(human))
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
	+ "Penis		| " .. AccBool(human.Penis.IsActive) [if not human.m_isMale]
		HumanPenisSet(human, not human.Penis.IsActive)
		Return(2)
	+ "Voice		| " .. TMMLabel_Voice(human) [if TM_SFX_VoiceAllow(human)]
		TMHStatsGet(human):VoiceToggle()
		Return()
	+ "Look at »" [gold]
		+ "• Look at " .. AccStr("cam")
			HumanLookAt(human, CameraPos())
			Return()
		+ "• Face " .. AccStr("cam")
			HumanLookAt(human, CameraPos())
			HumanFaceAt(human, CameraPos())
			Return()
		+ "Eyes | " .. AccBoolOC(TMHStatsGet(human).EyesOpen)
			TMHumanEyesToggle(human)
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

label TMMenuHumanStats(human, stats)
	+ "• Cumflating!" [if stats.IsCumflating]
		Return()
	+ "• Bulging!" [if stats.IsBulging]
		Return()
	+ "• Feeling cum!" [if stats.IsFeelingCum]
		Return()
	+ "• Cumming!" [if stats.IsCumming]
		Return()
	+ "• Climax!" [if stats.IsClimax]
		Return()
	+ "Sex		| " .. TMMLabel_Holes(human) [if stats.IsSexActive]
		Return()
	+ "Arousal	| " .. AccNumPC(stats.Arousal, 2, true) [if stats.Arousal > 0]
		Return()
	+ "Voice		| " .. TMMLabel_Voice(human, true) [if TM_SFX_VoiceAllow(human)]
		Return()
	+ "Auto sex	| " .. AccBoolYN(stats.AutoSex, true) .. " | " .. stats.AutoSexTier
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose_AutoSexStats(human)
stop