-- TrueMoan v1.2 by illa3d
label TMMenuPose(human)
	+ "(TODO) FaunaLabs"
		Return()
	+ "Original.."[gold]
		+ "Camel pose"
			human.Pose(CamelPose())
			Return()
		+ "Jack-o pose"
			human.Pose(JackoPose())
			Return()
		+ "Lay, back, legs spread"
			human.Pose(LayDownBackSpread())
			Return()
		+ "Lay, back"
			human.Pose(LayDownBack())
			Return()
		+ "Lay, side"
			human.Pose(LayDownSide())
			Return()
		+ "Lay, stomach"
			human.Pose(LaydownStomach())
			Return()
		+ "Doggy"
			human.Pose(GetdownAll4())
			Return()
		+ "Kneel"
			human.Pose(KneelDown())
			Return()
		+ "Sit, legs spread"
			human.Pose(SitDownSpreadLegs())
			Return()
		+ "Sit, legs cross"
			human.Pose(SittingFolded())
			Return()
		+ "Sit"
			human.Pose(SitDown())
			Return()
		+ "Stand, Bend over"
			human.Pose(BendOver())
			Return()
		+ "Stand, T-Pose"
			human.Pose(TPose())
			Return()
		+ "Stand"
			human.Pose(StandUp())
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "RESET Pose" [gold]
		HumanReset(human, false, false, true) --resetsex, resetanim, resetpose, resetface
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop