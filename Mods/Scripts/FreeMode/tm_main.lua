-- TrueMoan v0.8 by illa3d
-------------------------------------------------------------------------------------------------
-- freemode_main.lua is not required, these functions are overrides (even if it exists in folder)
-- happens automagically - same function in multiple files, alphabetically last one used!
-------------------------------------------------------------------------------------------------
-- Sex speed constants (UI slider values: 0.001 - 0.5)
sexspeedmin = 0.001
sexspeedmax = 2
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

	if bodyArea == "L_Eye" and lastHitTime > MoanCumEyeTime then 
		PlayGirlMoan(hitActor, "faster")
		hitActor.AddInvoluntaryAnim("L_Eye_HitClose", 1, 0.7, 0.7, EyelidL(1))
		ResetTimer(timerKey)
	elseif bodyArea == "R_Eye" and lastHitTime > MoanCumEyeTime then 
		PlayGirlMoan(hitActor, "faster")
		hitActor.AddInvoluntaryAnim("R_Eye_HitClose", 1, 0.7, 0.7, EyelidR(1))
		ResetTimer(timerKey)
	elseif bodyArea == "Lips" and lastHitTime > MoanCumLipsTime then 
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
		elseif lastHitTime > MoanCumBodyTime then
			PlayGirlMoan(hitActor, "slow")
			ResetTimer(timerKey)
		end
	end
end

function OnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
	-- holeName:"Vagina" "Anus" Mouth"
	if inVelocity < outVelocity or Moaning == false  then return end

	-- Variables
	local key = "PenetrationMoan_" .. girl.Name .. holeName
	local lastMoanTime = Timer(key)
	local tier = ""
	local pauseMax = 0
	local tierMin = 0
	local tierMax = 0
	local wetness = 0

	-- Tier selection + boundary detection
	if inVelocity > ClimaxTreshold then
		tier = "climax"
		pauseMax = 0.1 -- Audio files: ~0.3s + pause
		tierMax = ClimaxTreshold + 1
		tierMin = ClimaxTreshold
		wetness = 10000
	elseif inVelocity > OrgasmTreshold then
		tier = "orgasm"
		pauseMax = 0.4 -- Audio files: ~0.4s + pause
		tierMax = ClimaxTreshold
		tierMin = OrgasmTreshold
		wetness = 1000
	elseif inVelocity > FasterTreshold then
		tier = "faster"
		pauseMax = 0.5 -- Audio files: ~0.5s + pause
		tierMax = OrgasmTreshold
		tierMin = FasterTreshold
		wetness = 100
	elseif inVelocity > FastTreshold then
		tier = "fast"
		pauseMax = 0.6 -- Audio files: ~0.5s + pause
		tierMax = FasterTreshold
		tierMin = FastTreshold
		wetness = 10
	elseif inVelocity > NormalTreshold then
		tier = "normal"
		pauseMax = 1.3 -- Audio files: ~0.8s + pause
		tierMax = FastTreshold
		tierMin = NormalTreshold
		wetness = 5
	else
		tier = "slow"
		pauseMax = 10.0 -- VERY long pauses when not moving
		tierMax = NormalTreshold
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
		if WetSex then
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