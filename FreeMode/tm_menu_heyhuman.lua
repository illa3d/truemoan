-- TrueMoan v0.7 by illa3d
label TMMenuHeyHuman(human)
	+ "Stop Shaking" [if game.HasAnim(human.chestNames) == true]
		game.RemoveAnim(human.chestNames)
		Return()
	+ "Stop Bouncing" [if game.HasAnim(human.breastNames) == true]
		game.RemoveAnim(human.breastNames)
		Return()
	+ "Stop Left hand" [if game.HasAnim(human.forearmNames) == true]
		game.RemoveAnim(human.forearmNames)
		Return()
	+ "Stop Right hand" [if game.HasAnim(human.handNames) == true]
		game.RemoveAnim(human.handNames)
		Return()
	+ "Stop Licking" [if game.HasAnim(human.m_mouth) == true]
		game.RemoveAnim(human.m_mouth)
		Return()
	+ "Stop Head"[if game.HasAnim(human.headNames) == true]
		game.RemoveAnim(human.headNames)
		Return()
	+ "Stop Hip moves" [if game.HasAnim(human.Anus) == true]
		game.RemoveAnim(human.Anus)
		Return()
	+ "Stop Legs" [if game.HasAnim(human.footNames) == true]
		game.RemoveAnim(human.footNames)
		Return()
	+ "Stop twisting" [if game.HasAnim(human.thighNames) == true]
		game.RemoveAnim(human.thighNames)
		Return()
	+ "Stop Humping"[if game.HasAnim(human) == true]
		game.RemoveAnim(human)
		Return()
	+ "RESET Pose" [gold]
		ResetPose(human)
		Return()
	+ "Hands.." [gold]
		+ "Peace L"
			human.Pose(PeaceL())
			Return()
		+ "Peace R"
			human.Pose(PeaceR())
			Return()
		+ "Shush R"
			human.Pose(Shush())
			Return()
		+ "Open"
			human.Pose(HandsOpen())
			Return()
		+ "Open 2"
			human.Pose(HandsOpen2())
			Return()
		+ "Closed"
			human.Pose(HandsClosed())
			Return()
		+ "Behind 1"
			human.Pose(HandsBehind1())
			Return()
		+ "Behind 2"
			human.Pose(HandsBehind2())
			Return()
		+ "Grab Head"
			human.Pose(GrabHead())
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Look at me"
		human.Pose(LookCam())
		Return()
	+ "Face me"
		human.Pose(FaceCam())
		human.Pose(LookCam())
		Return()
	+ if human.m_isMale == true
		+ "Time to bottom, " .. human.Name .. "!"
			human.m_isMale = false
			human "Alright"
			Return(2)
	+ "Clothes ON"
		hadpenis = human.Penis.IsActive
		human.CustomizeAll(0)
		Return()
	+ "Clothes OFF"
		hadpenis = human.Penis.IsActive
		human.CustomizeAll(99)
		if (hadpenis == true)
			human.Customize("Penis", 1)
		else 
			human.Customize("Penis", 0)
		Return()
	+ MenuBack
		Return(2)
	+ MenuClose
stop