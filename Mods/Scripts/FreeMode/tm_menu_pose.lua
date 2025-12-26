-- TrueMoan v1.2 by illa3d
label TMMenuPose(human)
	+ "Hands " .. AccStr("(custom)") .. ".."[gold]
		GetMenuItems_Pose(human, TM_PoseHands_Custom)
	+ "Hands " .. AccStr("(fauna)") .. ".."[gold]
		GetMenuItems_Pose(human, TM_PoseHands_Fauna)
	+ "Body " .. AccStr("(custom)") .. ".." [gold]
		GetMenuItems_Pose(human, TM_PoseBody_Custom)
	+ "Body " .. AccStr("(fauna)") .. ".." [gold]
		GetMenuItems_Pose(human, TM_PoseBody_Fauna)
	+ "Body " .. AccStr("(orig)") .. ".." [gold]
		GetMenuItems_Pose(human, TM_PoseBody_Original)
	+ "RESET Pose" [gold]
		HumanReset(human, false, false, true) --resetsex, resetanim, resetpose, resetface
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop