label TMMenuFaceEdit(human)
	+ "Edit Cheeks.."[gold]
		+ "1. Left + 0.25"
			human.Pose(Cheekspar1_A())
			Return()
		+ "1. Left - 0.25"
			human.Pose(Cheekspar1_B())
			Return()
		+ "Reset Cheek Parameter 1" [gold]
			human.Pose(ResetCheeksParam(1))
			Return()
		+ "2. Right + 0.25"
			human.Pose(Cheekspar2_A())
			Return()
		+ "2. Right - 0.25"
			human.Pose(Cheekspar2_B())
			Return()
		+ "Reset Cheek Parameter 2" [gold]
			human.Pose(ResetCheeksParam(2))
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "Edit Brows.."[gold]
		+ "Right Brow.."[gold]
			+ "1. Right Inner + 0.25"
				human.Pose(Browspar1_A())
				Return()
			+ "1. Right Inner - 0.25"
				human.Pose(Browspar1_B())
				Return()
			+ "Reset Brows Parameter 1" [gold]
				human.Pose(ResetBrowsParam(1))
				Return()
			+ "3. Right Outer + 0.25"
				human.Pose(Browspar3_A())
				Return()
			+ "3. Right Outer - 0.25"
				human.Pose(Browspar3_B())
				Return()
			+ "Reset Brows Parameter 3" [gold]
				ResetBrowsParam(3)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Left Brow.."[gold]
			+ "2. Left Inner + 0.25"
				human.Pose(Browspar2_A())
				Return()
			+ "2. Left Inner - 0.25"
				human.Pose(Browspar2_B())
				Return()
			+ "Reset Brows Parameter 2" [gold]
				human.Pose(ResetBrowsParam(2))
				Return()
			+ "4. Left Outer + 0.25"
				human.Pose(Browspar4_A())
				Return()
			+ "4. Left Outer - 0.25"
				human.Pose(Browspar4_B())
				Return()
			+ "Reset Brows Parameter 4" [gold]
				ResetBrowsParam(4)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Both Brows.."[gold]
			+ "Left + 0.25"
				human.Pose(Browspar4_A())
				human.Pose(Browspar2_A())
				Return()
			+ "Left - 0.25"
				human.Pose(Browspar4_B())
				human.Pose(Browspar2_B())
				Return()
			+ "Right + 0.25"
				human.Pose(Browspar1_A())
				human.Pose(Browspar3_A())
				Return()
			+ "Right - 0.25"
				human.Pose(Browspar1_B())
				human.Pose(Browspar3_B())
				Return()
			+ " Inner + 0.25"
				human.Pose(Browspar1_A())
				human.Pose(Browspar2_A())
				Return()
			+ " Inner - 0.25"
				human.Pose(Browspar1_B())
				human.Pose(Browspar2_B())
				Return()
			+ " Outer + 0.25"
				human.Pose(Browspar3_A())
				human.Pose(Browspar4_A())
				Return()
			+ " Outer - 0.25"
				human.Pose(Browspar3_B())
				human.Pose(Browspar4_B())
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Raise"
			human.Pose(Browspar1_A())
			human.Pose(Browspar2_A())
			human.Pose(Browspar3_A())
			human.Pose(Browspar4_A())
			Return()
		+ "Lower"
			human.Pose(Browspar1_B())
			human.Pose(Browspar2_B())
			human.Pose(Browspar3_B())
			human.Pose(Browspar4_B())
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "Edit Mouth.."[gold]
		+ "Jaw V/H.."[gold]
			+ "1. Jaw V + 0.25"
				human.Pose(Mouthpar1_A())
				Return()
			+ "1. Jaw V - 0.25"
				human.Pose(Mouthpar1_B())
				Return()
			+ "Reset Mouth Parameter 1" [gold]
				human.Pose(ResetMouthParam(1))
				Return()
			+ "2. Jaw H + 0.25"[gold]
				human.Pose(Mouthpar2_A())
				Return()
			+ "2. Jaw H - 0.25"
				human.Pose(Mouthpar2_B())
				Return()
			+ "Reset Mouth Parameter 2" [gold]
				human.Pose(ResetMouthParam(2))
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Jaw Length.."[gold]
			+ "3. Jaw L + 0.25"
				human.Pose(Mouthpar3_A())
				Return()
			+ "3. Jaw L - 0.25"
				human.Pose(Mouthpar3_B())
				Return()
			+ "Reset Mouth Parameter 3" [gold]
				ResetMouthParam(3)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Lip Top.."[gold]
			+ "4. Lip TR + 0.25"
				human.Pose(Mouthpar4_A())
				Return()
			+ "4. Lip TR - 0.25"
				human.Pose(Mouthpar4_B())
				Return()
			+ "Reset Mouth Parameter 4" [gold]
				ResetMouthParam(4)
				Return()
			+ "5. Lip TL + 0.25"
				human.Pose(Mouthpar5_A())
				Return()
			+ "5. Lip TL - 0.25"
				human.Pose(Mouthpar5_B())
				Return()
			+ "Reset Mouth Parameter 5" [gold]
				ResetMouthParam(5)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Lip Bot.."[gold]
			+ "6. Lip BR + 0.25"
				human.Pose(Mouthpar6_A())
				Return()
			+ "6. Lip BR - 0.25"
				human.Pose(Mouthpar6_B())
				Return()
			+ "Reset Mouth Parameter 6" [gold]
				ResetMouthParam(6)
				Return()
			+ "7. Lip BL + 0.25"
				human.Pose(Mouthpar7_A())
				Return()
			+ "7. Lip BL - 0.25"
				human.Pose(Mouthpar7_B())
				Return()
			+ "Reset Mouth Parameter 7" [gold]
				ResetMouthParam(7)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Lip Width.."[gold]
			+ "10. Lip WR + 0.25"
				human.Pose(Mouthpar10_A())
				Return()
			+ "10. Lip WR - 0.25"
				human.Pose(Mouthpar10_B())
				Return()
			+ "Reset Mouth Parameter 10" [gold]
				ResetMouthParam(10)
				Return()
			+ "11. Lip WL + 0.25"
				human.Pose(Mouthpar11_A())
				Return()
			+ "11. Lip WL - 0.25"
				human.Pose(Mouthpar11_B())
				Return()
			+ "Reset Mouth Parameter 11" [gold]
				ResetMouthParam(11)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Lip Height.."[gold]
			+ "12. Pursed + 0.25"
				human.Pose(Mouthpar12_A())
				Return()
			+ "12. Pursed - 0.25"
				human.Pose(Mouthpar12_B())
				Return()
			+ "Reset Mouth Parameter 12" [gold]
				ResetMouthParam(12)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Tongue Length.."[gold]
			+ "14. Tongue L + 0.25"
				human.Pose(Mouthpar14_A())
				Return()
			+ "14. Tongue L - 0.25"
				human.Pose(Mouthpar14_B())
				Return()
			+ "Reset Mouth Parameter 14" [gold]
				ResetMouthParam(14)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Tongue V/H.."[gold]
			+ "15. Tongue H + 0.25"
				human.Pose(Mouthpar15_A())
				Return()
			+ "15. Tongue H - 0.25"
				human.Pose(Mouthpar15_B())
				Return()
			+ "Reset Mouth Parameter 15" [gold]
				ResetMouthParam(15)
				Return()
			+ "16. Tongue V + 0.25"
				human.Pose(Mouthpar16_A())
				Return()
			+ "16. Tongue V - 0.25"
				human.Pose(Mouthpar16_B())
				Return()
			+ "Reset Mouth Parameter 16" [gold]
				ResetMouthParam(16)
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Kiss.."[gold]
			+ "13. Pucker + 0.25"
				human.Pose(Mouthpar13_A())
				Return()
			+ "13. Pucker - 0.25"
				human.Pose(Mouthpar13_B())
				Return()
			+ "Reset Mouth Parameter 13" [gold]
				ResetMouthParam(13)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Smile.."[gold]
			+ "8. Smile R + 0.25"
				human.Pose(Mouthpar8_A())
				Return()
			+ "8. Smile R - 0.25"
				human.Pose(Mouthpar8_B())
				Return()
			+ "Reset Mouth Parameter 8" [gold]
				ResetMouthParam(8)
				Return()
			+ "9. Smile L + 0.25"
				human.Pose(Mouthpar9_A())
				Return()
			+ "9. Smile L - 0.25"
				human.Pose(Mouthpar9_B())
				Return()
			+ "Reset Mouth Parameter 9" [gold]
				ResetMouthParam(9)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
			+ "Neutral"
				play.pose(ResetALLMouthParam())
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "| BACK"
		Return(2)
	+ "| CLOSE"
stop