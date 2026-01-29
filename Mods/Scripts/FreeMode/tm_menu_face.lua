-- TrueMoan v2.7 by illa3d
---@diagnostic disable: exp-in-action, undefined-global, keyword, unknown-symbol, miss-end, miss-symbol, miss-exp, err-nonstandard-symbol
label TMMenuFace(human)
	-- FAUNA
	+ if TMMOD_FaunaLabs
		+ AccStr(TMMenuTag_Fauna) .. AccStr("EDIT Face »") [gold]
			TMMenuFaunaFaceLab(human, hitTri)
		+ AccStr(TMMenuTag_Fauna) .. "Kiss/Tongue »" [gold]
			TMMenuList_Poses(human, TMMenuItems_Fauna_Kiss)
		+ AccStr(TMMenuTag_Fauna) .. "Face »" [gold]
			TMMenuList_Poses(human, TMMenuItems_Fauna_Face)
	+ else
		+ AccStr("(more with faunalabs)") [gold]
			-- human "True Moan page clearly stated you need FaunaLABS for more!\nYour loss! Now watch me with just original faces."
			Return()
	-- ORIGINAL
	+ AccStr(TMMenuTag_Orig) .. "Face »" [gold]
		TMMenuList_Poses(human, TMMenuItems_OrigFaces)
	+ AccStr(TMMenuTag_TrueFace) .. "TrueFace »" [gold]
		TMMenuList_TrueFace(human, TMMenuItems_TrueFace)
	+ if #TM_PoseFace_Custom > 0
		+ AccStr(TM_PosePrefix_Custom) .. "Face »" [gold]
		TMMenuList_Poses(human, TM_PoseFace_Custom)
	+ "Stop Anim" [if game.HasAnim(human)]
		game.RemoveAnim(human)
		Return()
	+ "RESET Face" [gold]
		human.Pose(FaceNeutral())
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop