-- TrueMoan v1.2 by illa3d
label TMMenuFace(human)
	+ "Face " .. AccStr("(custom)") .. ".." [gold]
		GetMenuItems_Pose(human, TM_PoseFace_Custom)
	+ "Tongue/Kiss " .. AccStr("(fauna)") .. ".." [gold]
		GetMenuItems_Pose(human, TM_PoseTongueKiss_Fauna)
	+ "Face " .. AccStr("(fauna)") .. ".." [gold]
		GetMenuItems_Pose(human, TM_PoseFace_Fauna)
	+ "Face " .. AccStr("(orig)") .. ".." [gold]
		GetMenuItems_Pose(human, TM_PoseFace_Original)
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