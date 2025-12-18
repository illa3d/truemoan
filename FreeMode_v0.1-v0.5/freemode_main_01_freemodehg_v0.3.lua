init = false
-- FreemodeHG version 0.3


-- Variables
activeloops = {}
CL_SMult = 1 --Speed multiplier
--CL_Imult = 0.5 --Intensity multiplier
HG_UIvis = true

label Start()
	init = true
	ResetTimer("GenericChat", math.random(-10, 0))
	--game.CreateHuman(game.GetRandomGirlName())
	--game.CreateHuman(game.GetRandomGirlName())

	--IntroPose(game.GetHumans()[1], game.GetHumans()[2])

	local speaker = game.GetRandomHuman(|h| h.CanSpeak)
	if speaker ~= nil
		speaker.Say("Greeting")

	-- Varibles --
	boobsize = 0
	buttsize = 0
	penissize = 0
	penislength = 0
	bodysize = 0

	Jump("FreeMode")
stop

label TalkMenu(human, hitTri)
	+ "Start thrusting!" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == false] [gold]
		human.Penis.Interaction.AutoActive = true
		human.Penis.Interaction.AutoPenisWeight = 1
		Return()
	+ "Stop thrusting!" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == true] [gold]
		human.Penis.Interaction.AutoActive = false
		Return()
	+ "Start sucking!" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == false] [gold]
		human.Mouth.Fucker.Penis.Interaction.AutoActive = true
		human.Mouth.Fucker.Penis.Interaction.AutoPenisWeight = 0
		Return()
	+ "Stop sucking!" [if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis.Interaction.AutoActive == true] [gold]
		human.Mouth.Fucker.Penis.Interaction.AutoActive = false
		Return()
	+ "Start handjob" [if human.Penis.m_holdDepth ~= 0 and human.Penis.Interaction.m_autoHandActive == false] [gold]
		human.Penis.Interaction.m_autoHandActive = true
		Return()
	+ "Stop handjob" [if human.Penis.m_holdDepth ~= 0 and human.Penis.Interaction.m_autoHandActive == true] [gold]
		human.Penis.Interaction.m_autoHandActive = false
		Return()

	+ "Pose for me, " .. human.Name .. "!"
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
		+ for i, pres in ipairs (bodystr)
			+ " " .. pres [gold]
				human.Pose(bodypresets[i]())
				Return()
		+ "Back."
			Return(2)
	
	+ "Make a face!"
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
		+ for i, pres in ipairs (facestr)
			+ " " .. pres [gold]
				human.Pose(facepresets[i]())
				Return()
		+ "Back."
			Return(2)
	+ "Let's talk about clothing."
		+ "Take off your clothes, " .. human.Name .. "."
			human.CustomizeAll(99)
			if (human.m_isMale == false)
				human.Customize("Penis", 0)
			human "Done!"
			Return()
		+ "Dress up!"
			human.CustomizeAll(0)
			human "Alright!"
			Return()
		+ "Back."
			Return(2)

	+ "Illegal character customization" [gold]
		+ "Am i going to jail?"
			game "These options push the game farther than the normal limits"
			game "You may encounter glitchy or laggy behaviour"
			Return(1)
		+ "Proportions"
			+ "Bigger boobs"
				boobsize = boobsize + 1
				human.Body("Breasts size", 0.5+boobsize*0.1)
				Return(1)
			+ "Reset boobs"
				boobsize = 0
				human.Body("Breasts size", 0)
				Return(1)
			+ "Bigger butt"
				buttsize = buttsize + 1
				human.Body("Ass size", 0.5+buttsize*0.1)
				Return(1)
			+ "Reset butt"
				buttsize = 0
				human.Body("Ass size", 0)
				Return(1)
			+ "Shrink body"
				bodysize = bodysize + 1
				human.Body("Body size", -(1-1/bodysize))
				Return(1)
			+ "Reset body"
				bodysize = 0
				human.Body("Body size", 0)
				Return(1)
			+ "Back."
				Return(2)
		+ if human.m_isMale == true
			+ "Time to bottom, " .. human.Name
				human.m_isMale = false
				human "Alright"
				Return(2)
		+ if human.Penis.IsActive
			+ "Penis customization"
				+ "Turn into a dildo"
					human.Body("Penis size", 33, "Penis length", 0.6300205, "Body size", -0.97)
					human.m_vagina.m_wetness = 0
					Return(2)
				+ "Longer dick"
					penislength = penislength + 1
					human.Body("Penis length", 0.5+penislength*0.1)
					Return(1)
				+ "Bigger dick"
					penissize = penissize + 1
					human.Body("Penis size", 0.5+penissize*0.1)
					Return(1)
				+ "Reset dick size"
					penislength = 0
					penissize = 0
					human.Body("Penis size", 0, "Penis length", 0)
					Return(1)
				+ "Reset foreskin"
					human.Penis.m_penisSkinOut = 0
					Return(1)
				+ "Back."
					Return(2)
		+ "Remove pussy wetness"
			human.m_vagina.m_wetness = 0
		+ "Super fast autosex" [if human.Penis.Hole ~= nil and human.Penis.Interaction.AutoActive == true]
			human.Penis.Interaction.m_autoSpeed = 2
		+ "Back"
			Return(2)

	+ "Animations" [gold]
		+ "Speed " .. CL_SMult .. "x" [gold]
			+ "Current speed mult:" .. CL_SMult [gold]
				Return(1)
			+ "Increase speed"
				CL_SMult = CL_SMult*1.1
				Return(1)
			+ "Decrease speed"
				CL_SMult = CL_SMult*0.9
				Return(1)
			+ "Reset speed"
				CL_SMult = 1
				Return(1)
			+ "Back"
				Return(2)
		+ "Humping"[if game.HasAnim(human) == false]
			+ "Humping"
				activeloops[human] = 0.6/CL_SMult*2.5
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], HipsRot(-26, 0, 0), HipsRot(-2, 0, 0)), human)
			+ "Small humping"
				activeloops[human] = 0.6/CL_SMult*2.5
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], HipsRot(-10, 0, 0), HipsRot(-2, 0, 0)), human)
			+ "Hump front"
				activeloops[human] = 0.6/CL_SMult*2.5
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], HipsRot(20, 0, 0), HipsRot(-2, 0, 0)), human)
			+ "Twerk"
				activeloops[human] = 0.6/CL_SMult*2.5
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], HipsRot(45, 0, 0), HipsRot(10, 0, 0)), human)
			+ "Hip moves"
				activeloops[human] = 1/CL_SMult*2.5
				game.AddRepeatAnim(1/CL_SMult, || CustomLoopsV2(human, "Humping", activeloops[human], HipsRot(20, 15, -15), HipsRot(20, -15, 15)), human)
			+ "Back"
				Return(2)
		+ "Stop humping"[if game.HasAnim(human) == true][gold]
			game.RemoveAnim(human)
			Return(1)

		+ "Bouncing" [if game.HasAnim(human.breastNames) == false]
			+ "Bouncing"
				activeloops[human.breastNames] = 0.5/CL_SMult*2.5
				game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Bouncing", activeloops[human.breastNames], Hips(0, 0.95, 0.0), Hips(0, 0.90, 0.0)), human.breastNames)
			+ "Small Bouncing"
				activeloops[human.breastNames] = 0.5/CL_SMult*2.5
				game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Bouncing", activeloops[human.breastNames], Hips(0, 0.95, 0.0), Hips(0, 0.92, 0.0)), human.breastNames)
			+ "Back"
				Return(2)
		+ "Stop Bouncing" [if game.HasAnim(human.breastNames) == true][gold]
			game.RemoveAnim(human.breastNames)
			Return(1)

		+ "Breast shaking"[if game.HasAnim(human.chestNames) == false]
			+ "Wide shake"
				activeloops[human.chestNames] = 0.6/CL_SMult*2.5
				game.AddRepeatAnim(0.6/CL_SMult, || CustomLoopsV2(human, "Shaking", activeloops[human.chestNames], SpineRot(15), SpineRot(-15)), human.chestNames)
			+ "Narrow shake"
				activeloops[human.chestNames] = 0.5/CL_SMult*2.5
				game.AddRepeatAnim(0.5/CL_SMult, || CustomLoopsV2(human, "Shaking", activeloops[human.chestNames], SpineRot(7), SpineRot(-7)), human.chestNames)
			+ "Back"
				Return(2)
		+ "Stop shaking" [if game.HasAnim(human.chestNames) == true][gold]
			game.RemoveAnim(human.chestNames)
			Return(1)

		+ "Licking"[if game.HasAnim(human.m_mouth) == false]
			activeloops[human.m_mouth] = 0.3/CL_SMult*2.5
			game.AddRepeatAnim(0.3/CL_SMult, || CustomLoopsV2(human, "Licking", activeloops[human.m_mouth], Mouth(-0.68, 0.377, 0, 0.504, 0.504, -0.062, -0.062, 0.664, 0.664, 0.57, 0.57, 0, 0, 0.9, 0, 0.45), Mouth(-0.737, 0.377, 0, 0.504, 0.504, -0.062, -0.062, 0.664, 0.664, 0.57, 0.57, 0, 0, 0.97, 0, -0.10)), human.m_mouth)
		+ "Stop Licking" [if game.HasAnim(human.m_mouth) == true][gold]
			game.RemoveAnim(human.m_mouth)
			Return(1)

		+ "Left hand"[if game.HasAnim(human.forearmNames) == false]
			+ "Fingering index/middle"
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, FingeringIMl1, FingeringIMl2, "Lhand"), human.forearmNames)
			+ "Fingering middle/ring"
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, FingeringMRl1, FingeringMRl2, "Lhand"), human.forearmNames)
			+ "Back"
				Return(2)
		+ "Stop left hand" [if game.HasAnim(human.forearmNames) == true][gold]
			game.RemoveAnim(human.forearmNames)
			Return(1)

		+ "Right hand"[if game.HasAnim(human.handNames) == false]
			+ "Fingering index/middle"
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, FingeringIMr1, FingeringIMr2, "Lhand"), human.handNames)
			+ "Fingering middle/ring"
				game.AddRepeatAnim(0.3/CL_SMult, || CustomLoops(human, FingeringMRr1, FingeringMRr2, "Lhand"), human.handNames)
			+ "Back"
				Return(2)
		+ "Stop right hand" [if game.HasAnim(human.handNames) == true][gold]
			game.RemoveAnim(human.handNames)
			Return(1)

		+ "Back"
			Return(2)

	+ if human.Penis.IsActive and game.HasAnim(human.Penis)
		+ "Stop auto cumming."
			human "Alright."
			game.RemoveAnim(human.Penis)
	+ else
		+ "Start auto cumming."
			human "Of course!"
			game.AddRepeatAnim(4, || human.Shoot(), human.Penis)

	+ if game.PovHuman ~= human
		+ "Enter " .. human.Name .. "'s POV."
			game.PovHuman = human
	+ if game.PovHuman ~= nil
		+ "Exit POV."
			game.PovHuman = nil
	+ "UI"[gold]
		+ "Hide UI" [if HG_UIvis == true]
			HG_UIvis = false
			game.m_controlsUI.Show(false)
		+ "Show UI" [if HG_UIvis == false]
			HG_UIvis = true
			game.m_controlsUI.Show()
		+ "Change Music"
			local tracklist = {"01_Dreamy_Whisper", "02_Moon-blind", "03_OpenMeBabe", "04_What_an_Easy_Good-bye", "05_Somtimes", "06_Love_in_Fareast", "07_Tender_Passion", "08_Orbit", "09_Dancing_Queen", "10_Memories_of_Childhood", "11_Raggae_Fever", "12_Why", "13_Comma", "14_NoWar", "15_Special_Light", "16_Enjoy_Yaslef", "17_Lyve_Live", "18_Aquabelle", "19_1st_Mission", "20_Time_to_Groove", "21_Love_is_Bubble", "22_Flower_Bearing", "23_Secret_Garden_Before", "24_X-ray", "25_CallousCall", "26_Order_Circle", "27_This_is_My_Stage", "28_Wait_4_U", "29_Welcome_to_Radux_World", "30_Journey_to_You"}
			--game "Choose a track"
			+ for i, track in ipairs(tracklist)
				+ "Play " .. track
					Music(track , 0.05, 0)
			+ "Stop Music"
				StopMusic()
			+ "Nevermind"
				Return(3)

	+ "Back."

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

function CustomLoopsV2(actor, id, duration, effect1, effect2)
	if activeloops[actor.Name..id] == 2 then
		activeloops[actor.Name..id] = 1
		actor.AddInvoluntaryAnim(id, duration, (duration/2), duration/2, effect1)
	else
		activeloops[actor.Name..id] = 2
		actor.AddInvoluntaryAnim(id, duration, (duration/2), duration/2,  effect2)
	end
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

	if inVelocity > 0.3 and lastMoanTime > 6 then 
		girl.SayCustom(girl.Name.."_moan")
		girl.SayCustom("gen_moan")
		girl.Say(girl.FaceMood >= 0 and "Pleasure" or "Pain")
		ResetTimer(key)
	end
end
