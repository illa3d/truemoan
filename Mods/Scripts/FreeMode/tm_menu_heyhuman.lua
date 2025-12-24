-- TrueMoan v1.0 by illa3d
label TMMenuHeyHuman(human)
	+ "RESET ALL" [gold]
		ResetHuman(human)
		Return()
	+ "Hands.." [gold]
		+ "(TODO) FaunaLabs"
			Return()
	+ "Close eyes"
		human.Pose(EyesClose())
		Return()
	+ "Look at me"
		human.Pose(LookAtCamera())
		Return()
	+ "Face me"
		human.Pose(LookAtCamera())
		human.Pose(FaceAtCamera())
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
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop