-- FreemodeHG version 0.3 ~ fauna_LABS_v1.02 (partial menu extract)
label TMMenuFaunaAnim_Bouncing(human)
-- + "Bouncing.." [if game.HasAnim(human.breastNames) == false][gold]
	+ "Bouncing | 0.97 > 1"
		activeloops[human.breastNames] = 0.3/CL_SMult*1.5
		game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Bouncing", activeloops[human.breastNames], 
		Hips(0, 0.97, 0), 
		Hips(0, 1, 0)), human.breastNames)
		Return()
	+ "Bouncing | 0.90 > 0.95"
		activeloops[human.breastNames] = 0.5/CL_SMult*2.5
		game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Bouncing", activeloops[human.breastNames], 
		Hips(0, 0.95, 0.0), 
		Hips(0, 0.90, 0.0)), human.breastNames)
		Return()
	+ "Bouncing | 0.92 > 0.95"
		activeloops[human.breastNames] = 0.5/CL_SMult*2.5
		game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Bouncing", activeloops[human.breastNames], 
		Hips(0, 0.95, 0.0), 
		Hips(0, 0.92, 0.0)), human.breastNames)
		Return()
	+ "Stop Bouncing" [if game.HasAnim(human.breastNames) == true]
		game.RemoveAnim(human.breastNames)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
label TMMenuFaunaAnim_Feet(human)
-- + "Feet.."[if game.HasAnim(human.footNames) == false][gold]
	+ "Footjob.Stand.Right"
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, footjob_1R_a, footjob_1R_b, "footjob stand 1"), human.breastNames)
		Return()
	+ "Footjob.Sit.Right"
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoops6(human, footjob_sit_1R_A, footjob_sit_1R_B, footjob_sit_1R_C, footjob_sit_1R_D, footjob_sit_1R_E, footjob_sit_1R_F, "Footjob sit 1"), human.breastNames)
		Return()
	+ "Fj.Sit.Modular.Right"
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoops4(human, footjob_modular_1Ra, footjob_modular_1Rb, footjob_modular_1Rc, footjob_modular_1Rd, "Footjob sit 1"), human.breastNames)
		Return()
	-- + "Footjob.Sit.Right 2" --Quaternion?
	-- 	activeloops[human.footNames] = 0.6/CL_SMult*2.6
	-- 	game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsv6(human, "footjob sit 2", activeloops[human.footNames],
	-- 	FootR(WPos(0.031, 0.118, 0.666)),
	-- 	FootR(WPos(0.011, 0.217, 0.766)),
	-- 	FootR(WPos(0.034, 0.079, 0.673)),
	-- 	FootR(WPos(0.057, 0.136, 0.751)),
	-- 	FootR(WPos(0.025, 0.067, 0.651)),
	-- 	FootR(WPos(0.054, 0.15, 0.76))), human.footNames)
	-- 	Return()
	+ "WIP | Leg Sway L"
		human.Pose(LaydownStomach1())
		activeloops[human.footNames] = 0.6/CL_SMult*2.7
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "legswayL", activeloops[human.footNames], 
		FootL(WPos(-0.15, 0.577, -0.62)), 
		FootL(WPos(-0.15, 0.639, -0.4))), human.footNames)
		Return()
	+ "WIP | Leg Sway R"
		human.Pose(LaydownStomach1())
		activeloops[human.footNames] = 0.6/CL_SMult*2.7		
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "legswayR", activeloops[human.footNames], 
		FootR(WPos(0.007, 0.577, -0.7)), 
		FootR(WPos(0.043, 0.639, -0.4))), human.footNames)
		Return()
	+ "WIP | Leg Sway Both"
		human.Pose(LaydownStomach1())
		activeloops[human.footNames] = 0.6/CL_SMult*3		
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV4(human, "legsway", activeloops[human.footNames], 
		FootR(WPos(0.055, 0.629, -0.32)), 
		FootL(WPos(-0.084, 0.602, -0.537)), 
		FootR(WPos(0.084, 0.624, -0.537)), 
		FootL(WPos(-0.055, 0.605, -0.198))), human.footNames)
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
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
label TMMenuFaunaAnim_Breasts(human)
-- + "Breasts.."[if game.HasAnim(human.chestNames) == false][gold]
	+ "Shake - 7-25"
		activeloops[human.chestNames] = 0.4/CL_SMult*2
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Shaking", activeloops[human.chestNames], 
		SpineRot((math.random(7, 25))), 
		SpineRot((math.random(-7, -25)))), human.chestNames)
		Return()
	+ "Shake - 15"
		activeloops[human.chestNames] = 0.4/CL_SMult*1.5
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Shaking", activeloops[human.chestNames], 
		SpineRot(15), 
		SpineRot(-15)), human.chestNames)
		Return()
	+ "Shake - 10"
		activeloops[human.chestNames] = 0.5/CL_SMult*1.5
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Shaking", activeloops[human.chestNames], 
		SpineRot(10), 
		SpineRot(-10)), human.chestNames)
		Return()
	+ "Shake - 5-9"
		activeloops[human.chestNames] = 0.4/CL_SMult*2.5
		game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Shaking", activeloops[human.chestNames], 
		SpineRot((math.random(9, 5))), 
		SpineRot((math.random(-9, -5)))), human.chestNames)
		Return()
	+ "Shake - 7"
		activeloops[human.chestNames] = 0.5/CL_SMult*2.5
		game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Shaking", activeloops[human.chestNames], 
		SpineRot(7), 
		SpineRot(-7)), human.chestNames)
		Return()
	+ "Stop Shaking" [if game.HasAnim(human.chestNames) == true]
		game.RemoveAnim(human.chestNames)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
label TMMenuFaunaAnim_Licking(human)
-- + "Licking.."[if game.HasAnim(human.m_mouth) == false][gold]
	+ "Dagger"
		activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "Default", activeloops[human.m_mouth], 
		Mouth(-1.2, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1, 0.3, 0.4), 
		Mouth(-1.2, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1.8, -0.3, 0.4)), human.m_mouth)--d1
		Return()
	+ "Dagger - 2"
		activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "Default", activeloops[human.m_mouth], 
		Mouth(-1.2, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1, 0.3, 0.7), 
		Mouth(-1.2, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 2.3, -0.3, 0.7)), human.m_mouth)--d2
		Return()
	+ "Vertical"
		activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "vertical", activeloops[human.m_mouth], 
		Mouth(-0.8, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1.5, nil, 2.5), 
		Mouth(-1, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1.5, nil, -1)), human.m_mouth)--v1
		Return()
	+ "Vertical - 2"
		activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "vertical", activeloops[human.m_mouth], 
		Mouth(-1.1, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 2, nil, 3), 
		Mouth(-1.5, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 2, nil, -1.5)), human.m_mouth)--v2
		Return()
	+ "Horizontal"
		activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "horizontal", activeloops[human.m_mouth], 
		Mouth(-1, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1.4, -1.8, 0.5), 
		Mouth(-1, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1.4, 1.8, 0.5)), human.m_mouth)--h1
		Return()
	+ "Horizontal - 2"
		activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "horizontal", activeloops[human.m_mouth], 
		Mouth(-1.3, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1.7, -2.1, 0.5), 
		Mouth(-1.3, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1.7, 2.1, 0.5)), human.m_mouth)--h2
		Return()
	+ "Rotate"
		activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV4(human, "rotate", activeloops[human.m_mouth], 
		Mouth(-1, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1.5, 0, 2.5), 
		Mouth(-1, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1.5, -1.75, 0.2), 
		Mouth(-1, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1.5, 0, -1), 
		Mouth(-1, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1.5, 1.75, 0.2)), human.m_mouth)
		Return()
	+ "Rotate - 2"
		activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV4(human, "rotate", activeloops[human.m_mouth], 
		Mouth(-0.8, nil, nil, nil, nil, nil, nil, nil, nil, 0.9, 0.9, nil, nil, 1, 0, 4), 
		Mouth(-1.3, nil, nil, nil, nil, nil, nil, nil, nil, 1, 1, nil, nil, 1.7, 2.5, 0), 
		Mouth(-1.5, nil, nil, nil, nil, nil, nil, nil, nil, 0.8, 0.8, nil, nil, 1.7, 0, -3), 
		Mouth(-1.3, nil, nil, nil, nil, nil, nil, nil, nil, 1, 1, nil, nil, 1.7, -2.5, 0)), human.m_mouth)
		Return()
	+ "Stop Licking" [if game.HasAnim(human.m_mouth) == true]
		game.RemoveAnim(human.m_mouth)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
label TMMenuFaunaAnim_Blowjob(human)
-- + "BJ.."[gold]
	+ "forward"
		activeloops[human.Mouth] = 0.6/CL_SMult*3.7
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "BJ 1", activeloops[human.Mouth], 
		HeadRot(340, 355, 320), 
		HeadRot(340, 5, 40)), human.Mouth)
		Return()
	+ "forward - cheek"
		activeloops[human.Mouth] = 0.4/CL_SMult*3.7
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV6(human, "BJ 3", activeloops[human.Mouth], 
		HeadRot(300, 0, nil), 
		HeadRot(300, 340, nil), 
		HeadRot(300, 0, nil), 
		HeadRot(300, 320, nil), 
		HeadRot(300, 0, nil), 
		HeadRot(300, 350, nil)), human.Mouth)
		Return()				
	+ "Forward - Random"
		activeloops[human.Mouth] = 0.6/CL_SMult*3
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.Mouth], 
		HeadRot((math.random(0, -10)), (math.random(30, 20)), -20), 
		HeadRot((math.random(20, 10)), (math.random(330, 340)), 20)), human.Mouth)
		Return()
	+ "Upward"
		activeloops[human.Mouth] = 0.6/CL_SMult*3.7
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "BJ 2", activeloops[human.Mouth], 
		HeadRot(270, 320, 355), 
		HeadRot(270, 405, 5)), human.Mouth)
		Return()
	+ "Downward"
		activeloops[human.Mouth] = 0.6/CL_SMult*3.7 --0.6/CL_SMult*3.7
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "BJ 4", activeloops[human.Mouth], 
		HeadRot(90, (math.random(350, 0)), (math.random(330, 320))), 
		HeadRot(90, (math.random(0, 10)), (math.random(30, 50)))), human.Mouth) --HeadRot(-35, 355, (math.random(310, 330))), HeadRot(-30, 5, (math.random(30, 50)))), human.Mouth)
		Return()
	+ "Stop BJ" [if game.HasAnim(human.Mouth) == true][gold]
		game.RemoveAnim(human.Mouth)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
label TMMenuFaunaAnim_Neck(human)
-- + "Neck.."[if game.HasAnim(human.headNames) == false][gold]
	+ "Stop Neck"[if game.HasAnim(human.headNames) == true]
		game.RemoveAnim(human.headNames)
		Return()
	+ "Stop Humping"[if game.HasAnim(human) == true]
		game.RemoveAnim(human)
		Return()
	+ "<color=#54b095><i>Back."
		Return(2)
	+ "Nod - Eye Contact"
		activeloops[human.headNames] = 0.6/CL_SMult*2
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.headNames], 
		HeadRot(320, nil, nil), 
		HeadRot(280, nil, nil)), human.headNames)
		Return()
	+ "Nod - Eye Contact - 2"
		activeloops[human.headNames] = 0.6/CL_SMult*2
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV6(human,"Head", activeloops[human.headNames],
		HeadRot(320, nil, nil),
		HeadRot(280, nil, nil),
		HeadRot(320, nil, nil),
		HeadRot(280, nil, nil),
		HeadRot(280, nil, nil),
		HeadRot(320, nil, 20)), human.headNames)
		Return()
	+ "Nod - Eye Contact - 3"
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops6(human, EC_A , EC_B, EC_A, EC_A, EC_A, EC_B, "Test"), human.headNames)
		Return()
	+ "Nod - Jam - Randomized"
		activeloops[human.headNames] = 0.5/CL_SMult*2
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.headNames], 
		HeadRot((math.random(-20, -10)), nil, nil), 
		HeadRot((math.random(20, 10)), nil, nil)), human.headNames)
		Return()
	+ "Shake - No"
		activeloops[human.headNames] = 0.6/CL_SMult*3
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.headNames], 
		HeadRot(nil, 40, nil), 
		HeadRot(nil, 320, nil)), human.headNames)
		Return()
	+ "Shake - No - Quick"
		activeloops[human.headNames] = 0.3/CL_SMult*2.5
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.headNames], 
		HeadRot(320, 30, nil), 
		HeadRot(320, 330, nil)), human.headNames)
		Return()
	+ "Shake - lick"
		activeloops[human.headNames] = 0.6/CL_SMult*3.5
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.headNames], 
		HeadRot(320, 315, nil), 
		HeadRot(320, 45, nil)), human.headNames)
		Return()
	+ "Shake - No - Randomized"
		activeloops[human.headNames] = 0.6/CL_SMult*3
		game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.headNames], 
		HeadRot(nil, (math.random(20, 45)), nil), 
		HeadRot(nil, (math.random(340, 315)), nil)), human.headNames)
		Return()
	+ "Nod - Yes"
		activeloops[human.headNames] = 0.5/CL_SMult*2
		game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Head", activeloops[human.headNames], 
		HeadRot(325, nil, nil), 
		HeadRot(20, nil, nil)), human.headNames)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
label TMMenuFaunaAnim_HandR(human)
-- + "Right hand.."[if game.HasAnim(human.handNames) == false][gold]
	+ "BJ Gesture"
		human.pose(BJGesture())
		human.pose(TongueOut2())
		game.AddRepeatAnim(0.2/CL_SMult*1.4, || CustomLoops(human, Bjgesture_Ra, Bjgesture_Rb, "BJ Gesture"), human.handNames)
		Return()
	+ "WIP | Spank"
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, Slap_Ra, Slap_Rb, "Spank"), human.handNames)
		Return()
	+ "Beckon"
		human.Pose(Beckon())
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, Beckon_Ra, Beckon_Rb, "Beckon"), human.handNames)
		Return()
	+ "Touch Herself"
		game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, TouchHerself_Ra, TouchHerself_Rb, "Touch Herself R"), human.handNames)
		Return()
	-- + "Touch Herself 2"
	-- 	activeloops[human.handNames] = 0.6/CL_SMult*2.6
	-- 	game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV6(human, "Touch Herself 2", activeloops[human.handNames],
	-- 	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.747, -0.157, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	-- 	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.663, -0.204, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	-- 	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.819, -0.163, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	-- 	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.718, -0.251, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	-- 	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.564, -0.188, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	-- 	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.828, -0.184, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35))), human.handNames)
	-- 	Return()
	+ "WIP | Grope Breast - Topless"
		game.AddRepeatAnim(0.2/CL_SMult*1.5, || CustomLoops6(human, Gropebreast_Ra, Gropebreast_Rb, Gropebreast_Rc, Gropebreast_Rd, Gropebreast_Re, Gropebreast_Rf, "Grope Breast"), human.handNames)
		Return()
	+ "WIP | Grope Breast - 2"
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
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
label TMMenuFaunaAnim_HandL(human)
-- + "Left hand.."[if game.HasAnim(human.forearmNames) == false][gold]
	+ "WIP | Grope Breast Topless"
		game.AddRepeatAnim(0.3/CL_SMult*1.5, || CustomLoops6(human, Gropebreast_La, Gropebreast_Lb, Gropebreast_Lc, Gropebreast_Ld, Gropebreast_Le, Gropebreast_Lf, "Grope Breast"), human.forearmNames)
		Return()
	+ "WIP | Grope Breast - v6"
		game.AddRepeatAnim(0.3/CL_SMult*2, || CustomLoopsV6(human, "WIP - Grope Breast - 2", 0.9,
		HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.882, 0.678, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
		HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.823, 0.423, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
		HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.834, -0.124, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
		HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.797, 0.258, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
		HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.809, 0.081, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
		HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.98, -0.102, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35))), human.forearmNames)
		Return()
	+ "WIP | Grope Breast - v2"
		game.AddRepeatAnim(0.3/CL_SMult*2, || CustomLoopsV2(human, "WIP - Grope Breast - 2", 0.9,
		HandL(BoneMesh(TargetActor.Main, "Bone_Chest", 0.182, -0.312, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
		HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.957, 0.401, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35))), human.forearmNames)
		Return()
	+ "WIP | Touch Herself"
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
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
label TMMenuFaunaAnim_Hips(human)
-- + "Hips.."[gold]
	+ "Full Rotation" [if game.HasAnim(human.Anus) == false]
		activeloops[human.Anus] = 0.6/CL_SMult*1.5
		game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV4(human, "Rotate Hips", activeloops[human.Anus], 
		HipsRot(35, nil, -25), 
		HipsRot(35, nil, 25), 
		HipsRot(-35, nil, -25), 
		HipsRot(-35, nil, 25)), human.Anus)
		Return()
	+ "Full Rotation | 2" [if game.HasAnim(human.Anus) == false]
		activeloops[human.Anus] = 0.6/CL_SMult*1.5
		game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV4(human, "Rotate Hips 2", activeloops[human.Anus], 
		HipsRot(35, nil, -25), 
		HipsRot(35, nil, 25), 
		HipsRot(-35, nil, 25), 
		HipsRot(-35, nil, -25)), human.Anus)
		Return()
	+ "Sway.."[gold]
		+ "WIP | Sway Hips | Bent Over"
			activeloops[human] = 0.6/CL_SMult*2.5
			game.AddRepeatAnim(0.6/CL_SMult, || CustomLoops(human, HipSway_A, HipSway_B, "Swaying"), human)
			Return()
		+ "Stop Humping"[if game.HasAnim(human) == true]
			game.RemoveAnim(human)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "Twist.."[if game.HasAnim(human.thighNames) == false][gold]
		+ "Twist | 20"
			activeloops[human.thighNames] = 0.6/CL_SMult*1.5
			game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Twisting", activeloops[human.thighNames], 
			HipsRot(nil, -20, nil), 
			HipsRot(nil, 20, nil)), human.thighNames)
			Return()
		+ "Twist | 10"
			activeloops[human.thighNames] = 0.6/CL_SMult*1.5
			game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Twisting", activeloops[human.thighNames], 
			HipsRot(nil, -10, nil), 
			HipsRot(nil, 10, nil)), human.thighNames)
			Return()
		+ "Twist | 5"
			activeloops[human.thighNames] = 0.6/CL_SMult*1.5
			game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Twisting", activeloops[human.thighNames], 
			HipsRot(nil, -5, nil), 
			HipsRot(nil, 5, nil)), human.thighNames)
			Return()
		+ "Stop Twisting" [if game.HasAnim(human.thighNames) == true]
			game.RemoveAnim(human.thighNames)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "Tilt.."[if game.HasAnim(human.Anus) == false][gold]
		+ "Tilt | 35,  -25 > 25"
			activeloops[human.Anus] = 0.6/CL_SMult*2
			game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "HipMov", activeloops[human.Anus], 
			HipsRot(nil, nil, 25), 
			HipsRot(nil, nil, -25)), human.Anus)
			Return()
		+ "Tilt | 10-24"
			activeloops[human.Anus] = 0.6/CL_SMult*2
			game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "HipMov", activeloops[human.Anus], 
			HipsRot(nil, nil, (math.random(24, 10))), 
			HipsRot(nil, nil, (math.random(-10, -24)))), human.Anus)
			Return()
		+ "Tilt | 17"
			activeloops[human.Anus] = 0.6/CL_SMult*2
			game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "HipMov", activeloops[human.Anus], 
			HipsRot(nil, nil, 17), 
			HipsRot(nil, nil, -17)), human.Anus)
			Return()
		+ "Tilt | 13"
			activeloops[human.Anus] = 0.6/CL_SMult*2
			game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "HipMov", activeloops[human.Anus], 
			HipsRot(nil, nil, 13), 
			HipsRot(nil, nil, -13)), human.Anus)
			Return()
		+ "Tilt | 5-10"
			activeloops[human.Anus] = 0.6/CL_SMult*2
			game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "HipMov", activeloops[human.Anus], 
			HipsRot(nil, nil, (math.random(5, 10))), 
			HipsRot(nil, nil, (math.random(-5, -10)))), human.Anus)
			Return()
		+ "Stop Hip Moves" [if game.HasAnim(human.Anus) == true]
			game.RemoveAnim(human.Anus)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "Thrust.."[if game.HasAnim(human) == false][gold]
		+ "Humping | . 35"
			activeloops[human] = 0.5/CL_SMult*1.5
			game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], 
			HipsRot(-35, nil, nil), 
			HipsRot(35, nil, nil)), human)
			Return()
		+ "Humping | . 10 > 35"
			activeloops[human] = 0.6/CL_SMult*2
			game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], 
			HipsRot(-35, nil, nil), 
			HipsRot(10, nil, nil)), human)
			Return()
		+ "Humping | 0-20 > 30-40"
			activeloops[human] = 0.5/CL_SMult*1.5
			game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], 
			HipsRot((math.random(-40, -30)), nil, nil), 
			HipsRot((math.random(20, 0)), nil, nil)), human)
			Return()
		+ "Humping | .. 0 > 20-35"
			activeloops[human] = 0.5/CL_SMult*3
			game.AddRepeatAnim(0.7/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], 
			HipsRot((math.random(-20, -35)), nil, nil), 
			HipsRot(0, nil, nil)), human)
			Return()
		+ "Hard Humping"
			activeloops[human] = 0.3/CL_SMult*3
			game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], 
			HipsRot(-55, nil, nil), 
			HipsRot(-10, nil, nil)), human)
			Return()
		+ "Grind Face | -10 > -35-0 "
			activeloops[human] = 0.5/CL_SMult*2
			game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], 
			HipsRot((math.random(0, -35)), nil, nil), 
			HipsRot(-10, nil, nil)), human)
			Return()
		+ "Grind Face | -20 > -30"
			activeloops[human] = 0.6/CL_SMult*2.5
			game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], 
			HipsRot(-30, nil, nil), 
			HipsRot(-20, nil, nil)), human)
			Return()
		+ "Twerk"
			activeloops[human] = 0.3/CL_SMult*1.5
			game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], 
			HipsRot(45, nil, nil), 
			HipsRot(15, nil, nil)), human)
			Return()
		+ "Twerk 2"
			activeloops[human] = 0.3/CL_SMult*1.5
			game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], 
			HipsRot(50, nil, nil), 
			HipsRot(30, nil, nil)), human)
			Return()
		+ "Stop Humping" [if game.HasAnim(human) == true]
			game.RemoveAnim(human)
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "Stop Hip moves" [if game.HasAnim(human.Anus) == true]
		game.RemoveAnim(human.Anus)
		Return()
	+ "Stop Twisting" [if game.HasAnim(human.thighNames) == true]
		game.RemoveAnim(human.thighNames)
		Return()
	+ "Stop Humping"[if game.HasAnim(human) == true]
		game.RemoveAnim(human)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop