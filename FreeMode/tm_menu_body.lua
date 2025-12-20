-- TrueMoan v0.6 by illa3d
label TMMenuBody(human)
	+ "RESET values.." [gold]
		+ "Reset values?"
			Return()
		+ "Ok"
			EditResetValues()
			Return(2)
		+ "Cancel"
			Return(2)
	+ "Neck.. | " .. necksize [gold]
		+ "Neck >"
			necksize = EditUp(human, "Neck size", necksize, sizestep005, 2)
			Return()
		+ "< Neck"
			necksize = EditDown(human, "Neck size", necksize, sizestep005, -1)
			Return()
		+ "RESET | " .. necksize [gold]
			necksize = EditSet(human, "Neck size", 0)
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "Arms.. | T" .. forearmsize .. " | C" .. uperarmsize [gold]
		+ "Forearms >"
			forearmsize = EditUp(human, "Forearms size", forearmsize, sizestep005, 2)
			Return()
		+ "< Forearms"
			forearmsize = EditDown(human, "Forearms size", forearmsize, sizestep005, -0.5)
			Return()
		+ "RESET Forearms | " .. forearmsize [gold]
			forearmsize = EditSet(human, "Forearms size", 0)
			Return()
		+ "Upper arms >"
			uperarmsize = EditUp(human, "Upper arms size", uperarmsize, sizestep005, 2)
			Return()
		+ "< Upper arms"
			uperarmsize = EditDown(human, "Upper arms size", uperarmsize, sizestep005, -0.5)
			Return()
		+ "RESET Upper arms | " .. uperarmsize [gold]
			uperarmsize = EditSet(human, "Upper arms size", 0)
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "Legs.. | T" .. thighsize .. " | C" .. calfsize [gold]
		+ "Calf >"
			calfsize = EditUp(human, "Calf size", calfsize, sizestep005, 2)
			Return()
		+ "< Calf"
			calfsize = EditDown(human, "Calf size", calfsize, sizestep005, -0.5)
			Return()
		+ "RESET Calf | " .. calfsize [gold]
			calfsize = EditSet(human, "Calf size", 0)
			Return()
		+ "Thigh >"
			thighsize = EditUp(human, "Thigh size", thighsize, sizestep005, 2)
			Return()
		+ "< Thigh"
			thighsize = EditDown(human, "Thigh size", thighsize, sizestep005, -1)
			Return()
		+ "RESET Thigh | " .. thighsize [gold]
			thighsize = EditSet(human, "Thigh size", 0)
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "Waist.. | W" .. waistsize .. " | H" .. hipssize [gold]
		+ "Hips >"
			hipssize = EditUp(human, "Hips size", hipssize, sizestep01, 5)
			Return()
		+ "< Hips"
			hipssize = EditDown(human, "Hips size", hipssize, sizestep01, -2)
			Return()
		+ "RESET Hips | " .. hipssize [gold]
			hipssize = EditSet(human, "Hips size", 0)
			Return()
		+ "Waist >"
			waistsize = EditUp(human, "Waist size", waistsize, sizestep01, 5)
			Return()
		+ "< Waist"
			waistsize = EditDown(human, "Waist size", waistsize, sizestep01, -1)
			Return()
		+ "RESET Waist | " .. waistsize [gold]
			waistsize = EditSet(human, "Waist size", 0)
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "Ass.. | " .. asssize [gold]
		+ "Ass >"
			asssize = EditUp(human, "Ass size", asssize, sizestep01, 10)
			Return()
		+ "< Ass"
			asssize = EditDown(human, "Ass size", asssize, sizestep01, -1)
			Return()
		+ "RESET | " .. asssize [gold]
			asssize = EditSet(human, "Ass size", 0)
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ if human.m_isMale == false
		+ "Breasts.. | B" .. breastsize .. " | N" .. nipplesize [gold]
			+ "Nipples >"
				nipplesize = EditUp(human, "Nipples size", nipplesize, sizestep03, 10)
				Return()
			+ "< Nipples"
				nipplesize = EditDown(human, "Nipples size", nipplesize, sizestep03, -5)
				Return()
			+ "RESET Nipples | " .. nipplesize [gold]
				nipplesize = EditSet(human, "Nipples size", 0)
				Return()
			+ "Breasts >"
				breastsize = EditUp(human, "Breasts size", breastsize, sizestep01, 10)
				Return()
			+ "< Breasts"
				breastsize = EditDown(human, "Breasts size", breastsize, sizestep01, -2, breastsafemin)
				Return()
			+ "RESET Breasts | " .. breastsize [gold]
				breastsize = EditSet(human, "Breasts size", 0)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
	+ if human.Penis.IsActive
		+ "Penis.. | L" .. penislength .. " | S" .. penissize [gold]
			+ "Length >"
				penislength = EditUp(human, "Penis length", penislength, sizestep005, 4)
				Return()
			+ "< Length"
				penislength = EditDown(human, "Penis length", penislength, sizestep005, -0.7)
				Return()
			+ "RESET Length | " .. penislength [gold]
				penislength = EditSet(human, "Penis length", 0)
				Return()
			+ "Size >"
				penissize = EditUp(human, "Penis size", penissize, sizestep005, 4)
				Return()
			+ "< Size"
				penissize = EditDown(human, "Penis size", penissize, sizestep005, -0.7)
				Return()
			+ "RESET size | " .. penissize [gold]
				penissize = EditSet(human, "Penis size", 0)
				Return()
			+ "RESET Foreskin"
				human.Penis.m_penisSkinOut = 0
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
	+ "Body.. | B" .. bodysize .. " | M ".. musclesize [gold]
		+ "Muscle >"
			musclesize = EditUp(human, "Muscle tone", musclesize, sizestep01, 1)
			Return()
		+ "< Muscle"
			musclesize = EditDown(human, "Muscle tone", musclesize, sizestep01, -0.3)
			Return()
		+ "RESET Muscle | " .. musclesize [gold]
			musclesize = EditSet(human, "Muscle tone", 0)
			Return()
		+ "Body >"
			bodysize = EditUp(human, "Body size", bodysize, sizestep002, 1)
			Return()
		+ "< Body"
			bodysize = EditDown(human, "Body size", bodysize, sizestep002, -0.9)
			Return()
		+ "RESET Body | " .. bodysize [gold]
			bodysize = EditSet(human, "Body size", 0)
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "Apply values"
		EditApplyValues(human)
		Return()
	+ "Preset.." [gold]
		+ "Obese"
			EditPreset_Obese(human)
			Return()
		+ "Curvy"
			EditPreset_Curvy(human)
			Return()
		+ "Normal"
			EditPreset_Normal(human)
			Return()
		+ "Slim"
			EditPreset_Slim(human)
			Return()
		+ "Skinny"
			EditPreset_Skinny(human)
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "| BACK"
		Return(2)
	+ "| CLOSE"
stop