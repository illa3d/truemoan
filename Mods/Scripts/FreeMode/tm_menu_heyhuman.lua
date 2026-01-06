-- TrueMoan v1.9 by illa3d
TMEyesOpen = true

function TMMenuHumanStatsBodyLabel(stats)
	if not stats or not stats.SexBody then return "-" end
	local bodyStr = ""
	for _, actBody in pairs(stats.SexBody) do
		bodyStr = bodyStr .. (bodyStr ~= "" and ", " or "") .. actBody
	end
	return bodyStr ~= "" and bodyStr or "-"
end

label TMMenuHumanStats(human)
	+ "Auto sex	| " .. AccBool(TMHStatsGet(human).AutoSex)
		Return()
	+ "Sex tier	| " .. AccStr(TMHStatsGet(human).AutoSexTier)
		Return()
	+ "Is in sex	| " .. AccBoolYN(TMHStatsGet(human).IsSexActive)
		Return()
	+ TMMenuHumanStatsBodyLabel(TMHStatsGet(human)) [if TMHStatsGet(human).IsSexActive]
		Return()
	+ "Feeling cum	| " .. AccBoolYN(TMHStatsGet(human):IsFeelingCum())
		Return()
	+ "Cumflating	| " .. AccBoolYN(TMHStatsGet(human):IsCumflating())
		Return()
	+ "Arousal	| " .. AccNumPC(TMHStatsGet(human).Arousal, 2)
		Return()
	+ "Climax	| " .. AccBoolYN(TMHStatsGet(human).Climax)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

label TMMenuHeyHuman(human)
	+ "Stats " .. AccStr(human.Name) .. " »		" .. AccNumPC(TMHStatsGet(human).Arousal)
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
		HumanReset(human)
		Return()
	+ if not human.m_isMale
		+ "Penis		| " .. AccStr("OFF") [if not human.Penis.IsActive]
			HumanPenisSet(human, true)
			Return(2)
		+ "Penis		| " .. AccStr("ON") [if human.Penis.IsActive]
			HumanPenisSet(human, false)
			Return(2)
	+ "Penetration	| " .. AccStr("ON") [if not human.m_isMale]
		HumanMaleSet(human, true)
		Return()
	+ "Penetration	| " .. AccStr("OFF") [if human.m_isMale]
		HumanMaleSet(human, false)
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
	+ TM_MenuClose
stop