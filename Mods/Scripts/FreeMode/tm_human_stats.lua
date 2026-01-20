-- TrueMoan v2.5 by illa3d
-- Requires: tm_act.lua, tm_autosex.lua
-- Per-human AUTHORITATIVE stat storage (including EditBody data)
local TM_HumanStatsList = {}

-- DEFINITION (never update this, USE TMHStatsSet_BodyEdit or BodyEdit functions)
TMHumanStats = {
	-- Time
	UpdateDelta = 0,
	-- Customization
	TMBValue = TMBodyValueCloneDefault(),
	NeedsBodyApply = false,
	-- Sex
	AllowMoaning = true,
	Voice = "",
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
	IsClimax = false,
	Arousal = 0,
	ArousalSeed = 1,
	-- Cum
	IsCumming = false,
	CumFrequency = 0,
	-- Cum reactions
	IsFeelingCum = false,
	DeformHips_LastApplied = nil,
	DeformHips_Orig = nil,
	DeformHips_Bulge = nil,
	DeformHips_Cumflate = nil,
	-- AutoSex
	AutoSex = false,
	AutoSexTier = nil,
	Plap = nil,
	-- AutoSex parameters
	AutoSexCum = true,
	AutoSexClimax = true,
	AutoSexSpeed = true,
	AutoSexThrust = true,
	AutoSexWeight = true,
	AutoSexDepthStart = true,
	AutoSexDepthEnd = true,
}
function TMHumanStatsCloneDefault() return TableClone(TMHumanStats) end

-- PLAP DEFINITION
TMHumanStatsPlapDefault = {
	[ActBody.Vagina] = false,
	[ActBody.Anus] = false
}
function TMHumanStatsPlapCloneDefault() return TableClone(TMHumanStatsPlapDefault) end


local TM_UpdateDelta = 0		-- cumulative deltaTime
local TM_UpdateDeltaMax = 0.25	-- maximum update step
local TM_UpdateRate = 0.05		-- update tick (20 Hz)
local TM_UpdateRateStats = 0.1	-- stats update tick (10 Hz)
-------------------------------------------------------------------------------------------------
-- HUMAN STATS
-------------------------------------------------------------------------------------------------

local function TMHStatsNew(human)
	local clone = TMHumanStatsCloneDefault() -- TMHUmanStats is authoritative source of Stats for each human
	clone.TMBValue = TMBodyValueCloneDefault() --TMBValue is AUTHORITATIVE source of Human Body customization values
	clone.SexBody = {}
	clone.Plap = TMHumanStatsPlapCloneDefault()
	clone.ArousalSeed = GetRandomFloatAround(1, 0.1) -- Add random seed variation 10%
	clone.AutoSexTier = TM_AutoSexTier_Default
	clone.Voice = TMVoiceGet_RandomName()
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
function TMOnUpdate_HumanStats(humans, deltaTime)
	-- global scheduler cap
	TM_UpdateDelta = TM_UpdateDelta + deltaTime
	if TM_UpdateDelta < TM_UpdateRate then return end
	TM_UpdateDelta = 0
	local Seen = {}
	for _, human in ipairs(humans) do
		Seen[human] = true
		local stats = TMHStatsGet(human)
		if stats then
			-- BodyEdit (never throttled)
			if stats.NeedsBodyApply then TMHStats_TMBApply(human) end
			if TM_AutoSex then
				-- per-human update accumulator
				stats.UpdateDelta = stats.UpdateDelta + deltaTime
				if stats.UpdateDelta >= TM_UpdateRateStats then
					-- consume accumulated time
					local step = math.min(stats.UpdateDelta, TM_UpdateDeltaMax)
					stats.UpdateDelta = 0
					-- logic update (ONCE)
					stats:UpdateSex(human)
					stats:UpdateArousal(step)
				end
			end
		end
	end

	-- Cleanup non existing humans
	for human in pairs(TM_HumanStatsList) do
		if not Seen[human] then TMHStatsRemove(human) end
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
	if self.IsSexActive and self.AutoSexTier and self.IsClimax ~= true and self.IsCumming ~= true then
		local tierMul = AutoSexTierConfig[self.AutoSexTier].Arousal
		local gain = deltaTime * (TM_HumanArousalIncrease / 100) * tierMul
		* ArousalHoleMultiplier(self.SexBodyCount)
		* (self.IsCumflating and 2 or 1)
		* (self.IsFeelingCum and 1.3 or 1)
		* self.ArousalSeed
		self.Arousal = Clamp01(self.Arousal + gain)
		if self.Arousal >= 0.99 then self.Arousal = 1 end
	else
		self.Arousal = Clamp01(self.Arousal - deltaTime * (TM_HumanArousalDecrease / 100) * (self.IsCumming and 4 or 1) * self.ArousalSeed)
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

function TMHumanStats:VoiceToggle()
	-- No voices registered
	if not TMVoicesHas() then
		self.AllowMoaning = false
		return
	end
	
	-- If Voice is OFF, turn it ON
	if not self.AllowMoaning then
		self.AllowMoaning = true
		self.Voice = TM_Voices_Names[#TM_Voices_Names]
		return
	end
	-- Voice is ON, step down tiers
	if self.Voice ~= TM_Voices_Names[1] then
		self.Voice = ListItemStep(TM_Voices_Names, self.Voice, -1)
	-- Voice is ON, minimum tier toggles to OFF
	else self.AllowMoaning = false end
end

function TMHumanStats:CanStartCumOrClimax()
	return self.AutoSex and self.IsSexActive and self.Arousal == 1 and not self.IsClimax and not self.IsCumming 
end

-- DEFORM
function TMHumanStats:DeformBackupIfNot()
	if not self.DeformHips_Orig then self.DeformHips_Orig = self.TMBValue.Hips end
end

function TMHumanStats:IsDoneCumflating()
	return self.DeformHips_Cumflate <= self.DeformHips_Orig
end

function TMHumanStats:DeformReset()
	self.DeformHips_Orig = nil
	self.DeformHips_Cumflate = nil
	self.DeformHips_Bulge = nil
	self.DeformHips_LastApplied = nil
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
	-- stats:DeformReset()
	if not stats or not stats.NeedsBodyApply then return end
	-- don't allow changing values in the table while iterating (lua rules)
	local snapshot = TMBodyValueClone(stats.TMBValue)
	for part, value in pairs(snapshot) do TMBodyEdit_Apply(human, part, value) end
	stats.NeedsBodyApply = false
end