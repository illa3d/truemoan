-- TrueMoan v1.2 by illa3d
label TMMenuFace(human)
	+ if TMMOD_FaunaLabs
		+ AccStr(TM_PosePrefix_Faun) .. "Kiss/Tongue.." [gold]
			GetMenuItems_Pose(human, TM_PoseKissTongue_Fauna)
		+ AccStr(TM_PosePrefix_Faun) .. "Face.." [gold]
			GetMenuItems_Pose(human, TM_PoseFace_Fauna)
	+ AccStr(TM_PosePrefix_Orig) .. "Face.." [gold]
		GetMenuItems_Pose(human, TM_PoseFace_Original)
	+ if #TM_PoseFace_Custom > 0
		+ AccStr(TM_PosePrefix_Custom) .. "Face.." [gold]
		GetMenuItems_Pose(human, TM_PoseFace_Custom)
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