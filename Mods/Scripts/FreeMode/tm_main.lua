-- TrueMoan v1.7 by illa3d
-------------------------------------------------------------------------------------------------
-- freemode_main.lua is not required, these functions are overrides (even if it exists in folder)
-- same function in multiple files, alphabetically last one is used
-------------------------------------------------------------------------------------------------
-- TrueMoan module global switches
TM_UIVisible = true -- TrueFacials UI
TM_AllowVoice = true
TM_AllowGenericChat = false
TM_DeltaTime = 0

------------------------------------------------------------------------------------------------
-- FREE MODE START (called from TrueFacials)
-------------------------------------------------------------------------------------------------
function TMOnStart_Init()
	Play_FreeMode() -- this makes 3d interactable when TalkMenu visible
	if TMMOD_VoiceMod then TM_AllowVoice = false end
end

function TMOnStart_Ambience()
	TMPlayAmbienceRandom()
end

function TMOnStart_GenericChat()
	if not TM_AllowVoice then return end
	local timerKey = "TMGenericChat"
	ResetTimer(timerKey, math.random(-10, 0))
	local speaker = game.GetRandomHuman(|h| h.CanSpeak)
	if speaker ~= nil then speaker.Say("Greeting") end
	TM_AllowGenericChat = true
end

function TMOnHumanSingleClick(human, hittri)
	-- unused for now
end

function TMOnHumanDoubleClick(human, hittri)
	if (TM_DoubleClickReset) then HumanReset(human) end
	if (TM_DoubleClickUndress) then HumanClothes(human, false) end
	if (TM_DoubleClickMoan) then TMPlayGirlMoan(human, "slow") end
end 

function TMOnUpdate()
	TM_DeltaTime = Timer("TMDeltaTime")
	ResetTimer("TMDeltaTime")
	UpdateActTweens(TM_DeltaTime)
end

-- Updated every frame
function TMOnUpdate_GenericChat()
	local timerKey = "TMGenericChat"
	-- don't talk with other voice mods
	if not TM_AllowVoice or not TM_AllowGenericChat then return end
	local lastChatTime = Timer(timerKey)
	if lastChatTime > game.ChatIntervals then
		ResetTimer(timerKey, math.random(-7, 0))
		local speaker = game.GetRandomHuman(|h| h.CanSpeak and ((h.FaceMood >= 0 and h.HasVoice("Like") == true) or (h.FaceMood < 0 and h.HasVoice("Dislike") == true)))
		if speaker ~= nil then
			speaker.Say(speaker.FaceMood >= 0 and "Like" or "Dislike")
		end
	end
end

function TMOnCreateHuman(human)
	HumanWetReset(human)
	if TM_SpawnRandomBody then TMBEPreset_RandomStart(human) end
	if TM_SpawnNaked then HumanClothes(human) end
	if TM_SpawnNoFuta then Delayed(0.05, function() HumanPenis(human, false) end) end
	if TM_SpawnReset then Delayed(0.1, function() HumanReset(human) end) end
	game.PlayCharacterMusic(human)
	if TM_AllowGenericChat then human.Say("Greeting") end
end

function TMOnRemoveHuman(human)
	game.PlayRandomCharacterMusic()
end

-------------------------------------------------------------------------------------------------
-- VOICE
-------------------------------------------------------------------------------------------------
-- Updated on fluid hit (cum)
function TMOnFluidHit(hitActor, bodyArea, shootActor)
	if game.FluidReaction == false or shootActor == nil or hitActor.m_isMale == true then return end

	local timerKey = "TMFluidHit_" .. hitActor.Name .. bodyArea
	local lastHitTime = Timer(timerKey)

	if bodyArea == "L_Eye" and lastHitTime > TM_MoanCumEyeTime then 
		TMPlayGirlMoan(hitActor, "faster")
		hitActor.AddInvoluntaryAnim("L_Eye_HitClose", 1, 0.7, 0.7, EyelidL(1))
		ResetTimer(timerKey)
	elseif bodyArea == "R_Eye" and lastHitTime > TM_MoanCumEyeTime then 
		TMPlayGirlMoan(hitActor, "faster")
		hitActor.AddInvoluntaryAnim("R_Eye_HitClose", 1, 0.7, 0.7, EyelidR(1))
		ResetTimer(timerKey)
	elseif bodyArea == "Lips" and lastHitTime > TM_MoanCumLipsTime then 
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
		elseif lastHitTime > TM_MoanCumBodyTime then
			TMPlayGirlMoan(hitActor, "slow")
			ResetTimer(timerKey)
		end
	end
end

-- Updated on penetration (holeName: "Vagina" "Anus" Mouth")
function TMOnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
	if inVelocity < outVelocity or TM_MoanSex == false  then return end

	-- Variables
	local key = "TMSexMoan_" .. girl.Name .. holeName
	local lastMoanTime = Timer(key)
	local tier = ""
	local pauseMax = 0
	local tierMin = 0
	local tierMax = 0
	local wetness = 0

	-- Tier selection + boundary detection
	if inVelocity > TM_ClimaxTreshold then
		tier = "climax"
		pauseMax = 0.1 -- Audio files: ~0.3s + pause
		tierMax = TM_ClimaxTreshold + 1
		tierMin = TM_ClimaxTreshold
		wetness = 10000
	elseif inVelocity > TM_OrgasmTreshold then
		tier = "orgasm"
		pauseMax = 0.4 -- Audio files: ~0.4s + pause
		tierMax = TM_ClimaxTreshold
		tierMin = TM_OrgasmTreshold
		wetness = 1000
	elseif inVelocity > TM_FasterTreshold then
		tier = "faster"
		pauseMax = 0.5 -- Audio files: ~0.5s + pause
		tierMax = TM_OrgasmTreshold
		tierMin = TM_FasterTreshold
		wetness = 100
	elseif inVelocity > TM_FastTreshold then
		tier = "fast"
		pauseMax = 0.6 -- Audio files: ~0.5s + pause
		tierMax = TM_FasterTreshold
		tierMin = TM_FastTreshold
		wetness = 10
	elseif inVelocity > TM_NormalTreshold then
		tier = "normal"
		pauseMax = 1.3 -- Audio files: ~0.8s + pause
		tierMax = TM_FastTreshold
		tierMin = TM_NormalTreshold
		wetness = 5
	else
		tier = "slow"
		pauseMax = 10.0 -- VERY long pauses when not moving
		tierMax = TM_NormalTreshold
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
		if TM_WetSex then
			HumanWetSet(girl, wetness, holeName)
		else
			HumanWetSet(girl, 0, holeName)
		end
		ResetTimer(key)
	end
end