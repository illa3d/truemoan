-- TrueMoan v1.0 by illa3d
-------------------------------------------------------------------------------------------------
-- freemode_main.lua is not required, these functions are overrides (even if it exists in folder)
-- same function in multiple files, alphabetically last one is used
-------------------------------------------------------------------------------------------------
-- Variables
init = false

-------------------------------------------------------------------------------------------------
-- FREE MODE START (called from TrueFacials)
-------------------------------------------------------------------------------------------------
label Start()
	OnStart()
stop

function OnStart()
	init = true
	TMStartSound()
	ResetTimer("GenericChat", math.random(-10, 0))
	local speaker = game.GetRandomHuman(|h| h.CanSpeak)
	if speaker ~= nil then speaker.Say("Greeting") end
	Play_FreeMode() -- this makes TalkMenu visible and 3d interactable
end

-- Updated every frame
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

-- Updated on human click, Talk Menu Start
function OnHumanClick(human, hitTri)
	Jump("TalkMenu", human, hitTri)
end

-- Updated on human creation
function OnCreateHuman(human)
	ResetGirlWetness(human)
	TMBEPreset_RandomStart(human)
	if NakedOnSpawn then
		ShowClothes(human)
		ShowPenis(human, false)
	end
	game.PlayCharacterMusic(human)
	if init then human.Say("Greeting") end
end

-- Updated on human removal
function OnRemoveHuman(human)
	game.PlayRandomCharacterMusic()
end

-------------------------------------------------------------------------------------------------
-- MOANING (called from TrueFacials)
-------------------------------------------------------------------------------------------------
-- Updated on fluid hit (cum)
function OnFluidHit(hitActor, bodyArea, shootActor)
	if game.FluidReaction == false or shootActor == nil or hitActor.m_isMale == true then return end

	local timerKey = "FluidHit_" .. hitActor.Name .. bodyArea
	local lastHitTime = Timer(timerKey)

	if bodyArea == "L_Eye" and lastHitTime > MoanCumEyeTime then 
		TMPlayGirlMoan(hitActor, "faster")
		hitActor.AddInvoluntaryAnim("L_Eye_HitClose", 1, 0.7, 0.7, EyelidL(1))
		ResetTimer(timerKey)
	elseif bodyArea == "R_Eye" and lastHitTime > MoanCumEyeTime then 
		TMPlayGirlMoan(hitActor, "faster")
		hitActor.AddInvoluntaryAnim("R_Eye_HitClose", 1, 0.7, 0.7, EyelidR(1))
		ResetTimer(timerKey)
	elseif bodyArea == "Lips" and lastHitTime > MoanCumLipsTime then 
		TMPlayGirlMoan(hitActor, "fast")
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
			TMPlayGirlMoan(hitActor, "slow")
			ResetTimer(timerKey)
		end
	end
end

-- Updated on penetration (holeName: "Vagina" "Anus" Mouth")
function OnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
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
		TMPlayGirlMoan(girl, tier)
		-- Auto Wetness
		if WetSex then
			SetGirlWetness(girl, wetness, holeName)
		else
			SetGirlWetness(girl, 0, holeName)
		end
		ResetTimer(key)
	end
end

-- Function to play TM moans
function TMPlayGirlMoan(actor, tier)
	if actor == nil then return end
	actor.SayCustom("tm_" .. tier)
end