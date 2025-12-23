-- TrueMoan v1.0 by illa3d
-- decimals
tmBdec = 3

label TMMenuBody(human)
	+ "Edit Safe | " .. BoolLabel(BodyEditSafe) [if BodyEditSafe == true]
		BodyEditSafe = false
		human "Warning: Game can crash for Breasts <-0.8 and BodySize <-0.9!\nMake sure you save before :)"
		Return()
	+ "Edit Safe | " .. BoolLabel(BodyEditSafe) .. "(can crash app)" [if BodyEditSafe == false]
		BodyEditSafe = true
		Return()
	+ "RESET Values"
		TMBodyEditResetValues()
		Return()
	+ "| Neck	| " .. ValueLabel1("N", tmNeckSize, tmBdec) [gold]
		+ "| Neck >"
			tmNeckSize = TMBodyEditUp(human, "Neck size", tmNeckSize, BodyStepB, 2)
			Return()
		+ "| < Neck"
			tmNeckSize = TMBodyEditDown(human, "Neck size", tmNeckSize, BodyStepB, -1)
			Return()
		+ "RESET Neck | " .. ValueLabel(tmNeckSize)
			tmNeckSize = TMBodyEditSet(human, "Neck size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "| Arms	| " .. ValueLabel2("U", tmUperArmsize, "F", tmForearmSize, tmBdec) [gold]
		+ "| Forearms >"
			tmForearmSize = TMBodyEditUp(human, "Forearms size", tmForearmSize, BodyStepB, 2)
			Return()
		+ "| < Forearms"
			tmForearmSize = TMBodyEditDown(human, "Forearms size", tmForearmSize, BodyStepB, -0.5)
			Return()
		+ "RESET Forearms | " .. ValueLabel(tmForearmSize, tmBdec)
			tmForearmSize = TMBodyEditSet(human, "Forearms size", 0)
			Return()
		+ "| Upper arms >"
			tmUperArmsize = TMBodyEditUp(human, "Upper arms size", tmUperArmsize, BodyStepB, 2)
			Return()
		+ "| < Upper arms"
			tmUperArmsize = TMBodyEditDown(human, "Upper arms size", tmUperArmsize, BodyStepB, -0.5)
			Return()
		+ "RESET Upper arms | " .. ValueLabel(tmUperArmsize, tmBdec)
			tmUperArmsize = TMBodyEditSet(human, "Upper arms size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "| Legs		| " .. ValueLabel2("T", tmThighSize, "C", tmCalfSize, tmBdec) [gold]
		+ "| Calf >"
			tmCalfSize = TMBodyEditUp(human, "Calf size", tmCalfSize, BodyStepB, 2)
			Return()
		+ "| < Calf"
			tmCalfSize = TMBodyEditDown(human, "Calf size", tmCalfSize, BodyStepB, -0.5)
			Return()
		+ "RESET Calf | " .. ValueLabel(tmCalfSize, tmBdec)
			tmCalfSize = TMBodyEditSet(human, "Calf size", 0)
			Return()
		+ "| Thigh >"
			tmThighSize = TMBodyEditUp(human, "Thigh size", tmThighSize, BodyStepB, 2)
			Return()
		+ "| < Thigh"
			tmThighSize = TMBodyEditDown(human, "Thigh size", tmThighSize, BodyStepB, -1)
			Return()
		+ "RESET Thigh | " .. ValueLabel(tmThighSize, tmBdec)
			tmThighSize = TMBodyEditSet(human, "Thigh size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "| Waist	| " .. ValueLabel2("W", tmWaistSize, "H", tmHipsSize, tmBdec) [gold]
		+ "| Hips >"
			tmHipsSize = TMBodyEditUp(human, "Hips size", tmHipsSize, BodyStepA, 5)
			Return()
		+ "| < Hips"
			tmHipsSize = TMBodyEditDown(human, "Hips size", tmHipsSize, BodyStepA, -2)
			Return()
		+ "RESET Hips | " .. ValueLabel(tmHipsSize, tmBdec)
			tmHipsSize = TMBodyEditSet(human, "Hips size", 0)
			Return()
		+ "| Waist >"
			tmWaistSize = TMBodyEditUp(human, "Waist size", tmWaistSize, BodyStepA, 5)
			Return()
		+ "| < Waist"
			tmWaistSize = TMBodyEditDown(human, "Waist size", tmWaistSize, BodyStepA, -1)
			Return()
		+ "RESET Waist | " .. ValueLabel(tmWaistSize, tmBdec)
			tmWaistSize = TMBodyEditSet(human, "Waist size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "| Ass		| " .. ValueLabel1("A", tmAssSize, tmBdec) [gold]
		+ "| Ass >"
			tmAssSize = TMBodyEditUp(human, "Ass size", tmAssSize, BodyStepB, 10)
			Return()
		+ "| < Ass"
			tmAssSize = TMBodyEditDown(human, "Ass size", tmAssSize, BodyStepB, -1)
			Return()
		+ "RESET Ass | " .. ValueLabel(tmAssSize, tmBdec)
			tmAssSize = TMBodyEditSet(human, "Ass size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ if human.m_isMale == false
		+ "| Breasts	| " .. ValueLabel2("B", tmBreastSize, "N", tmNipplesSize, tmBdec) [gold]
			+ "| Nipples >"
				nipplesize = TMBodyEditUp(human, "Nipples size", tmNipplesSize, BodyStepA, 10)
				Return()
			+ "| < Nipples"
				tmNipplesSize = TMBodyEditDown(human, "Nipples size", tmNipplesSize, BodyStepA, -5)
				Return()
			+ "RESET Nipples | " .. ValueLabel(tmNipplesSize, tmBdec)
				tmNipplesSize = TMBodyEditSet(human, "Nipples size", 0)
				Return()
			+ "| Breasts >"
				tmBreastSize = TMBodyEditUp(human, "Breasts size", tmBreastSize, BodyStepC, 10)
				Return()
			+ "| < Breasts"
				tmBreastSize = TMBodyEditDown(human, "Breasts size", tmBreastSize, BodyStepC, -2, BreastSafeMin)
				Return()
			+ "RESET Breasts | " .. ValueLabel(tmBreastSize, tmBdec)
				tmBreastSize = TMBodyEditSet(human, "Breasts size", 0)
				Return()
			+ MenuBack
				Return(2)
			+ MenuClose
	+ if human.Penis.IsActive
		+ "| Penis	| " .. ValueLabel2("S", tmPenisSize, "L", tmPenisLength, tmBdec) [gold]
			+ "| Length >"
				tmPenisLength = TMBodyEditUp(human, "Penis length", tmPenisLength, BodyStepB, 5)
				Return()
			+ "| < Length"
				tmPenisLength = TMBodyEditDown(human, "Penis length", tmPenisLength, BodyStepB, -0.7)
				Return()
			+ "RESET Length | " .. ValueLabel(tmPenisLength, tmBdec)
				tmPenisLength = TMBodyEditSet(human, "Penis length", 0)
				Return()
			+ "| Size >"
				tmPenisSize = TMBodyEditUp(human, "Penis size", tmPenisSize, BodyStepB, 20)
				Return()
			+ "| < Size"
				tmPenisSize = TMBodyEditDown(human, "Penis size", tmPenisSize, BodyStepB, -0.7)
				Return()
			+ "RESET Size | " .. ValueLabel(tmPenisSize, tmBdec)
				tmPenisSize = TMBodyEditSet(human, "Penis size", 0)
				Return()
			+ "RESET Foreskin"
				human.Penis.m_penisSkinOut = 0
				Return()
			+ MenuBack
				Return(2)
			+ MenuClose
	+ "| Body	| " .. ValueLabel2("B", tmBodySize, "M", tmMuscleSize, tmBdec) [gold]
		+ "| Muscle >"
			tmMuscleSize = TMBodyEditUp(human, "Muscle tone", tmMuscleSize, BodyStepA, 1)
			Return()
		+ "| < Muscle"
			tmMuscleSize = TMBodyEditDown(human, "Muscle tone", tmMuscleSize, BodyStepA, -0.3)
			Return()
		+ "RESET Muscle | " .. ValueLabel(tmMuscleSize, tmBdec)
			tmMuscleSize = TMBodyEditSet(human, "Muscle tone", 0)
			Return()
		+ "| Body >"
			tmBodySize = TMBodyEditUp(human, "Body size", tmBodySize, BodyStepC, 10)
			Return()
		+ "| < Body"
			tmBodySize = TMBodyEditDown(human, "Body size", tmBodySize, BodyStepC, -0.9)
			Return()
		+ "RESET Body | " .. ValueLabel(tmBodySize, tmBdec)
			tmBodySize = TMBodyEditSet(human, "Body size", 0)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Apply values" [if BodyEditSafe]
		TMBodyEditApplyValues(human)
		Return()
	+ "Apply values " .. WordLabel("(safe off)") [if not BodyEditSafe]
		TMBodyEditApplyValues(human)
		Return()
	+ "Body sizes.." [gold]
		TMMenuBodySize(human)
	+ "Body types.." [gold]
		TMMenuBodyType(human)
	+ "RESET Body"
		TMBEPreset_Reset(human)
		Return()
	+ MenuBack
		Return(2)
	+ MenuClose
stop