-- FreemodeHG version 0.3 ~ fauna_LABS_v1.02 (partial menu extract)
---@diagnostic disable: exp-in-action, undefined-global, keyword, unknown-symbol, miss-end, miss-symbol, miss-exp, err-nonstandard-symbol, err-assign-as-eq, malformed-number
label TMMenuFaunaFingerLab(human, hitTri)
-- + "FingerLAB.."[gold]
	+ "  5"
		FINGER_PARAM_INCREMENT = 5
		Return()
	+ "  2"
		FINGER_PARAM_INCREMENT = 2
		Return()
	+ "  1"
		FINGER_PARAM_INCREMENT = 1
		Return()
	+ "0.25"
		FINGER_PARAM_INCREMENT = 0.25
		Return()
	+ "Left Hand.."[gold]
		+ "ThumbL.."[gold]
			+ "Reset ThumbL"
				ResetAllFingerParams(human, "ThumbL")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "ThumbL", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "ThumbL", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "ThumbL", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "ThumbL", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "ThumbL", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(ThumbL_J1_Inc())
				Return()
			+ "-"
				human.Pose(ThumbL_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(ThumbL_J2_Inc())
				Return()
			+ "-"
				human.Pose(ThumbL_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(ThumbL_J3_Inc())
				Return()
			+ "-"
				human.Pose(ThumbL_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(ThumbL_J4_Inc())
				Return()
			+ "-"
				human.Pose(ThumbL_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(ThumbL_J5_Inc())
				Return()
			+ "-"
				human.Pose(ThumbL_J5_Dec())
				Return()
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "IndexL.."[gold]
			+ "Reset IndexL"
				ResetAllFingerParams(human, "IndexL")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "IndexL", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "IndexL", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "IndexL", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "IndexL", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "IndexL", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(IndexL_J1_Inc())
				Return()
			+ "-"
				human.Pose(IndexL_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(IndexL_J2_Inc())
				Return()
			+ "-"
				human.Pose(IndexL_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(IndexL_J3_Inc())
				Return()
			+ "-"
				human.Pose(IndexL_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(IndexL_J4_Inc())
				Return()
			+ "-"
				human.Pose(IndexL_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(IndexL_J5_Inc())
				Return()
			+ "-"
				human.Pose(IndexL_J5_Dec())
				Return()
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "MidL.."[gold]
			+ "Reset MidL"
				ResetAllFingerParams(human, "MidL")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "MidL", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "MidL", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "MidL", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "MidL", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "MidL", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(MidL_J1_Inc())
				Return()
			+ "-"
				human.Pose(MidL_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(MidL_J2_Inc())
				Return()
			+ "-"
				human.Pose(MidL_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(MidL_J3_Inc())
				Return()
			+ "-"
				human.Pose(MidL_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(MidL_J4_Inc())
				Return()
			+ "-"
				human.Pose(MidL_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(MidL_J5_Inc())
				Return()
			+ "-"
				human.Pose(MidL_J5_Dec())
				Return()
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "RingL.."[gold]
			+ "Reset RingL"
				ResetAllFingerParams(human, "RingL")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "RingL", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "RingL", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "RingL", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "RingL", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "RingL", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(RingL_J1_Inc())
				Return()
			+ "-"
				human.Pose(RingL_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(RingL_J2_Inc())
				Return()
			+ "-"
				human.Pose(RingL_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(RingL_J3_Inc())
				Return()
			+ "-"
				human.Pose(RingL_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(RingL_J4_Inc())
				Return()
			+ "-"
				human.Pose(RingL_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(RingL_J5_Inc())
				Return()
			+ "-"
				human.Pose(RingL_J5_Dec())
				Return()
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "PinkyL.."[gold]
			+ "Reset PinkyL"
				ResetAllFingerParams(human, "PinkyL")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "PinkyL", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "PinkyL", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "PinkyL", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "PinkyL", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "PinkyL", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(PinkyL_J1_Inc())
				Return()
			+ "-"
				human.Pose(PinkyL_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(PinkyL_J2_Inc())
				Return()
			+ "-"
				human.Pose(PinkyL_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(PinkyL_J3_Inc())
				Return()
			+ "-"
				human.Pose(PinkyL_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(PinkyL_J4_Inc())
				Return()
			+ "-"
				human.Pose(PinkyL_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(PinkyL_J5_Inc())
				Return()
			+ "-"
				human.Pose(PinkyL_J5_Dec())
				Return()
		-- Repeat for IndexL, MidL, RingL, PinkyL
		+ "Reset All Left Fingers"
			human.Pose(ResetALLleftFingerParams(human))
			Return()
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------






	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	+ "Right Hand.."[gold]
		+ "ThumbR.."[gold]
			+ "Reset ThumbR"
				ResetAllFingerParams(human, "ThumbR")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "ThumbR", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "ThumbR", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "ThumbR", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "ThumbR", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "ThumbR", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(ThumbR_J1_Inc())
				Return()
			+ "-"
				human.Pose(ThumbR_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(ThumbR_J2_Inc())
				Return()
			+ "-"
				human.Pose(ThumbR_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(ThumbR_J3_Inc())
				Return()
			+ "-"
				human.Pose(ThumbR_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(ThumbR_J4_Inc())
				Return()
			+ "-"
				human.Pose(ThumbR_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(ThumbR_J5_Inc())
				Return()
			+ "-"
				human.Pose(ThumbR_J5_Dec())
				Return()
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "IndexR.."[gold]
			+ "Reset IndexR"
				ResetAllFingerParams(human, "IndexR")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "IndexR", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "IndexR", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "IndexR", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "IndexR", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "IndexR", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(IndexR_J1_Inc())
				Return()
			+ "-"
				human.Pose(IndexR_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(IndexR_J2_Inc())
				Return()
			+ "-"
				human.Pose(IndexR_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(IndexR_J3_Inc())
				Return()
			+ "-"
				human.Pose(IndexR_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(IndexR_J4_Inc())
				Return()
			+ "-"
				human.Pose(IndexR_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(IndexR_J5_Inc())
				Return()
			+ "-"
				human.Pose(IndexR_J5_Dec())
				Return()
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "MidR.."[gold]
			+ "Reset MidR"
				ResetAllFingerParams(human, "MidR")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "MidR", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "MidR", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "MidR", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "MidR", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "MidR", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(MidR_J1_Inc())
				Return()
			+ "-"
				human.Pose(MidR_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(MidR_J2_Inc())
				Return()
			+ "-"
				human.Pose(MidR_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(MidR_J3_Inc())
				Return()
			+ "-"
				human.Pose(MidR_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(MidR_J4_Inc())
				Return()
			+ "-"
				human.Pose(MidR_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(MidR_J5_Inc())
				Return()
			+ "-"
				human.Pose(MidR_J5_Dec())
				Return()
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "RingR.."[gold]
			+ "Reset RingR"
				ResetAllFingerParams(human, "RingR")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "RingR", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "RingR", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "RingR", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "RingR", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "RingR", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(RingR_J1_Inc())
				Return()
			+ "-"
				human.Pose(RingR_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(RingR_J2_Inc())
				Return()
			+ "-"
				human.Pose(RingR_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(RingR_J3_Inc())
				Return()
			+ "-"
				human.Pose(RingR_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(RingR_J4_Inc())
				Return()
			+ "-"
				human.Pose(RingR_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(RingR_J5_Inc())
				Return()
			+ "-"
				human.Pose(RingR_J5_Dec())
				Return()
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "PinkyR.."[gold]
			+ "Reset PinkyR"
				ResetAllFingerParams(human, "PinkyR")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "PinkyR", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "PinkyR", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "PinkyR", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "PinkyR", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "PinkyR", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(PinkyR_J1_Inc())
				Return()
			+ "-"
				human.Pose(PinkyR_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(PinkyR_J2_Inc())
				Return()
			+ "-"
				human.Pose(PinkyR_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(PinkyR_J3_Inc())
				Return()
			+ "-"
				human.Pose(PinkyR_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(PinkyR_J4_Inc())
				Return()
			+ "-"
				human.Pose(PinkyR_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(PinkyR_J5_Inc())
				Return()
			+ "-"
				human.Pose(PinkyR_J5_Dec())
				Return()
		+ "Reset All Right Fingers."
			human.Pose(ResetALLrightFingerParams())
			Return()
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------






	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------

	+ "Both Hands"[gold]
		+ "Both Thumbs"
			+ "Reset Thumbs"
				ResetAllFingerParams(human, "ThumbR")
				ResetAllFingerParams(human, "ThumbL")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "ThumbR", 1)
				ResetFingerParam(human, "ThumbL", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "ThumbR", 2)
				ResetFingerParam(human, "ThumbL", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "ThumbR", 3)
				ResetFingerParam(human, "ThumbL", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "ThumbR", 4)
				ResetFingerParam(human, "ThumbL", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "ThumbR", 5)
				ResetFingerParam(human, "ThumbL", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(ThumbR_J1_Inc())
				human.Pose(ThumbL_J1_Inc())
				Return()
			+ "-"
				human.Pose(ThumbR_J1_Dec())
				human.Pose(ThumbL_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(ThumbR_J2_Inc())
				human.Pose(ThumbL_J2_Inc())
				Return()
			+ "-"
				human.Pose(ThumbR_J2_Dec())
				human.Pose(ThumbL_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(ThumbR_J3_Inc())
				human.Pose(ThumbL_J3_Inc())
				Return()
			+ "-"
				human.Pose(ThumbR_J3_Dec())
				human.Pose(ThumbL_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(ThumbR_J4_Inc())
				human.Pose(ThumbL_J4_Inc())
				Return()
			+ "-"
				human.Pose(ThumbR_J4_Dec())
				human.Pose(ThumbL_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(ThumbR_J5_Inc())
				human.Pose(ThumbL_J5_Inc())
				Return()
			+ "-"
				human.Pose(ThumbR_J5_Dec())
				human.Pose(ThumbL_J5_Dec())
				Return()
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "Both Index"
			+ "Reset Index"
				ResetAllFingerParams(human, "IndexR")
				ResetAllFingerParams(human, "IndexL")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "IndexR", 1)
				ResetFingerParam(human, "IndexL", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "IndexR", 2)
				ResetFingerParam(human, "IndexL", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "IndexR", 3)
				ResetFingerParam(human, "IndexL", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "IndexR", 4)
				ResetFingerParam(human, "IndexL", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "IndexR", 5)
				ResetFingerParam(human, "IndexL", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(IndexR_J1_Inc())
				human.Pose(IndexL_J1_Inc())
				Return()
			+ "-"
				human.Pose(IndexR_J1_Dec())
				human.Pose(IndexL_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(IndexR_J2_Inc())
				human.Pose(IndexL_J2_Inc())
				Return()
			+ "-"
				human.Pose(IndexR_J2_Dec())
				human.Pose(IndexL_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(IndexR_J3_Inc())
				human.Pose(IndexL_J3_Inc())
				Return()
			+ "-"
				human.Pose(IndexR_J3_Dec())
				human.Pose(IndexL_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(IndexR_J4_Inc())
				human.Pose(IndexL_J4_Inc())
				Return()
			+ "-"
				human.Pose(IndexR_J4_Dec())
				human.Pose(IndexL_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(IndexR_J5_Inc())
				human.Pose(IndexL_J5_Inc())
				Return()
			+ "-"
				human.Pose(IndexR_J5_Dec())
				human.Pose(IndexL_J5_Dec())
				Return()
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "Both Mid"
			+ "Reset Mid"
				ResetAllFingerParams(human, "MidR")
				ResetAllFingerParams(human, "MidL")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "MidR", 1)
				ResetFingerParam(human, "MidL", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "MidR", 2)
				ResetFingerParam(human, "MidL", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "MidR", 3)
				ResetFingerParam(human, "MidL", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "MidR", 4)
				ResetFingerParam(human, "MidL", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "MidR", 5)
				ResetFingerParam(human, "MidL", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(MidR_J1_Inc())
				human.Pose(MidL_J1_Inc())
				Return()
			+ "-"
				human.Pose(MidR_J1_Dec())
				human.Pose(MidL_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(MidR_J2_Inc())
				human.Pose(MidL_J2_Inc())
				Return()
			+ "-"
				human.Pose(MidR_J2_Dec())
				human.Pose(MidL_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(MidR_J3_Inc())
				human.Pose(MidL_J3_Inc())
				Return()
			+ "-"
				human.Pose(MidR_J3_Dec())
				human.Pose(MidL_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(MidR_J4_Inc())
				human.Pose(MidL_J4_Inc())
				Return()
			+ "-"
				human.Pose(MidR_J4_Dec())
				human.Pose(MidL_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(MidR_J5_Inc())
				human.Pose(MidL_J5_Inc())
				Return()
			+ "-"
				human.Pose(MidR_J5_Dec())
				human.Pose(MidL_J5_Dec())
				Return()
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "Both Ring"
			+ "Reset Ring"
				ResetAllFingerParams(human, "RingR")
				ResetAllFingerParams(human, "RingL")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "RingR", 1)
				ResetFingerParam(human, "RingL", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "RingR", 2)
				ResetFingerParam(human, "RingL", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "RingR", 3)
				ResetFingerParam(human, "RingL", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "RingR", 4)
				ResetFingerParam(human, "RingL", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "RingR", 5)
				ResetFingerParam(human, "RingL", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(RingR_J1_Inc())
				human.Pose(RingL_J1_Inc())
				Return()
			+ "-"
				human.Pose(RingR_J1_Dec())
				human.Pose(RingL_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(RingR_J2_Inc())
				human.Pose(RingL_J2_Inc())
				Return()
			+ "-"
				human.Pose(RingR_J2_Dec())
				human.Pose(RingL_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(RingR_J3_Inc())
				human.Pose(RingL_J3_Inc())
				Return()
			+ "-"
				human.Pose(RingR_J3_Dec())
				human.Pose(RingL_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(RingR_J4_Inc())
				human.Pose(RingL_J4_Inc())
				Return()
			+ "-"
				human.Pose(RingR_J4_Dec())
				human.Pose(RingL_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(RingR_J5_Inc())
				human.Pose(RingL_J5_Inc())
				Return()
			+ "-"
				human.Pose(RingR_J5_Dec())
				human.Pose(RingL_J5_Dec())
				Return()
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "Both Pinky"
			+ "Reset Pinky"
				ResetAllFingerParams(human, "PinkyR")
				ResetAllFingerParams(human, "PinkyL")
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "Reset Joint 1"
				ResetFingerParam(human, "PinkyR", 1)
				ResetFingerParam(human, "PinkyL", 1)
				Return()
			+ "Reset Joint 2"
				ResetFingerParam(human, "PinkyR", 2)
				ResetFingerParam(human, "PinkyL", 2)
				Return()
			+ "Reset Joint 3"
				ResetFingerParam(human, "PinkyR", 3)
				ResetFingerParam(human, "PinkyL", 3)
				Return()
			+ "Reset Joint 4"
				ResetFingerParam(human, "PinkyR", 4)
				ResetFingerParam(human, "PinkyL", 4)
				Return()
			+ "Reset Joint 5"
				ResetFingerParam(human, "PinkyR", 5)
				ResetFingerParam(human, "PinkyL", 5)
				Return()
			+ "^ | Joint 1"[gold]
				human.Pose(PinkyR_J1_Inc())
				human.Pose(PinkyL_J1_Inc())
				Return()
			+ "-"
				human.Pose(PinkyR_J1_Dec())
				human.Pose(PinkyL_J1_Dec())
				Return()
			+ "^ | Joint 2"[gold]
				human.Pose(PinkyR_J2_Inc())
				human.Pose(PinkyL_J2_Inc())
				Return()
			+ "-"
				human.Pose(PinkyR_J2_Dec())
				human.Pose(PinkyL_J2_Dec())
				Return()
			+ "^ | Joint 3"[gold]
				human.Pose(PinkyR_J3_Inc())
				human.Pose(PinkyL_J3_Inc())
				Return()
			+ "-"
				human.Pose(PinkyR_J3_Dec())
				human.Pose(PinkyL_J3_Dec())
				Return()
			+ "^ | Joint 4"[gold]
				human.Pose(PinkyR_J4_Inc())
				human.Pose(PinkyL_J4_Inc())
				Return()
			+ "-"
				human.Pose(PinkyR_J4_Dec())
				human.Pose(PinkyL_J4_Dec())
				Return()
			+ "^ | Joint 5"[gold]
				human.Pose(PinkyR_J5_Inc())
				human.Pose(PinkyL_J5_Inc())
				Return()
			+ "-"
				human.Pose(PinkyR_J5_Dec())
				human.Pose(PinkyL_J5_Dec())
				Return()
		+ "<color=#54b095><i>Back."
			Return(2)
		+ "<color=#9a646f><i>Done."
	+ "Reset All Fingers"
		ResetAllFingers(human)
		Return()
	+ "<color=#54b095><i>Back. | Increment = " .. FINGER_PARAM_INCREMENT .. ".."
		Return(2)
	+ "<color=#9a646f><i>Done."
stop