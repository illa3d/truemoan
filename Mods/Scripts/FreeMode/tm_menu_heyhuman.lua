-- TrueMoan v1.3 by illa3d
TMEyesOpen = true

label TMMenuHeyHuman(human)
	+ "DELETE ".. AccStr(human.Name)
		+ AccStr("may crash the game If")
			Return()
		+ AccStr("actor is interacting!")
			Return()
		+ "Delete " .. AccStr(human.Name) .. "?"
			Return()
		+ TM_MenuOk
			HumanRemove(human)
			Return(2)
		+ TM_MenuCancel
			Return(2)
		Return()
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
	+ "Look at »" [gold]
		+ "• Look at " .. AccStr("cam")
			HumanLookAt(human, CameraPos())
			Return(2)
		+ "• Face " .. AccStr("cam")
			HumanLookAt(human, CameraPos())
			HumanFaceAt(human, CameraPos())
			Return(2)
		+ "Eyes | " .. AccStr("Closed")  [if not TMEyesOpen]
			TMEyesOpen = HumanEyesOpen(human, true)
			Return(2)
		+ "Eyes | " .. AccStr("Open") [if TMEyesOpen]
			TMEyesOpen = HumanEyesOpen(human, false)
			Return(2)
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "Clothes From »" [gold]
		TMMenuItems_Clothes(human, TM_Clothes_Custom)
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