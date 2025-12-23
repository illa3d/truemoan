-- TrueMoan v1.0 by illa3d
label TMMenuAnim(human)
	+ "Speed.. | " .. ValueLabel(CL_SMult, adec) [gold]
		+ "Speed >"
			CL_SMult = CL_SMult + SpeedIncrement_A
			Return()
		+ "< Speed"
			CL_SMult = CL_SMult - SpeedIncrement_A
			Return()
		+ "RESET | " .. ValueLabel(CL_SMult, adec) [gold]
			CL_SMult = 1
			Return()
		+ MenuBack.." (applied to new anims)"
			Return(2)
		+ MenuClose
	+ "Ease.. | " .. ValueLabel2("", CLV2_A, "", CLV2_B, adec) [gold]
		+ "Ease In >"
			CLV2_A = CLV2_A + EaseIncrement_A
			Return()
		+ "< Ease In"
			CLV2_A = CLV2_A - EaseIncrement_A
			Return()
		+ "RESET Ease In | ".. ValueLabel(CLV2_A, adec) [gold]
			CLV2_A = 2
			Return()
		+ "Ease Out >"
			CLV2_B = CLV2_B + EaseIncrement_A
			Return()
		+ "< Ease Out"
			CLV2_B = CLV2_B - EaseIncrement_A
			Return()
		+ "RESET Ease Out | " .. ValueLabel(CLV2_B, adec) [gold]
			CLV2_B = 2
			Return()
		+ MenuBack.." (applied to new anims)"
			Return(2)
		+ MenuClose
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
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "BJ Randomizer.." [gold]
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
		+ MenuBack
			Return(2)
		+ MenuClose
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
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Hands.." [gold]
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
			+ MenuBack
				Return(2)
			+ MenuClose
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
			+ MenuBack
				Return(2)
			+ MenuClose
		+ "Stop left hand" [if game.HasAnim(human.forearmNames) == true]
			game.RemoveAnim(human.forearmNames)
			Return()
		+ "Stop right hand" [if game.HasAnim(human.handNames) == true]
			game.RemoveAnim(human.handNames)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
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
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Hips.." [gold]
		+ "Sway.." [gold]
			+ "Sway Hips - Bent Over (WIP)"
				activeloops[human] = 0.6/CL_SMult*2.5
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoops(human, HipSway_A, HipSway_B, "Swaying"), human)
				Return()
			+ MenuBack
				Return(2)
			+ MenuClose
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
			+ MenuBack
				Return(2)
			+ MenuClose
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
			+ MenuBack
				Return(2)
			+ MenuClose
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
			+ MenuBack
				Return(2)
			+ MenuClose
		+ "Stop Hip moves" [if game.HasAnim(human.Anus) == true]
			game.RemoveAnim(human.Anus)
			Return()
		+ "Stop Twisting/Swaying" [if game.HasAnim(human.thighNames) == true]
			game.RemoveAnim(human.thighNames)
			Return()
		+ "Stop Humping"[if game.HasAnim(human) == true]
			game.RemoveAnim(human)
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
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
		+ MenuBack
			Return(2)
		+ MenuClose
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
		+ MenuBack
			Return(2)
		+ MenuClose
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
	+ MenuBack
		Return(2)
	+ MenuClose
stop