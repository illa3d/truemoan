-- TrueMoan v2.6 by illa3d
---@diagnostic disable: exp-in-action, undefined-global, keyword, unknown-symbol, miss-end, miss-symbol, miss-exp, err-nonstandard-symbol, err-assign-as-eq, malformed-number
label TMMenuPose(human)
	-- FAUNA
	+ if TMMOD_FaunaLabs
		+ AccStr(TMMenuTag_Fauna) .. AccStr("EDIT Fingers »") [gold]
			TMMenuFaunaFingerLab(human, hitTri)
		+ AccStr(TMMenuTag_Fauna) .. "Arms »" [gold]
			TMMenuList_Poses(human, TMMenuItems_Fauna_Arms)
		+ AccStr(TMMenuTag_Fauna) .. "Hands »" [gold]
			TMMenuList_Poses(human, TMMenuItems_Fauna_Hands)
		+ AccStr(TMMenuTag_Fauna) .. "Lay »" [gold]
			TMMenuList_Poses(human, TMMenuItems_Fauna_Lay)
		+ AccStr(TMMenuTag_Fauna) .. "Kneel »" [gold]
			TMMenuList_Poses(human, TMMenuItems_Fauna_Kneel)
		+ AccStr(TMMenuTag_Fauna) .. "Sit »" [gold]
			TMMenuList_Poses(human, TMMenuItems_Fauna_Sit)
		+ AccStr(TMMenuTag_Fauna) .. "Stand »" [gold]
			TMMenuList_Poses(human, TMMenuItems_Fauna_Stand)
		+ AccStr(TMMenuTag_VoidBranding) .. "Void.Branding »" [gold]
			TMMenuList_Poses(human, TMMenuItems_VoidBranding)
	+ else
		+ AccStr("(more with faunalabs)") [gold]
			-- human "Why didn't you download the TrueMoan bundled with FaunaLABS?\nI'd run away but there's no pose for it."
			Return()
	-- ORIGINAL
	+ AccStr(TMMenuTag_Orig) .. "Poses »" [gold]
		TMMenuList_Poses(human, TMMenuItems_OrigPoses)
	+ if #TM_PoseHands_Custom > 0
		+ AccStr(TM_PosePrefix_Custom) .. "Hands »" [gold]
			TMMenuList_Poses(human, TM_PoseHands_Custom)
		+ AccStr(TM_PosePrefix_Custom) .. "Poses »" [gold]
			TMMenuList_Poses(human, TM_PoseBody_Custom)
	+ "RESET Face"
		human.Pose(FaceNeutral())
		Return()
	+ "RESET Pose"
		HumanReset(human, false, false, true) --resetsex, resetanim, resetpose, resetface
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop