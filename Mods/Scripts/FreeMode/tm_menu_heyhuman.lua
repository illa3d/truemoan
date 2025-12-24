-- TrueMoan v1.0 by illa3d
TMEyesOpen = true

label TMMenuHeyHuman(human)
	+ "RESET ALL" [gold]
		HumanReset(human)
		Return()
	+ "Hands.." [gold]
		+ "(TODO) FaunaLabs"
			Return()
	+ "Eyes close" [if not TMEyesOpen]
		TMEyesOpen = true
		human.Pose(HumanEyesClose())
		Return()
	+ "Eyes open" [if TMEyesOpen]
		TMEyesOpen = false
		human.Pose(HumanEyesOpen())
		Return()
	+ "Look at me"
		human.Pose(HumanLookCamera())
		Return()
	+ "Face me"
		human.Pose(HumanLookCamera())
		human.Pose(HumanFaceCamera())
		Return()
	+ if human.m_isMale
		+ "Bottom time"
			HumanFemaleSet(human)
			Return(2)
	+ else
		+ "Penis Off" [if human.Penis.IsActive]
			HumanPenis(human, false)
			Return(2)
		+ "Penis On" [if not human.Penis.IsActive]
			HumanPenis(human, true)
			Return(2)
	+ "Clothes ON"
		HumanClothes(human, true)
		Return()
	+ "Clothes OFF"
		HumanClothes(human, false)	
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop