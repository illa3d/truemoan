-- TrueMoan v1.2 by illa3d
label TMMenuPose(human)
	+ "Hands " .. AccStr("(fauna)") .. ".." [if TMMOD_FaunaLabs] [gold]
		GetMenuItems_Pose(human, TM_PoseHands_Fauna)
	+ "Hands " .. AccStr("(custom)") .. ".." [if #TM_PoseHands_Custom > 0] [gold]
		GetMenuItems_Pose(human, TM_PoseHands_Custom)
	+ "Body " .. AccStr("(fauna)") .. ".." [if TMMOD_FaunaLabs] [gold]
		GetMenuItems_Pose(human, TM_PoseBody_Fauna)
	+ "Body " .. AccStr("(orig)") .. ".." [gold]
		GetMenuItems_Pose(human, TM_PoseBody_Original)
	+ "Body " .. AccStr("(custom)") .. ".." [if #TM_PoseBody_Custom > 0] [gold]
		GetMenuItems_Pose(human, TM_PoseBody_Custom)
	+ "RESET Pose" [gold]
		HumanReset(human, false, false, true) --resetsex, resetanim, resetpose, resetface
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop