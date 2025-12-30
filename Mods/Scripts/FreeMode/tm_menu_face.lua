-- TrueMoan v1.7 by illa3d
label TMMenuFace(human)
	-- FAUNA
	+ if TMMOD_FaunaLabs
		+ AccStr(TM_PosePrefix_Faun) .. AccStr("EDIT Face »") [gold]
			TMMenuFaunaFaceLab(human, hitTri)
		+ AccStr(TM_PosePrefix_Faun) .. "Kiss/Tongue »" [gold]
			TMMenuItems_Poses(human, TM_PoseKissTongue_Fauna)
		+ AccStr(TM_PosePrefix_Faun) .. "Face »" [gold]
			TMMenuItems_Poses(human, TM_PoseFace_Fauna)
	+ else
		+ AccStr("(more with faunalabs)") [gold]
			-- human "True Moan page clearly stated you need FaunaLABS for more!\nYour loss! Now watch me with just original faces."
			Return()
	-- ORIGINAL
	+ AccStr(TM_PosePrefix_Orig) .. "Face »" [gold]
		TMMenuItems_Poses(human, TM_PoseFace_Original)
	+ if #TM_PoseFace_Custom > 0
		+ AccStr(TM_PosePrefix_Custom) .. "Face »" [gold]
		TMMenuItems_Poses(human, TM_PoseFace_Custom)
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