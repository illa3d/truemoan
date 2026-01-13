-- TrueMoan v2.2 by illa3d
-- Requires: all tm_*.lua
-------------------------------------------------------------------------------------------------
-- freemode_main.lua is not required, these functions are overrides (even if it exists in folder)
-- same function in multiple files, alphabetically last one is used
-------------------------------------------------------------------------------------------------
-- TrueMoan module global switches
function TM_AllowVoice() return VM_VoiceMod_Enabled ~= true end
TM_UIVisible = true -- TrueFacials UI
TM_AllowGenericChat = false
TM_DeltaTime = 0

------------------------------------------------------------------------------------------------
-- TRUE FACIALS CALLS
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
	if TM_DoubleClickReset then TMHumanReset(human) end
	if TM_DoubleClickUndress then HumanClothes(human, false) end
	if TM_DoubleClickMoan then TMPlayMoan(human, TMMoan.DoubleClick) end
end 

-- Main update function (every frame)
function TMOnUpdate()
	TM_DeltaTime = Timer("TMDeltaTime")
	ResetTimer("TMDeltaTime")
	local humans = game.GetHumans()
	TMOnUpdate_HumanStats(humans, TM_DeltaTime)
	TMOnUpdate_Humans(humans)
	OnUpdate_ActTweens(TM_DeltaTime)
end

-- Generic chat update function (every frame)
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
	WetReset_All(human)
	if TM_SpawnRandomBody then TMBEPreset_StartRandom(human) end
	if TM_SpawnNaked then HumanClothes(human) end
	if TM_SpawnNoFuta then Delayed(0.05, function() HumanPenisSet(human, false) end) end
	if TM_SpawnReset then Delayed(0.1, function() TMHumanReset(human) end) end
	if TM_SpawnAutoSexOn then AutoSexSet(human, true) end
	game.PlayCharacterMusic(human)
	if TM_AllowGenericChat then human.Say("Greeting") end
end

function TMOnRemoveHuman(human)
	game.PlayRandomCharacterMusic()
end


-------------------------------------------------------------------------------------------------
-- HUMAN FUNCTIONS (called from UI)
-------------------------------------------------------------------------------------------------

-- Resets Inside fluids, pose, interactions...
function TMHumanReset(human)
	WetReset_All(human)
	WetClearInside_All(human)
	HumanReset(human)
end

-- Cum with a provided sec frequency (min 2, max 60), if randomMax is provided, random cum will select between 2 and randomMax
function TMHumanCum(human, sec, randomMax)
	if not human or not human.Penis then return end
	local stats = TMHStatsGet(human)
	if not stats then return end
	stats.IsCumming = true
	stats.CumFrequency = ClampValue(sec, 2, 60)
	local isFirstRun = true
	game.AddRepeatAnim(stats.CumFrequency, function ()
		if not stats.IsCumming then return end
		TMPlayMoan(human, TMMoan.Cumming)
		-- randomly pass another moan
		if math.random() > 0.5 then Delayed(TM_Moans_CummingPause, function () TMPlayMoan(human, TMMoan.Cumming) end) end
		-- shoot with random delay from moan
		Delayed(GetRandomFloat(0.2, 0.8), function() human.Shoot() end)
		if isFirstRun then isFirstRun = false return end
		if randomMax ~= nil then
			Delayed(0.1, function()
				-- adding repeat animations is not cumulative, calling again replaces the first one
				-- but can't remove anim without waiting at least a frame, hence the delay
				-- game.RemoveAnim(human.Penis) -- not needed
				TMHumanCum(human, GetRandomFloat(2, randomMax), randomMax)
			end)
		end
	end, human.Penis)
end

-- Stop the human cumming
function TMHumanCumStop(human)
	stats = TMHStatsGet(human)
	if not stats then return end
	stats.IsCumming = false
	stats.CumFrequency = 0
	game.RemoveAnim(human.Penis)
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- HUMANS UPDATE (every frame)
--===============================================================================================
-------------------------------------------------------------------------------------------------
function TMOnUpdate_Humans(humans)
	-- Iterate and call for every human in the scene
	for _, human in ipairs(humans) do
		local stats = TMHStatsGet(human)
		TMOnUpdate_Futa(human, stats)
		TMOnUpdate_AutoSexClimax(human, stats)
		TMOnUpdate_CumInside_End(human, stats)
		TMOnUpdate_DeformBody(human, stats)
	end
end

-------------------------------------------------------------------------------------------------
-- FLUID REACTIONS (every frame)
-------------------------------------------------------------------------------------------------

-- Updated on fluid hit (cum)
function TMOnFluidHit(hitActor, bodyArea, shootActor)
	if game.FluidReaction == false or not hitActor or hitActor.m_isMale == true then return end

	local timerKey = "TMFluidHit_" .. hitActor.Name .. bodyArea
	local lastTime = Timer(timerKey)
	local stats = TMHStatsGet(hitActor)

	if lastTime > TM_MoanCumHeadTime and (bodyArea == ActBodyArea.L_Eye or bodyArea == ActBodyArea.Tongue or bodyArea == ActBodyArea.Cheeks) then 
		TMPlayMoan(hitActor, TMMoan.CumHead)
		hitActor.AddInvoluntaryAnim("L_Eye_HitClose", 1, 0.7, 0.7, EyelidL(1))
		ResetTimer(timerKey)
	elseif lastTime > TM_MoanCumHeadTime and bodyArea == ActBodyArea.R_Eye then 
		TMPlayMoan(hitActor, TMMoan.CumHead)
		hitActor.AddInvoluntaryAnim("R_Eye_HitClose", 1, 0.7, 0.7, EyelidR(1))
		ResetTimer(timerKey)
	elseif lastTime > TM_MoanCumHoleTime and bodyArea == ActBodyArea.Lips then 
		TMPlayMoan(hitActor, TMMoan.CumHole)
		hitActor.AddInvoluntaryAnim("OpenMouth", 5, 0.4, 0.4, Mouth(-0.83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.73, 0, 0.39))
		Delayed(1, function() hitActor.Swallow() end)
		ResetTimer(timerKey)
	elseif lastTime > TM_MoanCumHoleTime and
		(bodyArea == ActBodyArea.Vagina or bodyArea == ActBodyArea.Anus or bodyArea == ActBodyArea.Breasts) then 
		TMPlayMoan(hitActor, TMMoan.CumHole)
		ResetTimer(timerKey)
	else
		local genericVoiceKey = "TMFluidHit_Generic_" .. hitActor.Name
		local lastGenericVoiceTime = Timer(genericVoiceKey)
		if TM_AllowGenericChat and lastGenericVoiceTime > 500 then
			hitActor.SayCustom("gen_cumshot")
			hitActor.Say(hitActor.FaceMood >= 0 and "Like" or "Dislike")
			ResetTimer(genericVoiceKey)
		elseif lastTime > TM_MoanCumBodyTime then
			TMPlayMoan(hitActor, TMMoan.CumBody)
			ResetTimer(timerKey)
		end
	end
end

-------------------------------------------------------------------------------------------------
-- PENETRATION SEX REACTIONS (every frame)
-------------------------------------------------------------------------------------------------

-- MOUTH EFFECTS
function TMOnPenetration_Mouth(girl, stats, holeName, inVelocity)
	if not girl or girl.m_isMale or holeName ~= ActBody.Mouth then return end
	
	-- SFX BLOWJOB
	if TM_SFX_AllReactions and TM_SFX_ReactBlowjob and TMHStatsGet(girl).AllowMoaning then
		local timerKey = "TMBlowJobSFX_" .. girl.Name
		local lastBlowJobSfx = Timer(timerKey)
		local speed = Clamp01(inVelocity)
		local pause = Lerp(GetRandomFloat(0.8, 1.2), 0.2, speed)
		local distance = ActPenetrationDistanceGet(girl, ActBody.Mouth)
		if lastBlowJobSfx > pause and distance < 0.08 then
			local tmSfx = distance < 0.04 and TMSfx.Blowjob_Deep or TMSfx.Blowjob
			-- SFX: Blowjob
			TMPlayHumanSFX(girl, tmSfx, holeName)
			ResetTimer(timerKey)
		end
	end
end

-- ANUS, VAGINA EFFECTS
function TMOnPenetration_AnusVagina(girl, stats, holeName, inVelocity)
	if not girl or girl.m_isMale or holeName ~= ActBody.Vagina and holeName ~= ActBody.Anus then return end
	
	-- SFX PLAP
	if TM_SFX_AllReactions and TM_SFX_ReactPlap then
		local timerKey = "TMPlapSFX_" .. girl.Name
		local lastPlapSfx = Timer(timerKey)
		local speed = Clamp01(inVelocity)
		local pause = Lerp(GetRandomFloat(0.8, 1.2), 0.3, speed)
		local distance = ActPenetrationDistanceGet(girl, holeName)

		if lastPlapSfx > pause and distance < 0.065 then
			-- SFX: Sex plap
			TMPlayHumanSFX(girl, TMSfx.Plap, holeName, speed)
			ResetTimer(timerKey)
		end
	end

	-- BULGING
	if TM_Bulging then
		stats.IsBulging = true
		local deformPercent = ActPenetrationVolumeGet(girl, holeName)
		TMDeformBodyEffect(girl, stats, deformPercent, true)
	else
		stats.IsBulging = false
		--TMDeformBodyReset(girl, stats)
	end
end

-- FUTA MOANING > ONPENETRATION ROUTER
function TMOnUpdate_Futa(girl, stats)
	if not TM_SFX_AllReactions or not TM_SFX_ReactSex or not TM_SFX_ReactFuta or not girl or girl.m_isMale or not TMHStatsGet(girl).AllowMoaning then return end
	local function DoFutaMoan(actBody)
		act = ActGet(girl, actBody)
		if not act or not ActActiveGet(act, actBody == ActBody.PenisHand) then return end
		TMOnPenetration(girl, actBody, ActSpeedGet(act, false)/3, 0, SexPartner_Get(girl, actBody))
	end
	if HasSexPartner(girl, ActBody.PenisHole) then DoFutaMoan(ActBody.PenisHole)
		-- Detect penis in hole or hand and call OnPenetration
	elseif HasSexPartner(girl, ActBody.PenisHand) then DoFutaMoan(ActBody.PenisHand) end
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- PENETRATION MOANING & SFX (HoleName = "Vagina" "Anus" Mouth", outVelocity is always 0 :(
--===============================================================================================
-------------------------------------------------------------------------------------------------

function TMOnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
	if not girl or girl.m_isMale then return end
	local stats = TMHStatsGet(girl)
	TMOnPenetration_Mouth(girl, stats, holeName, inVelocity)
	TMOnPenetration_AnusVagina(girl, stats, holeName, inVelocity)
	TMOnPenetration_CumInside(girl, stats, holeName)

	if inVelocity < outVelocity then return end -- useless, outVelocity is zero :(

	-- Variables
	local timerKey = "TMSexMoan_" .. girl.Name .. holeName
	local lastMoanTime = Timer(timerKey)
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

	-- Pause between moans
	local pause = 1
	if stats and stats.Climax then
		pause = 0.03
	elseif tier == TMMoanTier.Max then
		pause = 0.05
	elseif tier == TMMoanTier.Wild then
		pause = 0.08
	else
		-- Organic Speed-based pause scaling: longer to zero near tier end
		local t = (inVelocity - tierMin) / (tierMax - tierMin)
		t = math.max(0, math.min(t, 1))
		-- Small randomness to avoid mechanical timing
		pause = (pauseMax * (1 - t)) + (math.random() * 0.05)
	end

	-- Play
	if lastMoanTime > pause then
		if TM_SFX_AllReactions and TM_SFX_ReactSex and stats.AllowMoaning then
			-- SFX: CLIMAX MOANING
			if stats and stats.Climax then TMPlayMoanTier(girl, TMMoanTier[stats.AutoSexTier]) -- follow stats.AutoSexTier with sounds
			-- SFX: SEX MOANING
			else TMPlayMoanTier(girl, tier) end -- follow penetration speed tier set above
		end
		-- Auto Wetness
		if TM_WetSex then
			WetSet(girl, wetness, holeName)
		else
			WetSet(girl, 0, holeName)
		end
		ResetTimer(timerKey)
	end
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- AUTOSEX CLIMAX
--===============================================================================================
-------------------------------------------------------------------------------------------------

function TMOnUpdate_AutoSexClimax(human, stats)
	-- SFX: CLIMAX MOANING in OnPenetration
	if not TM_AutoSex or not human or not stats or not stats:CanStartCumOrClimax() then return end
	-- CanStartClimax() return self.Autosex and self.IsSexActive and self.Arousal == 1 and not self.Climax and not self.IsCumming 

	-- penis owners never initiate climax, just start & stop cumming
	if HumanHasPenis(human) then
		if not TM_AutoCum or stats.IsCumming then return end
		-- just start cumming and stop after 10 secs
		TMHumanCum(human, 2, 5)
		Delayed(10, function () TMHumanCumStop(human) end)
		return
	
	-- female needs to feel cum and the climax starts
	elseif not TM_AutoClimax or not stats.IsFeelingCum then return end
	
	-- Just girls can set this, they lead the Climax
	local delay = 6
	local function Increment() delay = IncrementRandom(delay, 2, 4) end
	local function AutoSexSet_ClimaxTier(girl, autoSexTier)
		local stats = TMHStatsGet(girl)
		if not stats then return end
		AutoSexSet(girl, true, autoSexTier)
		ActAll_ActiveSet(girl, true) -- turn on all interactions
		ActAll_SpeedSet(girl, AutoSexTierConfig[autoSexTier].Mid) -- force specific start speed
		ActAll_DepthSet(girl, AutoSexTierConfig_Climax[ActParam.DepthEnd].Max, false) -- increase depth
		-- CLIMAX ENDED
		if autoSexTier == AutoSexTier.Idle then
			-- Penises never end up here for now
			--if stats.IsCumming and HumanHasPenis(girl) then TMHumanCumStop(girl) end
			stats.Climax = false
		end
	end

	stats.Climax = true
	if TM_WetSex then WetSet(human, 100000, ActBody.Vagina) end
	AutoSexSet_ClimaxTier(human, AutoSexTier.Max)
	Delayed(delay, function() AutoSexSet_ClimaxTier(human, AutoSexTier.Wild) end) Increment()
	Delayed(delay, function() AutoSexSet_ClimaxTier(human, AutoSexTier.Faster) end) Increment()
	Delayed(delay, function() AutoSexSet_ClimaxTier(human, AutoSexTier.Fast) end) Increment()
	Delayed(delay, function() AutoSexSet_ClimaxTier(human, AutoSexTier.Normal) end) Increment()
	Delayed(delay, function() AutoSexSet_ClimaxTier(human, AutoSexTier.Slow) end) Increment()
	Delayed(delay, function() AutoSexSet_ClimaxTier(human, AutoSexTier.Idle) end)
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- DEFORM EFFECTS
--===============================================================================================
-------------------------------------------------------------------------------------------------
function TMTimerKey_Deform(girl) return "TMDeform_" .. girl.Name end
function TMTimerKey_CumInside(girl) return "TMCumInside_" .. girl.Name end
function TMTimerKey_CumEffect(girl) return "TMCumEffect_" .. girl.Name end

function TMDeformBodyEffect(girl, stats, value, isBulgingCall)
	if not girl or not stats or value == nil then return end
	-- ensure original reference
	stats:DeformBackup()
	-- Bulging = normalized pressure
	if isBulgingCall then stats.DeformHips_Bulge = Clamp01(value)
	-- Cumflation = incremental delta
	else
		local cur = stats.DeformHips_Cumflate or stats.DeformHips_Orig
		local maxCum = stats.DeformHips_Orig + (TM_BodyDeformHipSizeLimit - stats.DeformHips_Orig) * TM_CumflateMaxRatio
		stats.DeformHips_Cumflate = ClampValue( cur + value, stats.DeformHips_Orig, maxCum )
	end
end

function TMOnUpdate_DeformBody(girl, stats)
	if not girl or not stats then return end
	local deformKey = TMTimerKey_Deform(girl)
	if Timer(deformKey) < TM_BodyDeformUpdateRate then return end
	local maxValue = TM_BodyDeformHipSizeLimit
	local baseValue = stats.DeformHips_Cumflate or stats.DeformHips_Orig

	-- bulge01 is optional / transient
	local bulge01 = stats.IsBulging and stats.DeformHips_Bulge or nil
	local targetValue
	if bulge01 and bulge01 > 0 then
		targetValue = Lerp(baseValue, maxValue, Clamp01(bulge01))
	else
		targetValue = baseValue
	end

	-- never update unless value changed
	if stats.DeformHips_LastApplied == targetValue then return end
	TMBodyEdit(girl, TMBody.Hips, targetValue)
	stats.DeformHips_LastApplied = targetValue
	ResetTimer(deformKey)
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- CUM INSIDE EFFECTS (every frame)
--===============================================================================================
-------------------------------------------------------------------------------------------------

local function TMCumInside_CanPlayEffect(stats, lastEffect)
	if not TM_SFX_AllReactions or not TM_SFX_ReactSex or not stats.AllowMoaning then return false end
	return lastEffect > TM_CumEffectTime
end

-- START OF CUM / CUMFLATION
function TMOnPenetration_CumInside(girl, stats, holeName)
	if not girl or girl.m_isMale or not stats then return end
	
	-- Is partner cumming
	local partner = SexPartner_Get(girl, holeName)
	if partner and not HumanIsCumming(partner) then return end
	stats.IsFeelingCum = true

	-- Cum & Cumflation effects (same)
	local effectKey = TMTimerKey_CumEffect(girl)
	if TMCumInside_CanPlayEffect(stats, Timer(effectKey)) then
		-- SFX: CUM INSIDE / CUMFLATION
		TMPlayMoan(girl, TM_Cumflate and TMMoan.Cumflating or TMMoan.CumInside)
		ResetTimer(effectKey)
	end
	
	-- Cumflation
	local deformKey = TMTimerKey_Deform(girl)
	if TM_Cumflate and Timer(deformKey) > TM_BodyDeformUpdateRate then
		stats.IsCumflating = true
		TMDeformBodyEffect(girl, stats, TM_CumflateStepUp, false)
		ResetTimer(deformKey)
	end
end

-- END OF CUM / CUMFLATION
function TMOnUpdate_CumInside_End(girl, stats)
	if not girl or girl.m_isMale or not stats then return end
	
	if Timer(TMTimerKey_CumInside(girl)) < TM_CumPauseTime then return end
	if Timer(TMTimerKey_Deform(girl)) < TM_BodyDeformUpdateRate then return end

	-- Still having sex
	if HasSexPartner_HoleAny(girl) then return end

	-- CUMFLATION DEFLATE
	if TM_Cumflate and stats.DeformHips_Orig and stats.DeformHips_Cumflate then
		if stats.DeformHips_Cumflate > stats.DeformHips_Orig then
			local effectKey = TMTimerKey_CumEffect(girl) 
			if TMCumInside_CanPlayEffect(stats, Timer(effectKey)) then
				-- SFX: CUMDEFLATION
				if stats.AllowMoaning then TMPlayMoan(girl, TMMoan.Cumflating) end
				if TM_WetSex then WetSet(girl, 50000, ActBody.Vagina) end
				ResetTimer(effectKey)
			end
			TMDeformBodyEffect(girl, stats, -TM_CumflateStepDown, false)
		else
			-- CUMFLATION PULLOUT
			stats.IsFeelingCum = false
			stats.IsCumflating = false
			TMOnCumInside_EndCumflate(girl)
		end
	else
		-- CUM PULLOUT
		stats.IsFeelingCum = false
		TMOnCumInside_EndCum(girl)
	end
end

-------------------------------------------------------------------------------------------------
-- CUM PULLOUT REACTIONS (called once)
-------------------------------------------------------------------------------------------------

-- CUM REACTION ON PULLOUT
function TMOnCumInside_EndCum(girl)
	if not girl or girl.m_isMale then return end
	if TM_WetSex then WetSet(girl, 1000, ActBody.Vagina) end
	local function Increment(oldValue, newValue) return IncrementMultiplierRandom(oldValue, TM_AutoSexClimaxTimeStep, 0.8, 1.5) end 
	local delay = 0.5
	local function Increment(value) delay = IncrementMultiplierRandom(delay, value, 0.8, 1.1) end
	-- SFX: CUM PULLOUT
	if not TM_SFX_AllReactions or not TM_SFX_ReactSex then return end
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Fast) end) Increment(0.5)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Fast) end) Increment(0.5)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Normal) end) Increment(1.5)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Normal) end) Increment(2)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Slow) end) Increment(3)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Slow) end) Increment(4)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Slow) end)
end

-- CUMFLATION REACTION ON PULLOUT
function TMOnCumInside_EndCumflate(girl)
	if not girl or girl.m_isMale then return end
	if TM_WetSex then WetSet(girl, 10000, ActBody.Vagina) end
	local delay = 0.4
	local function Increment(value) delay = IncrementMultiplierRandom(delay, value, 0.8, 1.1) end
	-- SFX: CUMFLATION PULLOUT
	if not TM_SFX_AllReactions or not TM_SFX_ReactSex then return end
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Faster) end) Increment(0.4)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Faster) end) Increment(0.4)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Faster) end) Increment(0.4)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Fast) end) Increment(0.5)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Fast) end) Increment(0.5)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Normal) end) Increment(0.7)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Normal) end) Increment(0.7)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Normal) end) Increment(1)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Normal) end) Increment(1.5)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Slow) end) Increment(1.5)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Slow) end) Increment(4)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Slow) end) Increment(6)
	Delayed(delay, function() TMPlayMoanTier(girl, TMMoanTier.Slow) end)
end