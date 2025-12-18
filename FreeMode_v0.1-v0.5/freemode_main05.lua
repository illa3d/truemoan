init = false
-- FreemodeHG version 0.3 - faunap_edit_0.2 - illa3d_edit_0.2

--	HeadLookAt(BoneMesh(TargetActor.A, "Bone_Head", 0, 0, 0.03)),
--<color=red><b>text</b></color>
--<color=#890000><i>
-- nil (?<=index:\s*)\d+

-- Variables
activeloops = {}
activeAutoBJ = false
CL_SMult = 1 --Speed multiplier
--CL_Imult = 0.5 --Intensity multiplier
HG_UIvis = true

label Start()
	init = true
	ResetTimer("GenericChat", math.random(-10, 0))
	--game.CreateHuman(game.GetRandomGirlName())
	--game.CreateHuman(game.GetRandomGirlName())
		-- PlaySound ("SDTIntro", 0.5)
	--IntroPose(game.GetHumans()[1], game.GetHumans()[2])

	local speaker = game.GetRandomHuman(|h| h.CanSpeak)
	if speaker ~= nil
		speaker.Say("Greeting")

	-- Edit Body Increments --
	sizestep = 0.1
	penisstep = 0.02
	bodystep = 0.01
	-- Varibles --
	cumevery = 0
	boobsize = 0
	buttsize = 0
	penissize = 0
	penislength = 0
	bodysize = 0
	slowvoiceadjust = 0
	normalvoiceadjust = 0


	Jump("FreeMode")
stop

label TalkMenu(human, hitTri)
	+ "Options.."[gold]
		+ "Body.. | " .. bodysize [gold]
			+ "< Body"
				bodysize = bodysize - bodystep
				human.Body("Body size", bodysize)
				Return()
			+ "Body >"
				bodysize = bodysize + bodystep
				human.Body("Body size", bodysize)
				Return()
			+ "RESET | " .. bodysize
				bodysize = 0
				human.Body("Body size", 0)
				Return()
			+ "Back."
				Return(2)
			+ "Done."
		+ "Ass.. | " .. buttsize [gold]
			+ "< Ass"
				buttsize = buttsize - sizestep
				human.Body("Ass size", buttsize)
				Return()
			+ "Ass >"
				buttsize = buttsize + sizestep
				human.Body("Ass size", buttsize)
				Return()
			+ "RESET | " .. buttsize
				buttsize = 0
				human.Body("Ass size", buttsize)
				Return()
			+ "Back."
				Return(2)
			+ "Done."
		+ if human.m_isMale == false
			+ "Breasts.. | " .. boobsize [gold]
				+ "< Breasts"
					boobsize = boobsize - sizestep
					if (boobsize < -0.9)
						boobsize = -0.9
					human.Body("Breasts size", boobsize)
					Return()
				+ "Breasts >"
					boobsize = boobsize + sizestep
					human.Body("Breasts size", boobsize)
					Return()
				+ "RESET | " .. boobsize
					boobsize = 0
					human.Body("Breasts size", boobsize)
					Return()
				+ "Back."
					Return(2)
				+ "Done."
		+ if human.Penis.IsActive == false 
			+ "Pussy.. | " .. human.m_vagina.m_wetness [gold]
				+ "< Wetness"
					human.m_vagina.m_wetness = human.m_vagina.m_wetness - 100
					Return()
				+ "Wetness >"
					human.m_vagina.m_wetness = human.m_vagina.m_wetness + 100
					Return()
				+ "Squirting"
					human.m_vagina.m_wetness = 10000
					Return()
				+ "Wet"
					human.m_vagina.m_wetness = 1000
					Return()
				+ "RESET | " .. human.m_vagina.m_wetness
					human.m_vagina.m_wetness = 0
					Return()
				+ "Back."
					Return(2)
				+ "Done."
		+ if human.Penis.IsActive
			+ "Penis.. | L:" .. penislength .. " | S:".. penissize[gold]
				+ "< Length"
					penislength = penislength - penisstep
					human.Body("Penis length", penislength)
					Return()
				+ "Length >"
					penislength = penislength + penisstep
					human.Body("Penis length", penislength)
					Return()
				+ "< Size"
					penissize = penissize - penisstep
					human.Body("Penis size", penissize)
					Return()
				+ "Size >"
					penissize = penissize + penisstep
					human.Body("Penis size", penissize)
					Return()
				+ "RESET | L:" .. penislength .. " | S:".. penissize
					penislength = 0
					penissize = 0
					human.Body("Penis size", penislength, "Penis length", penissize)
					Return()
				+ "Foreskin RESET"
					human.Penis.m_penisSkinOut = 0
					Return()
				+ "Back."
					Return(2)
				+ "Done."
		+ "Voice.." [gold]
			+ "Increase slow threshold " .. slowvoiceadjust
				slowvoiceadjust = slowvoiceadjust + 0.01
				Return(1)
			+ "Decrease slow threshold"
				slowvoiceadjust = slowvoiceadjust - 0.01
				Return(1)
			+ "Increase normal threshold " .. normalvoiceadjust
				normalvoiceadjust = normalvoiceadjust + 0.01
				Return(1)
			+ "Decrease normal threshold"
				normalvoiceadjust = normalvoiceadjust - 0.01
				Return(1)
			+ "Back"
				Return(2)
		+ "Music.."[gold]
			local tracklist = {"01_Dreamy_Whisper", "02_Moon-blind", "03_OpenMeBabe", "04_What_an_Easy_Good-bye", "05_Somtimes", "06_Love_in_Fareast", "07_Tender_Passion", "08_Orbit", "09_Dancing_Queen", "10_Memories_of_Childhood", "11_Raggae_Fever", "12_Why", "13_Comma", "14_NoWar", "15_Special_Light", "16_Enjoy_Yaslef", "17_Lyve_Live", "18_Aquabelle", "19_1st_Mission", "20_Time_to_Groove", "21_Love_is_Bubble", "22_Flower_Bearing", "23_Secret_Garden_Before", "24_X-ray", "25_CallousCall", "26_Order_Circle", "27_This_is_My_Stage", "28_Wait_4_U", "29_Welcome_to_Radux_World", "30_Journey_to_You"}
			--game "Choose a track"
			+ "Back."
				Return (2)
			+ for i, track in ipairs(tracklist)
				+ "Play " .. track
					Music(track , 0.05, 0)
			+ "Stop Music"
				StopMusic()
			+ "Back."
				Return(2)
		+ "Hide UI" [if HG_UIvis == true]
			HG_UIvis = false
			game.m_controlsUI.Show(false)
			Return()
		+ "Show UI" [if HG_UIvis == false]
			HG_UIvis = true
			game.m_controlsUI.Show()
			Return()
		+ "Back."
			Return(2)
		+ "Done."
	+ "Poses.."[gold]
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
			+ "Back."
				Return(2)
			+ "Done."
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
			+ "Back."
				Return(2)
			+ "Done."
		+ "Lay.."[gold]
			+ "On your Back."
				human.Pose(LayDownBack1())
				Return()
			+ "On your side - Right."
				human.Pose(LayDownSideR())
				Return()
			+ "On your side - Left."
				human.Pose(LayDownSideL())
				Return()
			+ "On your stomach."
				human.Pose(LaydownStomach1())
				Return()
			+ "Back."
				Return(2)
			+ "Done."
		+ "Stand.."[gold]
			+ "Stand up!"
				human.Pose(StandUp1())
				Return()
			+ "Bend over."
				human.Pose(BendOver1())
				Return()
			+ "Back."
				Return(2)
			+ "Done."
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
			+ "Back. ^^^ Click twice! ^^^"
				Return(2)
			+ "Done."
		+ "Arms.."[gold]
			+ for i, pres in ipairs (bodystr)
				+ "" .. pres
					human.Pose(bodypresets[i]())
					Return()
			+ "Back."
				Return(2)
			+ "Done."
		+ "Back."
			Return(2)
		+ "Done."
	+ "Anim.." [gold]
		+ "Anim Speed.. | " .. CL_SMult [gold]
			+ "Animation Speed | " .. CL_SMult [gold]
				Return()
			+ "Increase speed"
				CL_SMult = CL_SMult*1.1
				Return()
			+ "Decrease speed"
				CL_SMult = CL_SMult*0.9
				Return()
			+ "Reset speed"
				CL_SMult = 1
				Return()
			+ "Back."
				Return(2)
			+ "Done."
		+ "Speedlab | " .. CL_SMult [gold]
			+ "Ease In = ".. CLV2_A ..".. Reset?"[gold]
				CLV2_A = 2
			+ "Increase Ease In"
				CLV2_A = CLV2_A + EaseIncrement_A
				Return()
			+ "Decrease Ease In"
				CLV2_A = CLV2_A - EaseIncrement_A
				Return()
			+ "Ease Out = ".. CLV2_B ..".. Reset?"[gold]
				CLV2_A = 2
			+ "Increase Ease Out"
				CLV2_B = CLV2_B + EaseIncrement_A
				Return()
			+ "Decrease Ease Out"
				CLV2_B = CLV2_B - EaseIncrement_A
				Return()
			+ "Increase speed"
				CL_SMult = CL_SMult + SpeedIncrement_A
				Return()
			+ "Decrease speed"
				CL_SMult = CL_SMult - SpeedIncrement_A
				Return()
			+ "Anim Speed = "  .. CL_SMult .. ".. Reset?"[gold]
				CL_SMult = 1
				Return()
			+ "Back."
				Return(2)
			+ "Done."
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
			+ "Back."
				Return(2)
			+ "Done."
		+ "Legs.."[if game.HasAnim(human.footNames) == false][gold]
			+ "Footjob.Stand.Right"
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, Footjob_1Ra, Footjob_1Rb, "FJ.Stand.R"), human.Anus)
				Return()
			+ "WIP - Leg Sway L"
				human.Pose(LaydownStomach1())
				activeloops[human.footNames] = 0.6/CL_SMult*2.7
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "legswayL", activeloops[human.footNames], FootL(WPos(-0.15, 0.577, -0.62)), FootL(WPos(-0.15, 0.639, -0.4))), human.footNames)
				Return()
			+ "WIP - Leg Sway R"
				human.Pose(LaydownStomach1())
				activeloops[human.footNames] = 0.6/CL_SMult*2.7		
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "legswayR", activeloops[human.footNames], FootR(WPos(0.007, 0.577, -0.7)), FootR(WPos(0.043, 0.639, -0.4))), human.footNames)
				Return()
			+ "WIP - Leg Sway Both"
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
			+ "Back."
				Return(2)
			+ "Done."
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
			+ "Back."
				Return(2)
			+ "Done."
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
			+ "Back."
				Return(2)
			+ "Done."
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
			+ "Back."
				Return(2)
			+ "Done."
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
				+ "WIP - Spank"
					game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, Slap_Ra, Slap_Rb, "Spank"), human.handNames)
					Return()
				+ "Beckon"
					human.Pose(Beckon())
					game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, Beckon_Ra, Beckon_Rb, "Beckon"), human.handNames)
					Return()
				+ "Touch Herself"
					game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, TouchHerself_Ra, TouchHerself_Rb, "Touch Herself R"), human.handNames)
					Return()
				+ "WIP - Grope Breast Topless"
					game.AddRepeatAnim(0.2/CL_SMult*1.5, || CustomLoops6(human, Gropebreast_Ra, Gropebreast_Rb, Gropebreast_Rc, Gropebreast_Rd, Gropebreast_Re, Gropebreast_Rf, "Grope Breast"), human.handNames)
					Return()
				+ "WIP - Grope Breast - 2"
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
				+ "Back."
					Return(2)
				+ "Done."
			+ "Left hand.."[if game.HasAnim(human.forearmNames) == false][gold]
				+ "WIP - Grope Breast Topless"
					game.AddRepeatAnim(0.3/CL_SMult*1.5, || CustomLoops6(human, Gropebreast_La, Gropebreast_Lb, Gropebreast_Lc, Gropebreast_Ld, Gropebreast_Le, Gropebreast_Lf, "Grope Breast"), human.forearmNames)
					Return()
				+ "WIP - Grope Breast - 2"
					game.AddRepeatAnim(0.3/CL_SMult*2, || CustomLoopsV2(human, "WIP - Grope Breast - 2", 0.9,
					HandL(BoneMesh(TargetActor.Main, "Bone_Chest", 0.182, -0.312, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
					HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.957, 0.401, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35))), human.forearmNames)
					Return()
				+ "WIP - Touch Herself"
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
				+ "Back."
					Return(2)
				+ "Done."
			+ "Stop left hand" [if game.HasAnim(human.forearmNames) == true]
				game.RemoveAnim(human.forearmNames)
				Return()
			+ "Stop right hand" [if game.HasAnim(human.handNames) == true]
				game.RemoveAnim(human.handNames)
				Return()
			+ "Back."
				Return(2)
			+ "Done."
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
			+ "Back."
				Return(2)
			+ "Done."

		+ "Hips.."[gold]
			+ "Full Rotation" [if game.HasAnim(human.Anus) == false]
				activeloops[human.Anus] = 0.6/CL_SMult*1.5
				game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV4(human, "Rotate Hips", activeloops[human.Anus], HipsRot(35, 0, -25), HipsRot(35, 0, 25), HipsRot(-35, 0, -25), HipsRot(-35, 0, 25)), human.Anus)
				Return()
			+ "Full Rotation - 2" [if game.HasAnim(human.Anus) == false]
				activeloops[human.Anus] = 0.6/CL_SMult*1.5
				game.AddRepeatAnim(0.4/CL_SMult, || CustomLoopsV4(human, "Rotate Hips 2", activeloops[human.Anus], HipsRot(35, 0, -25), HipsRot(35, 0, 25), HipsRot(-35, 0, 25), HipsRot(-35, 0, -25)), human.Anus)
				Return()
			+ "Sway.."[gold]
				+ "WIP - Sway Hips - Bent Over"
					activeloops[human] = 0.6/CL_SMult*2.5
					game.AddRepeatAnim(0.6/CL_SMult, || CustomLoops(human, HipSway_A, HipSway_B, "Swaying"), human)
					Return()
				+ "Back."
					Return(2)
				+ "Done."
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
				+ "Back."
					Return(2)
				+ "Done."
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
				+ "Back."
					Return(2)
				+ "Done."
			+ "Thrust.."[if game.HasAnim(human) == false][gold]
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
				+ "Back."
					Return(2)
				+ "Done."
			+ "Stop Hip moves" [if game.HasAnim(human.Anus) == true]
				game.RemoveAnim(human.Anus)
				Return()
			+ "Stop Twisting/Swaying" [if game.HasAnim(human.thighNames) == true]
				game.RemoveAnim(human.thighNames)
				Return()
			+ "Stop Humping"[if game.HasAnim(human) == true]
				game.RemoveAnim(human)
				Return()
			+ "Back."
				Return(2)
			+ "Done."
		+ "Stop shaking" [if game.HasAnim(human.chestNames) == true]
			game.RemoveAnim(human.chestNames)
			Return()
		+ "Stop Bouncing" [if game.HasAnim(human.breastNames) == true]
			game.RemoveAnim(human.breastNames)
			Return()
		+ "Stop left hand" [if game.HasAnim(human.forearmNames) == true]
			game.RemoveAnim(human.forearmNames)
			Return()
		+ "Stop right hand" [if game.HasAnim(human.handNames) == true]
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
			Return(2)
		+ "Stop humping"[if game.HasAnim(human) == true]
			game.RemoveAnim(human)
			Return()
		+ "Back."
			Return(2)
		+ "Done."
	+ "Face.."[gold]
		+ "Default.."[gold]
			+ "Back."
				Return(2)
			+ "Happy face."
				human.Pose(FaceSmile())
				Return()
			+ "Angry face."
				human.Pose(FaceAngry())
				Return()
			+ "Sad face."
				human.Pose(FaceSad())
				Return()
			+ "Ahegao!"
				human.Pose(FaceAhegao())
				Return()
			+ "Ahegao! x 2"
				human.Pose(FaceAhegao2())
				Return()
			+ "Surprised face."
				human.Pose(FaceSurprised())
				Return()
			+ "Scared face."
				human.Pose(FaceScared())
				Return()
			+ "Disgusted face."
				human.Pose(FaceDisgusted())
				Return()
			+ "Neutral face."
				human.Pose(FaceNeutral())
				Return()
			+ "Back."
				Return(2)
			+ "Done."
		+ "Custom.."[gold]
			+ "Back."
				Return(2)
			+ for i, pres in ipairs (facestr)
				+ " " .. pres
					human.Pose(facepresets[i]())
					Return()
			+ "kiss/tongue.."[gold]
				+ for i, pres in ipairs (kissstr)
					+ " " .. pres
						human.Pose(kisspresets[i]())
						Return()
				+ "Back."
					Return(2)
				+ "Done."
			+ "Neutral face."
				human.Pose(FaceNeutral())
				Return()
			+ "Back."
				Return(2)
			+ "Done."
		+ "Loops.. WIP"[gold]
			+ "Neutral face."
				human.Pose(FaceNeutral())
				Return()
			+ "Smile > Ahegao"
				game.AddRepeatAnim(2, || CustomLoops(human, FaceSmile, FaceAhegao, "Smile > Ahegao"), human)
				Return()
			+ "WIP - Idle Anim Test"
				game.AddRepeatAnim((math.random(5,20)), || CustomLoops3(human, Lipbite, Kiss2, Pursedlips, "Test"), human)
			-- + "WIP - Smile > Kiss"
			-- 	game.AddRepeatAnim(2, || CustomLoops4(human, FaceSmile, Kiss2, FaceSmile, FaceSmile, "Smile > Kiss"), human)
			-- 	Return()
			+ "Neutral > Scared"
				game.AddRepeatAnim(3, || CustomLoops(human, FaceNeutral, FaceScared, "Neutral > Scared"), human)
				Return()
			+ "Angry > Surprised"
				game.AddRepeatAnim(4, || CustomLoops(human, FaceAngry, FaceSurprised, "Angry > Surprised"), human) 
				Return()
			+ "Look Actor > Look Camera"
				game.AddRepeatAnim((math.random(5, 20)), || CustomLoops(human, LookActorA, LookCam, "Look Actor > Look Camera"), human) 
				Return()
			+ "Stop" [if game.HasAnim(human.m_mouth) == true]
				game.RemoveAnim(human.m_mouth)
				Return()
			+ "STOP LOOPING" [if game.HasAnim(human) == true]
				game.RemoveAnim(human)
				Return()
			+ "Back. **EYE BUG during movement**"
				Return(2)
			+ "Done."
		+ "Cheeks.."[gold]
			+ "1. Left + 0.25"[gold]
				human.Pose(Cheekspar1_A())
				Return()
			+ "1. Left - 0.25"
				human.Pose(Cheekspar1_B())
				Return()
			+ "Reset Cheek Parameter 1"
				human.Pose(ResetCheeksParam(1))
				Return()
			+ "2. Right + 0.25"[gold]
				human.Pose(Cheekspar2_A())
				Return()
			+ "2. Right - 0.25"
				human.Pose(Cheekspar2_B())
				Return()
			+ "Reset Cheek Parameter 2"
				human.Pose(ResetCheeksParam(2))
				Return()
			+ "Done."
			+ "Back."
				Return(2)
		+ "Brows.."[gold]
			+ "Right Brow.."[gold]
				+ "1. Right Inner + 0.25"[gold]
					human.Pose(Browspar1_A())
					Return()
				+ "1. Right Inner - 0.25"
					human.Pose(Browspar1_B())
					Return()
				+ "Reset Brows Parameter 1"
					human.Pose(ResetBrowsParam(1))
					Return()
				+ "3. Right Outer + 0.25"[gold]
					human.Pose(Browspar3_A())
					Return()
				+ "3. Right Outer - 0.25"
					human.Pose(Browspar3_B())
					Return()
				+ "Reset Brows Parameter 3"
					ResetBrowsParam(3)
					Return()
				+ "Done."
				+ "Back."
					Return(2)
			+ "Left Brow.."[gold]
				+ "2. Left Inner + 0.25"[gold]
					human.Pose(Browspar2_A())
					Return()
				+ "2. Left Inner - 0.25"
					human.Pose(Browspar2_B())
					Return()
				+ "Reset Brows Parameter 2"
					human.Pose(ResetBrowsParam(2))
					Return()
				+ "4. Left Outer + 0.25"[gold]
					human.Pose(Browspar4_A())
					Return()
				+ "4. Left Outer - 0.25"
					human.Pose(Browspar4_B())
					Return()
				+ "Reset Brows Parameter 4"
					ResetBrowsParam(4)
					Return()
				+ "Done."
				+ "Back."
					Return(2)
			+ "Both Brows.."[gold]
				+ "Left + 0.25"[gold]
					human.Pose(Browspar4_A())
					human.Pose(Browspar2_A())
					Return()
				+ "Left - 0.25"
					human.Pose(Browspar4_B())
					human.Pose(Browspar2_B())
					Return()
				+ "Right + 0.25"[gold]
					human.Pose(Browspar1_A())
					human.Pose(Browspar3_A())
					Return()
				+ "Right - 0.25"
					human.Pose(Browspar1_B())
					human.Pose(Browspar3_B())
					Return()
				+ " Inner + 0.25"[gold]
					human.Pose(Browspar1_A())
					human.Pose(Browspar2_A())
					Return()
				+ " Inner - 0.25"
					human.Pose(Browspar1_B())
					human.Pose(Browspar2_B())
					Return()
				+ " Outer + 0.25"[gold]
					human.Pose(Browspar3_A())
					human.Pose(Browspar4_A())
					Return()
				+ " Outer - 0.25"
					human.Pose(Browspar3_B())
					human.Pose(Browspar4_B())
					Return()
				+ "Done."
				+ "Back."
					Return(2)
			+ "Raise"[gold]
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
			+ "Back."
				Return(2)
			+ "Done."
		+ "Mouth"[gold]
			+ "Back."
				Return(2)
			+ "Jaw V/H"[gold]
				+ "1. Jaw V + 0.25"[gold]
					human.Pose(Mouthpar1_A())
					Return()
				+ "1. Jaw V - 0.25"
					human.Pose(Mouthpar1_B())
					Return()
				+ "Reset Mouth Parameter 1"
					human.Pose(ResetMouthParam(1))
					Return()
				+ "2. Jaw H + 0.25"[gold]
					human.Pose(Mouthpar2_A())
					Return()
				+ "2. Jaw H - 0.25"
					human.Pose(Mouthpar2_B())
					Return()
				+ "Reset Mouth Parameter 2"
					human.Pose(ResetMouthParam(2))
					Return()
				+ "Back."
					Return(2)
				+ "Done."
			+ "Jaw Length"[gold]
				+ "3. Jaw L + 0.25"[gold]
					human.Pose(Mouthpar3_A())
					Return()
				+ "3. Jaw L - 0.25"
					human.Pose(Mouthpar3_B())
					Return()
				+ "Reset Mouth Parameter 3"
					ResetMouthParam(3)
					Return()
				+ "Back."
					Return(2)
				+ "Done."
			+ "Lip Top"[gold]
				+ "4. Lip TR + 0.25"[gold]
					human.Pose(Mouthpar4_A())
					Return()
				+ "4. Lip TR - 0.25"
					human.Pose(Mouthpar4_B())
					Return()
				+ "Reset Mouth Parameter 4"
					ResetMouthParam(4)
					Return()
				+ "5. Lip TL + 0.25"[gold]
					human.Pose(Mouthpar5_A())
					Return()
				+ "5. Lip TL - 0.25"
					human.Pose(Mouthpar5_B())
					Return()
				+ "Reset Mouth Parameter 5"
					ResetMouthParam(5)
					Return()
				+ "Back."
					Return(2)
				+ "Done."
			+ "Lip Bot"[gold]
				+ "6. Lip BR + 0.25"[gold]
					human.Pose(Mouthpar6_A())
					Return()
				+ "6. Lip BR - 0.25"
					human.Pose(Mouthpar6_B())
					Return()
				+ "Reset Mouth Parameter 6"
					ResetMouthParam(6)
					Return()
				+ "7. Lip BL + 0.25"[gold]
					human.Pose(Mouthpar7_A())
					Return()
				+ "7. Lip BL - 0.25"
					human.Pose(Mouthpar7_B())
					Return()
				+ "Reset Mouth Parameter 7"
					ResetMouthParam(7)
					Return()
				+ "Back."
					Return(2)
				+ "Done."
			+ "Smile"[gold]
				+ "8. Smile R + 0.25"[gold]
					human.Pose(Mouthpar8_A())
					Return()
				+ "8. Smile R - 0.25"
					human.Pose(Mouthpar8_B())
					Return()
				+ "Reset Mouth Parameter 8"
					ResetMouthParam(8)
					Return()
				+ "9. Smile L + 0.25"[gold]
					human.Pose(Mouthpar9_A())
					Return()
				+ "9. Smile L - 0.25"
					human.Pose(Mouthpar9_B())
					Return()
				+ "Reset Mouth Parameter 9"
					ResetMouthParam(9)
					Return()
				+ "Back."
					Return(2)
				+ "Done."
			+ "Lip Width"[gold]
				+ "10. Lip WR + 0.25"[gold]
					human.Pose(Mouthpar10_A())
					Return()
				+ "10. Lip WR - 0.25"
					human.Pose(Mouthpar10_B())
					Return()
				+ "Reset Mouth Parameter 10"
					ResetMouthParam(10)
					Return()
				+ "11. Lip WL + 0.25"[gold]
					human.Pose(Mouthpar11_A())
					Return()
				+ "11. Lip WL - 0.25"
					human.Pose(Mouthpar11_B())
					Return()
				+ "Reset Mouth Parameter 11"
					ResetMouthParam(11)
					Return()
				+ "Back."
					Return(2)
				+ "Done."
			+ "Lip Height"[gold]
				+ "12. Pursed + 0.25"[gold]
					human.Pose(Mouthpar12_A())
					Return()
				+ "12. Pursed - 0.25"
					human.Pose(Mouthpar12_B())
					Return()
				+ "Reset Mouth Parameter 12"
					ResetMouthParam(12)
					Return()
				+ "Back."
					Return(2)
				+ "Done."
			+ "Kiss"[gold]
				+ "13. Pucker + 0.25"[gold]
					human.Pose(Mouthpar13_A())
					Return()
				+ "13. Pucker - 0.25"
					human.Pose(Mouthpar13_B())
					Return()
				+ "Reset Mouth Parameter 13"
					ResetMouthParam(13)
					Return()
				+ "Back."
					Return(2)
				+ "Done."
			+ "Tongue Length"[gold]
				+ "14. Tongue L + 0.25"[gold]
					human.Pose(Mouthpar14_A())
					Return()
				+ "14. Tongue L - 0.25"
					human.Pose(Mouthpar14_B())
					Return()
				+ "Reset Mouth Parameter 14"
					ResetMouthParam(14)
					Return()
				+ "Back."
					Return(2)
				+ "Done."
			+ "Tongue V/H"[gold]
				+ "15. Tongue H + 0.25"[gold]
					human.Pose(Mouthpar15_A())
					Return()
				+ "15. Tongue H - 0.25"
					human.Pose(Mouthpar15_B())
					Return()
				+ "Reset Mouth Parameter 15"
					ResetMouthParam(15)
					Return()
				+ "16. Tongue V + 0.25"[gold]
					human.Pose(Mouthpar16_A())
					Return()
				+ "16. Tongue V - 0.25"
					human.Pose(Mouthpar16_B())
					Return()
				+ "Reset Mouth Parameter 16"
					ResetMouthParam(16)
				+ "Back."
					Return(2)
				+ "Done."
			+ "Neutral"
				play.pose(ResetALLMouthParam())
			+ "Back."
				Return(2)
			+ "Done."
		+ "STOP LOOPING" [if game.HasAnim(human) == true]
			game.RemoveAnim(human)
			Return()
		+ "Neutral face."
			human.Pose(FaceNeutral())
			Return()
		+ "Back."
			Return(2)
		+ "Done."
	+ "Clothes.."[gold]
		+ "Clothes OFF"
			hadpenis = human.Penis.IsActive
			human.CustomizeAll(99)
			if (hadpenis == true)
				human.Customize("Penis", 1)
			else 
				human.Customize("Penis", 0)
		+ "Clothes ON"
			hadpenis = human.Penis.IsActive
			human.CustomizeAll(0)
		+ "Back."
			Return(2)
		+ "Done."
	+ "Sex.."[gold]
		+ if human.Penis.IsActive
			+ if human.Penis.IsActive and game.HasAnim(human.Penis)
				+ "Stop cumming."
					cumevery = 0
					game.RemoveAnim(human.Penis)
			+ else
				+ "Cum.."[gold]
					+ "Cum every 1 sec."
						cumevery = 1
						game.AddRepeatAnim(1, || human.Shoot(), human.Penis)
						Return(2)
					+ "Cum every 2 sec."
						cumevery = 2
						game.AddRepeatAnim(2, || human.Shoot(), human.Penis)
						Return(2)
					+ "Cum every 4 sec."
						cumevery = 4
						game.AddRepeatAnim(4, || human.Shoot(), human.Penis)
						Return(2)
					+ "Cum every 8 sec."
						cumevery = 8
						game.AddRepeatAnim(8, || human.Shoot(), human.Penis)
						Return(2)
					+ "Cum every 16 sec."
						cumevery = 16
						game.AddRepeatAnim(16, || human.Shoot(), human.Penis)
						Return(2)
					+ "Cum every 32 sec."
						cumevery = 32
						game.AddRepeatAnim(32, || human.Shoot(), human.Penis)
						Return(2)
					+ "Back."
						Return(2)
					+ "Done."
		+ if human.Penis.Hole ~= nil
			+ "Sex Speed.. | " .. human.Penis.Interaction.m_autoSpeed [gold]
				+ "< Slower"
					human.Penis.Interaction.m_autoSpeed = human.Penis.Interaction.m_autoSpeed*0.9
					Return()
				+ "Faster >"
					human.Penis.Interaction.m_autoSpeed = human.Penis.Interaction.m_autoSpeed*1.1
					Return()
				+ "4 - Fastest"
					human.Penis.Interaction.m_autoSpeed = 1
					Return()
				+ "3 - Fast"
					human.Penis.Interaction.m_autoSpeed = 0.5
					Return()
				+ "2 - Medium"
					human.Penis.Interaction.m_autoSpeed = 0.20
					Return()
				+ "1 - Slow"
					human.Penis.Interaction.m_autoSpeed = 0.10
					Return()
				+ "RESET | " .. human.Penis.Interaction.m_autoSpeed [gold]
					human.Penis.Interaction.m_autoSpeed = 0
					Return()
				+ "Back."
					Return(2)
				+ "Done."
		+ "Auto Thrust!" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == false]
			--function GradualSpeedUpAutoThrusting(human, duration, step, startSpeed, endSpeed, startDepth, endDepth, autoDisableAfter)
			GradualSpeedUpAutoThrusting(human, 30, 0, 0.6, 0.3, 0.1, 1, 30)
			Return()
		+ "Start thrusting!" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == false]
			human.Penis.Interaction.AutoActive = true
			human.Penis.Interaction.AutoPenisWeight = 1
			Return()
		+ "Stop thrusting!" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == true]
			human.Penis.Interaction.AutoActive = false
			Return()
		+ "Start sucking!" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == false and activeAutoBJ == false]
			human.Mouth.Fucker.Penis.Interaction.AutoActive = true
			human.Mouth.Fucker.Penis.Interaction.AutoPenisWeight = 0
			Return()
		+ "Stop sucking!" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == true and activeAutoBJ == false]
			human.Mouth.Fucker.Penis.Interaction.AutoActive = false
			Return()
		+ "Auto BJ" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == false and activeAutoBJ == false]
			--function GradualSpeedUpAutoBJ(human, duration, step, startSpeed, endSpeed, startDepth, endDepth, autoDisableAfter)
			human.Mouth.Fucker.Penis.Interaction.AutoPenisWeight = 0
			GradualSpeedUpAutoBJ(human, 30, 0, 0.35, 0.1, 0.3, 1.5, 25)
			activeAutoBJ = true
			Return()
		+ "Stop AutoBJ!" [if human.Mouth.Fucker ~= nil and activeAutoBJ == true] [gold]
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
		+ "Back."
			Return(2)
		+ "Done."
	+ "Hey " .. human.Name ..".."[gold]
		+ "Look at.."[gold]
			+ "Actor A: Look at"
				human.Pose(LookActorA())
				Return()
			+ "Actor A: Face"
				human.Pose(FaceActorA())
				Return()
			+ "Actor B: Look at"
				human.Pose(LookActorB())
				Return()
			+ "Actor B: Face"
				human.Pose(FaceActorB())
				Return()
			+ "Actor C: Look at"
				human.Pose(LookActorC())
				Return()
			+ "Actor C: Face"
				human.Pose(FaceActorC())
				Return()
			+ "Cam: Look at"
				human.Pose(LookCam())
				Return()
			+ "Cam: Face"
				human.Pose(FaceCam())
				Return()
			+ "Back."
				Return(2)
			+ "Done."
		+ "Hands.."[gold]
			+ "Grab Head!"
				human.Pose(GrabHead())
				Return()
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
			+ "Back."
				Return(2)
			+ "Done."
		+ if human.m_isMale == true
			+ "Time to bottom, " .. human.Name .. "!"
				human.m_isMale = false
				human "Alright"
				Return(2)
		+ "Stop Legs" [if game.HasAnim(human.footNames) == true]
			game.RemoveAnim(human.footNames)
			Return()
		+ "Stop humping"[if game.HasAnim(human) == true]
			game.RemoveAnim(human)
			Return()
		+ "Stop Hip moves" [if game.HasAnim(human.Anus) == true]
			game.RemoveAnim(human.Anus)
			Return()
		+ "Stop shaking" [if game.HasAnim(human.chestNames) == true]
			game.RemoveAnim(human.chestNames)
			Return()
		+ "Stop Bouncing" [if game.HasAnim(human.breastNames) == true]
			game.RemoveAnim(human.breastNames)
			Return()
		+ "Stop Licking" [if game.HasAnim(human.m_mouth) == true]
			game.RemoveAnim(human.m_mouth)
			Return()
		+ "Stop right hand" [if game.HasAnim(human.handNames) == true]
			game.RemoveAnim(human.handNames)
			Return()
		+ "Stop left hand" [if game.HasAnim(human.forearmNames) == true]
			game.RemoveAnim(human.forearmNames)
			Return()
		+ "Stop Head"[if game.HasAnim(human.headNames) == true]
			game.RemoveAnim(human.headNames)
			Return()
		+ "Stop twisting" [if game.HasAnim(human.thighNames) == true]
			game.RemoveAnim(human.thighNames)
			Return()
		+ "Kneel!"
			human.Pose(KneelDown1())
			Return()
		+ "Stand!"
			human.Pose(StandUp1())
			Return()
		+ "Sit!"
			human.Pose(SitDown())
			Return()
		+ "Back."
			Return(2)
		+ "Done."
	+ if game.PovHuman ~= human
		+ "POV."
			game.PovHuman = human
	+ if game.PovHuman ~= nil
		+ "Exit POV."
			game.PovHuman = nil
	-- + "Crash Tests"[gold]
	-- 	+ "Neutral"
	-- 		ResetALLMouthParam()
	-- 		human.Pose(Mouthpar14_A())
	-- 		Delayed(2)human.Pose(Mouthpar14_B())
	-- 		Return()
	-- 	+ "1. Jaw V + 0.25"
	-- 		human.Pose(Mouthpar1_A())
	-- 		Return()
	-- 	+ "1. Jaw V - 0.25"
	-- 		human.Pose(Mouthpar1_B())
	-- 		Return()
	-- 	+ "Reset Mouth Parameter 1"
	-- 		human.Pose(ResetMouthParam(1))
	-- 		Return()
	+ "Done."

stop

label FreeMode()
	Play_FreeMode()
stop



function CustomLoops(human, loop1, loop2, id)
	if activeloops[human.Name..id] == loop2 then
		activeloops[human.Name..id] = loop1
		human.Pose(loop1())
	else
		activeloops[human.Name..id] = loop2
		human.Pose(loop2())
	end
end

function CustomLoops3(human, loop1, loop2, loop3, id)
	local key = human.Name..id
	if activeloops[key] == loop1 then
		activeloops[key] = loop2
		human.Pose(loop2())
	elseif
		activeloops[key] == loop2 then
		activeloops[key] = loop3
		human.Pose(loop3())
	else
		activeloops[key] = loop1
		human.Pose(loop1())
	end
end

function CustomLoops4(human, loop1, loop2, loop3, loop4, id)
	local key = human.Name..id
	if activeloops[key] == loop1 then
		activeloops[key] = loop2
		human.Pose(loop2())
	elseif
		activeloops[key] == loop2 then
		activeloops[key] = loop3
		human.Pose(loop3())
	elseif
		activeloops[key] == loop3 then
		activeloops[key] = loop4
		human.Pose(loop4())
	else
		activeloops[key] = loop1
		human.Pose(loop1())
	end
end

function CustomLoops6(human, loop1, loop2, loop3, loop4, loop5, loop6, id)
	local key = human.Name..id
	if activeloops[key] == loop1 then
		activeloops[key] = loop2
		human.Pose(loop2())
	elseif
		activeloops[key] == loop2 then
		activeloops[key] = loop3
		human.Pose(loop3())
	elseif
		activeloops[key] == loop3 then
		activeloops[key] = loop4
		human.Pose(loop4())
	elseif
		activeloops[key] == loop4 then
		activeloops[key] = loop5
		human.Pose(loop5())
	elseif
		activeloops[key] == loop5 then
		activeloops[key] = loop6
		human.Pose(loop6())
	else
		activeloops[key] = loop1
		human.Pose(loop1())
	end
end

SpeedIncrement_A = 0.1
EaseIncrement_A = 0.2
CLV2_A = 2 + EaseIncrement_A
CLV2_B = 2 + EaseIncrement_A

function CustomLoopsV2(actor, id, duration, effect1, effect2)
	if activeloops[actor.Name..id] == 2 then
		activeloops[actor.Name..id] = 1
		actor.AddInvoluntaryAnim(id, duration, (duration/CLV2_A), duration/CLV2_A, effect1)
	else
		activeloops[actor.Name..id] = 2
		actor.AddInvoluntaryAnim(id, duration, (duration/CLV2_B), duration/CLV2_B,  effect2)
	end
end

function CustomLoopsV3(actor, id, duration, effect1, effect2, effect3,)
	local key = actor.Name..id
	if activeloops[key] == 1 then
		activeloops[key] = 2
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect2)
	elseif activeloops[key] == 2 then
		activeloops[key] = 3
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect3)
	else
		activeloops[key] = 1
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect1)
	end
end

function CustomLoopsV4(actor, id, duration, effect1, effect2, effect3, effect4)
	local key = actor.Name..id
	if activeloops[key] == 1 then
		activeloops[key] = 2
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect2)
	elseif activeloops[key] == 2 then
		activeloops[key] = 3
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect3)
	elseif activeloops[key] == 3 then
		activeloops[key] = 4
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect4)
	else
		activeloops[key] = 1
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect1)
	end
end

function CustomLoopsV6(actor, id, duration, effect1, effect2, effect3, effect4)
	local key = actor.Name..id
	if activeloops[key] == 1 then
		activeloops[key] = 2
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect2)
	elseif activeloops[key] == 2 then
		activeloops[key] = 3
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect3)
	elseif activeloops[key] == 3 then
		activeloops[key] = 4
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect4)
	elseif activeloops[key] == 4 then
		activeloops[key] = 5
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect5)
	elseif activeloops[key] == 5 then
		activeloops[key] = 6
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect6)
	else
		activeloops[key] = 1
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect1)
	end
end

local ThisAnim = {}	
function CustomAnimationV2(actor, anim1, anim2, duration, effect1, effect2)								
	if ThisAnim[anim1] == anim2 then
		ThisAnim[anim1] = anim1
		actor.AddInvoluntaryAnim(anim1, duration, (duration / 2), (duration / 2), effect1)				
	else																
		ThisAnim[anim1] = anim2																			
		actor.AddInvoluntaryAnim(anim2, duration, (duration / 2), (duration / 2), effect2)
	end
end

function GradualSpeedUpAutoBJ(human, duration, step, startSpeed, endSpeed, startDepth, endDepth, autoDisableAfter)
	duration = duration or 30
	step = step or 0
	startSpeed = startSpeed or 0.5
	endSpeed = endSpeed or 0.1
	startDepth = startDepth or 0
	endDepth = endDepth or 1.5
	autoDisableAfter = autoDisableAfter or duration + 1  -- default: disable right after sequence ends

	local fixedEndDepth = 1.0
	local speedStep = (startSpeed - endSpeed) / duration
	local depthStep = (endDepth - startDepth) / duration

	-- Abort if no target
	if human.Mouth == nil or human.Mouth.Fucker == nil or human.Mouth.Fucker.Penis == nil then
		return
	end

	local penis = human.Mouth.Fucker.Penis

	-- On first run, activate and schedule auto-disable
	if step == 0 then
		penis.Interaction.AutoActive = true

		-- Auto disable after X seconds
		Delayed(autoDisableAfter, function()
			if penis.Interaction.AutoActive then
				penis.Interaction.AutoActive = false
			end
		end)
	end

	-- Step progression
	if step <= duration then
		local newSpeed = startSpeed - speedStep * step
		local newStartDepth = startDepth + depthStep * step

		penis.Interaction.m_autoSpeed = newSpeed
		penis.Interaction.m_autoStartDepth = newStartDepth
		penis.Interaction.m_autoEndDepth = fixedEndDepth

		if human.Mouth.Fucker.Penis.Interaction.AutoActive == true then

			Delayed(1, function()
				GradualSpeedUpAutoBJ(human, duration, step + 1, startSpeed, endSpeed, startDepth, endDepth, autoDisableAfter)
			end)
		end
	else
		-- Final clamp
		penis.Interaction.m_autoSpeed = endSpeed
		penis.Interaction.m_autoStartDepth = endDepth
		penis.Interaction.m_autoEndDepth = fixedEndDepth
	end
end

function StopAutoBJ(human)
	if human == nil or human.Mouth == nil or human.Mouth.Fucker == nil then return end

	local penis = human.Mouth.Fucker.Penis
	if penis == nil then return end

	penis.Interaction.AutoActive = false
	penis.Interaction.m_autoSpeed = 0.3
	penis.Interaction.m_autoStartDepth = 0.3
	penis.Interaction.m_autoEndDepth = 0.5
end

function GradualSpeedUpAutoThrusting(human, duration, step, startSpeed, endSpeed, startDepth, endDepth, hasOffsetApplied)
	duration = duration or 30
	step = step or 0
	startSpeed = startSpeed or 0.3
	endSpeed = endSpeed or 1.0
	startDepth = startDepth or 0.3
	endDepth = endDepth or 1.0
	hasOffsetApplied = hasOffsetApplied or false

	if human == nil or human.Penis == nil or human.Penis.Hole == nil then return end
	local penis = human.Penis

	-- Stop if manually deactivated
	if step > 0 and penis.Interaction.AutoActive ~= true then return end

	-- First-time setup
	if step == 0 then
		penis.Interaction.AutoActive = true
		penis.Interaction.AutoPenisWeight = 1
	end

	-- Primary offset conditions (once, after half the duration)
	local offsetZoneStart = math.floor(duration * 0.25)
	if not hasOffsetApplied and step >= offsetZoneStart then
		local shouldOffset = math.random() < 0.5 -- 50% chance
		if shouldOffset then
			local offsetPercent = math.random(15, 50) / 100
			local offsetAmount = math.floor(duration * offsetPercent)
			step = math.max(0, step - offsetAmount)
			hasOffsetApplied = true
		end
	end

	-- Increase the pushback chance as progress advances
	local progress = math.min(step / duration, 1)  -- 0 (start) to 1 (end)
	local backStepChance = 0.05 + 0.25 * progress  -- grows from 0.25 to 0.5

	if math.random() < backStepChance then  
		local pushBack = math.random(2, 8)
		step = math.max(0, step - pushBack)
	end

	-- Recalculate progression values after any offset/pushback
	local speedStep = (endSpeed - startSpeed) / duration
	local depthStep = (endDepth - startDepth) / duration

	local currentDepth = startDepth + depthStep * step
	local currentSpeed = startSpeed + speedStep * step

	-- When the depth is nearly closed, decrease the speed gradually.
	local depthThreshold = startDepth + (endDepth - startDepth) * 0.8
	if currentDepth > depthThreshold then
		local ratio = (currentDepth - depthThreshold) / (endDepth - depthThreshold)
		currentSpeed = endSpeed - (endSpeed - startSpeed) * ratio
	end

	local fixedEndDepth = endDepth

	penis.Interaction.m_autoSpeed = currentSpeed
	penis.Interaction.m_autoStartDepth = currentDepth
	penis.Interaction.m_autoEndDepth = fixedEndDepth

	Delayed(1, function()
		GradualSpeedUpAutoThrusting(human, duration, step + 1, startSpeed, endSpeed, startDepth, endDepth, hasOffsetApplied)
	end)
end

function OnHumanClick(human, hitTri)
	Jump("TalkMenu", human, hitTri)
end

function OnCreateHuman(human)
	game.PlayCharacterMusic(human)

	if init == true then
		human.Say("Greeting")
	end
end

function OnRemoveHuman(human)
	game.PlayRandomCharacterMusic()
end

function OnGameUpdate()
	if init == false then return end

	local lastChatTime = Timer("GenericChat")
	if lastChatTime > game.ChatIntervals then
		ResetTimer("GenericChat", math.random(-7, 0))

		local speaker = game.GetRandomHuman(|h| h.CanSpeak and ((h.FaceMood >= 0 and h.HasVoice("Like") == true) or (h.FaceMood < 0 and h.HasVoice("Dislike") == true)))
		if speaker ~= nil then
			speaker.SayCustom(speaker.Name.."_idle")
			speaker.SayCustom("gen_idle")
			speaker.Say(speaker.FaceMood >= 0 and "Like" or "Dislike")
			--speaker.Animate("ChatLookAt", MotionLayer.Interactions, 3.8, 1, 1.3, HeadLookAt(CameraPos(), 0.6, 60))
		end
	end
end

function OnFluidHit(hitActor, bodyArea, shootActor)
	if hitActor == shootActor or shootActor == nil then return end

	local timerKey = "FluidHit_" .. hitActor.Name .. bodyArea
	local lastHitTime = Timer(timerKey)

	if bodyArea == "L_Eye" and lastHitTime > 1 then 
		hitActor.AddInvoluntaryAnim("L_Eye_HitClose", 1, 0.7, 0.7, EyelidL(1))
		ResetTimer(timerKey)
	elseif bodyArea == "R_Eye" and lastHitTime > 1 then 
		hitActor.AddInvoluntaryAnim("R_Eye_HitClose", 1, 0.7, 0.7, EyelidR(1))
		ResetTimer(timerKey)
	elseif bodyArea == "Lips" and lastHitTime > 10 then 
		hitActor.AddInvoluntaryAnim("OpenMouth", 5, 0.4, 0.4, Mouth(-0.83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.73, 0, 0.39))
		Delayed(5, function()
			hitActor.Swallow()
		end)
		ResetTimer(timerKey)
	else
		local genericVoiceKey = "FluidHit_Generic_" .. hitActor.Name
		local lastGenericVoiceTime = Timer(genericVoiceKey)

		if lastGenericVoiceTime > 2 and game.FluidReaction == true then
			hitActor.SayCustom(hitActor.Name.."_cumshot")
			hitActor.SayCustom("gen_cumshot")
			hitActor.Say(hitActor.FaceMood >= 0 and "Like" or "Dislike")
			ResetTimer(genericVoiceKey)
		end
	end
end

function OnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
	local key = "PenetrationMoan_" .. girl.Name .. holeName
	local lastMoanTime = Timer(key)
	local slowthreshold = 0.33 + slowvoiceadjust
	local normalthreshold = 0.66 + normalvoiceadjust

	if inVelocity > 0.03 and inVelocity < slowthreshold and lastMoanTime > 0.8 then 
		girl.SayCustom(girl.Name.."_moan_slow")
		girl.SayCustom("gen_moan_slow")
		ResetTimer(key)
	elseif inVelocity >= slowthreshold and inVelocity < normalthreshold and lastMoanTime > 0.4 then 
		girl.SayCustom(girl.Name.."_moan_normal")
		girl.SayCustom("gen_moan_normal")
		ResetTimer(key)
	elseif inVelocity >= normalthreshold and lastMoanTime > 0.005 then 
		girl.SayCustom(girl.Name.."_moan_fast")
		girl.SayCustom("gen_moan_fast")
		ResetTimer(key)
	end
end
