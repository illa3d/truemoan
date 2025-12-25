-- TrueMoan v1.2 by illa3d
TMEyesOpen = true

label TMMenuHeyHuman(human)
	+ "RESET ".. AccStr(human.Name)
		HumanReset(human)
		Return()
	+ "Hands.." [gold]
		+ "(TODO) FaunaLabs"
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "Eyes " .. AccStr("open")  [if not TMEyesOpen]
		TMEyesOpen = HumanEyesOpen(human, true)
		Return()
	+ "Eyes " .. AccStr("close") [if TMEyesOpen]
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
		+ "Penis " .. AccStr("on") [if not human.Penis.IsActive]
			HumanPenis(human, true)
			Return(2)
		+ "Penis " .. AccStr("off") [if human.Penis.IsActive]
			HumanPenis(human, false)
			Return(2)
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