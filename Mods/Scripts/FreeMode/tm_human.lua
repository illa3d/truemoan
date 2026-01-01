-- TrueMoan v1.8 by illa3d
-- Per-human AUTHORITATIVE stat storage (including EditBody data)
TM_HumanStatsList = {}
local TMH_LastUpdateClock = os.clock()

-- CONFIG
TMH_DefaultArousalIncrease = 0.10
TMH_DefaultArousalDecay = 0.05

-- DEFINITION (never update this, USE TMHStatsSet_BodyEdit or BodyEdit functions)
TMHumanStatsDefault = {
	TMBValue = nil,
	IsHavingSex = false,
	LastSeen = 0,
	LastUpdate = 0,
	NeedsBodyApply = false,
	-- Arousal
	Arousal = 0,
	-- Cum reactions
	CumLastTime = nil,
	CumLastUpdate = nil,
	CumEffectLastTime = nil,
	CumflateHipsSize = nil,
	CumflateHipsSizeOrig = nil,
}
function TMHumanStatsCloneDefault() return GetTableClone(TMHumanStatsDefault) end

-------------------------------------------------------------------------------------------------
-- HUMAN STATS
-------------------------------------------------------------------------------------------------

local function TMHStatsNew(human)
	local clone = TMHumanStatsCloneDefault() -- TMHUmanStatus is authoritative source of Status for each human
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
function TMOnUpdate_HumanStats()
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