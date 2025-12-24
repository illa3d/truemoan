-- TrueMoan v1.0 by illa3d
label TMMenuPose(human)
	+ "(TODO) FaunaLabs"
		Return()
	+ "Original.."[gold]
		+ "Stand up"
			human.Pose(StandUp())
			Return()
		+ "Sit down"
			human.Pose(SitDown())
			Return()
		+ "Kneel down"
			human.Pose(KneelDown())
			Return()
		+ "Sit and cross legs"
			human.Pose(SittingFolded())
			Return()
		+ "Sit and spread legs"
			human.Pose(SitDownSpreadLegs())
			Return()
		+ "Lay on your back"
			human.Pose(LayDownBack())
			Return()
		+ "Lay on your back and spread legs"
			human.Pose(LayDownBackSpread())
			Return()
		+ "Lay on your side"
			human.Pose(LayDownSide())
			Return()
		+ "Lay on your stomach"
			human.Pose(LaydownStomach())
			Return()
		+ "Get on all fours"
			human.Pose(GetdownAll4())
			Return()
		+ "Bend over"
			human.Pose(BendOver())
			Return()
		+ "Camel pose"
			human.Pose(CamelPose())
			Return()
		+ "Jack-o-Pose"
			human.Pose(JackoPose())
			Return()
		+ "T-Pose"
			human.Pose(TPose())
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