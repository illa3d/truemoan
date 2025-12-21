-- TrueMoan v0.7 by illa3d
label TMMenuPose(human)
	+ "Hands.."[gold]
		+ for i, pres in ipairs (bodystr)
			+ " " .. pres
				human.Pose(bodypresets[i]())
				Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Lay.."[gold]
		+ "On your Back"
			human.Pose(LayDownBack1())
			Return()
		+ "On your side - Right"
			human.Pose(LayDownSideR())
			Return()
		+ "On your side - Left"
			human.Pose(LayDownSideL())
			Return()
		+ "On your stomach."
			human.Pose(LaydownStomach1())
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Kneel.."[gold]
		+ "All Four."
			human.Pose(All41())
			Return()
		+ "All Four - 2."
			human.Pose(All42())
			Return()
		+ "Kneel down."
			human.Pose(KneelDown1())
			Return()
		+ "Kneel down - 2."
			human.Pose(KneelDown2())
			Return()
		+ "Kneel down - 3."
			human.Pose(KneelDown3())
			Return()
		+ "Kneel down - 4."
			human.Pose(KneelDown4())
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Sit.."[gold]
		+ "Sit down."
			human.Pose(SitDown1())
			Return()
		+ "Scared."
			human.Pose(SitDown2())
			Return()
		+ "Sit down and spread your legs."
			human.Pose(SitDownSpreadLegs())
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Stand.."[gold]
		+ "Stand up"
			human.Pose(StandUp1())
			Return()
		+ "Bend over."
			human.Pose(BendOver1())
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Original.."[gold]
		+ "Stand up straight."
			human.Pose(StandUp())
			Return()
		+ "Kneel down."
			human.Pose(KneelDown())
			Return()
		+ "Sit down."
			human.Pose(SitDown())
			Return()
		+ "Sit down and spread your legs."
			human.Pose(SitDownSpreadLegs())
			Return()
		+ "Lay down on your back."
			human.Pose(LayDownBack())
			Return()
		+ "Lay down on your side."
			human.Pose(LayDownSide())
			Return()
		+ "Lay down on your stomach."
			human.Pose(LaydownStomach())
			Return()
		+ "Get down on all fours."
			human.Pose(GetdownAll4())
			Return()
		+ "Bend over."
			human.Pose(BendOver())
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "RESET Pose" [gold]
		ResetPose(human)
		Return()
	+ MenuBack
		Return(2)
	+ MenuClose
stop