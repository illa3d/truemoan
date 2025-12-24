-- TrueMoan v1.0 by illa3d
TMEyesOpen = true

label TMMenuHeyHuman(human)
	+ "RESET ".. FBold(human.Name) [gold]
		HumanReset(human)
		Return()
	+ "Hands.." [gold]
		+ "(TODO) FaunaLabs"
			Return()
	+ "Eyes OPEN" [if not TMEyesOpen]
		TMEyesOpen = HumanEyesOpen(human, true)
		Return()
	+ "Eyes CLOSE" [if TMEyesOpen]
		TMEyesOpen = HumanEyesOpen(human, false)
		Return()
	+ "Look at me"
		HumanLookAtCamera(human)
		Return()
	+ "Face me"
		HumanLookAtCamera(human)
		HumanFaceAtCamera(human)
		Return()
	+ if human.m_isMale
		+ "Bottom time"
			HumanFemaleSet(human)
			Return(2)
	+ else
		+ "Penis ON" [if not human.Penis.IsActive]
			HumanPenis(human, true)
			Return(2)
		+ "Penis OFF" [if human.Penis.IsActive]
			HumanPenis(human, false)
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