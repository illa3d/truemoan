-- TrueMoan v1.0 by illa3d
label TMMenuFace(human)
	+ "(TODO) FaunaLabs"
		Return()
	+ "Original.."[gold]
		+ "Happy"
			human.Pose(FaceSmile())
			Return()
		+ "Angry"
			human.Pose(FaceAngry())
			Return()
		+ "Sad"
			human.Pose(FaceSad())
			Return()
		+ "Ahegao"
			human.Pose(FaceAhegao())
			Return()
		+ "Surprised"
			human.Pose(FaceSurprised())
			Return()
		+ "Scared"
			human.Pose(FaceScared())
			Return()
		+ "Disgusted"
			human.Pose(FaceDisgusted())
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