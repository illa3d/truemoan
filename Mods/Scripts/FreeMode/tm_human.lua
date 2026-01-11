-- TrueMoan v2.1 by illa3d
-- Per-human AUTHORITATIVE stat storage (including EditBody data)
local TM_HumanStatsList = {}

-- DEFINITION (never update this, USE TMHStatsSet_BodyEdit or BodyEdit functions)
TMHumanStats = {
	-- Time
	LastUpdate = 0,
	-- Customization
	TMBValue = nil,
	NeedsBodyApply = false,
	-- Sex
	IsSexActive = false,
	-- Where
	PenisHole = false,
	PenisHand = false,
	Mouth = false,
	Anus = false,
	Vagina = false,
	-- Where list
	SexBody = nil,
	SexBodyCount = 0,
	-- Arousal
	Arousal = 0,
	ArousalSeed = 1,
	Climax = false,
	-- AutoSex
	AutoSex = false,
	AutoSexTier = nil,
	-- Cum
	IsCumming = false,
	CumFrequency = 0,
	-- Cum reactions
	CumLastTime = nil,
	CumLastUpdate = nil,
	CumEffectLastTime = nil,
	CumflateHipsSize = nil,
	CumflateHipsSizeOrig = nil,
}

function TMHumanStatsCloneDefault() return TableClone(TMHumanStats) end

-------------------------------------------------------------------------------------------------
-- HUMAN STATS
-------------------------------------------------------------------------------------------------

local function TMHStatsNew(human)
	local clone = TMHumanStatsCloneDefault() -- TMHUmanStats is authoritative source of Stats for each human
	clone.LastUpdate = os.time()
	clone.TMBValue = TMBodyValueCloneDefault() --TMBValue is AUTHORITATIVE source of Human Body customization values
	clone.SexBody = {}
	clone.ArousalSeed = GetRandomFloatAround(1, 0.1) -- Add random seed variation 10%
	clone.AutoSexTier = TM_AutoSexTier_Default
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
function TMOnUpdate_HumanStats(deltaTime)
	local Humans = game.GetHumans()
	local Seen = {}

	for _, human in ipairs(Humans) do
		Seen[human] = true
		local stats = TMHStatsGet(human)
		-- Last update / Throttle
		stats.LastUpdate = os.time()
		-- TOOD Throttle
		-- Sexy features
		stats:UpdateSex(human)
		stats:UpdateArousal(deltaTime)
		-- BodyEdit
		if stats.NeedsBodyApply == true then TMHStats_TMBApply(human) end
	end

	-- Cleanup non existing humans
	for human, _ in pairs(TM_HumanStatsList) do
		if Seen[human] ~= true then TMHStatsRemove(human) end
	end
end

-------------------------------------------------------------------------------------------------
-- HUMAN STATS SEX UPDATE
-------------------------------------------------------------------------------------------------
-- SEX
function TMHumanStats:UpdateSex(human)
	-- check each body interaction for sex activity
	for _, body in pairs(ActBody) do
		self:UpdateSexActive(IsSexActive(human, body), body)
	end
end

function TMHumanStats:UpdateSexActive(active, actBody)
	-- set detected body activity and conclude if there's any sex (from all body activities)
	self[actBody] = active
	self.IsSexActive = self.PenisHand or self.PenisHole or self.Mouth or self.Anus or self.Vagina
	-- add or remove current body activity and bodycount (how many activities)
	if active then
		if not TableHasValue(self.SexBody, actBody) then table.insert(self.SexBody, actBody) end
	else TableRemoveValue(self.SexBody, actBody) end
	self.SexBodyCount = TableCount(self.SexBody)
end

-------------------------------------------------------------------------------------------------
-- HUMAN STATS AROUSAL UPDATE
-------------------------------------------------------------------------------------------------

-- AROUSAL
local function ArousalHoleMultiplier(holeCount)
	-- diminishing returns: 1 hole = 1.0, 2 = 1.35, 3 = 1.6
	if holeCount <= 0 then return 0 end
	return 1 + math.log(holeCount + 1) * 0.6
end

function TMHumanStats:UpdateArousal(deltaTime)
	if self.IsSexActive and self.AutoSexTier and self.Climax ~= true and self.IsCumming ~= true then
		local tierMul = AutoSexTierConfig[self.AutoSexTier].Arousal
		local gain = deltaTime * (TM_HumanArousalIncrease / 100) * tierMul
		* ArousalHoleMultiplier(self.SexBodyCount)
		* (self:IsCumflating() and 2 or 1)
		* (self:IsFeelingCum() and 1.3 or 1)
		* self.ArousalSeed
		self.Arousal = Clamp01(self.Arousal + gain)
		if self.Arousal >= 0.99 then self.Arousal = 1 end
	else
		self.Arousal = Clamp01(self.Arousal - deltaTime * (TM_HumanArousalDecrease / 100) * (self.IsCumming and 4 or 1))
	end
end

-------------------------------------------------------------------------------------------------
-- HUMAN STATS FUNCTIONS
-------------------------------------------------------------------------------------------------

-- AUTOSEX
function TMHumanStats:AutoSexSet(active)
	self.AutoSex = active
	if self.AutoSexTier == nil then self.AutoSexTier = TM_AutoSexTier_Default end
end

function TMHumanStats:AutoSexTierSet(autoSexTier)
	if not autoSexTier then return end
	self.AutoSexTier = autoSexTier
end

function TMHumanStats:CanStartClimax()
	return self.AutoSex and self.IsSexActive and self.Arousal == 1 and not self.Climax and not self.IsCumming 
end

-- CUM
function TMHumanStats:IsFeelingCum()
	return self.CumLastTime ~= nil
end

function TMHumanStats:IsCumflating()
	return self.CumflateHipsSize ~= nil
end

function TMHumanStats:CumReset()
	self.CumLastTime = nil
	self.CumEffectLastTime = nil
	self.CumLastUpdate = nil
	self.CumflateHipsSize = nil
	self.CumflateHipsSizeOrig = nil
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