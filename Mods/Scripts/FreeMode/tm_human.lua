-- TrueMoan v1.8 by illa3d
-- Per-human AUTHORITATIVE stat storage (including EditBody data)
TM_HumanStatsList = {}
local TMH_LastUpdateClock = os.clock()

-- CONFIG
TMH_DefaultArousalIncrease = 0.10
TMH_DefaultArousalDecay = 0.05
TMH_ImpregStepTime = 0.1
TMH_ImpregEffectTime = 0.5
TMH_ImpregPauseTime = 1

-- DEFINITION (never update this, USE TMHStatsSet_BodyEdit or BodyEdit functions)
TMHumanStatsDefault = {
	TMBValue = nil,
	IsHavingSex = false,
	LastSeen = 0,
	LastUpdate = 0,
	NeedsBodyApply = false,
	-- Arousal
	Arousal = 0,
	-- Impregnation
	ImpregLastTime = nil,
	ImpregLastUpdate = nil,
	ImpregEffectLastTime = nil,
	ImpregHipsSize = nil,
	ImpregHipsSizeOrig = nil,
}
function THMHumanStatsCloneDefault() return GetTableClone(TMHumanStatsDefault) end

-------------------------------------------------------------------------------------------------
-- HUMAN STATS
-------------------------------------------------------------------------------------------------

local function TMHStatsNew(human)
	local clone = THMHumanStatsCloneDefault() -- TMHUmanStatus is authoritative source of Status for each human
	clone.TMBValue = TMBodyValueCloneDefault() --TMBValue is AUTHORITATIVE source of Human Body customization values
	clone.LastSeen = os.time()
	clone.LastUpdate = os.time()
	TM_HumanStatsList[human] = clone
end

local function TMHStatsRemove(human)
	TM_HumanStatsList[human] = nil
end

function TMHStatsGet(human)
	if not human then return nil end
	if TM_HumanStatsList[human] == nil then TMHStatsNew(human) end
	return TM_HumanStatsList[human]
end

function TMHStatsReset(human)
	TMHStatsRemove(human)
	TMHStatsNew(human)
end

-- HUMAN STATS UPDATE
function OnUpdate_HumanStats()
	local now = os.clock()
	local deltaTime = now - TMH_LastUpdateClock
	TMH_LastUpdateClock = now
	local Humans = game.GetHumans()
	local Seen = {}

	for _, human in ipairs(Humans) do
		Seen[human] = true
		local stats = TMHStatsGet(human)
		stats.LastSeen = os.time()
		if stats.NeedsBodyApply == true then TMHStats_TMBApply(human) end
		-- Sexy features
		TMStatArousalUpdate(stats, deltaTime)
		TMStatImpregDeflateUpdate(human, stats)
		-- Last update time
		stats.LastUpdate = os.time()
		
	end

	-- Cleanup non existing humans
	for human, _ in pairs(TM_HumanStatsList) do
		if Seen[human] ~= true then
			TMHStatsRemove(human)
		end
	end
end

-------------------------------------------------------------------------------------------------
-- HUMAN SEX STATS
-------------------------------------------------------------------------------------------------
-- AROUSAL
function TMStatArousalUpdate(stats, deltaTime)
	if not stats then return end
	if stats.IsHavingSex == true then stats.Arousal = math.min(stats.Arousal + deltaTime * TMH_DefaultArousalIncrease,1.0)
	else stats.Arousal = math.max(stats.Arousal - deltaTime * TMH_DefaultArousalDecay,0) end
end

-- IMPREGNATION
function TMHStatImpregUpdate(girl, holeName)
	if not TM_ImpregAllow or not girl or girl.m_isMale then return end
	local stats = TMHStatsGet(girl)
	if not stats then return end
	-- throttle only if we have a previous update time
	if stats.ImpregLastUpdate and os.time() - stats.ImpregLastUpdate < TMH_ImpregStepTime then return end
	local partner = GetSexPartner(girl, holeName)
	if partner and not HumanIsCumming(partner) then return end
	if TMHCanPlayImpregEffect(stats) then
		TMPlayGirlMoan(girl, TMMoanTier.Orgasm)
		stats.ImpregEffectLastTime = os.time()
	end
	if stats.ImpregHipsSize == nil then
		stats.ImpregHipsSizeOrig = stats.TMBValue.Hips
		stats.ImpregHipsSize = stats.ImpregHipsSizeOrig
		stats.ImpregLastTime = os.time()
		stats.ImpregLastUpdate = os.time()
		return
	end
	stats.ImpregLastTime = os.time()
	stats.ImpregLastUpdate = os.time()
	stats.ImpregHipsSize = math.min(stats.ImpregHipsSize + TM_ImpregStepUp, TM_ImpregSizeLimit)
	TMBodyEdit(girl, TMBody.Hips, stats.ImpregHipsSize)
end

function TMStatImpregDeflateUpdate(girl, stats)
	if not TM_ImpregAllow or not girl or girl.m_isMale or not stats then return end
	if not stats.ImpregHipsSizeOrig or stats.ImpregHipsSize == 0 then return end
	if HasSexPartnerHoles(girl) then return end -- still having sex
	-- must have valid timers
	if not stats.ImpregLastTime or not stats.ImpregLastUpdate then return end
	-- Wait for timeout since last impregnation
	if os.time() - stats.ImpregLastTime < TMH_ImpregPauseTime then return end
	-- throttle deflation steps
	if os.time() - stats.ImpregLastUpdate < TMH_ImpregStepTime then return end
	-- Deflate start
	stats.ImpregLastUpdate = os.time()
	stats.ImpregHipsSize = math.max(stats.ImpregHipsSize - TM_ImpregStepDown, stats.ImpregHipsSizeOrig)
	TMBodyEdit(girl, TMBody.Hips, stats.ImpregHipsSize)
	-- Deflate effects
	if TMHCanPlayImpregEffect(stats) then
		TMPlayGirlMoan(girl, TMMoanTier.Faster)
		WetSet(girl, 50000, ActBody.Vagina)
		stats.ImpregEffectLastTime = os.time()
	end
	-- Deflate done
	if stats.ImpregHipsSize <= stats.ImpregHipsSizeOrig then
		TMBodyEdit(girl, TMBody.Hips, stats.ImpregHipsSizeOrig)
		WetSet(girl, 1000, ActBody.Vagina)
		Delayed(0.5, function() TMPlayGirlMoan(girl, TMMoanTier.Fast) end)
		Delayed(1, function() TMPlayGirlMoan(girl, TMMoanTier.Fast) end)
		Delayed(1.5, function() TMPlayGirlMoan(girl, TMMoanTier.Normal) end)
		Delayed(3, function() TMPlayGirlMoan(girl, TMMoanTier.Normal) end)
		Delayed(5, function() TMPlayGirlMoan(girl, TMMoanTier.Slow) end)
		Delayed(10, function() TMPlayGirlMoan(girl, TMMoanTier.Slow) end)
		Delayed(15, function() TMPlayGirlMoan(girl, TMMoanTier.Slow) end)
		stats.ImpregLastTime = nil
		stats.ImpregEffectLastTime = nil
		stats.ImpregLastUpdate = nil
		stats.ImpregHipsSize = nil
		stats.ImpregHipsSizeOrig = nil
	end
end

function TMHCanPlayImpregEffect(stats)
	if not stats.ImpregEffectLastTime then return true end
	return os.time() - stats.ImpregEffectLastTime >= TMH_ImpregEffectTime
end

-------------------------------------------------------------------------------------------------
-- BODY EDIT VALUES
-------------------------------------------------------------------------------------------------
-- Direct access to per-human TMBValue table
function TMHStatsGet_TMBValue(human)
	local stats = TMHStatsGet(human)
	if not stats then return nil end
	return stats.TMBValue
end

-- Replace entire TMB table (preset load, copy, etc.)
function TMHStatsReplace_TMBValue(human, tmbValue)
	if not tmbValue then return end
	local stats = TMHStatsGet(human)
	if not stats then return end
	stats.TMBValue = TMBodyValueClone(tmbValue)
	stats.NeedsBodyApply = true
end

-- Set single body value (called from BodyEdit to modify the AUTHORITATIVE TMBValue)
-- This can be used for directly editing the character
function TMHStatsSet_BodyEdit(human, tmBody, value, apply)
	if apply == nil then apply = true end
	-- don't allow changing values in the table while iterating (lua rules)
	local stats = TMHStatsGet(human)
	if not stats or not tmBody then return end
	stats.TMBValue[tmBody] = value
	if apply then stats.NeedsBodyApply = true end
end

-- BODY APPLY (WRITE-ONLY, AUTHORITATIVE)
function TMHStats_TMBApply(human)
	local stats = TMHStatsGet(human)
	if not stats or not stats.NeedsBodyApply then return end
	-- don't allow changing values in the table while iterating (lua rules)
	local snapshot = TMBodyValueClone(stats.TMBValue)
	for part, value in pairs(snapshot) do TMBodyEdit_Apply(human, part, value) end
	stats.NeedsBodyApply = false
end