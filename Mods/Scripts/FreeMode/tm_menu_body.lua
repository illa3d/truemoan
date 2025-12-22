-- TrueMoan v0.9 by illa3d
-- decimals
bdec = 3

label TMMenuBody(human)
	+ "Edit Safe | ON" [if BodyEditSafe == true]
		BodyEditSafe = false
		human "Warning: Game can crash for Breasts <-0.8 and BodySize <-0.9!\nMake sure you save before :)"
		Return()
	+ "Edit Safe | OFF (can crash app)" [if BodyEditSafe == false]
		BodyEditSafe = true
		Return()
	+ "RESET values.." [gold]
		+ "Reset values?"
			Return()
		+ "Ok"
			BodyEditResetValues()
			Return(2)
		+ "Cancel"
			Return(2)
	+ " Neck | " .. NumLabel(necksize, bdec) [gold]
		+ "Neck >"
			necksize = BodyEditUp(human, "Neck size", necksize, BodyStepB, 2)
			Return()
		+ "< Neck"
			necksize = BodyEditDown(human, "Neck size", necksize, BodyStepB, -1)
			Return()
		+ "RESET | " .. necksize [gold]
			necksize = BodyEditSet(human, "Neck size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ " Arms | F" .. NumLabel(forearmsize, bdec) .. " | U" .. NumLabel(uperarmsize, bdec) [gold]
		+ "Forearms >"
			forearmsize = BodyEditUp(human, "Forearms size", forearmsize, BodyStepB, 2)
			Return()
		+ "< Forearms"
			forearmsize = BodyEditDown(human, "Forearms size", forearmsize, BodyStepB, -0.5)
			Return()
		+ "RESET Forearms | " .. NumLabel(forearmsize, bdec) [gold]
			forearmsize = BodyEditSet(human, "Forearms size", 0)
			Return()
		+ "Upper arms >"
			uperarmsize = BodyEditUp(human, "Upper arms size", uperarmsize, BodyStepB, 2)
			Return()
		+ "< Upper arms"
			uperarmsize = BodyEditDown(human, "Upper arms size", uperarmsize, BodyStepB, -0.5)
			Return()
		+ "RESET Upper arms | " .. NumLabel(uperarmsize, bdec) [gold]
			uperarmsize = BodyEditSet(human, "Upper arms size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ " Legs | T" .. NumLabel(thighsize, bdec) .. " | C" .. NumLabel(calfsize, bdec) [gold]
		+ "Calf >"
			calfsize = BodyEditUp(human, "Calf size", calfsize, BodyStepB, 2)
			Return()
		+ "< Calf"
			calfsize = BodyEditDown(human, "Calf size", calfsize, BodyStepB, -0.5)
			Return()
		+ "RESET Calf | " .. NumLabel(calfsize, bdec) [gold]
			calfsize = BodyEditSet(human, "Calf size", 0)
			Return()
		+ "Thigh >"
			thighsize = BodyEditUp(human, "Thigh size", thighsize, BodyStepB, 2)
			Return()
		+ "< Thigh"
			thighsize = BodyEditDown(human, "Thigh size", thighsize, BodyStepB, -1)
			Return()
		+ "RESET Thigh | " .. NumLabel(thighsize, bdec) [gold]
			thighsize = BodyEditSet(human, "Thigh size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ " Waist | W" .. NumLabel(waistsize, bdec) .. " | H" .. NumLabel(hipssize, bdec) [gold]
		+ "Hips >"
			hipssize = BodyEditUp(human, "Hips size", hipssize, BodyStepA, 5)
			Return()
		+ "< Hips"
			hipssize = BodyEditDown(human, "Hips size", hipssize, BodyStepA, -2)
			Return()
		+ "RESET Hips | " .. NumLabel(hipssize, bdec) [gold]
			hipssize = BodyEditSet(human, "Hips size", 0)
			Return()
		+ "Waist >"
			waistsize = BodyEditUp(human, "Waist size", waistsize, BodyStepA, 5)
			Return()
		+ "< Waist"
			waistsize = BodyEditDown(human, "Waist size", waistsize, BodyStepA, -1)
			Return()
		+ "RESET Waist | " .. NumLabel(waistsize, bdec) [gold]
			waistsize = BodyEditSet(human, "Waist size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ " Ass | " .. NumLabel(asssize, bdec) [gold]
		+ "Ass >"
			asssize = BodyEditUp(human, "Ass size", asssize, BodyStepB, 10)
			Return()
		+ "< Ass"
			asssize = BodyEditDown(human, "Ass size", asssize, BodyStepB, -1)
			Return()
		+ "RESET | " .. NumLabel(asssize, bdec) [gold]
			asssize = BodyEditSet(human, "Ass size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ if human.m_isMale == false
		+ " Breasts | B" .. NumLabel(breastsize, bdec) .. " | N" .. NumLabel(nipplesize, bdec) [gold]
			+ "Nipples >"
				nipplesize = BodyEditUp(human, "Nipples size", nipplesize, BodyStepA, 10)
				Return()
			+ "< Nipples"
				nipplesize = BodyEditDown(human, "Nipples size", nipplesize, BodyStepA, -5)
				Return()
			+ "RESET Nipples | " .. NumLabel(nipplesize, bdec) [gold]
				nipplesize = BodyEditSet(human, "Nipples size", 0)
				Return()
			+ "Breasts >"
				breastsize = BodyEditUp(human, "Breasts size", breastsize, BodyStepC, 10)
				Return()
			+ "< Breasts"
				breastsize = BodyEditDown(human, "Breasts size", breastsize, BodyStepC, -2, BreastSafeMin)
				Return()
			+ "RESET Breasts | " .. NumLabel(breastsize, bdec) [gold]
				breastsize = BodyEditSet(human, "Breasts size", 0)
				Return()
			+ MenuBack
				Return(2)
			+ MenuClose
	+ if human.Penis.IsActive
		+ " Penis | L" .. NumLabel(penislength, bdec) .. " | S" .. NumLabel(penissize, bdec) [gold]
			+ "Length >"
				penislength = BodyEditUp(human, "Penis length", penislength, BodyStepB, 5)
				Return()
			+ "< Length"
				penislength = BodyEditDown(human, "Penis length", penislength, BodyStepB, -0.7)
				Return()
			+ "RESET Length | " .. NumLabel(penislength, bdec) [gold]
				penislength = BodyEditSet(human, "Penis length", 0)
				Return()
			+ "Size >"
				penissize = BodyEditUp(human, "Penis size", penissize, BodyStepB, 10)
				Return()
			+ "< Size"
				penissize = BodyEditDown(human, "Penis size", penissize, BodyStepB, -0.7)
				Return()
			+ "RESET size | " .. NumLabel(penissize, bdec) [gold]
				penissize = BodyEditSet(human, "Penis size", 0)
				Return()
			+ "RESET Foreskin"
				human.Penis.m_penisSkinOut = 0
				Return()
			+ MenuBack
				Return(2)
			+ MenuClose
	+ " Body | B" .. NumLabel(bodysize, bdec) .. " | M".. NumLabel(musclesize, bdec) [gold]
		+ "Muscle >"
			musclesize = BodyEditUp(human, "Muscle tone", musclesize, BodyStepA, 1)
			Return()
		+ "< Muscle"
			musclesize = BodyEditDown(human, "Muscle tone", musclesize, BodyStepA, -0.3)
			Return()
		+ "RESET Muscle | " .. NumLabel(musclesize, bdec) [gold]
			musclesize = BodyEditSet(human, "Muscle tone", 0)
			Return()
		+ "Body >"
			bodysize = BodyEditUp(human, "Body size", bodysize, BodyStepC, 10)
			Return()
		+ "< Body"
			bodysize = BodyEditDown(human, "Body size", bodysize, BodyStepC, -0.9)
			Return()
		+ "RESET Body | " .. NumLabel(bodysize, bdec) [gold]
			bodysize = BodyEditSet(human, "Body size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Size Preset.." [gold]
		TMMenuBodySize(human)
	+ "Type Preset.." [gold]
		TMMenuBodyType(human)
	+ "Apply values" [if BodyEditSafe]
		BodyEditApplyValues(human)
		Return()
	+ "Apply values (safe off!)" [if not BodyEditSafe]
		BodyEditApplyValues(human)
		Return()
	+ MenuBack
		Return(2)
	+ MenuClose
stop