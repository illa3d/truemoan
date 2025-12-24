-- TrueMoan v1.0 by illa3d
-- decimals
tmBdec = 3

label TMMenuBody(human)
	+ "Edit Safe | " .. AccBool(TM_BodyEditSafe) [if TM_BodyEditSafe == true]
		TM_BodyEditSafe = false
		human "Warning: Game can crash for Breasts <-0.8 and BodySize <-0.9!\nMake sure you save before :)"
		Return()
	+ "Edit Safe | " .. AccBool(TM_BodyEditSafe) .. "(can crash app)" [if TM_BodyEditSafe == false]
		TM_BodyEditSafe = true
		Return()
	+ "RESET Values"
		TMBodyEditResetValues()
		Return()
	+ "| Neck	| " .. AccTextNum1("N", tmNeckSize, tmBdec) [gold]
		+ "| Neck >"
			tmNeckSize = TMBodyEditUp(human, "Neck size", tmNeckSize, TM_BodyStepB, 2)
			Return()
		+ "| < Neck"
			tmNeckSize = TMBodyEditDown(human, "Neck size", tmNeckSize, TM_BodyStepB, -1)
			Return()
		+ "RESET Neck | " .. AccNum(tmNeckSize)
			tmNeckSize = TMBodyEditSet(human, "Neck size", 0)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Arms	| " .. AccTextNum2("U", tmUperArmsize, "F", tmForearmSize, tmBdec) [gold]
		+ "| Forearms >"
			tmForearmSize = TMBodyEditUp(human, "Forearms size", tmForearmSize, TM_BodyStepB, 2)
			Return()
		+ "| < Forearms"
			tmForearmSize = TMBodyEditDown(human, "Forearms size", tmForearmSize, TM_BodyStepB, -0.5)
			Return()
		+ "RESET Forearms | " .. AccNum(tmForearmSize, tmBdec)
			tmForearmSize = TMBodyEditSet(human, "Forearms size", 0)
			Return()
		+ "| Upper arms >"
			tmUperArmsize = TMBodyEditUp(human, "Upper arms size", tmUperArmsize, TM_BodyStepB, 2)
			Return()
		+ "| < Upper arms"
			tmUperArmsize = TMBodyEditDown(human, "Upper arms size", tmUperArmsize, TM_BodyStepB, -0.5)
			Return()
		+ "RESET Upper arms | " .. AccNum(tmUperArmsize, tmBdec)
			tmUperArmsize = TMBodyEditSet(human, "Upper arms size", 0)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Legs		| " .. AccTextNum2("T", tmThighSize, "C", tmCalfSize, tmBdec) [gold]
		+ "| Calf >"
			tmCalfSize = TMBodyEditUp(human, "Calf size", tmCalfSize, TM_BodyStepB, 2)
			Return()
		+ "| < Calf"
			tmCalfSize = TMBodyEditDown(human, "Calf size", tmCalfSize, TM_BodyStepB, -0.5)
			Return()
		+ "RESET Calf | " .. AccNum(tmCalfSize, tmBdec)
			tmCalfSize = TMBodyEditSet(human, "Calf size", 0)
			Return()
		+ "| Thigh >"
			tmThighSize = TMBodyEditUp(human, "Thigh size", tmThighSize, TM_BodyStepB, 2)
			Return()
		+ "| < Thigh"
			tmThighSize = TMBodyEditDown(human, "Thigh size", tmThighSize, TM_BodyStepB, -1)
			Return()
		+ "RESET Thigh | " .. AccNum(tmThighSize, tmBdec)
			tmThighSize = TMBodyEditSet(human, "Thigh size", 0)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Waist	| " .. AccTextNum2("W", tmWaistSize, "H", tmHipsSize, tmBdec) [gold]
		+ "| Hips >"
			tmHipsSize = TMBodyEditUp(human, "Hips size", tmHipsSize, TM_BodyStepA, 5)
			Return()
		+ "| < Hips"
			tmHipsSize = TMBodyEditDown(human, "Hips size", tmHipsSize, TM_BodyStepA, -2)
			Return()
		+ "RESET Hips | " .. AccNum(tmHipsSize, tmBdec)
			tmHipsSize = TMBodyEditSet(human, "Hips size", 0)
			Return()
		+ "| Waist >"
			tmWaistSize = TMBodyEditUp(human, "Waist size", tmWaistSize, TM_BodyStepA, 5)
			Return()
		+ "| < Waist"
			tmWaistSize = TMBodyEditDown(human, "Waist size", tmWaistSize, TM_BodyStepA, -1)
			Return()
		+ "RESET Waist | " .. AccNum(tmWaistSize, tmBdec)
			tmWaistSize = TMBodyEditSet(human, "Waist size", 0)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Ass		| " .. AccTextNum1("A", tmAssSize, tmBdec) [gold]
		+ "| Ass >"
			tmAssSize = TMBodyEditUp(human, "Ass size", tmAssSize, TM_BodyStepB, 10)
			Return()
		+ "| < Ass"
			tmAssSize = TMBodyEditDown(human, "Ass size", tmAssSize, TM_BodyStepB, -1)
			Return()
		+ "RESET Ass | " .. AccNum(tmAssSize, tmBdec)
			tmAssSize = TMBodyEditSet(human, "Ass size", 0)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ if human.m_isMale == false
		+ "| Breasts	| " .. AccTextNum2("B", tmBreastSize, "N", tmNipplesSize, tmBdec) [gold]
			+ "| Nipples >"
				nipplesize = TMBodyEditUp(human, "Nipples size", tmNipplesSize, TM_BodyStepA, 10)
				Return()
			+ "| < Nipples"
				tmNipplesSize = TMBodyEditDown(human, "Nipples size", tmNipplesSize, TM_BodyStepA, -5)
				Return()
			+ "RESET Nipples | " .. AccNum(tmNipplesSize, tmBdec)
				tmNipplesSize = TMBodyEditSet(human, "Nipples size", 0)
				Return()
			+ "| Breasts >"
				tmBreastSize = TMBodyEditUp(human, "Breasts size", tmBreastSize, TM_BodyStepC, 10)
				Return()
			+ "| < Breasts"
				tmBreastSize = TMBodyEditDown(human, "Breasts size", tmBreastSize, TM_BodyStepC, -2, TM_BreastSafeMin)
				Return()
			+ "RESET Breasts | " .. AccNum(tmBreastSize, tmBdec)
				tmBreastSize = TMBodyEditSet(human, "Breasts size", 0)
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose
	+ if human.Penis.IsActive
		+ "| Penis	| " .. AccTextNum2("S", tmPenisSize, "L", tmPenisLength, tmBdec) [gold]
			+ "| Length >"
				tmPenisLength = TMBodyEditUp(human, "Penis length", tmPenisLength, TM_BodyStepB, 5)
				Return()
			+ "| < Length"
				tmPenisLength = TMBodyEditDown(human, "Penis length", tmPenisLength, TM_BodyStepB, -0.7)
				Return()
			+ "RESET Length | " .. AccNum(tmPenisLength, tmBdec)
				tmPenisLength = TMBodyEditSet(human, "Penis length", 0)
				Return()
			+ "| Size >"
				tmPenisSize = TMBodyEditUp(human, "Penis size", tmPenisSize, TM_BodyStepB, 20)
				Return()
			+ "| < Size"
				tmPenisSize = TMBodyEditDown(human, "Penis size", tmPenisSize, TM_BodyStepB, -0.7)
				Return()
			+ "RESET Size | " .. AccNum(tmPenisSize, tmBdec)
				tmPenisSize = TMBodyEditSet(human, "Penis size", 0)
				Return()
			+ "RESET Foreskin"
				human.Penis.m_penisSkinOut = 0
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose
	+ "| Body	| " .. AccTextNum2("B", tmBodySize, "M", tmMuscleSize, tmBdec) [gold]
		+ "| Muscle >"
			tmMuscleSize = TMBodyEditUp(human, "Muscle tone", tmMuscleSize, TM_BodyStepA, 1)
			Return()
		+ "| < Muscle"
			tmMuscleSize = TMBodyEditDown(human, "Muscle tone", tmMuscleSize, TM_BodyStepA, -0.3)
			Return()
		+ "RESET Muscle | " .. AccNum(tmMuscleSize, tmBdec)
			tmMuscleSize = TMBodyEditSet(human, "Muscle tone", 0)
			Return()
		+ "| Body >"
			tmBodySize = TMBodyEditUp(human, "Body size", tmBodySize, TM_BodyStepC, 10)
			Return()
		+ "| < Body"
			tmBodySize = TMBodyEditDown(human, "Body size", tmBodySize, TM_BodyStepC, -0.9)
			Return()
		+ "RESET Body | " .. AccNum(tmBodySize, tmBdec)
			tmBodySize = TMBodyEditSet(human, "Body size", 0)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "Apply values" [if TM_BodyEditSafe]
		TMBodyEditApplyValues(human)
		Return()
	+ "Apply values " .. AccStr("(safe off)") [if not TM_BodyEditSafe]
		TMBodyEditApplyValues(human)
		Return()
	+ "Body sizes.." [gold]
		TMMenuBodySize(human)
	+ "Body types.." [gold]
		TMMenuBodyType(human)
	+ "RESET Body"
		TMBEPreset_Reset(human)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop