-- TrueMoan v1.0 by illa3d
TMEyesOpen = true

label TMMenuHeyHuman(human)
	+ "RESET ALL" [gold]
		ResetHuman(human)
		Return()
	+ "Hands.." [gold]
		+ "(TODO) FaunaLabs"
			Return()
	+ "Eyes close" [if TMEyesOpen = true]
		TMEyesOpen = true
		human.Pose(EyesClose())
		Return()
	+ "Eyes open" [if TMEyesOpen = false]
		TMEyesOpen = false
		human.Pose(EyesOpen())
		Return()
	+ "Look at me"
		human.Pose(CameraLookAt())
		Return()
	+ "Face me"
		human.Pose(CameraLookAt())
		human.Pose(CameraFaceAt())
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