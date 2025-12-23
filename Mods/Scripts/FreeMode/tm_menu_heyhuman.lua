-- TrueMoan v1.0 by illa3d
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
	+ "RESET ALL" [gold]
		ResetHuman(human)
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
	+ if human.m_isMale
		+ "Bottom time"
			SetMaleBottomable(human)
			Return(2)
	+ else
		+ "Penis Off" [if human.Penis.IsActive]
			ShowPenis(human, false)
			Return(2)
		+ "Penis On" [if not human.Penis.IsActive]
			ShowPenis(human, true)
			Return(2)
	+ "Clothes ON"
		ShowClothes(human, true)
		Return()
	+ "Clothes OFF"
		ShowClothes(human, false)	
		Return()
	+ MenuBack
		Return(2)
	+ MenuClose
stop