-- TrueMoan v2.0 by illa3d
-- Code in: tm_bodyedit.lua
-- Body edit decimals
tmBdec = 2

label TMMenuBody(human)
	+ "Edit safe | " .. AccBool(TM_BodyEditSafe) .. (TM_BodyEditSafe and "" or "(can crash app)")
		TM_BodyEditSafe = not TM_BodyEditSafe
		Return()
	+ "Clear | "  .. AccStr(TMBodyValueCopyName) [if TMBodyHasCopy()]
		TMBodyCopyClear()
		Return()
	+ "Copy | "  .. AccStr(human.Name)
		TMBodyCopy(human)
		Return()
	+ "| Neck »	|" .. AccTextNum1("N", TMBodyUI(TMBody.Neck), tmBdec) [gold]
		+ TM_UP.."Neck"
			TMBodyEdit_Up(human, TMBody.Neck, TM_BodyStepB)
			Return()
		+ TM_DN.."Neck"
			TMBodyEdit_Down(human, TMBody.Neck, TM_BodyStepB)
			Return()
		+ "RESET Neck | " .. AccNum(TMBodyUI(TMBody.Neck), tmBdec)
			TMBodyEdit(human, TMBody.Neck, TMBD_BodyDefault)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Arms »	|" .. AccTextNum2("U", TMBodyUI(TMBody.UpperArms), "F", TMBodyUI(TMBody.Forearms), tmBdec) [gold]
		+ TM_UP.."Upper arms"
			TMBodyEdit_Up(human, TMBody.UpperArms, TM_BodyStepB)
			Return()
		+ TM_DN.."Upper arms"
			TMBodyEdit_Down(human, TMBody.UpperArms, TM_BodyStepB)
			Return()
		+ "RESET Upper arms | " .. AccNum(TMBodyUI(TMBody.UpperArms), tmBdec)
			TMBodyEdit(human, TMBody.UpperArms, TMBD_BodyDefault)
			Return()
		+ TM_UP.."Forearms"
			TMBodyEdit_Up(human, TMBody.Forearms, TM_BodyStepB)
			Return()
		+ TM_DN.."Forearms"
			TMBodyEdit_Down(human, TMBody.Forearms, TM_BodyStepB)
			Return()
		+ "RESET Forearms | " .. AccNum(TMBodyUI(TMBody.Forearms), tmBdec)
			TMBodyEdit(human, TMBody.Forearms, TMBD_BodyDefault)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Legs »	|" .. AccTextNum2("T", TMBodyUI(TMBody.Thigh), "C", TMBodyUI(TMBody.Calf), tmBdec) [gold]
		+ TM_UP.."Thigh"
			TMBodyEdit_Up(human, TMBody.Thigh, TM_BodyStepB)
			Return()
		+ TM_DN.."Thigh"
			TMBodyEdit_Down(human, TMBody.Thigh, TM_BodyStepB)
			Return()
		+ "RESET Thigh | " .. AccNum(TMBodyUI(TMBody.Thigh), tmBdec)
			TMBodyEdit(human, TMBody.Thigh, TMBD_BodyDefault)
			Return()
		+ TM_UP.."Calf"
			TMBodyEdit_Up(human, TMBody.Calf, TM_BodyStepB)
			Return()
		+ TM_DN.."Calf"
			TMBodyEdit_Down(human, TMBody.Calf, TM_BodyStepB)
			Return()
		+ "RESET Calf | " .. AccNum(TMBodyUI(TMBody.Calf), tmBdec)
			TMBodyEdit(human, TMBody.Calf, TMBD_BodyDefault)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Waist »	|" .. AccTextNum2("W", TMBodyUI(TMBody.Waist), "H", TMBodyUI(TMBody.Hips), tmBdec) [gold]
		+ TM_UP.."Waist"
			TMBodyEdit_Up(human, TMBody.Waist, TM_BodyStepA)
			Return()
		+ TM_DN.."Waist"
			TMBodyEdit_Down(human, TMBody.Waist, TM_BodyStepA)
			Return()
		+ "RESET Waist | " .. AccNum(TMBodyUI(TMBody.Waist), tmBdec)
			TMBodyEdit(human, TMBody.Waist, TMBD_BodyDefault)
			Return()
		+ TM_UP.."Hips"
			TMBodyEdit_Up(human, TMBody.Hips, TM_BodyStepA)
			Return()
		+ TM_DN.."Hips"
			TMBodyEdit_Down(human, TMBody.Hips, TM_BodyStepA)
			Return()
		+ "RESET Hips | " .. AccNum(TMBodyUI(TMBody.Hips), tmBdec)
			TMBodyEdit(human, TMBody.Hips, TMBD_BodyDefault)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Ass »	|" .. AccTextNum1("A", TMBodyUI(TMBody.Ass), tmBdec) [gold]
		+ TM_UP.."Ass"
			TMBodyEdit_Up(human, TMBody.Ass, TM_BodyStepB)
			Return()
		+ TM_DN.."Ass"
			TMBodyEdit_Down(human, TMBody.Ass, TM_BodyStepB)
			Return()
		+ "RESET Ass | " .. AccNum(TMBodyUI(TMBody.Ass), tmBdec)
			TMBodyEdit(human, TMBody.Ass, TMBD_BodyDefault)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ if not human.m_isMale
		+ "| Breasts »	|" .. AccTextNum2("B", TMBodyUI(TMBody.Breasts), "N", TMBodyUI(TMBody.Nipples), tmBdec) [gold]
			+ TM_UP.."Breasts"
				TMBodyEdit_Up(human, TMBody.Breasts, TM_BodyStepC)
				Return()
			+ TM_DN.."Breasts"
				TMBodyEdit_Down(human, TMBody.Breasts, TM_BodyStepC)
				Return()
			+ "RESET Breasts | " .. AccNum(TMBodyUI(TMBody.Breasts), tmBdec)
				TMBodyEdit(human, TMBody.Breasts, TMBD_BodyDefault)
				Return()
			+ TM_UP.."Nipples"
				TMBodyEdit_Up(human, TMBody.Nipples, TM_BodyStepA*2)
				Return()
			+ TM_DN.."Nipples"
				TMBodyEdit_Down(human, TMBody.Nipples, TM_BodyStepA*2)
				Return()
			+ "RESET Nipples | " .. AccNum(TMBodyUI(TMBody.Nipples), tmBdec)
				TMBodyEdit(human, TMBody.Nipples, TMBD_BodyDefault)
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose
	+ if human.Penis.IsActive
		+ "| Penis »	|" .. AccTextNum2("S", TMBodyUI(TMBody.PenisSize), "L", TMBodyUI(TMBody.PenisLength), tmBdec) [gold]
			+ "| Ragdoll »	| " .. AccNum(TMBodyUI(TMBody.PenisRagdoll), tmBdec) [gold]
				+ TM_UP.."Ragdoll"
					TMBodyEdit_Up(human, TMBody.PenisRagdoll, TM_BodyStepB)
					Return()
				+ TM_DN.."Ragdoll"
					TMBodyEdit_Down(human, TMBody.PenisRagdoll, TM_BodyStepB)
					Return()
				+ "RESET Ragdoll | " .. AccNum(TMBodyUI(TMBody.PenisRagdoll), tmBdec)
					TMBodyEdit(human, TMBody.PenisRagdoll, TMBD_RagdollSizeDefault)
					Return()
				+ TM_MenuBack
					Return(2)
				+ TM_MenuClose
			+ "| Foreskin »	| " .. AccNum(TMBodyUI(TMBody.PenisSkin), tmBdec) [gold]
				+ TM_UP.."Foreskin"
					TMBodyEdit_Up(human, TMBody.PenisSkin, TM_BodyStepB)
					Return()
				+ TM_DN.."Foreskin"
					TMBodyEdit_Down(human, TMBody.PenisSkin, TM_BodyStepB)	
					Return()
				+ "RESET Foreskin | " .. AccNum(TMBodyUI(TMBody.PenisSkin), tmBdec)
					TMBodyEdit(human, TMBody.PenisSkin, TMBD_BodyDefault)
					Return()
				+ TM_MenuBack
					Return(2)
				+ TM_MenuClose
			+ TM_UP.."Size"
				TMBodyEdit_Up(human, TMBody.PenisSize, TM_BodyStepB)
				Return()
			+ TM_DN.."Size"
				TMBodyEdit_Down(human, TMBody.PenisSize, TM_BodyStepB)
				Return()
			+ "RESET Size | " .. AccNum(TMBodyUI(TMBody.PenisSize), tmBdec)
				TMBodyEdit(human, TMBody.PenisSize, TMBD_BodyDefault)
				Return()
			+ TM_UP.."Length"
				TMBodyEdit_Up(human, TMBody.PenisLength, TM_BodyStepB)
				Return()
			+ TM_DN.."Length"
				TMBodyEdit_Down(human, TMBody.PenisLength, TM_BodyStepB)
				Return()
			+ "RESET Length | " .. AccNum(TMBodyUI(TMBody.PenisLength), tmBdec)
				TMBodyEdit(human, TMBody.PenisLength, TMBD_BodyDefault)
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose
	+ "| Body »	|" .. AccTextNum2("B", TMBodyUI(TMBody.Body), "M", TMBodyUI(TMBody.Muscle), tmBdec) [gold]
		+ TM_UP.."Body"
			TMBodyEdit_Up(human, TMBody.Body, TM_BodyStepC)
			Return()
		+ TM_DN.."Body"
			TMBodyEdit_Down(human, TMBody.Body, TM_BodyStepC)
			Return()
		+ "RESET Body | " .. AccNum(TMBodyUI(TMBody.Body), tmBdec)
			TMBodyEdit(human, TMBody.Body, TMBD_BodyDefault)
			Return()
		+ TM_UP.."Muscle"
			TMBodyEdit_Up(human, TMBody.Muscle, TM_BodyStepA)
			Return()
		+ TM_DN.."Muscle"
			TMBodyEdit_Down(human, TMBody.Muscle, TM_BodyStepA)
			Return()
		+ "RESET Muscle | " .. AccNum(TMBodyUI(TMBody.Muscle), tmBdec)
			TMBodyEdit(human, TMBody.Muscle, TMBD_BodyDefault)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "Body sizes »" [gold]
		TMMenuBodySize(human)
	+ "Body types »" [gold]
		TMMenuBodyType(human)
	+ "Paste | " .. AccStr(TMBodyValueCopyName) [if TMBodyHasCopy()]
		TMBodyPaste(human)
		Return()
	+ "RESET " .. AccStr(human.Name)
		TMBodyEdit_Preset(human, TMBEPreset_Reset)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop