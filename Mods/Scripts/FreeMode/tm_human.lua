-- TrueMoan v1.8 by illa3d
-- Per-human AUTHORITATIVE stat storage (including EditBody data)
TM_HumanStats = {}
local TMH_LastUpdateClock = os.clock()

-- CONFIG
TMH_DefaultArousalIncrease = 0.10
TMH_DefaultArousalDecay = 0.05
TMH_ImpregStepTime = 0.1
TMH_ImpregTimeout = 1

-------------------------------------------------------------------------------------------------
-- HUMAN STATS
-------------------------------------------------------------------------------------------------

local function TMHStatsCreate(human)
	TM_HumanStats[human] = {
		--TMBValue is AUTHORITATIVE source of Human Body customization values
		TMBValue = TMBValueDefaultGet(), -- NEVER CHANGE THESE VALUES DIRECTLY, USE TMHStatsSet_BodyEdit or BodyEdit functions
		IsHavingSex = false,
		LastSeen = os.time(),
		LastUpdate = os.time(),
		NeedsBodyApply = false,
		-- Arousal
		Arousal = 0,
		-- Impregnation
		ImpregLastTime = nil,
		ImpregLastUpdate = nil,
		ImpregHipsSize = nil,
		ImpregHipsSizeOrig = nil,
	}
end

local function TMHStatsRemove(human)
	TM_HumanStats[human] = nil
end

function TMHStatsGet(human)
	if not human then return nil end
	if TM_HumanStats[human] == nil then TMHStatsCreate(human) end
	return TM_HumanStats[human]
end

function TMHStatsReset(human)
	TMHStatsRemove(human)
	TMHStatsCreate(human)
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
		TMStatImpregUpdate(human, stats)
		-- Last update time
		stats.LastUpdate = os.time()
		
	end

	-- Cleanup non existing humans
	for human, _ in pairs(TM_HumanStats) do
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
function TMStatImpregUpdate(human, stats)
	if not TM_ImpregAllow or not stats or not stats.ImpregHipsSizeOrig or stats.ImpregHipsSize == 0 then return end
	if HasSexPartnerHoles(human) then return end -- don't deflate if still having sex
	if not stats.ImpregLastTime or not stats.ImpregLastUpdate then return end
	if os.time() - stats.ImpregLastTime < TMH_ImpregTimeout then return end
	if os.time() - stats.ImpregLastUpdate < TMH_ImpregStepTime then return end
	stats.ImpregLastUpdate = os.time()
	stats.ImpregHipsSize = math.max( stats.ImpregHipsSize - TM_ImpregStepDown, stats.ImpregHipsSizeOrig)
	TMBodyEdit(human, TMBody.Hips, stats.ImpregHipsSize)
	WetSet(human, 50000, ActBody.Vagina)
	if stats.ImpregHipsSize <= stats.ImpregHipsSizeOrig then
		stats.ImpregLastTime = nil
		stats.ImpregLastUpdate = nil
		stats.ImpregHipsSize = nil
		stats.ImpregHipsSizeOrig = nil
	end
end

function TMHStatImpregnanteStep(human)
	if not TM_ImpregAllow then return end
	local stats = TMHStatsGet(human)
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
	TMBodyEdit(human, TMBody.Hips, stats.ImpregHipsSize)
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
	stats.TMBValue = TMBValueClone(tmbValue)
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
	local snapshot = TMBValueClone(stats.TMBValue)
	for part, value in pairs(snapshot) do TMBodyEdit_Apply(human, part, value) end
	stats.NeedsBodyApply = false
end