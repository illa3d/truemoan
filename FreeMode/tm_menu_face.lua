-- TrueMoan v0.6 by illa3d
label TMMenuFace(human)
	+ "Edit Face.." [gold]
		TMMenuFaceEdit(human)
	+ "Loops.. (WIP)"[gold]
		+ "Smile > Ahegao"
			game.AddRepeatAnim(2, || CustomLoops(human, FaceSmile, FaceAhegao, "Smile > Ahegao"), human)
			Return()
		+ "Idle Anim Test (WIP)"
			game.AddRepeatAnim((math.random(5,20)), || CustomLoops3(human, Lipbite, Kiss2, Pursedlips, "Test"), human)
		+ "Neutral > Scared"
			game.AddRepeatAnim(3, || CustomLoops(human, FaceNeutral, FaceScared, "Neutral > Scared"), human)
			Return()
		+ "Angry > Surprised"
			game.AddRepeatAnim(4, || CustomLoops(human, FaceAngry, FaceSurprised, "Angry > Surprised"), human) 
			Return()
		+ "Look Actor > Look Camera"
			game.AddRepeatAnim((math.random(5, 20)), || CustomLoops(human, LookActorA, LookCam, "Look Actor > Look Camera"), human) 
			Return()
		+ "Stop Anim" [if game.HasAnim(human.m_mouth) == true]
			game.RemoveAnim(human.m_mouth)
			Return()
		+ "Stop Looping" [if game.HasAnim(human) == true]
			game.RemoveAnim(human)
			Return()
		+ "< BACK (EYE BUG during movement)"
			Return(2)
		+ "| CLOSE"
	+ "Kiss/Tongue.."[gold]
		+ for i, pres in ipairs (kissstr)
			+ " " .. pres
				human.Pose(kisspresets[i]())
				Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "Custom.."[gold]
		+ for i, pres in ipairs (facestr)
			+ " " .. pres
				human.Pose(facepresets[i]())
				Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "Original.."[gold]
		+ "Ahegao!"
			human.Pose(FaceAhegao())
			Return()
		+ "Ahegao1"
			human.Pose(FaceAhegao1())
			Return()
		+ "Ahegao2"
			human.Pose(FaceAhegao2())
			Return()
		+ "Angry face."
			human.Pose(FaceAngry())
			Return()
		+ "Disgusted face."
			human.Pose(FaceDisgusted())
			Return()
		+ "Happy face."
			human.Pose(FaceSmile())
			Return()
		+ "Sad face."
			human.Pose(FaceSad())
			Return()
		+ "Scared face."
			human.Pose(FaceScared())
			Return()
		+ "Surprised face."
			human.Pose(FaceSurprised())
			Return()
		+ "Neutral face."
			human.Pose(FaceNeutral())
			Return()
		+ "Close your eyes."
			human.Pose(EyesClose())
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "Stop Looping" [if game.HasAnim(human) == true]
		game.RemoveAnim(human)
		Return()
	+ "RESET Face" [gold]
		human.Pose(FaceNeutral())
		Return()
	+ "| BACK"
		Return(2)
	+ "| CLOSE"
stop