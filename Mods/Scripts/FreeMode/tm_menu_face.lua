-- TrueMoan v1.0 by illa3d
label TMMenuFace(human)
	+ "(TODO) FaunaLabs"
		Return()
	+ "Original.."[gold]
		+ "Ahegao"
			human.Pose(FaceAhegao())
			Return()
		+ "Disgusted"
			human.Pose(FaceDisgusted())
			Return()
		+ "Sad"
			human.Pose(FaceSad())
			Return()
		+ "Scared"
			human.Pose(FaceScared())
			Return()
		+ "Angry"
			human.Pose(FaceAngry())
			Return()
		+ "Surprised"
			human.Pose(FaceSurprised())
			Return()
		+ "Happy"
			human.Pose(FaceSmile())
			Return()
		+ "Neutral"
			human.Pose(FaceNeutral())
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "Stop Looping" [if game.HasAnim(human) == true]
		game.RemoveAnim(human)
		Return()
	+ "RESET Face" [gold]
		human.Pose(FaceNeutral())
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop