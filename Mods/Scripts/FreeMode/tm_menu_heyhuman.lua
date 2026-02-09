-- TrueMoan v2.9 by illa3d
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
	+ if TMVoiceAllow(human)
		+ "Sfx	| " .. TMMLabel_Sfx(human) [if TM_Sfxs_CountLow()]
			TMHStatsGet(human):SfxToggle()
			Return()
		+ "Sfx »	| " .. TMMLabel_Sfx(human) [gold] [if not TM_Sfxs_CountLow()]
			TMMenuList_Sfx(human)
		+ "Voice	| " .. TMMLabel_Voice(human) [if TM_Voices_CountLow(human.m_isMale)]
			TMHStatsGet(human):VoiceToggle()
			Return()
		+ "Voice »	| " .. TMMLabel_Voice(human) [gold] [if not TM_Voices_CountLow(human.m_isMale)]
			TMMenuList_Voice(human)
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
	+ "Sfx			| " .. TMMLabel_Sfx(human, true) [if TMSfxAllow(human)]
		Return()
	+ "Voice		| " .. TMMLabel_Voice(human, true) [if TMVoiceAllow(human)]
		Return()
	+ "Auto sex	| " .. AccBoolYN(stats.AutoSex, true) .. " | " .. stats.AutoSexTier
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose_AutoSexStats(human)
stop