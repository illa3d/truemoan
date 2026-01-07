-- TrueMoan v2.0 by illa3d
-------------------------------------------------------------------------------------------------
-- freemode_main.lua is not required, these functions are overrides (even if it exists in folder)
-- same function in multiple files, alphabetically last one is used
-------------------------------------------------------------------------------------------------
-- TrueMoan module global switches
TM_UIVisible = true -- TrueFacials UI
function TM_AllowVoice() return VM_VoiceMod_Enabled ~= true end
TM_AllowGenericChat = false
TM_DeltaTime = 0
-- Cum reactions
TMH_CumStepTime = 0.1
TMH_CumEffectTime = 0.5
TMH_CumPauseTime = 1
------------------------------------------------------------------------------------------------
-- FREE MODE START (called from TrueFacials)
-------------------------------------------------------------------------------------------------
function TMOnStart_Init()
	Play_FreeMode() -- this makes 3d interactable when TalkMenu visible
end

function TMOnStart_Ambience()
	TMPlayAmbienceRandom()
end

function TMOnStart_GenericChat()
	if not TM_AllowVoice() then return end
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
	OnUpdate_ActTweens(TM_DeltaTime)
	TMOnUpdate_HumanStats()
	-- Iterate and call for every human in the scene
	for _, human in ipairs(game.GetHumans()) do
		TMOnUpdate_CumFinish(human)
		TMOnUpdate_Futa(human)
	end
end

-- Updated every frame
function TMOnUpdate_GenericChat()
	local timerKey = "TMGenericChat"
	-- don't talk with other voice mods
	if not TM_AllowVoice() or not TM_AllowGenericChat then return end
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
	WetAllReset(human)
	if TM_SpawnRandomBody then TMBEPreset_StartRandom(human) end
	if TM_SpawnNaked then HumanClothes(human) end
	if TM_SpawnNoFuta then Delayed(0.05, function() HumanPenisSet(human, false) end) end
	if TM_SpawnReset then Delayed(0.1, function() HumanReset(human) end) end
	if TM_SpawnAutoSexOn then AutoSexActive(human, true, true) end
	game.PlayCharacterMusic(human)
	if TM_AllowGenericChat then human.Say("Greeting") end
end

function TMOnRemoveHuman(human)
	game.PlayRandomCharacterMusic()
end

-------------------------------------------------------------------------------------------------
-- FLUID REACTIONS
-------------------------------------------------------------------------------------------------
-- Updated on fluid hit (cum)
function TMOnFluidHit(hitActor, bodyArea, shootActor)
	if game.FluidReaction == false or shootActor == nil or hitActor.m_isMale == true then return end

	local timerKey = "TMFluidHit_" .. hitActor.Name .. bodyArea
	local lastHitTime = Timer(timerKey)
	local stats = TMHStatsGet(hitActor)
	local function PlayHitMoan(stats, tmMoanTier)
		if stats and stats.Climax then return end
		TMPlayGirlMoan(hitActor, TMMoanTier.Faster)
	end

	if bodyArea == "L_Eye" and lastHitTime > TM_MoanCumEyeTime then 
		PlayHitMoan(stats, TMMoanTier.Faster)
		hitActor.AddInvoluntaryAnim("L_Eye_HitClose", 1, 0.7, 0.7, EyelidL(1))
		ResetTimer(timerKey)
	elseif bodyArea == "R_Eye" and lastHitTime > TM_MoanCumEyeTime then 
		PlayHitMoan(stats, TMMoanTier.Faster)
		hitActor.AddInvoluntaryAnim("R_Eye_HitClose", 1, 0.7, 0.7, EyelidR(1))
		ResetTimer(timerKey)
	elseif bodyArea == "Lips" and lastHitTime > TM_MoanCumLipsTime then 
		PlayHitMoan(stats, TMMoanTier.Fast)
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
			if not stats.IsSexActive then PlayHitMoan(stats, TMMoanTier.Slow) end
			ResetTimer(timerKey)
		end
	end
end

-------------------------------------------------------------------------------------------------
-- SEX REACTIONS
-------------------------------------------------------------------------------------------------
function TMOnUpdate_Futa(girl)
	if not TM_MoanFuta or not girl or girl.m_isMale then return end

	local function OnPenetration(actBody)
		act = ActGet(girl, actBody)
		if not act or not ActActiveGet(act, actBody == ActBody.PenisHand) then return end
		TMOnPenetration(girl, actBody, ActSpeedGet(act, false)/1.5, 0, SexPartner_Get(girl, actBody))
	end

	if HasSexPartner(girl, ActBody.PenisHole) then OnPenetration(ActBody.PenisHole)
	elseif HasSexPartner(girl, ActBody.PenisHand) then OnPenetration(ActBody.PenisHand) end
end


-- Updated on penetration (holeName: "Vagina" "Anus" Mouth")
function TMOnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
	TMOnPenetration_Cum(girl, holeName)
	TMOnClimaxEffects(girl)

	if not TM_AllowVoice() or not TM_MoanSex or inVelocity < outVelocity then return end

	-- Variables
	local stats = TMHStatsGet(girl)
	local keyMoan = "TMSexMoan_" .. girl.Name .. holeName
	local lastMoanTime = Timer(keyMoan)
	local tier = ""
	local pauseMax = 0
	local tierMin = 0
	local tierMax = 0
	local wetness = 0

	-- Tier selection + boundary detection
	if inVelocity > TM_MoanTreshold_Climax then
		tier = TMMoanTier.Max
		pauseMax = 0.1 -- Audio files: ~0.3s + pause
		tierMax = TM_MoanTreshold_Climax + 1
		tierMin = TM_MoanTreshold_Climax
		wetness = 10000
	elseif inVelocity > TM_MoanTreshold_Wild then
		tier = TMMoanTier.Wild
		pauseMax = 0.4 -- Audio files: ~0.4s + pause
		tierMax = TM_MoanTreshold_Climax
		tierMin = TM_MoanTreshold_Wild
		wetness = 1000
	elseif inVelocity > TM_MoanTreshold_Faster then
		tier = TMMoanTier.Faster
		pauseMax = 0.5 -- Audio files: ~0.5s + pause
		tierMax = TM_MoanTreshold_Wild
		tierMin = TM_MoanTreshold_Faster
		wetness = 100
	elseif inVelocity > TM_MoanTreshold_Fast then
		tier = TMMoanTier.Fast
		pauseMax = 0.6 -- Audio files: ~0.5s + pause
		tierMax = TM_MoanTreshold_Faster
		tierMin = TM_MoanTreshold_Fast
		wetness = 10
	elseif inVelocity > TM_MoanTreshold_Normal then
		tier = TMMoanTier.Normal
		pauseMax = 1.3 -- Audio files: ~0.8s + pause
		tierMax = TM_MoanTreshold_Fast
		tierMin = TM_MoanTreshold_Normal
		wetness = 5
	else
		tier = TMMoanTier.Slow
		pauseMax = 10.0 -- VERY long pauses when not moving
		tierMax = TM_MoanTreshold_Normal
		tierMin = 0.0
		wetness = 1
	end

	-- Organic Speed-based pause scaling: longer to zero near tier end
	local t = (inVelocity - tierMin) / (tierMax - tierMin)
	t = math.max(0, math.min(t, 1))
	local cooldown = pauseMax * (1 - t)
	-- Small randomness to avoid mechanical timing
	if stats and stats.Climax then
		cooldown = 0.01
	elseif tier == TMMoanTier.Max then
		cooldown = 0.03
	elseif tier == TMMoanTier.Wild then
		cooldown = 0.05
	else
		cooldown = cooldown + math.random() * 0.05
	end

	-- Play
	if lastMoanTime > cooldown then
		if stats and stats.Climax then
			TMPlayGirlMoan(girl, TMMoanTier[stats.AutoSexTier])
		else
			TMPlayGirlMoan(girl, tier) end
		-- Auto Wetness
		if TM_WetSex then
			WetSet(girl, wetness, holeName)
		else
			WetSet(girl, 0, holeName)
		end
		ResetTimer(keyMoan)
	end
end

-------------------------------------------------------------------------------------------------
-- CLIMAX
-------------------------------------------------------------------------------------------------
function TMOnClimaxEffects(girl)
	local function AutoSexTierSet(girl, autoSexTier)
		stats = TMHStatsGet(girl)
		stats:AutoSexTierSet(autoSexTier)
		ActAll_ActiveSet(girl, true) -- turn on all interactions
		ActAll_SpeedSet(girl, AutoSexTierConfig[autoSexTier].Mid) -- force specific start speed
		ActAll_DepthSet(girl, AutoSexTierConfig_Climax[ActValue.DepthEnd].Max, false) -- increase depth
		if autoSexTier == AutoSexTier.Idle then stats.Climax = false end
	end
	
	local delay = 6
	local function Increment() delay = IncrementRandom(delay, 2, 4) end

	if not girl then return end
	local stats = TMHStatsGet(girl)
	if not stats.IsSexActive or stats.Arousal < 1 or stats.Climax or not stats:IsFeelingCum() then return end
	stats.Climax = true
	if TM_WetSex then WetSet(girl, 100000, ActBody.Vagina) end
	AutoSexTierSet(girl, AutoSexTier.Max)
	Delayed(delay, function() AutoSexTierSet(girl, AutoSexTier.Wild) end) Increment()
	Delayed(delay, function() AutoSexTierSet(girl, AutoSexTier.Faster) end) Increment()
	Delayed(delay, function() AutoSexTierSet(girl, AutoSexTier.Fast) end) Increment()
	Delayed(delay, function() AutoSexTierSet(girl, AutoSexTier.Normal) end) Increment()
	Delayed(delay, function() AutoSexTierSet(girl, AutoSexTier.Slow) end) Increment()
	Delayed(delay, function() AutoSexTierSet(girl, AutoSexTier.Idle) end)
end




-------------------------------------------------------------------------------------------------
-- CUM REACTIONS
-------------------------------------------------------------------------------------------------

local function TMHCanPlayCumEffect(stats)
	if not stats.CumEffectLastTime then return true end
	return os.time() - stats.CumEffectLastTime >= TMH_CumEffectTime
end

-- Updated on cum inside reaction
function TMOnPenetration_Cum(girl, holeName)
	if not girl or girl.m_isMale then return end
	local stats = TMHStatsGet(girl)
	if not stats then return end
	-- throttle only if we have a previous update time
	local now = os.time()
	if stats.CumLastUpdate and now - stats.CumLastUpdate < TMH_CumStepTime then return end
	local partner = SexPartner_Get(girl, holeName)
	if partner and not HumanIsCumming(partner) then return end
	stats.CumLastTime = now
	stats.CumLastUpdate = now
	-- Cum & Cumflation effects (same)
	if TMHCanPlayCumEffect(stats) then
		TMPlayGirlMoan(girl, TM_Cumflate and TMMoanTier.Wild or TMMoanTier.Normal)
		stats.CumEffectLastTime = now
	end
	-- Cumflation
	if TM_Cumflate then
		if stats.CumflateHipsSize == nil then
			-- run once to intialize cumflation
			stats.CumflateHipsSizeOrig = stats.TMBValue.Hips
			stats.CumflateHipsSize = stats.CumflateHipsSizeOrig
			TMBodyEdit(girl, TMBody.Hips, stats.CumflateHipsSize)
			return
		end
		-- run every other time while penetration is on
		stats.CumflateHipsSize = math.min(stats.CumflateHipsSize + TM_CumflateStepUp, TM_CumflateHipSizeLimit)
		TMBodyEdit(girl, TMBody.Hips, stats.CumflateHipsSize)
	elseif stats.CumflateHipsSize ~= nil then
		-- Reset cumflation (in case it was switched mid cumflation)
		TMBodyEdit(girl, TMBody.Hips, stats.CumflateHipsSizeOrig)
		stats.CumflateHipsSize = nil
		stats.CumflateHipsSizeOrig = nil
	end 
end

function TMOnUpdate_CumFinish(girl)
	if not girl or girl.m_isMale then return end
	local stats = TMHStatsGet(girl)
	if not stats or not stats.CumLastTime then return end

	local now = os.time()
	-- throttle expensive logic
	if stats.CumLastUpdate and now - stats.CumLastUpdate < TMH_CumStepTime then return end
	-- wait after last cum
	if now - stats.CumLastTime < TMH_CumPauseTime then return end
	-- still having sex
	if HasSexPartner_HoleAny(girl) then return end
	stats.CumLastUpdate = now

	-- CUMFLATION DEFLATE
	if TM_Cumflate and stats.CumflateHipsSizeOrig and stats.CumflateHipsSize then
		if stats.CumflateHipsSize > stats.CumflateHipsSizeOrig then
			if TMHCanPlayCumEffect(stats) then
				TMPlayGirlMoan(girl, TMMoanTier.Faster)
				if TM_WetSex then WetSet(girl, 50000, ActBody.Vagina) end
				stats.CumEffectLastTime = now
			end
			stats.CumflateHipsSize = math.max(stats.CumflateHipsSize - TM_CumflateStepDown, stats.CumflateHipsSizeOrig)
			TMBodyEdit(girl, TMBody.Hips, stats.CumflateHipsSize)
		else
			-- Deflate done
			TMBodyEdit(girl, TMBody.Hips, stats.CumflateHipsSizeOrig)
			stats:CumReset()
			TMOnCumflatePulloutEffects(girl)
		end
	else
		-- NORMAL CUM (no cumflation)
		stats:CumReset()
		TMOnCumPulloutEffects(girl)
	end
end

-------------------------------------------------------------------------------------------------
-- CUM PULLOUT REACTIONS
-------------------------------------------------------------------------------------------------

function TMOnCumPulloutEffects(girl)
	if not girl then return end
	if TM_WetSex then WetSet(girl, 1000, ActBody.Vagina) end
	local function Increment(oldValue, newValue) return IncrementMultiplierRandom(oldValue, AutoSexClimaxTimeStep, 0.8, 1.5) end 
	local delay = 0.5
	local function Increment(value) delay = IncrementMultiplierRandom(delay, value, 0.8, 1.1) end
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Fast) end) Increment(0.5)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Fast) end) Increment(0.5)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Normal) end) Increment(1.5)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Normal) end) Increment(2)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Slow) end) Increment(3)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Slow) end) Increment(4)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Slow) end)
end

function TMOnCumflatePulloutEffects(girl)
	if not girl then return end
	if TM_WetSex then WetSet(girl, 10000, ActBody.Vagina) end
	local delay = 0.4
	local function Increment(value) delay = IncrementMultiplierRandom(delay, value, 0.8, 1.1) end
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Faster) end) Increment(0.4)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Faster) end) Increment(0.4)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Faster) end) Increment(0.4)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Fast) end) Increment(0.5)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Fast) end) Increment(0.5)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Normal) end) Increment(0.7)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Normal) end) Increment(0.7)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Normal) end) Increment(1)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Normal) end) Increment(1.5)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Slow) end) Increment(1.5)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Slow) end) Increment(4)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Slow) end) Increment(6)
	Delayed(delay, function() TMPlayGirlMoan(girl, TMMoanTier.Slow) end)
end