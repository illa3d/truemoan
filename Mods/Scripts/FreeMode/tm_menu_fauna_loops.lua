-- FreemodeHG version 0.3 ~ fauna_LABS_v1.02 (partial menu extract)
label TMMenuFaunaLoops(human, hitTri)
	+ "Smile > Ahegao"
		game.AddRepeatAnim(2, || CustomLoops(human, FaceSmile, FaceAhegao, "Smile > Ahegao"), human)
		Return()
	+ "Neutral > Scared"
		game.AddRepeatAnim(3, || CustomLoops(human, FaceNeutral, FaceScared, "Neutral > Scared"), human)
		Return()
	+ "Angry > Surprised"
		game.AddRepeatAnim(4, || CustomLoops(human, FaceAngry, FaceSurprised, "Angry > Surprised"), human) 
		Return()
	+ "Look Actor > Look Camera"
		game.AddRepeatAnim((math.random(5, 20)), || CustomLoops(human, LookActorA, LookCam, "Look Actor > Look Camera"), human) 
		Return()
	+ "STOP Mouth" [if game.HasAnim(human.m_mouth) == true]
		game.RemoveAnim(human.m_mouth)
		Return()
	+ "STOP Anim" [if game.HasAnim(human) == true]
		game.RemoveAnim(human)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop