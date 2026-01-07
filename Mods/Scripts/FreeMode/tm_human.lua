-- TrueMoan v2.0 by illa3d
-- Per-human AUTHORITATIVE stat storage (including EditBody data)
TM_HumanStatsList = {}
local TMH_LastUpdateClock = os.clock()

-- CONFIG
TMH_DefaultArousalIncrease = 0.003
TMH_DefaultArousalDecay = 0.01

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
	local clone = TMHumanStatsCloneDefault() -- TMHUmanStatus is authoritative source of Status for each human
	clone.LastUpdate = os.time()
	clone.TMBValue = TMBodyValueCloneDefault() --TMBValue is AUTHORITATIVE source of Human Body customization values
	clone.SexBody = {}
	clone.AutoSexTier = AutoSexTier_Default
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
		if stats.NeedsBodyApply == true then TMHStats_TMBApply(human) end
		-- Sexy features
		stats:UpdateSex(human)
		stats:UpdateArousal(deltaTime)
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
-- SEX
function TMHumanStats:UpdateSex(human)
	for _, body in pairs(ActBody) do
		self:SetSexActive(IsSexActive(human, body), body)
	end
end

function TMHumanStats:SetSexActive(active, actBody)
	self[actBody] = active
	self.IsSexActive = self.PenisHand or self.PenisHole or self.Mouth or self.Anus or self.Vagina
	if active then
		if not TableHasValue(self.SexBody, actBody) then table.insert(self.SexBody, actBody) end
	else TableRemoveValue(self.SexBody, actBody) end
	self.SexBodyCount = TableCount(self.SexBody)
end

-- AROUSAL
local function HoleMultiplier(holeCount)
	-- diminishing returns: 1 hole = 1.0, 2 = 1.35, 3 = 1.6
	if holeCount <= 0 then return 0 end
	return 1 + math.log(holeCount + 1) * 0.6
end

function TMHumanStats:UpdateArousal(deltaTime)
	if self.IsSexActive and self.AutoSexTier and not self.Climax then
		local tierMul = AutoSexTierConfig[self.AutoSexTier].Arousal
		local gain = deltaTime * TMH_DefaultArousalIncrease * tierMul
		* HoleMultiplier(self.SexBodyCount)
		* (self.IsCumming and 2 or 1)
		* (self:IsCumflating() and 2 or 1)
		* (self:IsFeelingCum() and 1.3 or 1)
		self.Arousal = Clamp01(self.Arousal + gain)
		if self.Arousal >= 0.99 then self.Arousal = 1 end
	else
		self.Arousal = Clamp01(self.Arousal - deltaTime * TMH_DefaultArousalDecay)
	end
end

-- AUTOSEX
function TMHumanStats:AutoSexSet(active)
	self.AutoSex = active
	if self.AutoSexTier == nil then self.AutoSexTier = AutoSexTier_Default end
end

function TMHumanStats:AutoSexTierSet(autoSexTier)
	if not autoSexTier then return end
	self.AutoSexTier = autoSexTier
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

function TMHumanCumEvery(human, sec)
	if not human or not human.Penis then return end
	stats = TMHStatsGet(human)
	if not stats then return end
	stats.IsCumming = true
	stats.CumFrequency = sec
	game.AddRepeatAnim(sec, function ()
		TMPlayMoan(human, TMMoan.Cumming)
		human.Shoot()
	end, human.Penis)
end

function TMHumanCumStop(human)
	stats = TMHStatsGet(human)
	if not stats then return end
	stats.IsCumming = false
	stats.CumFrequency = 0
	game.RemoveAnim(human.Penis)
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