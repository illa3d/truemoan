-- FreemodeHG version 0.3 ~ fauna_LABS_v1.02 (partial menu extract)
---@diagnostic disable: exp-in-action, undefined-global, keyword, unknown-symbol, miss-end, miss-symbol, miss-exp, err-nonstandard-symbol, err-assign-as-eq, malformed-number
label TMMenuFaunaAnimLab(human, hitTri)
-- + "animationLAB.."[gold]
	+ "Info"
		-- human "Build your own animations in realtime! Also, penetration toggle can be good for licking scenes!"
		Return()
	+ if human.m_isMale == false
		+ "<color=#90ee90><i>Penetration is Turned On"
			human.m_isMale = true
			Return()
	+ if human.m_isMale == true
		+ "<color=#f08080><i>Penetration is Turned Off"
			human.m_isMale = false
			Return()
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------






---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	+ "Licking / Kissing"[gold]
		+ "Reset All"
			AnimInc_M1_Pose1 = 0 
			AnimInc_M1_Pose2 = 0
			AnimInc_M1_Pose3 = 0
			AnimInc_M1_Pose4 = 0
			AnimInc_M1_Pose5 = 0
			AnimInc_M1_Pose6 = 0
			AnimInc_M10_Pose1 = 0 
			AnimInc_M10_Pose2 = 0
			AnimInc_M10_Pose3 = 0
			AnimInc_M10_Pose4 = 0
			AnimInc_M10_Pose5 = 0
			AnimInc_M10_Pose6 = 0
			AnimInc_M11_Pose1 = 0 
			AnimInc_M11_Pose2 = 0
			AnimInc_M11_Pose3 = 0
			AnimInc_M11_Pose4 = 0
			AnimInc_M11_Pose5 = 0
			AnimInc_M11_Pose6 = 0
			AnimInc_M12_Pose1 = 0 
			AnimInc_M12_Pose2 = 0
			AnimInc_M12_Pose3 = 0
			AnimInc_M12_Pose4 = 0
			AnimInc_M12_Pose5 = 0
			AnimInc_M12_Pose6 = 0
			AnimInc_M13_Pose1 = 0 
			AnimInc_M13_Pose2 = 0
			AnimInc_M13_Pose3 = 0
			AnimInc_M13_Pose4 = 0
			AnimInc_M13_Pose5 = 0
			AnimInc_M13_Pose6 = 0
			AnimInc_M14_Pose1 = 0 
			AnimInc_M14_Pose2 = 0
			AnimInc_M14_Pose3 = 0
			AnimInc_M14_Pose4 = 0
			AnimInc_M14_Pose5 = 0
			AnimInc_M14_Pose6 = 0
			AnimInc_M15_Pose1 = 0 
			AnimInc_M15_Pose2 = 0
			AnimInc_M15_Pose3 = 0
			AnimInc_M15_Pose4 = 0
			AnimInc_M15_Pose5 = 0
			AnimInc_M15_Pose6 = 0
			AnimInc_M16_Pose1 = 0 
			AnimInc_M16_Pose2 = 0
			AnimInc_M16_Pose3 = 0
			AnimInc_M16_Pose4 = 0
			AnimInc_M16_Pose5 = 0
			AnimInc_M16_Pose6 = 0
			Return()
		+ "<color=#9a646f><i>Done."
		+ "<color=#54b095><i>Back."
			Return(2)
		+ "Start"
			activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
			game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV6(human, "rotate", activeloops[human.m_mouth], 
			Mouth(AnimInc_M1_Pose1, nil, nil, nil, nil, nil, nil, nil, nil, AnimInc_M10_Pose1, AnimInc_M11_Pose1, AnimInc_M12_Pose1, AnimInc_M13_Pose1, AnimInc_M14_Pose1, AnimInc_M15_Pose1, AnimInc_M16_Pose1), 
			Mouth(AnimInc_M1_Pose2, nil, nil, nil, nil, nil, nil, nil, nil, AnimInc_M10_Pose2, AnimInc_M11_Pose2, AnimInc_M12_Pose2, AnimInc_M13_Pose2, AnimInc_M14_Pose2, AnimInc_M15_Pose2, AnimInc_M16_Pose2), 
			Mouth(AnimInc_M1_Pose3, nil, nil, nil, nil, nil, nil, nil, nil, AnimInc_M10_Pose3, AnimInc_M11_Pose3, AnimInc_M12_Pose3, AnimInc_M13_Pose3, AnimInc_M14_Pose3, AnimInc_M15_Pose3, AnimInc_M16_Pose3), 
			Mouth(AnimInc_M1_Pose4, nil, nil, nil, nil, nil, nil, nil, nil, AnimInc_M10_Pose4, AnimInc_M11_Pose4, AnimInc_M12_Pose4, AnimInc_M13_Pose4, AnimInc_M14_Pose4, AnimInc_M15_Pose4, AnimInc_M16_Pose4), 
			Mouth(AnimInc_M1_Pose5, nil, nil, nil, nil, nil, nil, nil, nil, AnimInc_M10_Pose5, AnimInc_M11_Pose5, AnimInc_M12_Pose5, AnimInc_M13_Pose5, AnimInc_M14_Pose5, AnimInc_M15_Pose5, AnimInc_M16_Pose5), 
			Mouth(AnimInc_M1_Pose6, nil, nil, nil, nil, nil, nil, nil, nil, AnimInc_M10_Pose6, AnimInc_M11_Pose6, AnimInc_M12_Pose6, AnimInc_M13_Pose6, AnimInc_M14_Pose6, AnimInc_M15_Pose6, AnimInc_M16_Pose6)), 
			human.m_mouth)
			Return()
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------





---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "1=" .. AnimInc_M1_Pose1 .. " | " .. AnimInc_M10_Pose1 .. " | " .. AnimInc_M11_Pose1 .. " | " .. AnimInc_M12_Pose1 .. " | " .. AnimInc_M13_Pose1 .. " | " .. AnimInc_M14_Pose1 .. " | " .. AnimInc_M15_Pose1 .. " | " .. AnimInc_M16_Pose1 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 1"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_M1_Pose1 .. " | " .. AnimInc_M10_Pose1 .. " | " .. AnimInc_M11_Pose1 .. " | " .. AnimInc_M12_Pose1 .. " | " .. AnimInc_M13_Pose1 .. " | "  .. AnimInc_M14_Pose1 .. " | " .. AnimInc_M15_Pose1 .. " | " .. AnimInc_M16_Pose1 .. ""
				Return(2)
			+ "^ ~ Jaw - Vertical"
				AnimInc_M1_Pose1 = AnimInc_M1_Pose1 + 0.25
				Return()
			+ "-"
				AnimInc_M1_Pose1 = AnimInc_M1_Pose1 - 0.25
				Return()
			+ "Lips.."[gold]
				+ "<color=#9a646f><i>Done. | Pose 1"
				+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_M1_Pose1 .. " | " .. AnimInc_M10_Pose1 .. " | " .. AnimInc_M11_Pose1 .. " | " .. AnimInc_M12_Pose1 .. " | " .. AnimInc_M13_Pose1 .. " | "  .. AnimInc_M14_Pose1 .. " | " .. AnimInc_M15_Pose1 .. " | " .. AnimInc_M16_Pose1 .. ""
					Return(2)
				+ "^ ~ Lip - Horizontal - R"
					AnimInc_M10_Pose1 = AnimInc_M10_Pose1 + 0.25
					Return()
				+ "-"
					AnimInc_M10_Pose1 = AnimInc_M10_Pose1 - 0.25
					Return()
				+ "^ ~ Lip - Horizontal - L"
					AnimInc_M11_Pose1 = AnimInc_M11_Pose1 + 0.25
					Return()
				+ "-"
					AnimInc_M11_Pose1 = AnimInc_M11_Pose1 - 0.25
					Return()
				+ "^ ~ Lip - Vertical"
					AnimInc_M12_Pose1 = AnimInc_M12_Pose1 + 0.25
					Return()
				+ "-"
					AnimInc_M12_Pose1 = AnimInc_M12_Pose1 - 0.25
					Return()
				+ "^ ~ Lip - Length / Curve"
					AnimInc_M13_Pose1 = AnimInc_M13_Pose1 + 0.25
					Return()
				+ "-"
					AnimInc_M13_Pose1 = AnimInc_M13_Pose1 - 0.25
					Return()
			+ "^ ~ Tongue - Length"
				AnimInc_M14_Pose1 = AnimInc_M14_Pose1 + 0.25
				Return()
			+ "-"
				AnimInc_M14_Pose1 = AnimInc_M14_Pose1 - 0.25
				Return()
			+ "^ ~ Tongue - Horizontal"
				AnimInc_M15_Pose1 = AnimInc_M15_Pose1 + 0.25
				Return()
			+ "-"
				AnimInc_M15_Pose1 = AnimInc_M15_Pose1 - 0.25
				Return()
			+ "^ ~ Tongue - Vertical"
				AnimInc_M16_Pose1 = AnimInc_M16_Pose1 + 0.25
				Return()
			+ "-"
				AnimInc_M16_Pose1 = AnimInc_M16_Pose1 - 0.25
				Return()
		+ "2=" .. AnimInc_M1_Pose2 .. " | " .. AnimInc_M10_Pose2 .. " | " .. AnimInc_M11_Pose2 .. " | " .. AnimInc_M12_Pose2 .. " | " .. AnimInc_M13_Pose2 .. " | " .. AnimInc_M14_Pose2 .. " | " .. AnimInc_M15_Pose2 .. " | " .. AnimInc_M16_Pose2 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 2"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_M1_Pose2 .. " | " .. AnimInc_M10_Pose2 .. " | " .. AnimInc_M11_Pose2 .. " | " .. AnimInc_M12_Pose2 .. " | " .. AnimInc_M13_Pose2 .. " | " .. AnimInc_M14_Pose2 .. " | " .. AnimInc_M15_Pose2 .. " | " .. AnimInc_M16_Pose2 .. ""
				Return(2)
			+ "^ ~ Jaw"
				AnimInc_M1_Pose2 = AnimInc_M1_Pose2 + 0.25
				Return()
			+ "-"
				AnimInc_M1_Pose2 = AnimInc_M1_Pose2 - 0.25
				Return()
			+ "Lips.."[gold]
				+ "<color=#9a646f><i>Done. | Pose 2"
				+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_M1_Pose2 .. " | " .. AnimInc_M10_Pose2 .. " | " .. AnimInc_M11_Pose2 .. " | " .. AnimInc_M12_Pose2 .. " | " .. AnimInc_M13_Pose2 .. " | "  .. AnimInc_M14_Pose2 .. " | " .. AnimInc_M15_Pose2 .. " | " .. AnimInc_M16_Pose2 .. ""
					Return(2)
				+ "^ ~ Lip - Horizontal - R"
					AnimInc_M10_Pose2 = AnimInc_M10_Pose2 + 0.25
					Return()
				+ "-"
					AnimInc_M10_Pose2 = AnimInc_M10_Pose2 - 0.25
					Return()
				+ "^ ~ Lip - Horizontal - L"
					AnimInc_M11_Pose2 = AnimInc_M11_Pose2 + 0.25
					Return()
				+ "-"
					AnimInc_M11_Pose2 = AnimInc_M11_Pose2 - 0.25
					Return()
				+ "^ ~ Lip - Vertical"
					AnimInc_M12_Pose2 = AnimInc_M12_Pose2 + 0.25
					Return()
				+ "-"
					AnimInc_M12_Pose2 = AnimInc_M12_Pose2 - 0.25
					Return()
				+ "^ ~ Lip - Length / Curve"
					AnimInc_M13_Pose2 = AnimInc_M13_Pose2 + 0.25
					Return()
				+ "-"
					AnimInc_M13_Pose2 = AnimInc_M13_Pose2 - 0.25
					Return()
			+ "^ ~ Tongue - Length"
				AnimInc_M14_Pose2 = AnimInc_M14_Pose2 + 0.25
				Return()
			+ "-"
				AnimInc_M14_Pose2 = AnimInc_M14_Pose2 - 0.25
				Return()
			+ "^ ~ Tongue - Horizontal"
				AnimInc_M15_Pose2 = AnimInc_M15_Pose2 + 0.25
				Return()
			+ "-"
				AnimInc_M15_Pose2 = AnimInc_M15_Pose2 - 0.25
				Return()
			+ "^ ~ Tongue - Vertical"
				AnimInc_M16_Pose2 = AnimInc_M16_Pose2 + 0.25
				Return()
			+ "-"
				AnimInc_M16_Pose2 = AnimInc_M16_Pose2 - 0.25
				Return()
		+ "3=" .. AnimInc_M1_Pose3 .. " | " .. AnimInc_M10_Pose3 .. " | " .. AnimInc_M11_Pose3 .. " | " .. AnimInc_M12_Pose3 .. " | " .. AnimInc_M13_Pose3 .. " | " .. AnimInc_M14_Pose3 .. " | " .. AnimInc_M15_Pose3 .. " | " .. AnimInc_M16_Pose3 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 3"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_M1_Pose3 .. " | " .. AnimInc_M10_Pose3 .. " | " .. AnimInc_M11_Pose3 .. " | " .. AnimInc_M12_Pose3 .. " | " .. AnimInc_M13_Pose3 .. " | " .. AnimInc_M14_Pose3 .. " | " .. AnimInc_M15_Pose3 .. " | " .. AnimInc_M16_Pose3 .. ""
				Return(2)
			+ "^ ~ Jaw"
				AnimInc_M1_Pose3 = AnimInc_M1_Pose3 + 0.25
				Return()
			+ "-"
				AnimInc_M1_Pose3 = AnimInc_M1_Pose3 - 0.25
				Return()
			+ "Lips.."[gold]
				+ "<color=#9a646f><i>Done. | Pose 3"
				+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_M1_Pose3 .. " | " .. AnimInc_M10_Pose3 .. " | " .. AnimInc_M11_Pose3 .. " | " .. AnimInc_M12_Pose3 .. " | " .. AnimInc_M13_Pose3 .. " | "  .. AnimInc_M14_Pose3 .. " | " .. AnimInc_M15_Pose3 .. " | " .. AnimInc_M16_Pose3 .. ""
					Return(2)
				+ "^ ~ Lip - Horizontal - R"
					AnimInc_M10_Pose3 = AnimInc_M10_Pose3 + 0.25
					Return()
				+ "-"
					AnimInc_M10_Pose3 = AnimInc_M10_Pose3 - 0.25
					Return()
				+ "^ ~ Lip - Horizontal - L"
					AnimInc_M11_Pose3 = AnimInc_M11_Pose3 + 0.25
					Return()
				+ "-"
					AnimInc_M11_Pose3 = AnimInc_M11_Pose3 - 0.25
					Return()
				+ "^ ~ Lip - Vertical"
					AnimInc_M12_Pose3 = AnimInc_M12_Pose3 + 0.25
					Return()
				+ "-"
					AnimInc_M12_Pose3 = AnimInc_M12_Pose3 - 0.25
					Return()
				+ "^ ~ Lip - Length / Curve"
					AnimInc_M13_Pose3 = AnimInc_M13_Pose3 + 0.25
					Return()
				+ "-"
					AnimInc_M13_Pose3 = AnimInc_M13_Pose3 - 0.25
						Return()
			+ "^ ~ Length"
				AnimInc_M14_Pose3 = AnimInc_M14_Pose3 + 0.25
				Return()
			+ "-"
				AnimInc_M14_Pose3 = AnimInc_M14_Pose3 - 0.25
				Return()						
			+ "^ ~ Horizontal"
				AnimInc_M15_Pose3 = AnimInc_M15_Pose3 + 0.25
				Return()
			+ "-"
				AnimInc_M15_Pose3 = AnimInc_M15_Pose3 - 0.25
				Return()					
			+ "^ ~ Vertical"
				AnimInc_M16_Pose3 = AnimInc_M16_Pose3 + 0.25
				Return()
			+ "-"
				AnimInc_M16_Pose3 = AnimInc_M16_Pose3 - 0.25
				Return()
		+ "4=" .. AnimInc_M1_Pose4 .. " | " .. AnimInc_M10_Pose4 .. " | " .. AnimInc_M11_Pose4 .. " | " .. AnimInc_M12_Pose4 .. " | " .. AnimInc_M13_Pose4 .. " | " .. AnimInc_M14_Pose4 .. " | " .. AnimInc_M15_Pose4 .. " | " .. AnimInc_M16_Pose4 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 4"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_M1_Pose4 .. " | " .. AnimInc_M10_Pose4 .. " | " .. AnimInc_M11_Pose4 .. " | " .. AnimInc_M12_Pose4 .. " | " .. AnimInc_M13_Pose4 .. " | " .. AnimInc_M14_Pose4 .. " | " .. AnimInc_M15_Pose4 .. " | " .. AnimInc_M16_Pose4 .. ""
				Return(2)
			+ "^ ~ Jaw"
				AnimInc_M1_Pose4 = AnimInc_M1_Pose4 + 0.25
				Return()
			+ "-"
				AnimInc_M1_Pose4 = AnimInc_M1_Pose4 - 0.25
				Return()
			+ "Lips.."[gold]
				+ "<color=#9a646f><i>Done. | Pose 4"
				+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_M1_Pose4 .. " | " .. AnimInc_M10_Pose4 .. " | " .. AnimInc_M11_Pose4 .. " | " .. AnimInc_M12_Pose4 .. " | " .. AnimInc_M13_Pose4 .. " | "  .. AnimInc_M14_Pose4 .. " | " .. AnimInc_M15_Pose4 .. " | " .. AnimInc_M16_Pose4 .. ""
					Return(2)
				+ "^ ~ Lip - Horizontal - R"
					AnimInc_M10_Pose4 = AnimInc_M10_Pose4 + 0.25
					Return()
				+ "-"
					AnimInc_M10_Pose4 = AnimInc_M10_Pose4 - 0.25
					Return()
				+ "^ ~ Lip - Horizontal - L"
					AnimInc_M11_Pose4 = AnimInc_M11_Pose4 + 0.25
					Return()
				+ "-"
					AnimInc_M11_Pose4 = AnimInc_M11_Pose4 - 0.25
					Return()
				+ "^ ~ Lip - Vertical"
					AnimInc_M12_Pose4 = AnimInc_M12_Pose4 + 0.25
					Return()
				+ "-"
					AnimInc_M12_Pose4 = AnimInc_M12_Pose4 - 0.25
					Return()
				+ "^ ~ Lip - Length / Curve"
					AnimInc_M13_Pose4 = AnimInc_M13_Pose4 + 0.25
					Return()
				+ "-"
					AnimInc_M13_Pose4 = AnimInc_M13_Pose4 - 0.25
					Return()
			+ "^ ~ Length"
				AnimInc_M14_Pose4 = AnimInc_M14_Pose4 + 0.25
				Return()
			+ "-"
				AnimInc_M14_Pose4 = AnimInc_M14_Pose4 - 0.25
				Return()
			+ "^ ~ Horizontal"
				AnimInc_M15_Pose4 = AnimInc_M15_Pose4 + 0.25
				Return()
			+ "-"
				AnimInc_M15_Pose4 = AnimInc_M15_Pose4 - 0.25
				Return()
			+ "^ ~ Vertical"
				AnimInc_M16_Pose4 = AnimInc_M16_Pose4 + 0.25
				Return()
			+ "-"
				AnimInc_M16_Pose4 = AnimInc_M16_Pose4 - 0.25
				Return()
		+ "5=" .. AnimInc_M1_Pose5 .. " | " .. AnimInc_M10_Pose5 .. " | " .. AnimInc_M11_Pose5 .. " | " .. AnimInc_M12_Pose5 .. " | " .. AnimInc_M13_Pose5 .. " | " .. AnimInc_M14_Pose5 .. " | " .. AnimInc_M15_Pose5 .. " | " .. AnimInc_M16_Pose5 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 5"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_M1_Pose5 .. " | " .. AnimInc_M10_Pose5 .. " | " .. AnimInc_M11_Pose5 .. " | " .. AnimInc_M12_Pose5 .. " | " .. AnimInc_M13_Pose5 .. " | " .. AnimInc_M14_Pose5 .. " | " .. AnimInc_M15_Pose5 .. " | " .. AnimInc_M16_Pose5 .. ""
				Return(2)
			+ "^ ~ Jaw"
				AnimInc_M1_Pose5 = AnimInc_M1_Pose5 + 0.25
				Return()
			+ "-"
				AnimInc_M1_Pose5 = AnimInc_M1_Pose5 - 0.25
				Return()
			+ "Lips.."[gold]
				+ "<color=#9a646f><i>Done. | Pose 5"
				+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_M1_Pose5 .. " | " .. AnimInc_M10_Pose5 .. " | " .. AnimInc_M11_Pose5 .. " | " .. AnimInc_M12_Pose5 .. " | " .. AnimInc_M13_Pose5 .. " | "  .. AnimInc_M14_Pose5 .. " | " .. AnimInc_M15_Pose5 .. " | " .. AnimInc_M16_Pose5 .. ""
					Return(2)
				+ "^ ~ Lip - Horizontal - R"
					AnimInc_M10_Pose5 = AnimInc_M10_Pose5 + 0.25
					Return()
				+ "-"
					AnimInc_M10_Pose5 = AnimInc_M10_Pose5 - 0.25
					Return()
				+ "^ ~ Lip - Horizontal - L"
					AnimInc_M11_Pose5 = AnimInc_M11_Pose5 + 0.25
					Return()
				+ "-"
					AnimInc_M11_Pose5 = AnimInc_M11_Pose5 - 0.25
					Return()
				+ "^ ~ Lip - Vertical"
					AnimInc_M12_Pose5 = AnimInc_M12_Pose5 + 0.25
					Return()
				+ "-"
					AnimInc_M12_Pose5 = AnimInc_M12_Pose5 - 0.25
					Return()
				+ "^ ~ Lip - Length / Curve"
					AnimInc_M13_Pose5 = AnimInc_M13_Pose5 + 0.25
					Return()
				+ "-"
					AnimInc_M13_Pose5 = AnimInc_M13_Pose5 - 0.25
					Return()
			+ "^ ~ Length"
				AnimInc_M14_Pose5 = AnimInc_M14_Pose5 + 0.25
				Return()
			+ "-"
				AnimInc_M14_Pose5 = AnimInc_M14_Pose5 - 0.25
				Return()
			+ "^ ~ Horizontal"
				AnimInc_M15_Pose5 = AnimInc_M15_Pose5 + 0.25
				Return()
			+ "-"
				AnimInc_M15_Pose5 = AnimInc_M15_Pose5 - 0.25
				Return()
			+ "^ ~ Vertical"
				AnimInc_M16_Pose5 = AnimInc_M16_Pose5 + 0.25
				Return()
			+ "-"
				AnimInc_M16_Pose5 = AnimInc_M16_Pose5 - 0.25
				Return()
		+ "6=" .. AnimInc_M1_Pose6 .. " | " .. AnimInc_M10_Pose6 .. " | " .. AnimInc_M11_Pose6 .. " | " .. AnimInc_M12_Pose6 .. " | " .. AnimInc_M13_Pose6 .. " | " .. AnimInc_M14_Pose6 .. " | " .. AnimInc_M15_Pose6 .. " | " .. AnimInc_M16_Pose6 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 6"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_M1_Pose6 .. " | " .. AnimInc_M10_Pose6 .. " | " .. AnimInc_M11_Pose6 .. " | " .. AnimInc_M12_Pose6 .. " | " .. AnimInc_M13_Pose6 .. " | " .. AnimInc_M14_Pose6 .. " | " .. AnimInc_M15_Pose6 .. " | " .. AnimInc_M16_Pose6 .. ""
				Return(2)
			+ "^ ~ Jaw"
				AnimInc_M1_Pose6 = AnimInc_M1_Pose6 + 0.25
				Return()
			+ "-"
				AnimInc_M1_Pose6 = AnimInc_M1_Pose6 - 0.25
				Return()
			+ "Lips.."[gold]
				+ "<color=#9a646f><i>Done. | Pose 6"
				+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_M1_Pose6 .. " | " .. AnimInc_M10_Pose6 .. " | " .. AnimInc_M11_Pose6 .. " | " .. AnimInc_M12_Pose6 .. " | " .. AnimInc_M13_Pose6 .. " | "  .. AnimInc_M14_Pose6 .. " | " .. AnimInc_M15_Pose6 .. " | " .. AnimInc_M16_Pose6 .. ""
					Return(2)
				+ "^ ~ Lip - Horizontal - R"
					AnimInc_M10_Pose6 = AnimInc_M10_Pose6 + 0.25
					Return()
				+ "-"
					AnimInc_M10_Pose6 = AnimInc_M10_Pose6 - 0.25
					Return()
				+ "^ ~ Lip - Horizontal - L"
					AnimInc_M11_Pose6 = AnimInc_M11_Pose6 + 0.25
					Return()
				+ "-"
					AnimInc_M11_Pose6 = AnimInc_M11_Pose6 - 0.25
					Return()
				+ "^ ~ Lip - Vertical"
					AnimInc_M12_Pose6 = AnimInc_M12_Pose6 + 0.25
					Return()
				+ "-"
					AnimInc_M12_Pose6 = AnimInc_M12_Pose6 - 0.25
					Return()
				+ "^ ~ Lip - Length / Curve"
					AnimInc_M13_Pose6 = AnimInc_M13_Pose6 + 0.25
					Return()
				+ "-"
					AnimInc_M13_Pose6 = AnimInc_M13_Pose6 - 0.25
					Return()
			+ "^ ~ Length"
				AnimInc_M14_Pose6 = AnimInc_M14_Pose6 + 0.25
				Return()
			+ "-"
				AnimInc_M14_Pose6 = AnimInc_M14_Pose6 - 0.25
				Return()
			+ "^ ~ Horizontal"
				AnimInc_M15_Pose6 = AnimInc_M15_Pose6 + 0.25
				Return()
			+ "-"
				AnimInc_M15_Pose6 = AnimInc_M15_Pose6 - 0.25
				Return()
			+ "^ ~ Vertical"
				AnimInc_M16_Pose6 = AnimInc_M16_Pose6 + 0.25
				Return()
			+ "-"
				AnimInc_M16_Pose6 = AnimInc_M16_Pose6 - 0.25
				Return()
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "speedLAB.."[gold]
			+ "Reset | Ease In"[gold]
				CLV_A = 2
				Return()
			+ "Reset | Ease Out"[gold]
				CLV_B = 2
				Return()
			+ "Reset | Anim Speed"[gold]
				CL_SMult = 1
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "^ | Ease In = " .. CLV_A .. ""[gold]
				CLV_A = CLV_A + Faun_EaseIncrement
				Return()
			+ "-"
				CLV_A = CLV_A - Faun_EaseIncrement
				Return()
			+ "^ | Ease Out = " .. CLV_B .. ""[gold]
				CLV_B = CLV_B + Faun_EaseIncrement
				Return()
			+ "-"
				CLV_B = CLV_B - Faun_EaseIncrement
				Return()
			+ "^ | speed = " .. CL_SMult .. ""[gold]
				CL_SMult = CL_SMult + Faun_SpeedIncrement
				Return()
			+ "-"
				CL_SMult = CL_SMult - Faun_SpeedIncrement
				Return()
		+ "Stop Licking" [if game.HasAnim(human.m_mouth) == true]
			game.RemoveAnim(human.m_mouth)
			Return()
		+ "Info"
			-- human "Screenshot your values with F10 and build your own custom animation afterwards! Tutorial in /Mods folder~"
			Return()
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------





---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	+ "Head"[gold]
		+ "Reset All"
			AnimInc_Head1_Pose1 = 0.03
			AnimInc_Head1_Pose2 = 0.03
			AnimInc_Head1_Pose3 = 0.03
			AnimInc_Head1_Pose4 = 0.03
			AnimInc_Head2_Pose1 = 1
			AnimInc_Head2_Pose2 = 1
			AnimInc_Head2_Pose3 = 1
			AnimInc_Head2_Pose4 = 1
			AnimInc_Head3_Pose1 = 0.141
			AnimInc_Head3_Pose2 = 0.141
			AnimInc_Head3_Pose3 = 0.141
			AnimInc_Head3_Pose4 = 0.141
		+ "<color=#9a646f><i>Done."
		+ "<color=#54b095><i>Back."
			Return(2)
		+ "Start"
			activeloops[human.spineNames] = 0.6/CL_SMult*3
			game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV4(human, "Modular Head", activeloops[human.spineNames], 
			Head(AnimInc_Head1_Pose1, AnimInc_Head2_Pose1, AnimInc_Head3_Pose1), 
			Head(AnimInc_Head1_Pose2, AnimInc_Head2_Pose2, AnimInc_Head3_Pose2), 
			Head(AnimInc_Head1_Pose3, AnimInc_Head2_Pose3, AnimInc_Head3_Pose3), 
			Head(AnimInc_Head1_Pose4, AnimInc_Head2_Pose4, AnimInc_Head3_Pose4)), human.spineNames)
			Return()
		+ "Pose 1 = " .. AnimInc_Head1_Pose1 .. " | " .. AnimInc_Head2_Pose1 .. " | " .. AnimInc_Head3_Pose1 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 1"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_Head1_Pose1 .. " | " .. AnimInc_Head2_Pose1 .. " | " .. AnimInc_Head3_Pose1 .. ""
				Return(2)
			+ "^ ~ Vertical"
				AnimInc_Head1_Pose1 = AnimInc_Head1_Pose1 + 0.1
				Return()
			+ "-"
				AnimInc_Head1_Pose1 = AnimInc_Head1_Pose1 - 0.1
				Return()
			+ "^ ~ Horizontal"
				AnimInc_Head2_Pose1 = AnimInc_Head2_Pose1 + 0.1
				Return()
			+ "-"
				AnimInc_Head2_Pose1 = AnimInc_Head2_Pose1 - 0.1
				Return()
			+ "^ ~ Rotation"
				AnimInc_Head3_Pose1 = AnimInc_Head3_Pose1 + 0.1
				Return()
			+ "-"
				AnimInc_Head3_Pose1 = AnimInc_Head3_Pose1 - 0.1
				Return()
		+ "Pose 2 = " .. AnimInc_Head1_Pose2 .. " | " .. AnimInc_Head2_Pose2 .. " | " .. AnimInc_Head3_Pose2 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 2"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_Head1_Pose2 .. " | " .. AnimInc_Head2_Pose2 .. " | " .. AnimInc_Head3_Pose2 .. ""
				Return(2)
			+ "^ ~ Vertical"
				AnimInc_Head1_Pose2 = AnimInc_Head1_Pose2 + 0.1
				Return()
			+ "-"
				AnimInc_Head1_Pose2 = AnimInc_Head1_Pose2 - 0.1
				Return()
			+ "^ ~ Horizontal"
				AnimInc_Head2_Pose2 = AnimInc_Head2_Pose2 + 0.1
				Return()
			+ "-"
				AnimInc_Head2_Pose2 = AnimInc_Head2_Pose2 - 0.1
				Return()
			+ "^ ~ Rotation"
				AnimInc_Head3_Pose2 = AnimInc_Head3_Pose2 + 0.1
				Return()
			+ "-"
				AnimInc_Head3_Pose2 = AnimInc_Head3_Pose2 - 0.1
				Return()
		+ "Pose 3 = " .. AnimInc_Head1_Pose3 .. " | " .. AnimInc_Head2_Pose3 .. " | " .. AnimInc_Head3_Pose3 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 3"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_Head1_Pose3 .. " | " .. AnimInc_Head2_Pose3 .. " | " .. AnimInc_Head3_Pose3 .. ""
				Return(2)
			+ "^ ~ Vertical"
				AnimInc_Head1_Pose3 = AnimInc_Head1_Pose3 + 0.1
				Return()
			+ "-"
				AnimInc_Head1_Pose3 = AnimInc_Head1_Pose3 - 0.1
				Return()						
			+ "^ ~ Horizontal"
				AnimInc_Head2_Pose3 = AnimInc_Head2_Pose3 + 0.1
				Return()
			+ "-"
				AnimInc_Head2_Pose3 = AnimInc_Head2_Pose3 - 0.1
				Return()					
			+ "^ ~ Rotation"
				AnimInc_Head3_Pose3 = AnimInc_Head3_Pose3 + 0.1
				Return()
			+ "-"
				AnimInc_Head3_Pose3 = AnimInc_Head3_Pose3 - 0.1
				Return()
		+ "Pose 4 = " .. AnimInc_Head1_Pose4 .. " | " .. AnimInc_Head2_Pose4 .. " | " .. AnimInc_Head3_Pose4 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 4"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_Head1_Pose4 .. " | " .. AnimInc_Head2_Pose4 .. " | " .. AnimInc_Head3_Pose4 .. ""
				Return(2)
			+ "^ ~ Vertical"
				AnimInc_Head1_Pose4 = AnimInc_Head1_Pose4 + 0.1
				Return()
			+ "-"
				AnimInc_Head1_Pose4 = AnimInc_Head1_Pose4 - 0.1
				Return()
			+ "^ ~ Horizontal"
				AnimInc_Head2_Pose4 = AnimInc_Head2_Pose4 + 0.1
				Return()
			+ "-"
				AnimInc_Head2_Pose4 = AnimInc_Head2_Pose4 - 0.1
				Return()
			+ "^ ~ Rotation"
				AnimInc_Head3_Pose4 = AnimInc_Head3_Pose4 + 0.1
				Return()
			+ "-"
				AnimInc_Head3_Pose4 = AnimInc_Head3_Pose4 - 0.1
				Return()
		+ "speedLAB.."[gold]
			+ "Reset | Ease In"[gold]
				CLV_A = 2
				Return()
			+ "Reset | Ease Out"[gold]
				CLV_B = 2
				Return()
			+ "Reset | Anim Speed"[gold]
				CL_SMult = 1
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "^ | Ease In = " .. CLV_A .. ""[gold]
				CLV_A = CLV_A + Faun_EaseIncrement
				Return()
			+ "-"
				CLV_A = CLV_A - Faun_EaseIncrement
				Return()
			+ "^ | Ease Out = " .. CLV_B .. ""[gold]
				CLV_B = CLV_B + Faun_EaseIncrement
				Return()
			+ "-"
				CLV_B = CLV_B - Faun_EaseIncrement
				Return()
			+ "^ | speed = " .. CL_SMult .. ""[gold]
				CL_SMult = CL_SMult + Faun_SpeedIncrement
				Return()
			+ "-"
				CL_SMult = CL_SMult - Faun_SpeedIncrement
				Return()
		+ "Stop head" [if game.HasAnim(human.spineNames) == true]
			game.RemoveAnim(human.spineNames)
			Return()
		+ "Info"
			-- human "Screenshot your values with F10 and build your own custom animation afterwards! Tutorial in /Mods folder~"
			Return()
	+ "Neck"[gold]
		+ "Reset All"
			AnimInc_HeadRot1_Pose1 = 0
			AnimInc_HeadRot1_Pose2 = 0
			AnimInc_HeadRot1_Pose3 = 0
			AnimInc_HeadRot1_Pose4 = 0
			AnimInc_HeadRot2_Pose1 = 0
			AnimInc_HeadRot2_Pose2 = 0
			AnimInc_HeadRot2_Pose3 = 0
			AnimInc_HeadRot2_Pose4 = 0
			AnimInc_HeadRot3_Pose1 = 0
			AnimInc_HeadRot3_Pose2 = 0
			AnimInc_HeadRot3_Pose3 = 0
			AnimInc_HeadRot3_Pose4 = 0
		+ "<color=#9a646f><i>Done."
		+ "<color=#54b095><i>Back."
			Return(2)
		+ "Start"
			activeloops[human.headNames] = 0.3/CL_SMult*2.5
			game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV4(human, "Modular Neck", activeloops[human.headNames], 
			HeadRot(AnimInc_HeadRot1_Pose1, AnimInc_HeadRot2_Pose1, AnimInc_HeadRot3_Pose1), 
			HeadRot(AnimInc_HeadRot1_Pose2, AnimInc_HeadRot2_Pose2, AnimInc_HeadRot3_Pose2), 
			HeadRot(AnimInc_HeadRot1_Pose3, AnimInc_HeadRot2_Pose3, AnimInc_HeadRot3_Pose3), 
			HeadRot(AnimInc_HeadRot1_Pose4, AnimInc_HeadRot2_Pose4, AnimInc_HeadRot3_Pose4)), human.headNames)
			Return()
		+ "Pose 1 = " .. AnimInc_HeadRot1_Pose1 .. " | " .. AnimInc_HeadRot2_Pose1 .. " | " .. AnimInc_HeadRot3_Pose1 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 1"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_HeadRot1_Pose1 .. " | " .. AnimInc_HeadRot2_Pose1 .. " | " .. AnimInc_HeadRot3_Pose1 .. ""
				Return(2)
			+ "^ ~ Vertical"
				AnimInc_HeadRot1_Pose1 = AnimInc_HeadRot1_Pose1 + 2.5
				Return()
			+ "-"
				AnimInc_HeadRot1_Pose1 = AnimInc_HeadRot1_Pose1 - 2.5
				Return()
			+ "^ ~ Horizontal"
				AnimInc_HeadRot2_Pose1 = AnimInc_HeadRot2_Pose1 + 2.5
				Return()
			+ "-"
				AnimInc_HeadRot2_Pose1 = AnimInc_HeadRot2_Pose1 - 2.5
				Return()
			+ "^ ~ Rotation"
				AnimInc_HeadRot3_Pose1 = AnimInc_HeadRot3_Pose1 + 2.5
				Return()
			+ "-"
				AnimInc_HeadRot3_Pose1 = AnimInc_HeadRot3_Pose1 - 2.5
				Return()
		+ "Pose 2 = " .. AnimInc_HeadRot1_Pose2 .. " | " .. AnimInc_HeadRot2_Pose2 .. " | " .. AnimInc_HeadRot3_Pose2 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 2"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_HeadRot1_Pose2 .. " | " .. AnimInc_HeadRot2_Pose2 .. " | " .. AnimInc_HeadRot3_Pose2 .. ""
				Return(2)
			+ "^ ~ Vertical"
				AnimInc_HeadRot1_Pose2 = AnimInc_HeadRot1_Pose2 + 2.5
				Return()
			+ "-"
				AnimInc_HeadRot1_Pose2 = AnimInc_HeadRot1_Pose2 - 2.5
				Return()
			+ "^ ~ Horizontal"
				AnimInc_HeadRot2_Pose2 = AnimInc_HeadRot2_Pose2 + 2.5
				Return()
			+ "-"
				AnimInc_HeadRot2_Pose2 = AnimInc_HeadRot2_Pose2 - 2.5
				Return()
			+ "^ ~ Rotation"
				AnimInc_HeadRot3_Pose2 = AnimInc_HeadRot3_Pose2 + 2.5
				Return()
			+ "-"
				AnimInc_HeadRot3_Pose2 = AnimInc_HeadRot3_Pose2 - 2.5
				Return()
		+ "Pose 3 = " .. AnimInc_HeadRot1_Pose3 .. " | " .. AnimInc_HeadRot2_Pose3 .. " | " .. AnimInc_HeadRot3_Pose3 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 3"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_HeadRot1_Pose3 .. " | " .. AnimInc_HeadRot2_Pose3 .. " | " .. AnimInc_HeadRot3_Pose3 .. ""
				Return(2)
			+ "^ ~ Vertical"
				AnimInc_HeadRot1_Pose3 = AnimInc_HeadRot1_Pose3 + 2.5
				Return()
			+ "-"
				AnimInc_HeadRot1_Pose3 = AnimInc_HeadRot1_Pose3 - 2.5
				Return()						
			+ "^ ~ Horizontal"
				AnimInc_HeadRot2_Pose3 = AnimInc_HeadRot2_Pose3 + 2.5
				Return()
			+ "-"
				AnimInc_HeadRot2_Pose3 = AnimInc_HeadRot2_Pose3 - 2.5
				Return()					
			+ "^ ~ Rotation"
				AnimInc_HeadRot3_Pose3 = AnimInc_HeadRot3_Pose3 + 2.5
				Return()
			+ "-"
				AnimInc_HeadRot3_Pose3 = AnimInc_HeadRot3_Pose3 - 2.5
				Return()
		+ "Pose 4 = " .. AnimInc_HeadRot1_Pose4 .. " | " .. AnimInc_HeadRot2_Pose4 .. " | " .. AnimInc_HeadRot3_Pose4 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 4"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_HeadRot1_Pose4 .. " | " .. AnimInc_HeadRot2_Pose4 .. " | " .. AnimInc_HeadRot3_Pose4 .. ""
				Return(2)
			+ "^ ~ Vertical"
				AnimInc_HeadRot1_Pose4 = AnimInc_HeadRot1_Pose4 + 2.5
				Return()
			+ "-"
				AnimInc_HeadRot1_Pose4 = AnimInc_HeadRot1_Pose4 - 2.5
				Return()
			+ "^ ~ Horizontal"
				AnimInc_HeadRot2_Pose4 = AnimInc_HeadRot2_Pose4 + 2.5
				Return()
			+ "-"
				AnimInc_HeadRot2_Pose4 = AnimInc_HeadRot2_Pose4 - 2.5
				Return()
			+ "^ ~ Rotation"
				AnimInc_HeadRot3_Pose4 = AnimInc_HeadRot3_Pose4 + 2.5
				Return()
			+ "-"
				AnimInc_HeadRot3_Pose4 = AnimInc_HeadRot3_Pose4 - 2.5
				Return()
		+ "speedLAB.."[gold]
			+ "Reset | Ease In"[gold]
				CLV_A = 2
				Return()
			+ "Reset | Ease Out"[gold]
				CLV_B = 2
				Return()
			+ "Reset | Anim Speed"[gold]
				CL_SMult = 1
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "^ | Ease In = " .. CLV_A .. ""[gold]
				CLV_A = CLV_A + Faun_EaseIncrement
				Return()
			+ "-"
				CLV_A = CLV_A - Faun_EaseIncrement
				Return()
			+ "^ | Ease Out = " .. CLV_B .. ""[gold]
				CLV_B = CLV_B + Faun_EaseIncrement
				Return()
			+ "-"
				CLV_B = CLV_B - Faun_EaseIncrement
				Return()
			+ "^ | speed = " .. CL_SMult .. ""[gold]
				CL_SMult = CL_SMult + Faun_SpeedIncrement
				Return()
			+ "-"
				CL_SMult = CL_SMult - Faun_SpeedIncrement
				Return()
		+ "Stop head" [if game.HasAnim(human.headNames) == true]
			game.RemoveAnim(human.headNames)
			Return()
		+ "Info"
			-- human "Screenshot your values with F10 and build your own custom animation afterwards! Tutorial in /Mods folder~"
			Return()
	+ "Hips"[gold]
		+ "Reset All"
			AnimInc_HipsRot1_Pose1 = 0
			AnimInc_HipsRot1_Pose2 = 0
			AnimInc_HipsRot1_Pose3 = 0
			AnimInc_HipsRot1_Pose4 = 0
			AnimInc_HipsRot2_Pose1 = 0
			AnimInc_HipsRot2_Pose2 = 0
			AnimInc_HipsRot2_Pose3 = 0
			AnimInc_HipsRot2_Pose4 = 0
			AnimInc_HipsRot3_Pose1 = 0
			AnimInc_HipsRot3_Pose2 = 0
			AnimInc_HipsRot3_Pose3 = 0
			AnimInc_HipsRot3_Pose4 = 0
		+ "<color=#9a646f><i>Done."
		+ "<color=#54b095><i>Back."
			Return(2)
		+ "Start"
			activeloops[human] = 0.3/CL_SMult*2.5
			game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV4(human, "Modular Hips", activeloops[human], 
			HipsRot(AnimInc_HipsRot1_Pose1, AnimInc_HipsRot2_Pose1, AnimInc_HipsRot3_Pose1), 
			HipsRot(AnimInc_HipsRot1_Pose2, AnimInc_HipsRot2_Pose2, AnimInc_HipsRot3_Pose2), 
			HipsRot(AnimInc_HipsRot1_Pose3, AnimInc_HipsRot2_Pose3, AnimInc_HipsRot3_Pose3), 
			HipsRot(AnimInc_HipsRot1_Pose4, AnimInc_HipsRot2_Pose4, AnimInc_HipsRot3_Pose4)), human)
			Return()
		+ "Pose 1 = " .. AnimInc_HipsRot1_Pose1 .. " | " .. AnimInc_HipsRot2_Pose1 .. " | " .. AnimInc_HipsRot3_Pose1 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 1"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_HipsRot1_Pose1 .. " | " .. AnimInc_HipsRot2_Pose1 .. " | " .. AnimInc_HipsRot3_Pose1 .. ""
				Return(2)
			+ "^ ~ Length"
				AnimInc_HipsRot1_Pose1 = AnimInc_HipsRot1_Pose1 + 5
				Return()
			+ "-"
				AnimInc_HipsRot1_Pose1 = AnimInc_HipsRot1_Pose1 - 5
				Return()
			+ "^ ~ Horizontal"
				AnimInc_HipsRot2_Pose1 = AnimInc_HipsRot2_Pose1 + 5
				Return()
			+ "-"
				AnimInc_HipsRot2_Pose1 = AnimInc_HipsRot2_Pose1 - 5
				Return()
			+ "^ ~ Vertical"
				AnimInc_HipsRot3_Pose1 = AnimInc_HipsRot3_Pose1 + 5
				Return()
			+ "-"
				AnimInc_HipsRot3_Pose1 = AnimInc_HipsRot3_Pose1 - 5
				Return()
		+ "Pose 2 = " .. AnimInc_HipsRot1_Pose2 .. " | " .. AnimInc_HipsRot2_Pose2 .. " | " .. AnimInc_HipsRot3_Pose2 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 2"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_HipsRot1_Pose2 .. " | " .. AnimInc_HipsRot2_Pose2 .. " | " .. AnimInc_HipsRot3_Pose2 .. ""
				Return(2)
			+ "^ ~ Length"
				AnimInc_HipsRot1_Pose2 = AnimInc_HipsRot1_Pose2 + 5
				Return()
			+ "-"
				AnimInc_HipsRot1_Pose2 = AnimInc_HipsRot1_Pose2 - 5
				Return()
			+ "^ ~ Horizontal"
				AnimInc_HipsRot2_Pose2 = AnimInc_HipsRot2_Pose2 + 5
				Return()
			+ "-"
				AnimInc_HipsRot2_Pose2 = AnimInc_HipsRot2_Pose2 - 5
				Return()
			+ "^ ~ Vertical"
				AnimInc_HipsRot3_Pose2 = AnimInc_HipsRot3_Pose2 + 5
				Return()
			+ "-"
				AnimInc_HipsRot3_Pose2 = AnimInc_HipsRot3_Pose2 - 5
				Return()
		+ "Pose 3 = " .. AnimInc_HipsRot1_Pose3 .. " | " .. AnimInc_HipsRot2_Pose3 .. " | " .. AnimInc_HipsRot3_Pose3 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 3"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_HipsRot1_Pose3 .. " | " .. AnimInc_HipsRot2_Pose3 .. " | " .. AnimInc_HipsRot3_Pose3 .. ""
				Return(2)
			+ "^ ~ Length"
				AnimInc_HipsRot1_Pose3 = AnimInc_HipsRot1_Pose3 + 5
				Return()
			+ "-"
				AnimInc_HipsRot1_Pose3 = AnimInc_HipsRot1_Pose3 - 5
				Return()						
			+ "^ ~ Horizontal"
				AnimInc_HipsRot2_Pose3 = AnimInc_HipsRot2_Pose3 + 5
				Return()
			+ "-"
				AnimInc_HipsRot2_Pose3 = AnimInc_HipsRot2_Pose3 - 5
				Return()					
			+ "^ ~ Vertical"
				AnimInc_HipsRot3_Pose3 = AnimInc_HipsRot3_Pose3 + 5
				Return()
			+ "-"
				AnimInc_HipsRot3_Pose3 = AnimInc_HipsRot3_Pose3 - 5
				Return()
		+ "Pose 4 = " .. AnimInc_HipsRot1_Pose4 .. " | " .. AnimInc_HipsRot2_Pose4 .. " | " .. AnimInc_HipsRot3_Pose4 .. ""[gold]
			+ "<color=#9a646f><i>Done. | Pose 4"
			+ "<color=#54b095><i>Back. | Parameters = " .. AnimInc_HipsRot1_Pose4 .. " | " .. AnimInc_HipsRot2_Pose4 .. " | " .. AnimInc_HipsRot3_Pose4 .. ""
				Return(2)
			+ "^ ~ Length"
				AnimInc_HipsRot1_Pose4 = AnimInc_HipsRot1_Pose4 + 5
				Return()
			+ "-"
				AnimInc_HipsRot1_Pose4 = AnimInc_HipsRot1_Pose4 - 5
				Return()
			+ "^ ~ Horizontal"
				AnimInc_HipsRot2_Pose4 = AnimInc_HipsRot2_Pose4 + 5
				Return()
			+ "-"
				AnimInc_HipsRot2_Pose4 = AnimInc_HipsRot2_Pose4 - 5
				Return()
			+ "^ ~ Vertical"
				AnimInc_HipsRot3_Pose4 = AnimInc_HipsRot3_Pose4 + 5
				Return()
			+ "-"
				AnimInc_HipsRot3_Pose4 = AnimInc_HipsRot3_Pose4 - 5
				Return()
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
		+ "speedLAB.."[gold]
			+ "Reset | Ease In"[gold]
				CLV_A = 2
				Return()
			+ "Reset | Ease Out"[gold]
				CLV_B = 2
				Return()
			+ "Reset | Anim Speed"[gold]
				CL_SMult = 1
				Return()
			+ "<color=#9a646f><i>Done."
			+ "<color=#54b095><i>Back."
				Return(2)
			+ "^ | Ease In = " .. CLV_A .. ""[gold]
				CLV_A = CLV_A + Faun_EaseIncrement
				Return()
			+ "-"
				CLV_A = CLV_A - Faun_EaseIncrement
				Return()
			+ "^ | Ease Out = " .. CLV_B .. ""[gold]
				CLV_B = CLV_B + Faun_EaseIncrement
				Return()
			+ "-"
				CLV_B = CLV_B - Faun_EaseIncrement
				Return()
			+ "^ | speed = " .. CL_SMult .. ""[gold]
				CL_SMult = CL_SMult + Faun_SpeedIncrement
				Return()
			+ "-"
				CL_SMult = CL_SMult - Faun_SpeedIncrement
				Return()
		+ "Info"
			-- human "Screenshot your values with F10 and build your own custom animation afterwards! Tutorial in /Mods folder~"
			Return()
		+ "Stop Hips" [if game.HasAnim(human) == true]
			game.RemoveAnim(human)
			Return()
	+ "Stop neck" [if game.HasAnim(human.headNames) == true]
		game.RemoveAnim(human.headNames)
		Return()
	+ "<color=#54b095><i>Back."
		Return(2)
	+ "<color=#9a646f><i>Done."
stop
