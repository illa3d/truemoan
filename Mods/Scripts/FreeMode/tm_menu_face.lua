-- TrueMoan v1.2 by illa3d
label TMMenuFace(human)
	+ "Tongue/Kiss " .. AccStr("(fauna)") .. ".." [if TMMOD_FaunaLabs] [gold]
		GetMenuItems_Pose(human, TM_PoseTongueKiss_Fauna)
	+ "Face " .. AccStr("(fauna)") .. ".."  [if TMMOD_FaunaLabs] [gold]
		GetMenuItems_Pose(human, TM_PoseFace_Fauna)
	+ "Face " .. AccStr("(orig)") .. ".." [gold]
		GetMenuItems_Pose(human, TM_PoseFace_Original)
	+ "Face " .. AccStr("(custom)") .. ".." [if #TM_PoseFace_Custom > 0] [gold]
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