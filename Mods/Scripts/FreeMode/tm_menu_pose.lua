-- TrueMoan v1.0 by illa3d
label TMMenuPose(human)
	+ "(TODO) FaunaLabs"
		Return()
	+ "Original.."[gold]
		+ "Camel pose"
			human.Pose(CamelPose())
			Return()
		+ "Jack-o-Pose"
			human.Pose(JackoPose())
			Return()
		+ "Lay on back"
			human.Pose(LayDownBack())
			Return()
		+ "Lay on back, spread legs"
			human.Pose(LayDownBackSpread())
			Return()
		+ "Lay on side"
			human.Pose(LayDownSide())
			Return()
		+ "Lay on stomach"
			human.Pose(LaydownStomach())
			Return()
		+ "Kneel on all fours"
			human.Pose(GetdownAll4())
			Return()
		+ "Kneel down"
			human.Pose(KneelDown())
			Return()
		+ "Sit down"
			human.Pose(SitDown())
			Return()
		+ "Sit and cross legs"
			human.Pose(SittingFolded())
			Return()
		+ "Sit and spread legs"
			human.Pose(SitDownSpreadLegs())
			Return()
		+ "Bend over"
			human.Pose(BendOver())
			Return()
		+ "T-Pose"
			human.Pose(TPose())
			Return()
		+ "Stand up"
			human.Pose(StandUp())
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "RESET Pose" [gold]
		ResetHuman(human, false, false, true) --resetsex, resetanim, resetpose, resetface
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop