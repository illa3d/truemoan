-- TrueMoan v1.2 by illa3d
label TMMenuPose(human)
	-- FAUNA
	+ if TMMOD_FaunaLabs
		+ AccStr(TM_PosePrefix_Faun) .. "EDIT Fingers.." [gold]
			TMMenuFaunaFingerLab(human, hitTri)
		+ AccStr(TM_PosePrefix_Faun) .. "Arms.." [gold]
			GetMenuItems_Poses(human, TM_PoseArms_Fauna)
		+ AccStr(TM_PosePrefix_Faun) .. "Hands.." [gold]
			GetMenuItems_Poses(human, TM_PoseHands_Fauna)
		+ AccStr(TM_PosePrefix_Faun) .. "Lay.." [gold]
			GetMenuItems_Poses(human, TM_PoseBody_Fauna_Lay)
		+ AccStr(TM_PosePrefix_Faun) .. "Kneel.." [gold]
			GetMenuItems_Poses(human, TM_PoseBody_Fauna_Kneel)
		+ AccStr(TM_PosePrefix_Faun) .. "Sit.." [gold]
			GetMenuItems_Poses(human, TM_PoseBody_Fauna_Sit)
		+ AccStr(TM_PosePrefix_Faun) .. "Stand.." [gold]
			GetMenuItems_Poses(human, TM_PoseBody_Fauna_Stand)
	-- ORIGINAL
	+ AccStr(TM_PosePrefix_Orig) .. "Poses.." [gold]
		GetMenuItems_Poses(human, TM_PoseBody_Original)
	+ if #TM_PoseHands_Custom > 0
		+ AccStr(TM_PosePrefix_Custom) .. "Hands.." [gold]
			GetMenuItems_Poses(human, TM_PoseHands_Custom)
		+ AccStr(TM_PosePrefix_Custom) .. "Poses.." [gold]
			GetMenuItems_Poses(human, TM_PoseBody_Custom)
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