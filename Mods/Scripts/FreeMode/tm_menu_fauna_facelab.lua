-- FreemodeHG version 0.3 ~ fauna_LABS_v1.02 (partial menu extract)
label TMMenuFaunaFaceLab(human, hitTri)
-- + "faceLAB.."[gold]
	+ "0.5"
		FACE_PARAM_INCREMENT = 0.5
		Return()
	+ "0.25"
		FACE_PARAM_INCREMENT = 0.25
		Return()
	+ "0.1"
		FACE_PARAM_INCREMENT = 0.1
		Return()
	-- + "Eyelids.."[gold] --no effect
	-- 	+ "<color=#9a646f><i>Done."
	-- 	+ "<color=#54b095><i>Back."
	-- 		Return(2)
	-- 	+ "1. Left"[gold]
	-- 		human.Pose(Eyelidpar1_A())
	-- 		Return()
	-- 	+ "1. Left"
	-- 		human.Pose(Eyelidpar1_B())
	-- 		Return()
	-- 	+ "Reset Cheek Parameter 1"
	-- 		human.Pose(ResetEyelidParam(1))
	-- 		Return()
	-- 	+ "2. Right"[gold]
	-- 		human.Pose(Eyelidpar2_A())
	-- 		Return()
	-- 	+ "2. Right"
	-- 		human.Pose(Eyelidpar2_B())
	-- 		Return()
	-- 	+ "Reset Cheek Parameter 2"
	-- 		human.Pose(ResetEyelidParam(2))
	-- 		Return()
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	+ "Cheeks.."[gold]
		+ "Left/Right.."[gold]
			+ "^ | Left"[gold]
				human.Pose(Cheekspar1_A())
				Return()
			+ "-"
				human.Pose(Cheekspar1_B())
				Return()
			+ "Reset Cheek Parameter 1"
				human.Pose(ResetCheeksParam(human, 1))
				Return()
			+ "^ | Right"[gold]
				human.Pose(Cheekspar2_A())
				Return()
			+ "-"
				human.Pose(Cheekspar2_B())
				Return()
			+ "Reset Cheek Parameter 2"
				human.Pose(ResetCheeksParam(human, 2))
				Return()
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "<color=#9a646f><i>Done."
		+ "Both.."[gold]
			+ "^ | Both"[gold]
				human.Pose(Cheekspar1_A())
				human.Pose(Cheekspar2_A())
				Return()
			+ "-"
				human.Pose(Cheekspar1_B())
				human.Pose(Cheekspar2_B())
				Return()
			+ "Reset Cheek Parameters"
				human.Pose(ResetCheeksParam(human, 1))
				human.Pose(ResetCheeksParam(human, 2))
				Return()
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "<color=#9a646f><i>Done."
		+ "<color=#54b095><i>Back."
			Return(2)
		+ "<color=#9a646f><i>Done."
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	+ "Brows.."[gold]
		+ "Right Brow.."[gold]
			+ "^ | Right Inner"[gold]
				human.Pose(Browspar1_A())
				Return()
			+ "-"
				human.Pose(Browspar1_B())
				Return()
			+ "Reset Brows Parameter 1"
				human.Pose(ResetBrowsParam(human, 1))
				Return()
			+ "^ | Right Outer"[gold]
				human.Pose(Browspar3_A())
				Return()
			+ "-"
				human.Pose(Browspar3_B())
				Return()
			+ "Reset Brows Parameter 3"
				human.Pose(ResetBrowsParam(human, 3))
				Return()
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "<color=#9a646f><i>Done."
		+ "Left Brow.."[gold]
			+ "^ | Left Inner"[gold]
				human.Pose(Browspar2_A())
				Return()
			+ "-"
				human.Pose(Browspar2_B())
				Return()
			+ "Reset Brows Parameter 2"
				human.Pose(ResetBrowsParam(human, 2))
				Return()
			+ "^ | Left Outer"[gold]
				human.Pose(Browspar4_A())
				Return()
			+ "-"
				human.Pose(Browspar4_B())
				Return()
			+ "Reset Brows Parameter 4"
				human.Pose(ResetBrowsParam(human, 4))
				Return()
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "<color=#9a646f><i>Done."
		+ "Both Brows.."[gold]
			+ "^ | Left"[gold]
				human.Pose(Browspar4_A())
				human.Pose(Browspar2_A())
				Return()
			+ "-"
				human.Pose(Browspar4_B())
				human.Pose(Browspar2_B())
				Return()
			+ "^ | Right"[gold]
				human.Pose(Browspar1_A())
				human.Pose(Browspar3_A())
				Return()
			+ "-"
				human.Pose(Browspar1_B())
				human.Pose(Browspar3_B())
				Return()
			+ "^ | Inner"[gold]
				human.Pose(Browspar1_A())
				human.Pose(Browspar2_A())
				Return()
			+ "-"
				human.Pose(Browspar1_B())
				human.Pose(Browspar2_B())
				Return()
			+ "^ | Outer"[gold]
				human.Pose(Browspar3_A())
				human.Pose(Browspar4_A())
				Return()
			+ "-"
				human.Pose(Browspar3_B())
				human.Pose(Browspar4_B())
				Return()
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "<color=#9a646f><i>Done."
		+ "^ | Both"[gold]
			human.Pose(Browspar1_A())
			human.Pose(Browspar2_A())
			human.Pose(Browspar3_A())
			human.Pose(Browspar4_A())
			Return()
		+ "-"
			human.Pose(Browspar1_B())
			human.Pose(Browspar2_B())
			human.Pose(Browspar3_B())
			human.Pose(Browspar4_B())
			Return()
		+ "Reset Both Brows"
			human.Pose(ResetALLBrowsParam(human))
			Return()
		+ "<color=#54b095><i>Back."
			Return(2)
		+ "<color=#9a646f><i>Done."
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	+ "Mouth.."[gold]
		+ "Jaw V/H.."[gold]
			+ "^ | Vertical"[gold]
				human.Pose(Mouthpar1_A())
				Return()
			+ "-"
				human.Pose(Mouthpar1_B())
				Return()
			+ "Reset Mouth Parameter 1"
				human.Pose(ResetMouthParam(human, 1))
				Return()
			+ "^ | Horizontal"[gold]
				human.Pose(Mouthpar2_A())
				Return()
			+ "-"
				human.Pose(Mouthpar2_B())
				Return()
			+ "Reset Mouth Parameter 2"
				human.Pose(ResetMouthParam(human, 2))
				Return()
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "<color=#9a646f><i>Done."
		+ "Jaw Length.."[gold]
			+ "^ | Length"[gold]
				human.Pose(Mouthpar3_A())
				Return()
			+ "-"
				human.Pose(Mouthpar3_B())
				Return()
			+ "Reset Mouth Parameter 3"
				ResetMouthParam(human, 3)
				Return()
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "<color=#9a646f><i>Done."
		+ "Lips.." [gold]
			+ "Lip Top.."[gold]
				+ "^ | Top Right"[gold]
					human.Pose(Mouthpar4_A())
					Return()
				+ "-"
					human.Pose(Mouthpar4_B())
					Return()
				+ "Reset Mouth Parameter 4"
					ResetMouthParam(human, 4)
					Return()
				+ "^ | Top Left"[gold]
					human.Pose(Mouthpar5_A())
					Return()
				+ "-"
					human.Pose(Mouthpar5_B())
					Return()
				+ "Reset Mouth Parameter 5"
					ResetMouthParam(human, 5)
					Return()
				+ "^ | Both"[gold]
					human.Pose(Mouthpar4_A())
					human.Pose(Mouthpar5_A())
					Return()
				+ "-"
					human.Pose(Mouthpar4_B())
					human.Pose(Mouthpar5_B())
					Return()
				+ "<color=#54b095><i>Back."
					Return(2)
				+ "<color=#9a646f><i>Done."
			+ "Lip Bottom.."[gold]
				+ "^ | Bottom Right"[gold]
					human.Pose(Mouthpar6_A())
					Return()
				+ "-"
					human.Pose(Mouthpar6_B())
					Return()
				+ "Reset Mouth Parameter 6"
					ResetMouthParam(human, 6)
					Return()
				+ "^ | Bottom Left"[gold]
					human.Pose(Mouthpar7_A())
					Return()
				+ "-"
					human.Pose(Mouthpar7_B())
					Return()
				+ "Reset Mouth Parameter 7"
					ResetMouthParam(human, 7)
					Return()
				+ "^ | Both"[gold]
					human.Pose(Mouthpar6_A())
					human.Pose(Mouthpar7_A())
					Return()
				+ "-"
					human.Pose(Mouthpar6_B())
					human.Pose(Mouthpar7_B())
					Return()
				+ "<color=#54b095><i>Back."
					Return(2)
				+ "<color=#9a646f><i>Done."
			+ "Smile.."[gold]
				+ "^ | Right"[gold]
					human.Pose(Mouthpar8_A())
					Return()
				+ "-"
					human.Pose(Mouthpar8_B())
					Return()
				+ "Reset Mouth Parameter 8"
					ResetMouthParam(human, 8)
					Return()
				+ "^ | Left"[gold]
					human.Pose(Mouthpar9_A())
					Return()
				+ "-"
					human.Pose(Mouthpar9_B())
					Return()
				+ "Reset Mouth Parameter 9"
					ResetMouthParam(human, 9)
					Return()
				+ "^ | Both"[gold]
					human.Pose(Mouthpar8_A())
					human.Pose(Mouthpar9_A())
					Return()
				+ "-"
					human.Pose(Mouthpar8_B())
					human.Pose(Mouthpar9_B())
					Return()
				+ "<color=#54b095><i>Back."
					Return(2)
				+ "<color=#9a646f><i>Done."
			+ "Lip Horizontal.."[gold]
				+ "^ | Right"[gold]
					human.Pose(Mouthpar10_A())
					Return()
				+ "-"
					human.Pose(Mouthpar10_B())
					Return()
				+ "Reset Mouth Parameter 10"
					ResetMouthParam(human, 10)
					Return()
				+ "^ | Left"[gold]
					human.Pose(Mouthpar11_A())
					Return()
				+ "-"
					human.Pose(Mouthpar11_B())
					Return()
				+ "Reset Mouth Parameter 11"
					ResetMouthParam(human, 11)
					Return()
				+ "^ | Both"[gold]
					human.Pose(Mouthpar10_A())
					human.Pose(Mouthpar11_A())
					Return()
				+ "-"
					human.Pose(Mouthpar10_B())
					human.Pose(Mouthpar11_B())
					Return()
				+ "<color=#54b095><i>Back."
					Return(2)
				+ "<color=#9a646f><i>Done."
			+ "Lip Vertical.."[gold]
				+ "^ | Height"[gold]
					human.Pose(Mouthpar12_A())
					Return()
				+ "-"
					human.Pose(Mouthpar12_B())
					Return()
				+ "Reset Mouth Parameter 12"
					ResetMouthParam(human, 12)
					Return()
				+ "<color=#54b095><i>Back."
					Return(2)
				+ "<color=#9a646f><i>Done."
			+ "Lip Length / Curve.."[gold]
				+ "^ | Length"[gold]
					human.Pose(Mouthpar13_A())
					Return()
				+ "-"
					human.Pose(Mouthpar13_B())
					Return()
				+ "Reset Mouth Parameter 13"
					ResetMouthParam(human, 13)
					Return()
				+ "<color=#54b095><i>Back."
					Return(2)
				+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "<color=#9a646f><i>Done."
		+ "Tongue Length.."[gold]
			+ "^ | Length"[gold]
				human.Pose(Mouthpar14_A())
				Return()
			+ "-"
				human.Pose(Mouthpar14_B())
				Return()
			+ "Reset Mouth Parameter 14"
				ResetMouthParam(human, 14)
				Return()
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "<color=#9a646f><i>Done."
		+ "Tongue Horizontal / Vertical.."[gold]
			+ "^ | Horizontal"[gold]
				human.Pose(Mouthpar15_A())
				Return()
			+ "-"
				human.Pose(Mouthpar15_B())
				Return()
			+ "Reset Mouth Parameter 15"
				ResetMouthParam(human, 15)
				Return()
			+ "^ | Vertical"[gold]
				human.Pose(Mouthpar16_A())
				Return()
			+ "-"
				human.Pose(Mouthpar16_B())
				Return()
			+ "Reset Mouth Parameter 16"
				ResetMouthParam(human, 16)
				Return()
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "<color=#9a646f><i>Done."
		+ "Reset Mouth"
			human.Pose(ResetALLMouthParam(human))
			Return()
		+ "<color=#54b095><i>Back."
			Return(2)
		+ "<color=#9a646f><i>Done."
	+ "<color=#54b095><i>Back. | Increment = "  .. FACE_PARAM_INCREMENT .. ""
		Return(2)
	+ "<color=#9a646f><i>Done."
stop