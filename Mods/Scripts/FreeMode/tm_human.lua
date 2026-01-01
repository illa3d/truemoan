-- TrueMoan v1.8 by illa3d
-- Per-human AUTHORITATIVE stat storage (including EditBody data)
TM_HumanStats = {}
local TMH_LastUpdateClock = os.clock()

-- CONFIG
TMH_DefaultArousalIncrease = 0.10
TMH_DefaultArousalDecay = 0.05
TMH_ImpregnateIncrement = 0.1
TMH_ImpregnateDecay = 0.05
TMH_ImpregnateHipsLimit = 1.5

-------------------------------------------------------------------------------------------------
-- HUMAN STATS
-------------------------------------------------------------------------------------------------

local function TMHStatsCreate(human)
	TM_HumanStats[human] = {
		--TMBValue is AUTHORITATIVE source of Human Body customization values
		TMBValue = TMBValueDefaultGet(), -- NEVER CHANGE THESE VALUES DIRECTLY, USE TMHStatsSet_BodyEdit or BodyEdit functions
		IsHavingSex = false,
		Arousal = 0,
		LastSeen = os.time(),
		LastUpdate = os.time(),
		NeedsBodyApply = false,
		HipsOriginal = 0,
		HipsImpregnate = 0,
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
		-- Arousal
		if stats.IsHavingSex == true then stats.Arousal = math.min(stats.Arousal + deltaTime * TMH_DefaultArousalIncrease,1.0)
		else stats.Arousal = math.max(stats.Arousal - deltaTime * TMH_DefaultArousalDecay,0) end
		-- Impregnation
		if stats.HipsImpregnate and stats.HipsImpregnate > 0 then TMHStatImpregnateDecrease(human) end
		-- Body Edit check
		if stats.NeedsBodyApply == true then TMHStats_TMBApply(human) end
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
-- BODY EDIT VALUES
-------------------------------------------------------------------------------------------------

function TMHStatImpregnanteStep(human)
	local stats = TMHStatsGet(human)
	if stats.HipsImpregnate == 0 then 
		stats.HipsOriginal = stats.TMBValue.Hips
		stats.HipsImpregnate = stats.HipsOriginal
	end
	stats.HipsImpregnate = math.min(stats.HipsImpregnate + TMH_ImpregnateIncrement, TMH_ImpregnateHipsLimit)
	TMBodyEdit(human, TMBody.Hips, stats.HipsImpregnate)
end

function TMHStatImpregnateDecrease(human)
	local stats = TMHStatsGet(human)
	if not stats then return end
	-- Nothing to decay
	if not stats.HipsImpregnate or not stats.HipsOriginal then return end
	-- Move back toward original value
	stats.HipsImpregnate = math.max(stats.HipsImpregnate - TMH_ImpregnateDecay,stats.HipsOriginal)
	-- Apply via authoritative path
	TMBodyEdit(human, TMBody.Hips, stats.HipsImpregnate)
	-- Fully reset when done
	if stats.HipsImpregnate <= stats.HipsOriginal then
		stats.HipsImpregnate = 0
		stats.HipsOriginal = nil
	end
end

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