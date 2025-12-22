-- TrueMoan v0.7 by illa3d
-------------------------------------------------------------------------------------------------
-- freemode_main.lua is not required, these functions are overrides (even if it exists in folder)
-- happens automagically - same function in multiple files, alphabetically last one used!
-------------------------------------------------------------------------------------------------

-- Music Config
tracklist = {"01_Dreamy_Whisper", "02_Moon-blind", "03_OpenMeBabe", "04_What_an_Easy_Good-bye", "05_Somtimes", "06_Love_in_Fareast", "07_Tender_Passion", "08_Orbit", "09_Dancing_Queen", "10_Memories_of_Childhood", "11_Raggae_Fever", "12_Why", "13_Comma", "14_NoWar", "15_Special_Light", "16_Enjoy_Yaslef", "17_Lyve_Live", "18_Aquabelle", "19_1st_Mission", "20_Time_to_Groove", "21_Love_is_Bubble", "22_Flower_Bearing", "23_Secret_Garden_Before", "24_X-ray", "25_CallousCall", "26_Order_Circle", "27_This_is_My_Stage", "28_Wait_4_U", "29_Welcome_to_Radux_World", "30_Journey_to_You"}

-- Sex Config - UI slider values (0-0.5)
sexspeedmin = 0.001
sexspeedmax = 2
wetstep = 200
moancumeyetimeout = 1
moancumlipstimeout = 3
moancumbodytimeout = 5

-- Moan Tier config - Tresholds by speed (0-2)
climaxtreshold = 1.3
orgasmtreshold = 0.9
fastertreshold = 0.6
fasttreshold = 0.3
normaltreshold = 0.1

-- Edit Body Config - Increments
breastsafemin = -0.8 -- some characters fall apart below this value and game crashes
sizestep03 = 0.3 -- nipples
sizestep01 = 0.1 -- hip, waist, ass, breast, muscle
sizestep005 = 0.05 -- neck, forearm, upperarm, calf, thigh, penis-length, penis-size
sizestep002 = 0.02 -- body

-- Edit Body Variables
necksize = 0
forearmsize = 0
uperarmsize = 0
calfsize = 0
thighsize = 0
waistsize = 0
hipssize = 0
asssize = 0
nipplesize = 0
breastsize = 0
penissize = 0
penislength = 0
musclesize = 0
bodysize = 0

-- Options
editsafe = true
moaning = true
wetsex = true

-- Variables
init = false
cumevery = 0


-------------------------------------------------------------------------------------------------
-- FREE MODE STARTS HERE (called from TrueFacials)
-- freemode_main.lua's Start() is ignored
-------------------------------------------------------------------------------------------------

label Start()
	init = true
	TMStartSound()
	ResetTimer("GenericChat", math.random(-10, 0))
	local speaker = game.GetRandomHuman(|h| h.CanSpeak)
	if speaker ~= nil
		speaker.Say("Greeting")
	Play_FreeMode()
stop

function OnGameUpdate()
	if init == false then return end
	local lastChatTime = Timer("GenericChat")
	if lastChatTime > game.ChatIntervals then
		ResetTimer("GenericChat", math.random(-7, 0))
		local speaker = game.GetRandomHuman(|h| h.CanSpeak and ((h.FaceMood >= 0 and h.HasVoice("Like") == true) or (h.FaceMood < 0 and h.HasVoice("Dislike") == true)))
		if speaker ~= nil then
			speaker.Say(speaker.FaceMood >= 0 and "Like" or "Dislike")
		end
	end
end

function OnHumanClick(human, hitTri)
	Jump("TalkMenu", human, hitTri)
end

function OnCreateHuman(human)
	ResetGirlWetness(human)
	TMBEPreset_RandomStart(human)
	game.PlayCharacterMusic(human)
	if init then human.Say("Greeting") end
end

function OnRemoveHuman(human)
	game.PlayRandomCharacterMusic()
end

-------------------------------------------------------------------------------------------------
-- MOANING (called from TrueFacials)
-------------------------------------------------------------------------------------------------

function OnFluidHit(hitActor, bodyArea, shootActor)
	if game.FluidReaction == false or shootActor == nil or hitActor.m_isMale == true then return end

	local timerKey = "FluidHit_" .. hitActor.Name .. bodyArea
	local lastHitTime = Timer(timerKey)

	if bodyArea == "L_Eye" and lastHitTime > moancumeyetimeout then 
		PlayGirlMoan(hitActor, "faster")
		hitActor.AddInvoluntaryAnim("L_Eye_HitClose", 1, 0.7, 0.7, EyelidL(1))
		ResetTimer(timerKey)
	elseif bodyArea == "R_Eye" and lastHitTime > moancumeyetimeout then 
		PlayGirlMoan(hitActor, "faster")
		hitActor.AddInvoluntaryAnim("R_Eye_HitClose", 1, 0.7, 0.7, EyelidR(1))
		ResetTimer(timerKey)
	elseif bodyArea == "Lips" and lastHitTime > moancumlipstimeout then 
		PlayGirlMoan(hitActor, "fast")
		hitActor.AddInvoluntaryAnim("OpenMouth", 5, 0.4, 0.4, Mouth(-0.83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.73, 0, 0.39))
		Delayed(1, function()
			hitActor.Swallow()
		end)
		ResetTimer(timerKey)
	else
		local genericVoiceKey = "FluidHit_Generic_" .. hitActor.Name
		local lastGenericVoiceTime = Timer(genericVoiceKey)
		if lastGenericVoiceTime > 500 then
			hitActor.SayCustom("gen_cumshot")
			hitActor.Say(hitActor.FaceMood >= 0 and "Like" or "Dislike")
			ResetTimer(genericVoiceKey)
		elseif lastHitTime > moancumbodytimeout then
			PlayGirlMoan(hitActor, "slow")
			ResetTimer(timerKey)
		end
	end
end

function OnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
	-- holeName:"Vagina" "Anus" Mouth"
	if inVelocity < outVelocity or moaning == false  then return end

	-- Variables
	local key = "PenetrationMoan_" .. girl.Name .. holeName
	local lastMoanTime = Timer(key)
	local tier = ""
	local pauseMax = 0
	local tierMin = 0
	local tierMax = 0
	local wetness = 0

	-- Tier selection + boundary detection
	if inVelocity > climaxtreshold then
		tier = "climax"
		pauseMax = 0.1 -- Audio files: ~0.3s + pause
		tierMax = climaxtreshold + 1
		tierMin = climaxtreshold
		wetness = 10000
	elseif inVelocity > orgasmtreshold then
		tier = "orgasm"
		pauseMax = 0.4 -- Audio files: ~0.4s + pause
		tierMax = climaxtreshold
		tierMin = orgasmtreshold
		wetness = 1000
	elseif inVelocity > fastertreshold then
		tier = "faster"
		pauseMax = 0.5 -- Audio files: ~0.5s + pause
		tierMax = orgasmtreshold
		tierMin = fastertreshold
		wetness = 100
	elseif inVelocity > fasttreshold then
		tier = "fast"
		pauseMax = 0.6 -- Audio files: ~0.5s + pause
		tierMax = fastertreshold
		tierMin = fasttreshold
		wetness = 10
	elseif inVelocity > normaltreshold then
		tier = "normal"
		pauseMax = 1.3 -- Audio files: ~0.8s + pause
		tierMax = fasttreshold
		tierMin = normaltreshold
		wetness = 5
	else
		tier = "slow"
		pauseMax = 10.0 -- VERY long pauses when not moving
		tierMax = normaltreshold
		tierMin = 0.0
		wetness = 1
	end

	-- Organic Speed-based pause scaling: longer to zero near tier end
	local t = (inVelocity - tierMin) / (tierMax - tierMin)
	t = math.max(0, math.min(t, 1))
	local cooldown = pauseMax * (1 - t)
	-- Small randomness to avoid mechanical timing
	if tier == "climax" or tier == "orgasm" then 
		cooldown = 0.02
	else
		cooldown = cooldown + math.random() * 0.05
	end

	-- Play
	if lastMoanTime > cooldown then
		PlayGirlMoan(girl, tier)
		-- Auto Wetness
		if wetsex then
			SetGirlWetness(girl, wetness, holeName)
		else
			SetGirlWetness(girl, 0, holeName)
		end
		ResetTimer(key)
	end
end

-------------------------------------------------------------------------------------------------
-- VARIOUS
-------------------------------------------------------------------------------------------------

function PlayGirlMoan(actor, tier)
	if actor == nil then return end
	actor.SayCustom("tm_" .. tier)
end

function ResetGirlWetness(girl)
	SetGirlWetness(girl, 0, "Vagina")
	SetGirlWetness(girl, 0, "Anus")
	SetGirlWetness(girl, 0, "Mouth")
end

function SetGirlWetness(girl, value, holename)
	--holeName:"Vagina" "Anus" Mouth"
	if girl == nil or value == nil or girl.m_isMale == true then return end
	if holename ~= nil and holename == "Mouth" then
		girl.m_mouth.m_wetness = value
	elseif holename ~= nil and holename == "Anus" then
		girl.m_anus.m_wetness = value
	else
		girl.m_vagina.m_wetness = value
	end
end

function SetInteractionSpeed(interaction, speed)
	speed = math.max(sexspeedmin, math.min(speed, sexspeedmax)) -- clamp min max
	interaction.AutoActive = true
	interaction.m_autoSpeed = speed
end

function SetInteractionSpeedStep(interaction, increase)
	local speed = interaction.m_autoSpeed
	local increment = 1 + (0.05 / (speed ^ 0.6)) -- 1 + (speed multiplier / (speed / curve))
	if increase then speed = speed * increment
	else speed = speed / increment end
	speed = math.max(sexspeedmin, math.min(speed, sexspeedmax)) -- clamp min max
	interaction.AutoActive = true
	interaction.m_autoSpeed = speed
end

function ResetPose(human)
	human.Pose(StandUp())
	human.Pose(FaceNeutral())
	game.RemoveAnim(human)
	game.RemoveAnim(human.chestNames)
	game.RemoveAnim(human.breastNames)
	game.RemoveAnim(human.forearmNames)
	game.RemoveAnim(human.handNames)
	game.RemoveAnim(human.m_mouth)
	game.RemoveAnim(human.headNames)
	game.RemoveAnim(human.Anus)
	game.RemoveAnim(human.footNames)
	game.RemoveAnim(human.thighNames)
	human.Penis.Interaction.AutoActive = false
	human.Mouth.Fucker.Penis.Interaction.AutoActive = false
end