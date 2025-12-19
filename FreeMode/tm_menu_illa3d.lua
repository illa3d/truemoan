-- TrueMoan v0.6 by illa3d

label TalkMenu(human, hitTri)
	+ "OPTIONS.."[gold]
		+ "Anim Speed.. | " .. CL_SMult [gold]
			+ "Speed >"
				CL_SMult = CL_SMult + SpeedIncrement_A
				Return()
			+ "< Speed"
				CL_SMult = CL_SMult - SpeedIncrement_A
				Return()
			+ "RESET | "  .. CL_SMult [gold]
				CL_SMult = 1
				Return()
			+ "< BACK (applied to new anims)"
				Return(2)
			+ "| CLOSE"
		+ "Anim Ease.. | " .. CLV2_A .. "/" .. CLV2_B [gold]
			+ "Ease In >"
				CLV2_A = CLV2_A + EaseIncrement_A
				Return()
			+ "< Ease In"
				CLV2_A = CLV2_A - EaseIncrement_A
				Return()
			+ "RESET Ease In |".. CLV2_A [gold]
				CLV2_A = 2
				Return()
			+ "Ease Out >"
				CLV2_B = CLV2_B + EaseIncrement_A
				Return()
			+ "< Ease Out"
				CLV2_B = CLV2_B - EaseIncrement_A
				Return()
			+ "RESET Ease Out | ".. CLV2_B [gold]
				CLV2_B = 2
				Return()
			+ "< BACK (applied to new anims)"
				Return(2)
			+ "| CLOSE"
		+ "Music.."[gold]
			+ "| BACK"
				Return (2)
			+ for i, track in ipairs(tracklist)
				+ "Play " .. track
					Music(track , 0.05, 0)
					Return()
			+ "Stop Music"
				StopMusic()
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Safe Body Edit | ON" [if editsafe == true]
			editsafe = false
			Return()
		+ "Safe Body Edit | OFF (could crash app)" [if editsafe == false]
			editsafe = true
			Return()
		+ "Sex Moan | ON" [if moaning == true]
			moaning = false
			Return()
		+ "Sex Moan | OFF" [if moaning == false]
			moaning = true
			Return()
		+ "Cum Moan | ON" [if game.FluidReaction == true]
			game.FluidReaction = false
			Return()
		+ "Cum Moan | OFF" [if game.FluidReaction == false]
			game.FluidReaction = true
			Return()
		+ "Hide UI" [if HG_UIvis == true]
			HG_UIvis = false
			game.m_controlsUI.Show(false)
			Return()
		+ "Show UI" [if HG_UIvis == false]
			HG_UIvis = true
			game.m_controlsUI.Show()
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "BODY.."[gold]
		+ "Neck.. | " .. necksize [gold]
			+ "Neck >"
				necksize = EditUp(human, "Neck size", necksize, sizestep005, 2)
				Return()
			+ "< Neck"
				necksize = EditDown(human, "Neck size", necksize, sizestep005, -1)
				Return()
			+ "RESET | " .. necksize [gold]
				necksize = EditSet(human, "Neck size", 0)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Arms.. | T" .. forearmsize .. " | C" .. uperarmsize [gold]
			+ "Forearms >"
				forearmsize = EditUp(human, "Forearms size", forearmsize, sizestep005, 2)
				Return()
			+ "< Forearms"
				forearmsize = EditDown(human, "Forearms size", forearmsize, sizestep005, -0.5)
				Return()
			+ "RESET Forearms | " .. forearmsize [gold]
				forearmsize = EditSet(human, "Forearms size", 0)
				Return()
			+ "Upper arms >"
				uperarmsize = EditUp(human, "Upper arms size", uperarmsize, sizestep005, 2)
				Return()
			+ "< Upper arms"
				uperarmsize = EditDown(human, "Upper arms size", uperarmsize, sizestep005, -0.5)
				Return()
			+ "RESET Upper arms | " .. uperarmsize [gold]
				uperarmsize = EditSet(human, "Upper arms size", 0)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Legs.. | T" .. thighsize .. " | C" .. calfsize [gold]
			+ "Calf >"
				calfsize = EditUp(human, "Calf size", calfsize, sizestep005, 2)
				Return()
			+ "< Calf"
				calfsize = EditDown(human, "Calf size", calfsize, sizestep005, -0.5)
				Return()
			+ "RESET Calf | " .. calfsize [gold]
				calfsize = EditSet(human, "Calf size", 0)
				Return()
			+ "Thigh >"
				thighsize = EditUp(human, "Thigh size", thighsize, sizestep005, 2)
				Return()
			+ "< Thigh"
				thighsize = EditDown(human, "Thigh size", thighsize, sizestep005, -1)
				Return()
			+ "RESET Thigh | " .. thighsize [gold]
				thighsize = EditSet(human, "Thigh size", 0)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Waist.. | W" .. waistsize .. " | H" .. hipssize [gold]
			+ "Hips >"
				hipssize = EditUp(human, "Hips size", hipssize, sizestep01, 5)
				Return()
			+ "< Hips"
				hipssize = EditDown(human, "Hips size", hipssize, sizestep01, -2)
				Return()
			+ "RESET Hips | " .. hipssize [gold]
				hipssize = EditSet(human, "Hips size", 0)
				Return()
			+ "Waist >"
				waistsize = EditUp(human, "Waist size", waistsize, sizestep01, 5)
				Return()
			+ "< Waist"
				waistsize = EditDown(human, "Waist size", waistsize, sizestep01, -1)
				Return()
			+ "RESET Waist | " .. waistsize [gold]
				waistsize = EditSet(human, "Waist size", 0)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Ass.. | " .. asssize [gold]
			+ "Ass >"
				asssize = EditUp(human, "Ass size", asssize, sizestep01, 10)
				Return()
			+ "< Ass"
				asssize = EditDown(human, "Ass size", asssize, sizestep01, -1)
				Return()
			+ "RESET | " .. asssize [gold]
				asssize = EditSet(human, "Ass size", 0)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ if human.m_isMale == false
			+ "Breasts.. | B" .. breastsize .. " | N" .. nipplesize [gold]
				+ "Nipples >"
					nipplesize = EditUp(human, "Nipples size", nipplesize, sizestep03, 10)
					Return()
				+ "< Nipples"
					nipplesize = EditDown(human, "Nipples size", nipplesize, sizestep03, -5)
					Return()
				+ "RESET Nipples | " .. nipplesize [gold]
					nipplesize = EditSet(human, "Nipples size", 0)
					Return()
				+ "Breasts >"
					breastsize = EditUp(human, "Breasts size", breastsize, sizestep01, 10)
					Return()
				+ "< Breasts"
					breastsize = EditDown(human, "Breasts size", breastsize, sizestep01, -2, breastsafemin)
					Return()
				+ "RESET Breasts | " .. breastsize [gold]
					breastsize = EditSet(human, "Breasts size", 0)
					Return()
				+ "| BACK"
					Return(2)
				+ "| CLOSE"
		+ if human.Penis.IsActive
			+ "Penis.. | L" .. penislength .. " | S" .. penissize [gold]
				+ "Length >"
					penislength = EditUp(human, "Penis length", penislength, sizestep005, 4)
					Return()
				+ "< Length"
					penislength = EditDown(human, "Penis length", penislength, sizestep005, -0.7)
					Return()
				+ "RESET Length | " .. penislength [gold]
					penislength = EditSet(human, "Penis length", 0)
					Return()
				+ "Size >"
					penissize = EditUp(human, "Penis size", penissize, sizestep005, 4)
					Return()
				+ "< Size"
					penissize = EditDown(human, "Penis size", penissize, sizestep005, -0.7)
					Return()
				+ "RESET size | " .. penissize [gold]
					penissize = EditSet(human, "Penis size", 0)
					Return()
				+ "RESET Foreskin"
					human.Penis.m_penisSkinOut = 0
					Return()
				+ "| BACK"
					Return(2)
				+ "| CLOSE"
		+ "Body.. | B" .. bodysize .. " | M ".. musclesize [gold]
			+ "Muscle >"
				musclesize = EditUp(human, "Muscle tone", musclesize, sizestep01, 1)
				Return()
			+ "< Muscle"
				musclesize = EditDown(human, "Muscle tone", musclesize, sizestep01, -0.3)
				Return()
			+ "RESET Muscle | " .. musclesize [gold]
				musclesize = EditSet(human, "Muscle tone", 0)
				Return()
			+ "Body >"
				bodysize = EditUp(human, "Body size", bodysize, sizestep002, 1)
				Return()
			+ "< Body"
				bodysize = EditDown(human, "Body size", bodysize, sizestep002, -0.9)
				Return()
			+ "RESET Body | " .. bodysize [gold]
				bodysize = EditSet(human, "Body size", 0)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Apply values"
			EditApplyValues(human)
			Return()
		+ "Preset.." [gold]
			+ "Fat"
				EditPreset_Fat(human)
				Return()
			+ "Normal"
				EditPreset_Normal(human)
				Return()
			+ "Slim"
				EditPreset_Slim(human)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Reset values"
			+ "Reset values?"
				Return()
			+ "Ok"
				EditResetValues()
				Return(2)
			+ "Cancel"
				Return(2)
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "POSE.."[gold]
		+ "Hands.."[gold]
			+ for i, pres in ipairs (bodystr)
				+ " " .. pres
					human.Pose(bodypresets[i]())
					Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Lay.."[gold]
			+ "On your Back"
				human.Pose(LayDownBack1())
				Return()
			+ "On your side - Right"
				human.Pose(LayDownSideR())
				Return()
			+ "On your side - Left"
				human.Pose(LayDownSideL())
				Return()
			+ "On your stomach."
				human.Pose(LaydownStomach1())
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Kneel.."[gold]
			+ "All Four."
				human.Pose(All41())
				Return()
			+ "All Four - 2."
				human.Pose(All42())
				Return()
			+ "Kneel down."
				human.Pose(KneelDown1())
				Return()
			+ "Kneel down - 2."
				human.Pose(KneelDown2())
				Return()
			+ "Kneel down - 3."
				human.Pose(KneelDown3())
				Return()
			+ "Kneel down - 4."
				human.Pose(KneelDown4())
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Sit.."[gold]
			+ "Sit down."
				human.Pose(SitDown1())
				Return()
			+ "Scared."
				human.Pose(SitDown2())
				Return()
			+ "Sit down and spread your legs."
				human.Pose(SitDownSpreadLegs())
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Stand.."[gold]
			+ "Stand up"
				human.Pose(StandUp1())
				Return()
			+ "Bend over."
				human.Pose(BendOver1())
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Original.."[gold]
			+ "Stand up straight."
				human.Pose(StandUp())
				Return()
			+ "Kneel down."
				human.Pose(KneelDown())
				Return()
			+ "Sit down."
				human.Pose(SitDown())
				Return()
			+ "Sit down and spread your legs."
				human.Pose(SitDownSpreadLegs())
				Return()
			+ "Lay down on your back."
				human.Pose(LayDownBack())
				Return()
			+ "Lay down on your side."
				human.Pose(LayDownSide())
				Return()
			+ "Lay down on your stomach."
				human.Pose(LaydownStomach())
				Return()
			+ "Get down on all fours."
				human.Pose(GetdownAll4())
				Return()
			+ "Bend over."
				human.Pose(BendOver())
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "RESET Pose" [gold]
			ResetPose(human)
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "FACE.."[gold]
		+ "Loops.. (WIP)"[gold]
			+ "Smile > Ahegao"
				game.AddRepeatAnim(2, || CustomLoops(human, FaceSmile, FaceAhegao, "Smile > Ahegao"), human)
				Return()
			+ "Idle Anim Test (WIP)"
				game.AddRepeatAnim((math.random(5,20)), || CustomLoops3(human, Lipbite, Kiss2, Pursedlips, "Test"), human)
			+ "Neutral > Scared"
				game.AddRepeatAnim(3, || CustomLoops(human, FaceNeutral, FaceScared, "Neutral > Scared"), human)
				Return()
			+ "Angry > Surprised"
				game.AddRepeatAnim(4, || CustomLoops(human, FaceAngry, FaceSurprised, "Angry > Surprised"), human) 
				Return()
			+ "Look Actor > Look Camera"
				game.AddRepeatAnim((math.random(5, 20)), || CustomLoops(human, LookActorA, LookCam, "Look Actor > Look Camera"), human) 
				Return()
			+ "Stop Anim" [if game.HasAnim(human.m_mouth) == true]
				game.RemoveAnim(human.m_mouth)
				Return()
			+ "Stop Looping" [if game.HasAnim(human) == true]
				game.RemoveAnim(human)
				Return()
			+ "< BACK (EYE BUG during movement)"
				Return(2)
			+ "| CLOSE"
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
		+ "Kiss/Tongue.."[gold]
			+ for i, pres in ipairs (kissstr)
				+ " " .. pres
					human.Pose(kisspresets[i]())
					Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Custom.."[gold]
			+ for i, pres in ipairs (facestr)
				+ " " .. pres
					human.Pose(facepresets[i]())
					Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Original.."[gold]
			+ "Ahegao!"
				human.Pose(FaceAhegao())
				Return()
			+ "Ahegao1"
				human.Pose(FaceAhegao1())
				Return()
			+ "Ahegao2"
				human.Pose(FaceAhegao2())
				Return()
			+ "Angry face."
				human.Pose(FaceAngry())
				Return()
			+ "Disgusted face."
				human.Pose(FaceDisgusted())
				Return()
			+ "Happy face."
				human.Pose(FaceSmile())
				Return()
			+ "Sad face."
				human.Pose(FaceSad())
				Return()
			+ "Scared face."
				human.Pose(FaceScared())
				Return()
			+ "Surprised face."
				human.Pose(FaceSurprised())
				Return()
			+ "Neutral face."
				human.Pose(FaceNeutral())
				Return()
			+ "Close your eyes."
				human.Pose(EyesClose())
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Stop Looping" [if game.HasAnim(human) == true]
			game.RemoveAnim(human)
			Return()
		+ "RESET Face" [gold]
			human.Pose(FaceNeutral())
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "ANIM.." [gold]
		+ "Licking.."[if game.HasAnim(human.m_mouth) == false][gold]
			+ "Tongue"
				activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "Default", activeloops[human.m_mouth], Mouth(-0.68, 0.377, 0, 0.504, 0.504, -0.062, -0.062, 0.664, 0.664, 0.57, 0.57, 0, 0, 0.9, 0, 0.45), Mouth(-0.737, 0.377, 0, 0.504, 0.504, -0.062, -0.062, 0.664, 0.664, 0.57, 0.57, 0, 0, 0.97, 0, -0.10)), human.m_mouth)
				Return()
			+ "Vertical"
				activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "vertical", activeloops[human.m_mouth], Mouth(-0.5, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 1, 1, 0, 0, 1, 0, 1), Mouth(-0.8, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 1, 0, -1)), human.m_mouth)
				Return()
			+ "Vertical - 2"
				activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "vertical", activeloops[human.m_mouth], Mouth(-0.5, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 1, 1, 0, 0, 1.5, 0, 1), Mouth(-0.8, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 1.5, 0, -1)), human.m_mouth)
				Return()
			+ "Horizontal"
				activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "horizontal", activeloops[human.m_mouth], Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 1, 1, 0, 0, 1, -1, 0.2), Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 1, 1, 0.2)), human.m_mouth)
				Return()
			+ "Horizontal - 2"
				activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "horizontal", activeloops[human.m_mouth], Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 1, 1, 0, 0, 1.5, -1.3, 0.2), Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 1.5, 1.3, 0.2)), human.m_mouth)
				Return()
			+ "Rotate"
				activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV4(human, "rotate", activeloops[human.m_mouth], Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 1, 1, 0, 0, 1, 0, 1), Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 1, 1, 0, 0, 1, -1, 0.2), Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 1, 0, -1), Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 1, 1, 0.2)), human.m_mouth)
				Return()
			+ "Rotate - 2"
				activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV4(human, "rotate", activeloops[human.m_mouth], Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 1, 1, 0, 0, 1.5, 0, 1), Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 1, 1, 0, 0, 1.5, -1, 0.2), Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 1.5, 0, -1), Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 1.5, 1, 0.2)), human.m_mouth)
				Return()
			+ "Stop Licking" [if game.HasAnim(human.m_mouth) == true]
				game.RemoveAnim(human.m_mouth)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "BJ Randomizer.."[gold]
			+ "Face Upward BJ"
				activeloops[human.Mouth] = 0.6/CL_SMult*3.7
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Face Upward BJ", activeloops[human.Mouth], HeadRot(-98, 355, 320), HeadRot(-90, 5, 40)), human.Mouth)
				Return()
			+ "Face Downward BJ"
				activeloops[human.Mouth] = 0.6/CL_SMult*3.7
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Face Downward BJ", activeloops[human.Mouth], HeadRot(60, 355, 320), HeadRot(52, 5, 40)), human.Mouth)
				Return()
			+ "Face Forward BJ"
				activeloops[human.Mouth] = 0.6/CL_SMult*3.7
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Face Forward BJ", activeloops[human.Mouth], HeadRot(-35, 350, 320), HeadRot(-30, 10, 40)), human.Mouth) --HeadRot(-35, 355, 320), HeadRot(-30, 5, 40))
				Return()
			+ "Face Forward BJ - Random"
				activeloops[human.Mouth] = 0.6/CL_SMult*3.7 --0.6/CL_SMult*3.7
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Face Forward BJ", activeloops[human.Mouth], HeadRot((math.random(-40, -35)), (math.random(350, 359)), (math.random(310, 330))), HeadRot((math.random(-30, -25)), (math.random(1, 10)), (math.random(30, 50)))), human.Mouth) --HeadRot(-35, 355, (math.random(310, 330))), HeadRot(-30, 5, (math.random(30, 50)))), human.Mouth)
				Return()
			+ "Random"
				activeloops[human.Mouth] = 0.6/CL_SMult*3
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.Mouth], HeadRot((math.random(-20, -10)), (math.random(30, 20)), -20), HeadRot((math.random(20, 10)), (math.random(330, 340)), 20)), human.Mouth)
				Return()
			+ "Stop BJ" [if game.HasAnim(human.Mouth) == true][gold]
				game.RemoveAnim(human.Mouth)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Head.."[if game.HasAnim(human.headNames) == false][gold]
			+ "Nod - Yes"
				activeloops[human.headNames] = 0.5/CL_SMult*2 -- 325,.,.)(20,.,.)
				game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.headNames], HeadRot(325, nil, nil), HeadRot(20, nil, nil)), human.headNames) --HeadRot(-15, nil, nil), HeadRot(15, nil, nil)), human.headNames)
				Return()
			+ "Nod - lick"
				activeloops[human.headNames] = 0.6/CL_SMult*2
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.headNames], HeadRot(320, nil, nil), HeadRot(280, nil, nil)), human.headNames)
				Return()
			+ "Nod - Jam - Randomized"
				activeloops[human.headNames] = 0.5/CL_SMult*2
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.headNames], HeadRot((math.random(-20, -10)), nil, nil), HeadRot((math.random(20, 10)), nil, nil)), human.headNames)
				Return()
			+ "Shake - No"
				activeloops[human.headNames] = 0.6/CL_SMult*3
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.headNames], HeadRot(nil, 40, nil), HeadRot(nil, 320, nil)), human.headNames)
				Return()
			+ "Shake - lick"
				activeloops[human.headNames] = 0.6/CL_SMult*2
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.headNames], HeadRot(nil, 325, nil), HeadRot(nil, 15, nil)), human.headNames)
				Return()
			+ "Shake - No - Randomized"
				activeloops[human.headNames] = 0.6/CL_SMult*3
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.headNames], HeadRot(nil, (math.random(50, 25)), nil), HeadRot(nil, (math.random(310, 335)), nil)), human.headNames)
				Return()
			+ "Stop Head"[if game.HasAnim(human.headNames) == true]
				game.RemoveAnim(human.headNames)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Hands.."[gold]
			-- + "WIP - Grope Breasts"
			-- 	game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, GropebreastBoth1a, GropebreastBoth1b, "Grope Breasts"), human.forearmNames)
			-- 	Return(2)
			+ "Right hand.."[if game.HasAnim(human.handNames) == false][gold]
				+ "BJ Gesture"
					human.pose(BJGesture())
					human.pose(TongueOut2())
					game.AddRepeatAnim(0.2/CL_SMult*1.4, || CustomLoops(human, Bjgesture_Ra, Bjgesture_Rb, "BJ Gesture"), human.handNames)
					Return()
				+ "Spank (WIP)"
					game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, Slap_Ra, Slap_Rb, "Spank"), human.handNames)
					Return()
				+ "Beckon"
					human.Pose(Beckon())
					game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, Beckon_Ra, Beckon_Rb, "Beckon"), human.handNames)
					Return()
				+ "Touch Herself"
					game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, TouchHerself_Ra, TouchHerself_Rb, "Touch Herself R"), human.handNames)
					Return()
				+ "Grope Breast Topless (WIP)"
					game.AddRepeatAnim(0.2/CL_SMult*1.5, || CustomLoops6(human, Gropebreast_Ra, Gropebreast_Rb, Gropebreast_Rc, Gropebreast_Rd, Gropebreast_Re, Gropebreast_Rf, "Grope Breast"), human.handNames)
					Return()
				+ "Grope Breast - 2 (WIP)"
					game.AddRepeatAnim(0.3/CL_SMult*2, || CustomLoops(human, Gropebreast_2Ra, Gropebreast_2Rb, "Grope Breast 2 R"), human.handNames)
					Return()
				+ "Fingering index"
					game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, FingeringIMr1, FingeringIMr2, "Rhand"), human.handNames)
					Return()
				+ "Fingering middle"
					game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, FingeringMRr1, FingeringMRr2, "Rhand"), human.handNames)
					Return()
				+ "Fingering middle - 2"
					game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, FingeringMRr3, FingeringMRr4, "Rhand"), human.handNames)
					Return()
				+ "Stop right hand" [if game.HasAnim(human.handNames) == true]
					game.RemoveAnim(human.handNames)
					Return()
				+ "| BACK"
					Return(2)
				+ "| CLOSE"
			+ "Left hand.."[if game.HasAnim(human.forearmNames) == false][gold]
				+ "Grope Breast Topless (WIP)"
					game.AddRepeatAnim(0.3/CL_SMult*1.5, || CustomLoops6(human, Gropebreast_La, Gropebreast_Lb, Gropebreast_Lc, Gropebreast_Ld, Gropebreast_Le, Gropebreast_Lf, "Grope Breast"), human.forearmNames)
					Return()
				+ "Grope Breast - 2 (WIP)"
					game.AddRepeatAnim(0.3/CL_SMult*2, || CustomLoopsV2(human, "WIP - Grope Breast - 2", 0.9,
					HandL(BoneMesh(TargetActor.Main, "Bone_Chest", 0.182, -0.312, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
					HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.957, 0.401, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35))), human.forearmNames)
					Return()
				+ "Touch Herself (WIP)"
					game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, TouchHerself_La, TouchHerself_Lb, "Touch Herself L"), human.forearmNames)
					Return()
				+ "Fingering index"
					game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, FingeringIMl1, FingeringIMl2, "Lhand"), human.forearmNames)
					Return()
				+ "Fingering middle"
					game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, FingeringMRl1, FingeringMRl2, "Lhand"), human.forearmNames)
					Return()
				+ "Fingering middle - 2"
					game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, FingeringMRl3, FingeringMRl4, "Rhand"), human.forearmNames)
					Return()
				+ "Stop left hand" [if game.HasAnim(human.forearmNames) == true]
					game.RemoveAnim(human.forearmNames)
					Return()
				+ "| BACK"
					Return(2)
				+ "| CLOSE"
			+ "Stop left hand" [if game.HasAnim(human.forearmNames) == true]
				game.RemoveAnim(human.forearmNames)
				Return()
			+ "Stop right hand" [if game.HasAnim(human.handNames) == true]
				game.RemoveAnim(human.handNames)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Legs.."[if game.HasAnim(human.footNames) == false][gold]
			+ "Footjob.Stand.Right"
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, Footjob_1Ra, Footjob_1Rb, "FJ.Stand.R"), human.Anus)
				Return()
			+ "Leg Sway L (WIP)"
				human.Pose(LaydownStomach1())
				activeloops[human.footNames] = 0.6/CL_SMult*2.7
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "legswayL", activeloops[human.footNames], FootL(WPos(-0.15, 0.577, -0.62)), FootL(WPos(-0.15, 0.639, -0.4))), human.footNames)
				Return()
			+ "Leg Sway R (WIP)"
				human.Pose(LaydownStomach1())
				activeloops[human.footNames] = 0.6/CL_SMult*2.7		
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "legswayR", activeloops[human.footNames], FootR(WPos(0.007, 0.577, -0.7)), FootR(WPos(0.043, 0.639, -0.4))), human.footNames)
				Return()
			+ "Leg Sway Both (WIP)"
				human.Pose(LaydownStomach1())
				activeloops[human.footNames] = 0.6/CL_SMult*3		
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV4(human, "legsway", activeloops[human.footNames], FootR(WPos(0.055, 0.629, -0.32)), FootL(WPos(-0.084, 0.602, -0.537)), FootR(WPos(0.084, 0.624, -0.537)), FootL(WPos(-0.055, 0.605, -0.198))), human.footNames)
				Return()
			-- + "WIP - Leg Sway?" -- no knee lock makes this rough
			-- 	human.Pose(LaydownStomach1())
			-- 	activeloops[human.footNames] = 0.6/CL_SMult*3		
			-- 	game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV6(human, "legsway", activeloops[human.footNames], FootR(WPos(0.05, 0.55, -0.79)), FootL(WPos(-0.055, 0.605, -0.198)), FootR(WPos(0.084, 0.624, -0.537)), FootL(WPos(-0.084, 0.602, -0.537)), FootR(WPos(0.055, 0.629, -0.32)), FootL(WPos(-0.05, 0.463, -0.79))), human.footNames)
			-- 	Return()
			+ "Stand up straight."
				human.Pose(StandUp())
				Return()
			+ "Stop Legs" [if game.HasAnim(human.footNames) == true]
				game.RemoveAnim(human.footNames)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Hips.."[gold]
			+ "Sway.."[gold]
				+ "Sway Hips - Bent Over (WIP)"
					activeloops[human] = 0.6/CL_SMult*2.5
					game.AddRepeatAnim(0.6/CL_SMult, || CustomLoops(human, HipSway_A, HipSway_B, "Swaying"), human)
					Return()
				+ "| BACK"
					Return(2)
				+ "| CLOSE"
			+ "Twist.."[if game.HasAnim(human.thighNames) == false][gold]
				+ "Twist = 20"
					activeloops[human.thighNames] = 0.6/CL_SMult*1.5
					game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Twisting", activeloops[human.thighNames], HipsRot(0, -20, -0), HipsRot(0, 20, 0)), human.thighNames)
					Return()
				+ "Twist = 10"
					activeloops[human.thighNames] = 0.6/CL_SMult*1.5
					game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Twisting", activeloops[human.thighNames], HipsRot(0, -10, -0), HipsRot(0, 10, 0)), human.thighNames)
					Return()
				+ "Twist - 5"
					activeloops[human.thighNames] = 0.6/CL_SMult*1.5
					game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Twisting", activeloops[human.thighNames], HipsRot(0, -5, -0), HipsRot(0, 5, 0)), human.thighNames)
					Return()
				+ "| BACK"
					Return(2)
				+ "| CLOSE"
			+ "Tilt.."[if game.HasAnim(human.Anus) == false][gold]
				+ "Tilt = 35,  -25 > 25"
					activeloops[human.Anus] = 0.6/CL_SMult*2
					game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "HipMov", activeloops[human.Anus], HipsRot(35, 0, 25), HipsRot(35, 0, -25)), human.Anus)
					Return()
				+ "Tilt = -35,  -25 > 25"
					activeloops[human.Anus] = 0.6/CL_SMult*2
					game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "HipMov", activeloops[human.Anus], HipsRot(-35, 0, 25), HipsRot(-35, 0, -25)), human.Anus)
					Return()
				+ "Tilt - 10-24"
					activeloops[human.Anus] = 0.6/CL_SMult*2
					game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "HipMov", activeloops[human.Anus], HipsRot(10, 0, (math.random(24, 10))), HipsRot(10, 0, (math.random(-10, -24)))), human.Anus)
					Return()
				+ "Tilt - 17"
					activeloops[human.Anus] = 0.6/CL_SMult*2
					game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "HipMov", activeloops[human.Anus], HipsRot(10, 0, 17), HipsRot(10, 0, -17)), human.Anus)
					Return()
				+ "Tilt - 13"
					activeloops[human.Anus] = 0.6/CL_SMult*2
					game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "HipMov", activeloops[human.Anus], HipsRot(10, 0, 13), HipsRot(10, 0, -13)), human.Anus)
					Return()
				+ "Tilt - 5-10"
					activeloops[human.Anus] = 0.6/CL_SMult*2
					game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "HipMov", activeloops[human.Anus], HipsRot(10, 0, (math.random(5, 10))), HipsRot(10, 0, (math.random(-5, -10)))), human.Anus)
					Return()
				+ "| BACK"
					Return(2)
				+ "| CLOSE"
			+ "Humping.."[if game.HasAnim(human) == false][gold]
				+ "Humping = 35"
					activeloops[human] = 0.5/CL_SMult*1.5
					game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], HipsRot(-35, 0, 0), HipsRot(35, 0, 0)), human)
					Return()
				+ "Humping = 10 > 35"
					activeloops[human] = 0.6/CL_SMult*2
					game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], HipsRot(-35, 0, 0), HipsRot(10, 0, 0)), human)
					Return()
				+ "Humping = 0-20 > 30-40"
					activeloops[human] = 0.5/CL_SMult*1.5
					game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], HipsRot((math.random(-40, -30)), 0, 0), HipsRot((math.random(20, 0)), 0, 0)), human)
					Return()
				+ "Humping = 0 > 20-35"
					activeloops[human] = 0.5/CL_SMult*3
					game.AddRepeatAnim(0.7/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], HipsRot((math.random(-20, -35)), 0, 0), HipsRot(0, 0, 0)), human)
					Return()
				+ "Humping = -10 > 0-35 "
					activeloops[human] = 0.5/CL_SMult*2
					game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], HipsRot((math.random(0, -35)), 0, 0), HipsRot(-10, 0, 0)), human)
					Return()
				+ "Hard Humping"
					activeloops[human] = 0.3/CL_SMult*3
					game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], HipsRot(-55, 0, 0), HipsRot(-10, 0, 0)), human)
					Return()
				+ "Hump front"
					activeloops[human] = 0.6/CL_SMult*2.5
					game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], HipsRot(-30, 0, 0), HipsRot(-20, 0, 0)), human)
					Return()
				+ "Twerk"
					activeloops[human] = 0.3/CL_SMult*1.5
					game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], HipsRot(45, 0, 0), HipsRot(10, 0, 0)), human)
					Return()
				+ "| BACK"
					Return(2)
				+ "| CLOSE"
			+ "Stop Hip moves" [if game.HasAnim(human.Anus) == true]
				game.RemoveAnim(human.Anus)
				Return()
			+ "Stop Twisting/Swaying" [if game.HasAnim(human.thighNames) == true]
				game.RemoveAnim(human.thighNames)
				Return()
			+ "Stop Humping"[if game.HasAnim(human) == true]
				game.RemoveAnim(human)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Bouncing.." [if game.HasAnim(human.breastNames) == false][gold]
			+ "Bouncing = 0.97 > 1"
				activeloops[human.breastNames] = 0.3/CL_SMult*1.5
				game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Bouncing", activeloops[human.breastNames], Hips(0, 0.97, 0), Hips(0, 1, 0)), human.breastNames)
				Return()
			+ "Bouncing"
				activeloops[human.breastNames] = 0.5/CL_SMult*2.5
				game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Bouncing", activeloops[human.breastNames], Hips(0, 0.95, 0.0), Hips(0, 0.90, 0.0)), human.breastNames)
				Return()
			+ "Small Bouncing"
				activeloops[human.breastNames] = 0.5/CL_SMult*2.5
				game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Bouncing", activeloops[human.breastNames], Hips(0, 0.95, 0.0), Hips(0, 0.92, 0.0)), human.breastNames)
				Return()
			+ "Stop Bouncing" [if game.HasAnim(human.breastNames) == true]
				game.RemoveAnim(human.breastNames)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Breast Shaking.."[if game.HasAnim(human.chestNames) == false][gold]
			+ "Shake - 7-25"
				activeloops[human.chestNames] = 0.4/CL_SMult*2
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Shaking", activeloops[human.chestNames], SpineRot((math.random(7, 25))), SpineRot((math.random(-7, -25)))), human.chestNames)
				Return()
			+ "Shake - 15"
				activeloops[human.chestNames] = 0.4/CL_SMult*1.5
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Shaking", activeloops[human.chestNames], SpineRot(15), SpineRot(-15)), human.chestNames)
				Return()
			+ "Shake - 10"
				activeloops[human.chestNames] = 0.5/CL_SMult*1.5
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Shaking", activeloops[human.chestNames], SpineRot(10), SpineRot(-10)), human.chestNames)
				Return()
			+ "Shake - 5-9"
				activeloops[human.chestNames] = 0.4/CL_SMult*2.5
				game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Shaking", activeloops[human.chestNames], SpineRot((math.random(9, 5))), SpineRot((math.random(-9, -5)))), human.chestNames)
				Return()
			+ "Shake - 7"
				activeloops[human.chestNames] = 0.5/CL_SMult*2.5
				game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Shaking", activeloops[human.chestNames], SpineRot(7), SpineRot(-7)), human.chestNames)
				Return()
			+ "Stop Shaking" [if game.HasAnim(human.chestNames) == true]
				game.RemoveAnim(human.chestNames)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Stop Shaking" [if game.HasAnim(human.chestNames) == true]
			game.RemoveAnim(human.chestNames)
			Return()
		+ "Stop Bouncing" [if game.HasAnim(human.breastNames) == true]
			game.RemoveAnim(human.breastNames)
			Return()
		+ "Stop Left hand" [if game.HasAnim(human.forearmNames) == true]
			game.RemoveAnim(human.forearmNames)
			Return()
		+ "Stop Right hand" [if game.HasAnim(human.handNames) == true]
			game.RemoveAnim(human.handNames)
			Return()
		+ "Stop Licking" [if game.HasAnim(human.m_mouth) == true]
			game.RemoveAnim(human.m_mouth)
			Return()
		+ "Stop Head"[if game.HasAnim(human.headNames) == true]
			game.RemoveAnim(human.headNames)
			Return()
		+ "Stop Hip moves" [if game.HasAnim(human.Anus) == true]
			game.RemoveAnim(human.Anus)
			Return()
		+ "Stop Legs" [if game.HasAnim(human.footNames) == true]
			game.RemoveAnim(human.footNames)
			Return()
		+ "Stop twisting" [if game.HasAnim(human.thighNames) == true]
			game.RemoveAnim(human.thighNames)
			Return()
		+ "Stop Humping"[if game.HasAnim(human) == true]
			game.RemoveAnim(human)
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "SEX.."[gold]
		+ "Auto Thrust" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == false]
			--function GradualSpeedUpAutoThrusting(human, duration, step, startSpeed, endSpeed, startDepth, endDepth, autoDisableAfter)
			GradualSpeedUpAutoThrusting(human, 30, 0, 0.6, 0.3, 0.1, 1, 30)
			Return()
		+ "Auto Sucking" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == false and activeAutoBJ == false]
			--function GradualSpeedUpAutoBJ(human, duration, step, startSpeed, endSpeed, startDepth, endDepth, autoDisableAfter)
			human.Mouth.Fucker.Penis.Interaction.AutoPenisWeight = 0
			GradualSpeedUpAutoBJ(human, 30, 0, 0.35, 0.1, 0.3, 1.5, 25)
			activeAutoBJ = true
			Return()
		+ "Thrust.. | " .. human.Penis.Interaction.m_autoSpeed [if human.Penis.Hole ~= nil] [gold]
			+ "5 Max"
				SetInteractionSpeed(human.Penis.Interaction, 2);
				Return()
			+ "4 Fast"
				SetInteractionSpeed(human.Penis.Interaction, 0.9)	
				Return()
			+ "3 Normal"
				SetInteractionSpeed(human.Penis.Interaction, 0.5)
				Return()
			+ "2 Medium"
				SetInteractionSpeed(human.Penis.Interaction, 0.25)
				Return()
			+ "1 Slow"
				SetInteractionSpeed(human.Penis.Interaction, 0.1)
				Return()
			+ "Faster >"
				SetInteractionSpeedStep(human.Penis.Interaction, true)
				Return()
			+ "< Slower"
				SetInteractionSpeedStep(human.Penis.Interaction, false)
				Return()
			+ "STOP | " .. human.Penis.Interaction.m_autoSpeed [gold]
				SetInteractionSpeed(human.Penis.Interaction, 0)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Suck.. | " .. human.Mouth.Fucker.Penis.Interaction.m_autoSpeed [if human.Mouth.Fucker ~= nil] [gold]
			+ "5 Max"
				SetInteractionSpeed(human.Mouth.Fucker.Penis.Interaction, 2);
				Return()
			+ "4 Fast"
				SetInteractionSpeed(human.Mouth.Fucker.Penis.Interaction, 0.9)	
				Return()
			+ "3 Normal"
				SetInteractionSpeed(human.Mouth.Fucker.Penis.Interaction, 0.5)	
				Return()
			+ "2 Medium"
				SetInteractionSpeed(human.Mouth.Fucker.Penis.Interaction, 0.25)	
				Return()
			+ "1 Slow"
				SetInteractionSpeed(human.Mouth.Fucker.Penis.Interaction, 0.1)	
				Return()
			+ "Faster >"
				SetInteractionSpeedStep(human.Mouth.Fucker.Penis.Interaction, true)
				Return()
			+ "< Slower"
				SetInteractionSpeedStep(human.Mouth.Fucker.Penis.Interaction, false)
				Return()
			+ "STOP | " .. human.Mouth.Fucker.Penis.Interaction.m_autoSpeed [gold]
				SetInteractionSpeed(human.Mouth.Fucker.Penis.Interaction, 0)
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Start Thrusting" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == false]
			human.Penis.Interaction.AutoActive = true
			human.Penis.Interaction.AutoPenisWeight = 1
			Return()
		+ "Stop Thrusting" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == true]
			human.Penis.Interaction.AutoActive = false
			Return()
		+ "Start Sucking" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == false and activeAutoBJ == false]
			human.Mouth.Fucker.Penis.Interaction.AutoActive = true
			human.Mouth.Fucker.Penis.Interaction.AutoPenisWeight = 0
			Return()
		+ "Stop Sucking" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == true and activeAutoBJ == false]
			human.Mouth.Fucker.Penis.Interaction.AutoActive = false
			Return()
		+ "Stop Sucking" [if human.Mouth.Fucker ~= nil and activeAutoBJ == true]
			--human.Mouth.Fucker.Penis.Interaction.AutoActive = false
			StopAutoBJ(human)
			activeAutoBJ = false
			Return()
		+ "Start handjob" [if human.Penis.m_holdDepth ~= 0 and human.Penis.Interaction.m_autoHandActive == false]
			human.Penis.Interaction.m_autoHandActive = true
			Return()
		+ "Stop handjob" [if human.Penis.m_holdDepth ~= 0 and human.Penis.Interaction.m_autoHandActive == true]
			human.Penis.Interaction.m_autoHandActive = false
			Return()
		+ if human.Penis.IsActive == true
			+ "Cum.. | " .. cumevery .. "s" [gold]
				+ "Cum every 1 sec"
					cumevery = 1
					game.AddRepeatAnim(1, || human.Shoot(), human.Penis)
					Return(2)
				+ "Cum every 2 sec"
					cumevery = 2
					game.AddRepeatAnim(2, || human.Shoot(), human.Penis)
					Return(2)
				+ "Cum every 4 sec"
					cumevery = 4
					game.AddRepeatAnim(4, || human.Shoot(), human.Penis)
					Return(2)
				+ "Cum every 8 sec"
					cumevery = 8
					game.AddRepeatAnim(8, || human.Shoot(), human.Penis)
					Return(2)
				+ "Cum every 16 sec"
					cumevery = 16
					game.AddRepeatAnim(16, || human.Shoot(), human.Penis)
					Return(2)
				+ "Cum every 32 sec"
					cumevery = 32
					game.AddRepeatAnim(32, || human.Shoot(), human.Penis)
					Return(2)
				+ "| BACK"
					Return(2)
				+ "| CLOSE"
			+ if game.HasAnim(human.Penis)
				+ "Stop Cumming"
					cumevery = 0
					game.RemoveAnim(human.Penis)
					Return()
			+ else
				+ "Start Cumming"
					cumevery = 4
					game.AddRepeatAnim(4, || human.Shoot(), human.Penis)
					Return()
		+ if human.Penis.IsActive == false
			+ "Wet.. | " .. human.m_vagina.m_wetness [gold]
				+ "3 Squirt"
					human.m_vagina.m_wetness = 10000
					Return()
				+ "2 Wet"
					human.m_vagina.m_wetness = 2000
					Return()
				+ "1 Default"
					human.m_vagina.m_wetness = 500
					Return()
				+ "Wetness >"
					human.m_vagina.m_wetness = human.m_vagina.m_wetness + wetstep
					Return()
				+ "< Wetness"
					wett = human.m_vagina.m_wetness - wetstep
					if wett < 0
						wett = 0
					human.m_vagina.m_wetness = wett
					Return()
				+ "RESET | " .. human.m_vagina.m_wetness [gold]
					human.m_vagina.m_wetness = 0
					Return()
				+ "| BACK"
					Return(2)
				+ "| CLOSE"
			+ if human.m_vagina.m_wetness > 0
				+ "Stop Squirting"
					human.m_vagina.m_wetness = 0
					Return()
			+ else
				+ "Start Squirting"
					human.m_vagina.m_wetness = 10000
					Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ "HEY, " .. human.Name ..".."[gold]
		+ "Stop Shaking" [if game.HasAnim(human.chestNames) == true]
			game.RemoveAnim(human.chestNames)
			Return()
		+ "Stop Bouncing" [if game.HasAnim(human.breastNames) == true]
			game.RemoveAnim(human.breastNames)
			Return()
		+ "Stop Left hand" [if game.HasAnim(human.forearmNames) == true]
			game.RemoveAnim(human.forearmNames)
			Return()
		+ "Stop Right hand" [if game.HasAnim(human.handNames) == true]
			game.RemoveAnim(human.handNames)
			Return()
		+ "Stop Licking" [if game.HasAnim(human.m_mouth) == true]
			game.RemoveAnim(human.m_mouth)
			Return()
		+ "Stop Head"[if game.HasAnim(human.headNames) == true]
			game.RemoveAnim(human.headNames)
			Return()
		+ "Stop Hip moves" [if game.HasAnim(human.Anus) == true]
			game.RemoveAnim(human.Anus)
			Return()
		+ "Stop Legs" [if game.HasAnim(human.footNames) == true]
			game.RemoveAnim(human.footNames)
			Return()
		+ "Stop twisting" [if game.HasAnim(human.thighNames) == true]
			game.RemoveAnim(human.thighNames)
			Return()
		+ "Stop Humping"[if game.HasAnim(human) == true]
			game.RemoveAnim(human)
			Return()
		+ "RESET Pose" [gold]
			ResetPose(human)
			Return()
		+ "Hands.."[gold]
			+ "Peace L"
				human.Pose(PeaceL())
				Return()
			+ "Peace R"
				human.Pose(PeaceR())
				Return()
			+ "Shush R"
				human.Pose(Shush())
				Return()
			+ "Open"
				human.Pose(HandsOpen())
				Return()
			+ "Open 2"
				human.Pose(HandsOpen2())
				Return()
			+ "Closed"
				human.Pose(HandsClosed())
				Return()
			+ "Behind 1"
				human.Pose(HandsBehind1())
				Return()
			+ "Behind 2"
				human.Pose(HandsBehind2())
				Return()
			+ "Grab Head"
				human.Pose(GrabHead())
				Return()
			+ "| BACK"
				Return(2)
			+ "| CLOSE"
		+ "Look at me"
			human.Pose(LookCam())
			Return()
		+ "Face me"
			human.Pose(FaceCam())
			human.Pose(LookCam())
			Return()
		+ if human.m_isMale == true
			+ "Time to bottom, " .. human.Name .. "!"
				human.m_isMale = false
				human "Alright"
				Return(2)
		+ "Clothes ON"
			hadpenis = human.Penis.IsActive
			human.CustomizeAll(0)
			Return()
		+ "Clothes OFF"
			hadpenis = human.Penis.IsActive
			human.CustomizeAll(99)
			if (hadpenis == true)
				human.Customize("Penis", 1)
			else 
				human.Customize("Penis", 0)
			Return()
		+ "| BACK"
			Return(2)
		+ "| CLOSE"
	+ if game.PovHuman ~= human
		+ "POV"
			game.PovHuman = human
			Return()
	+ if game.PovHuman ~= nil
		+ "Exit POV"
			game.PovHuman = nil
			Return()
	+ "| CLOSE"
stop