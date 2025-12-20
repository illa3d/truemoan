-- TrueMoan v0.7 by illa3d
label TMMenuBody(human)
	+ "RESET values.." [gold]
		+ "Reset values?"
			Return()
		+ "Ok"
			BodyEditResetValues()
			Return(2)
		+ "Cancel"
			Return(2)
	+ "Neck.. | " .. necksize [gold]
		+ "Neck >"
			necksize = BodyEditUp(human, "Neck size", necksize, sizestep005, 2)
			Return()
		+ "< Neck"
			necksize = BodyEditDown(human, "Neck size", necksize, sizestep005, -1)
			Return()
		+ "RESET | " .. necksize [gold]
			necksize = BodyEditSet(human, "Neck size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Arms.. | T" .. forearmsize .. " | C" .. uperarmsize [gold]
		+ "Forearms >"
			forearmsize = BodyEditUp(human, "Forearms size", forearmsize, sizestep005, 2)
			Return()
		+ "< Forearms"
			forearmsize = BodyEditDown(human, "Forearms size", forearmsize, sizestep005, -0.5)
			Return()
		+ "RESET Forearms | " .. forearmsize [gold]
			forearmsize = BodyEditSet(human, "Forearms size", 0)
			Return()
		+ "Upper arms >"
			uperarmsize = BodyEditUp(human, "Upper arms size", uperarmsize, sizestep005, 2)
			Return()
		+ "< Upper arms"
			uperarmsize = BodyEditDown(human, "Upper arms size", uperarmsize, sizestep005, -0.5)
			Return()
		+ "RESET Upper arms | " .. uperarmsize [gold]
			uperarmsize = BodyEditSet(human, "Upper arms size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Legs.. | T" .. thighsize .. " | C" .. calfsize [gold]
		+ "Calf >"
			calfsize = BodyEditUp(human, "Calf size", calfsize, sizestep005, 2)
			Return()
		+ "< Calf"
			calfsize = BodyEditDown(human, "Calf size", calfsize, sizestep005, -0.5)
			Return()
		+ "RESET Calf | " .. calfsize [gold]
			calfsize = BodyEditSet(human, "Calf size", 0)
			Return()
		+ "Thigh >"
			thighsize = BodyEditUp(human, "Thigh size", thighsize, sizestep005, 2)
			Return()
		+ "< Thigh"
			thighsize = BodyEditDown(human, "Thigh size", thighsize, sizestep005, -1)
			Return()
		+ "RESET Thigh | " .. thighsize [gold]
			thighsize = BodyEditSet(human, "Thigh size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Waist.. | W" .. waistsize .. " | H" .. hipssize [gold]
		+ "Hips >"
			hipssize = BodyEditUp(human, "Hips size", hipssize, sizestep01, 5)
			Return()
		+ "< Hips"
			hipssize = BodyEditDown(human, "Hips size", hipssize, sizestep01, -2)
			Return()
		+ "RESET Hips | " .. hipssize [gold]
			hipssize = BodyEditSet(human, "Hips size", 0)
			Return()
		+ "Waist >"
			waistsize = BodyEditUp(human, "Waist size", waistsize, sizestep01, 5)
			Return()
		+ "< Waist"
			waistsize = BodyEditDown(human, "Waist size", waistsize, sizestep01, -1)
			Return()
		+ "RESET Waist | " .. waistsize [gold]
			waistsize = BodyEditSet(human, "Waist size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Ass.. | " .. asssize [gold]
		+ "Ass >"
			asssize = BodyEditUp(human, "Ass size", asssize, sizestep01, 10)
			Return()
		+ "< Ass"
			asssize = BodyEditDown(human, "Ass size", asssize, sizestep01, -1)
			Return()
		+ "RESET | " .. asssize [gold]
			asssize = BodyEditSet(human, "Ass size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ if human.m_isMale == false
		+ "Breasts.. | B" .. breastsize .. " | N" .. nipplesize [gold]
			+ "Nipples >"
				nipplesize = BodyEditUp(human, "Nipples size", nipplesize, sizestep03, 10)
				Return()
			+ "< Nipples"
				nipplesize = BodyEditDown(human, "Nipples size", nipplesize, sizestep03, -5)
				Return()
			+ "RESET Nipples | " .. nipplesize [gold]
				nipplesize = BodyEditSet(human, "Nipples size", 0)
				Return()
			+ "Breasts >"
				breastsize = BodyEditUp(human, "Breasts size", breastsize, sizestep01, 10)
				Return()
			+ "< Breasts"
				breastsize = BodyEditDown(human, "Breasts size", breastsize, sizestep01, -2, breastsafemin)
				Return()
			+ "RESET Breasts | " .. breastsize [gold]
				breastsize = BodyEditSet(human, "Breasts size", 0)
				Return()
			+ MenuBack
				Return(2)
			+ MenuClose
	+ if human.Penis.IsActive
		+ "Penis.. | L" .. penislength .. " | S" .. penissize [gold]
			+ "Length >"
				penislength = BodyEditUp(human, "Penis length", penislength, sizestep005, 4)
				Return()
			+ "< Length"
				penislength = BodyEditDown(human, "Penis length", penislength, sizestep005, -0.7)
				Return()
			+ "RESET Length | " .. penislength [gold]
				penislength = BodyEditSet(human, "Penis length", 0)
				Return()
			+ "Size >"
				penissize = BodyEditUp(human, "Penis size", penissize, sizestep005, 4)
				Return()
			+ "< Size"
				penissize = BodyEditDown(human, "Penis size", penissize, sizestep005, -0.7)
				Return()
			+ "RESET size | " .. penissize [gold]
				penissize = BodyEditSet(human, "Penis size", 0)
				Return()
			+ "RESET Foreskin"
				human.Penis.m_penisSkinOut = 0
				Return()
			+ MenuBack
				Return(2)
			+ MenuClose
	+ "Body.. | B" .. bodysize .. " | M ".. musclesize [gold]
		+ "Muscle >"
			musclesize = BodyEditUp(human, "Muscle tone", musclesize, sizestep01, 1)
			Return()
		+ "< Muscle"
			musclesize = BodyEditDown(human, "Muscle tone", musclesize, sizestep01, -0.3)
			Return()
		+ "RESET Muscle | " .. musclesize [gold]
			musclesize = BodyEditSet(human, "Muscle tone", 0)
			Return()
		+ "Body >"
			bodysize = BodyEditUp(human, "Body size", bodysize, sizestep002, 1)
			Return()
		+ "< Body"
			bodysize = BodyEditDown(human, "Body size", bodysize, sizestep002, -0.9)
			Return()
		+ "RESET Body | " .. bodysize [gold]
			bodysize = BodyEditSet(human, "Body size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Apply values"
		BodyEditApplyValues(human)
		Return()
	+ "Preset.." [gold]
		TMMenuBodyPreset(human)
	+ MenuBack
		Return(2)
	+ MenuClose
stop