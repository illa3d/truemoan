-- TrueMoan v1.3 by illa3d
-- Code in: tm_bodyedit.lua
-- Body edit decimals
tmBdec = 3

label TMMenuBody(human)
	+ "Edit safe | " .. AccBool(TM_BodyEditSafe) [if TM_BodyEditSafe]
		TM_BodyEditSafe = false
		-- human "Warning: Game can crash for Breasts <-0.8 and BodySize <-0.9!\nMake sure you save before :)"
		Return()
	+ "Edit safe | " .. AccBool(TM_BodyEditSafe) .. "(can crash app)" [if not TM_BodyEditSafe]
		TM_BodyEditSafe = true
		Return()
	+ "RESET Values"
		TMBodyEditResetValues()
		Return()
	+ "| Neck »	| " .. AccTextNum1("N", TMB_NeckSize, tmBdec) [gold]
		+ TM_UP.."Neck"
			TMB_NeckSize = TMBodyEditUp(human, TMBE_Neck, TMB_NeckSize, TM_BodyStepB)
			Return()
		+ TM_DN.."Neck"
			TMB_NeckSize = TMBodyEditDown(human, TMBE_Neck, TMB_NeckSize, TM_BodyStepB)
			Return()
		+ "RESET Neck | " .. AccNum(TMB_NeckSize, tmBdec)
			TMB_NeckSize = TMBodyEdit(human, TMBE_Neck, TMBD_BodyDefault)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Arms »	| " .. AccTextNum2("U", TMB_UperArmsize, "F", TMB_ForearmSize, tmBdec) [gold]
		+ TM_UP.."Upper arms"
			TMB_UperArmsize = TMBodyEditUp(human, TMBE_Upperarms, TMB_UperArmsize, TM_BodyStepB)
			Return()
		+ TM_DN.."Upper arms"
			TMB_UperArmsize = TMBodyEditDown(human, TMBE_Upperarms, TMB_UperArmsize, TM_BodyStepB)
			Return()
		+ "RESET Upper arms | " .. AccNum(TMB_UperArmsize, tmBdec)
			TMB_UperArmsize = TMBodyEdit(human, TMBE_Upperarms, TMBD_BodyDefault)
			Return()
		+ TM_UP.."Forearms"
			TMB_ForearmSize = TMBodyEditUp(human, TMBE_Forearms, TMB_ForearmSize, TM_BodyStepB)
			Return()
		+ TM_DN.."Forearms"
			TMB_ForearmSize = TMBodyEditDown(human, TMBE_Forearms, TMB_ForearmSize, TM_BodyStepB)
			Return()
		+ "RESET Forearms | " .. AccNum(TMB_ForearmSize, tmBdec)
			TMB_ForearmSize = TMBodyEdit(human, TMBE_Forearms, TMBD_BodyDefault)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Legs »	| " .. AccTextNum2("T", TMB_ThighSize, "C", TMB_CalfSize, tmBdec) [gold]
		+ TM_UP.."Thigh"
			TMB_ThighSize = TMBodyEditUp(human, TMBE_Thigh, TMB_ThighSize, TM_BodyStepB)
			Return()
		+ TM_DN.."Thigh"
			TMB_ThighSize = TMBodyEditDown(human, TMBE_Thigh, TMB_ThighSize, TM_BodyStepB)
			Return()
		+ "RESET Thigh | " .. AccNum(TMB_ThighSize, tmBdec)
			TMB_ThighSize = TMBodyEdit(human, TMBE_Thigh, TMBD_BodyDefault)
			Return()
		+ TM_UP.."Calf"
			TMB_CalfSize = TMBodyEditUp(human, TMBE_Calf, TMB_CalfSize, TM_BodyStepB)
			Return()
		+ TM_DN.."Calf"
			TMB_CalfSize = TMBodyEditDown(human, TMBE_Calf, TMB_CalfSize, TM_BodyStepB)
			Return()
		+ "RESET Calf | " .. AccNum(TMB_CalfSize, tmBdec)
			TMB_CalfSize = TMBodyEdit(human, TMBE_Calf, TMBD_BodyDefault)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Waist »	| " .. AccTextNum2("W", TMB_WaistSize, "H", TMB_HipsSize, tmBdec) [gold]
		+ TM_UP.."Waist"
			TMB_WaistSize = TMBodyEditUp(human, TMBE_Waist, TMB_WaistSize, TM_BodyStepA)
			Return()
		+ TM_DN.."Waist"
			TMB_WaistSize = TMBodyEditDown(human, TMBE_Waist, TMB_WaistSize, TM_BodyStepA)
			Return()
		+ "RESET Waist | " .. AccNum(TMB_WaistSize, tmBdec)
			TMB_WaistSize = TMBodyEdit(human, TMBE_Waist, TMBD_BodyDefault)
			Return()
		+ TM_UP.."Hips"
			TMB_HipsSize = TMBodyEditUp(human, TMBE_Hips, TMB_HipsSize, TM_BodyStepA)
			Return()
		+ TM_DN.."Hips"
			TMB_HipsSize = TMBodyEditDown(human, TMBE_Hips, TMB_HipsSize, TM_BodyStepA)
			Return()
		+ "RESET Hips | " .. AccNum(TMB_HipsSize, tmBdec)
			TMB_HipsSize = TMBodyEdit(human, TMBE_Hips, TMBD_BodyDefault)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "| Ass »	| " .. AccTextNum1("A", TMB_AssSize, tmBdec) [gold]
		+ TM_UP.."Ass"
			TMB_AssSize = TMBodyEditUp(human, TMBE_Ass, TMB_AssSize, TM_BodyStepB)
			Return()
		+ TM_DN.."Ass"
			TMB_AssSize = TMBodyEditDown(human, TMBE_Ass, TMB_AssSize, TM_BodyStepB)
			Return()
		+ "RESET Ass | " .. AccNum(TMB_AssSize, tmBdec)
			TMB_AssSize = TMBodyEdit(human, TMBE_Ass, TMBD_BodyDefault)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ if not human.m_isMale
		+ "| Breasts »	| " .. AccTextNum2("B", TMB_BreastSize, "N", TMB_NipplesSize, tmBdec) [gold]
			+ TM_UP.."Breasts"
				TMB_BreastSize = TMBodyEditUp(human, TMBE_Breasts, TMB_BreastSize, TM_BodyStepC)
				Return()
			+ TM_DN.."Breasts"
				TMB_BreastSize = TMBodyEditDown(human, TMBE_Breasts, TMB_BreastSize, TM_BodyStepC)
				Return()
			+ "RESET Breasts | " .. AccNum(TMB_BreastSize, tmBdec)
				TMB_BreastSize = TMBodyEdit(human, TMBE_Breasts, TMBD_BodyDefault)
				Return()
			+ TM_UP.."Nipples"
				TMB_NipplesSize = TMBodyEditUp(human, TMBE_Nipples, TMB_NipplesSize, TM_BodyStepA)
				Return()
			+ TM_DN.."Nipples"
				TMB_NipplesSize = TMBodyEditDown(human, TMBE_Nipples, TMB_NipplesSize, TM_BodyStepA)
				Return()
			+ "RESET Nipples | " .. AccNum(TMB_NipplesSize, tmBdec)
				TMB_NipplesSize = TMBodyEdit(human, TMBE_Nipples, TMBD_BodyDefault)
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose
	+ if human.Penis.IsActive
		+ "| Penis »	| " .. AccTextNum2("S", TMB_PenisSize, "L", TMB_PenisLength, tmBdec) [gold]
			+ "| Ragdoll »	| " .. AccNum(TMB_PenisRagdoll, tmBdec) [gold]
				+ TM_UP.."Ragdoll"
					TMB_PenisRagdoll = TMBodyEditPenisRagdoll(human, TMB_PenisRagdoll + TM_BodyStepB)
					Return()
				+ TM_DN.."Ragdoll"
					TMB_PenisRagdoll = TMBodyEditPenisRagdoll(human, TMB_PenisRagdoll - TM_BodyStepB)
					Return()
				+ "RESET Ragdoll | " .. AccNum(TMB_PenisRagdoll, tmBdec)
					TMB_PenisRagdoll = TMBodyEditPenisRagdoll(human, TMBD_RagdollSizeDefault)
					Return()
				+ TM_MenuBack
					Return(2)
				+ TM_MenuClose
			+ "| Foreskin »	| " .. AccNum(TMB_PenisSkin, tmBdec) [gold]
				+ TM_UP.."Foreskin"
					TMB_PenisSkin = TMBodyEditPenisSkin(human, TMB_PenisSkin + TM_BodyStepB)
					Return()
				+ TM_DN.."Foreskin"
					TMB_PenisSkin = TMBodyEditPenisSkin(human, TMB_PenisSkin - TM_BodyStepB)
					Return()
				+ "RESET Foreskin | " .. AccNum(TMB_PenisSkin, tmBdec)
					TMB_PenisSkin = TMBodyEditPenisSkin(human, TMBD_BodyDefault)
					Return()
				+ TM_MenuBack
					Return(2)
				+ TM_MenuClose
			+ TM_UP.."Size"
				TMB_PenisSize = TMBodyEditUp(human, TMBE_PenisSize, TMB_PenisSize, TM_BodyStepB)
				Return()
			+ TM_DN.."Size"
				TMB_PenisSize = TMBodyEditDown(human, TMBE_PenisSize, TMB_PenisSize, TM_BodyStepB)
				Return()
			+ "RESET Size | " .. AccNum(TMB_PenisSize, tmBdec)
				TMB_PenisSize = TMBodyEdit(human, TMBE_PenisSize, TMBD_BodyDefault)
				Return()
			+ TM_UP.."Length"
				TMB_PenisLength = TMBodyEditUp(human, TMBE_PenisLength, TMB_PenisLength, TM_BodyStepB)
				Return()
			+ TM_DN.."Length"
				TMB_PenisLength = TMBodyEditDown(human, TMBE_PenisLength, TMB_PenisLength, TM_BodyStepB)
				Return()
			+ "RESET Length | " .. AccNum(TMB_PenisLength, tmBdec)
				TMB_PenisLength = TMBodyEdit(human, TMBE_PenisLength, TMBD_BodyDefault)
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose
	+ "| Body »	| " .. AccTextNum2("B", TMB_BodySize, "M", TMB_MuscleSize, tmBdec) [gold]
		+ TM_UP.."Body"
			TMB_BodySize = TMBodyEditUp(human, TMBE_Body, TMB_BodySize, TM_BodyStepC)
			Return()
		+ TM_DN.."Body"
			TMB_BodySize = TMBodyEditDown(human, TMBE_Body, TMB_BodySize, TM_BodyStepC)
			Return()
		+ "RESET Body | " .. AccNum(TMB_BodySize, tmBdec)
			TMB_BodySize = TMBodyEdit(human, TMBE_Body, TMBD_BodyDefault)
			Return()
		+ TM_UP.."Muscle"
			TMB_MuscleSize = TMBodyEditUp(human, TMBE_Muscle, TMB_MuscleSize, TM_BodyStepA)
			Return()
		+ TM_DN.."Muscle"
			TMB_MuscleSize = TMBodyEditDown(human, TMBE_Muscle, TMB_MuscleSize, TM_BodyStepA)
			Return()
		+ "RESET Muscle | " .. AccNum(TMB_MuscleSize, tmBdec)
			TMB_MuscleSize = TMBodyEdit(human, TMBE_Muscle, TMBD_BodyDefault)
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
	+ "Body sizes »" [gold]
		TMMenuBodySize(human)
	+ "Body types »" [gold]
		TMMenuBodyType(human)
	+ "RESET Body"
		TMBEPreset_Reset(human)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop