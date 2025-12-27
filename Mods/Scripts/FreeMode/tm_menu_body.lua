-- TrueMoan v1.3 by illa3d
-- Code in: tm_bodyedit.lua
-- decimals
tmBdec = 3

label TMMenuBody(human)
	+ "Edit safe | " .. AccBool(TM_BodyEditSafe) [if TM_BodyEditSafe]
		TM_BodyEditSafe = false
		human "Warning: Game can crash for Breasts <-0.8 and BodySize <-0.9!\nMake sure you save before :)"
		Return()
	+ "Edit safe | " .. AccBool(TM_BodyEditSafe) .. "(can crash app)" [if not TM_BodyEditSafe]
		TM_BodyEditSafe = true
		Return()
	+ "RESET Values"
		TMBodyEditResetValues()
		Return()
	+ "| Neck	| " .. AccTextNum1("N", tmNeckSize, tmBdec) [gold]
		+ "| > Neck"
			tmNeckSize = TMBodyEditUp(human, TMBE_Neck, tmNeckSize, TM_BodyStepB, 2)
			Return()
		+ "| < Neck"
			tmNeckSize = TMBodyEditDown(human, TMBE_Neck, tmNeckSize, TM_BodyStepB, -1)
			Return()
		+ "RESET Neck | " .. AccNum(tmNeckSize)
			tmNeckSize = TMBodyEdit(human, TMBE_Neck, 0)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Arms	| " .. AccTextNum2("U", tmUperArmsize, "F", tmForearmSize, tmBdec) [gold]
		+ "| > Upper arms"
			tmUperArmsize = TMBodyEditUp(human, TMBE_Upperarms, tmUperArmsize, TM_BodyStepB, 2)
			Return()
		+ "| < Upper arms"
			tmUperArmsize = TMBodyEditDown(human, TMBE_Upperarms, tmUperArmsize, TM_BodyStepB, -0.5)
			Return()
		+ "RESET Upper arms | " .. AccNum(tmUperArmsize, tmBdec)
			tmUperArmsize = TMBodyEdit(human, TMBE_Upperarms, 0)
			Return()
		+ "| > Forearms"
			tmForearmSize = TMBodyEditUp(human, TMBE_Forearms, tmForearmSize, TM_BodyStepB, 2)
			Return()
		+ "| < Forearms"
			tmForearmSize = TMBodyEditDown(human, TMBE_Forearms, tmForearmSize, TM_BodyStepB, -0.5)
			Return()
		+ "RESET Forearms | " .. AccNum(tmForearmSize, tmBdec)
			tmForearmSize = TMBodyEdit(human, TMBE_Forearms, 0)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Legs		| " .. AccTextNum2("T", tmThighSize, "C", tmCalfSize, tmBdec) [gold]
		+ "| > Thigh"
			tmThighSize = TMBodyEditUp(human, TMBE_Thigh, tmThighSize, TM_BodyStepB, 2)
			Return()
		+ "| < Thigh"
			tmThighSize = TMBodyEditDown(human, TMBE_Thigh, tmThighSize, TM_BodyStepB, -1)
			Return()
		+ "RESET Thigh | " .. AccNum(tmThighSize, tmBdec)
			tmThighSize = TMBodyEdit(human, TMBE_Thigh, 0)
			Return()
		+ "| > Calf"
			tmCalfSize = TMBodyEditUp(human, TMBE_Calf, tmCalfSize, TM_BodyStepB, 2)
			Return()
		+ "| < Calf"
			tmCalfSize = TMBodyEditDown(human, TMBE_Calf, tmCalfSize, TM_BodyStepB, -0.5)
			Return()
		+ "RESET Calf | " .. AccNum(tmCalfSize, tmBdec)
			tmCalfSize = TMBodyEdit(human, TMBE_Calf, 0)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Waist	| " .. AccTextNum2("W", tmWaistSize, "H", tmHipsSize, tmBdec) [gold]
		+ "| > Waist"
			tmWaistSize = TMBodyEditUp(human, TMBE_Waist, tmWaistSize, TM_BodyStepA, 5)
			Return()
		+ "| < Waist"
			tmWaistSize = TMBodyEditDown(human, TMBE_Waist, tmWaistSize, TM_BodyStepA, -1)
			Return()
		+ "RESET Waist | " .. AccNum(tmWaistSize, tmBdec)
			tmWaistSize = TMBodyEdit(human, TMBE_Waist, 0)
			Return()
		+ "| > Hips"
			tmHipsSize = TMBodyEditUp(human, TMBE_Hips, tmHipsSize, TM_BodyStepA, 5)
			Return()
		+ "| < Hips"
			tmHipsSize = TMBodyEditDown(human, TMBE_Hips, tmHipsSize, TM_BodyStepA, -2)
			Return()
		+ "RESET Hips | " .. AccNum(tmHipsSize, tmBdec)
			tmHipsSize = TMBodyEdit(human, TMBE_Hips, 0)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Ass		| " .. AccTextNum1("A", tmAssSize, tmBdec) [gold]
		+ "| > Ass"
			tmAssSize = TMBodyEditUp(human, TMBE_Ass, tmAssSize, TM_BodyStepB, 10)
			Return()
		+ "| < Ass"
			tmAssSize = TMBodyEditDown(human, TMBE_Ass, tmAssSize, TM_BodyStepB, -1)
			Return()
		+ "RESET Ass | " .. AccNum(tmAssSize, tmBdec)
			tmAssSize = TMBodyEdit(human, TMBE_Ass, 0)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ if not human.m_isMale
		+ "| Breasts	| " .. AccTextNum2("B", tmBreastSize, "N", tmNipplesSize, tmBdec) [gold]
			+ "| > Breasts"
				tmBreastSize = TMBodyEditUp(human, TMBE_Breasts, tmBreastSize, TM_BodyStepC, 10)
				Return()
			+ "| < Breasts"
				tmBreastSize = TMBodyEditDown(human, TMBE_Breasts, tmBreastSize, TM_BodyStepC, -2, TM_BreastSafeMin)
				Return()
			+ "RESET Breasts | " .. AccNum(tmBreastSize, tmBdec)
				tmBreastSize = TMBodyEdit(human, TMBE_Breasts, 0)
				Return()
			+ "| > Nipples"
				tmNipplesSize = TMBodyEditUp(human, TMBE_Nipples, tmNipplesSize, TM_BodyStepA, 10)
				Return()
			+ "| < Nipples"
				tmNipplesSize = TMBodyEditDown(human, TMBE_Nipples, tmNipplesSize, TM_BodyStepA, -5)
				Return()
			+ "RESET Nipples | " .. AccNum(tmNipplesSize, tmBdec)
				tmNipplesSize = TMBodyEdit(human, TMBE_Nipples, 0)
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose
	+ if human.Penis.IsActive
		+ "| Penis	| " .. AccTextNum2("S", tmPenisSize, "L", tmPenisLength, tmBdec) [gold]
			+ "| > Size"
				tmPenisSize = TMBodyEditUp(human, TMBE_PenisSize, tmPenisSize, TM_BodyStepB, 20)
				Return()
			+ "| < Size"
				tmPenisSize = TMBodyEditDown(human, TMBE_PenisSize, tmPenisSize, TM_BodyStepB, -0.7)
				Return()
			+ "RESET Size | " .. AccNum(tmPenisSize, tmBdec)
				tmPenisSize = TMBodyEdit(human, TMBE_PenisSize, 0)
				Return()
			+ "| > Length"
				tmPenisLength = TMBodyEditUp(human, TMBE_PenisLength, tmPenisLength, TM_BodyStepB, 5)
				Return()
			+ "| < Length"
				tmPenisLength = TMBodyEditDown(human, TMBE_PenisLength, tmPenisLength, TM_BodyStepB, -0.7)
				Return()
			+ "RESET Length | " .. AccNum(tmPenisLength, tmBdec)
				tmPenisLength = TMBodyEdit(human, TMBE_PenisLength, 0)
				Return()
			+ "RESET Foreskin"
				human.Penis.m_penisSkinOut = 0
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose
	+ "| Body	| " .. AccTextNum2("B", tmBodySize, "M", tmMuscleSize, tmBdec) [gold]
		+ "| > Body"
			tmBodySize = TMBodyEditUp(human, TMBE_Body, tmBodySize, TM_BodyStepC, 10)
			Return()
		+ "| < Body"
			tmBodySize = TMBodyEditDown(human, TMBE_Body, tmBodySize, TM_BodyStepC, -0.9)
			Return()
		+ "RESET Body | " .. AccNum(tmBodySize, tmBdec)
			tmBodySize = TMBodyEdit(human, TMBE_Body, 0)
			Return()
		+ "| > Muscle"
			tmMuscleSize = TMBodyEditUp(human, TMBE_Muscle, tmMuscleSize, TM_BodyStepA, 1)
			Return()
		+ "| < Muscle"
			tmMuscleSize = TMBodyEditDown(human, TMBE_Muscle, tmMuscleSize, TM_BodyStepA, -0.3)
			Return()
		+ "RESET Muscle | " .. AccNum(tmMuscleSize, tmBdec)
			tmMuscleSize = TMBodyEdit(human, TMBE_Muscle, 0)
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