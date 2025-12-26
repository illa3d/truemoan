-- TrueMoan v1.2 by illa3d
TMEyesOpen = true

label TMMenuHeyHuman(human)
	+ "RESET ".. AccStr(human.Name)
		HumanReset(human)
		Return()
	+ if not human.m_isMale
		+ "Penis | " .. AccStr("OFF") [if not human.Penis.IsActive]
			HumanPenis(human, true)
			Return(2)
		+ "Penis | " .. AccStr("ON") [if human.Penis.IsActive]
			HumanPenis(human, false)
			Return(2)
	+ "Penetration | " .. AccStr("ON") [if not human.m_isMale]
		HumanMaleSet(human, true)
		Return()
	+ "Penetration | " .. AccStr("OFF") [if human.m_isMale]
		HumanMaleSet(human, false)
		Return()
	+ "Eyes | " .. AccStr("Closed")  [if not TMEyesOpen]
		TMEyesOpen = HumanEyesOpen(human, true)
		Return()
	+ "Eyes | " .. AccStr("Open") [if TMEyesOpen]
		TMEyesOpen = HumanEyesOpen(human, false)
		Return()
	+ "Look at me"
		HumanLookAtCamera(human)
		Return()
	+ "Face me"
		HumanLookAtCamera(human)
		HumanFaceAtCamera(human)
		Return()
	+ "Clothes " .. AccStr("on")
		HumanClothes(human, true)
		Return()
	+ "Clothes " .. AccStr("off")
		HumanClothes(human, false)	
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop