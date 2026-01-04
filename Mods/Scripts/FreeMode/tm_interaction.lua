-- TrueMoan v1.9 by illa3d
-------------------------------------------------------------------------------------------------
-- INTERACTION BETWEEN HUMANS, HOLES AND PENISES, INTERACTION PARAMETERS AND THEIR TWEENS
-------------------------------------------------------------------------------------------------
-- AUTOSEX DEFINITIONS (Act = Interaction)
-------------------------------------------------------------------------------------------------
-- AUTOSEX: Game Timer (ActAutoSexTickTime) -> AutoSexTick -> AutoSexBodyParamSet (each full hole interaction, 5 params)
-- 		Get Random time between TM_AutoSexTimeMin and TM_AutoSexTimeMax (config)
-- 		ActAutoSexTickTime = 0.5 (subtract each tick from random time passed game time in seconds)
-- 			Start parameter change (TWEEN or raw set)
-------------------------------------------------------------------------------------------------
-- ACUTUAL GAME FUNCTIONS AND LIMITS
-------------------------------------------------------------------------------------------------
-- ACTIVE (penis, hand)
--  interaction.AutoActive = true
--  interaction.m_autoHandActive = true
-- SPEED (penis, hand)
--  interaction.m_autoSpeed = speed (0.001 - 2)
--  interaction.m_autoHandSpeed = speed (0.001 - 2)
-- THRUST (penis, hand)
--  interaction.m_autoThrustWeight = weight (1-3)
--  interaction.m_autoHandThrustWeight = weight (1-3)
-- DEPTH (penis, hand)
--  interaction.m_autoStartDepth = depth (0-0.1.25)
--  interaction.m_autoEndDepth = depth (0.05-1.3)
--  interaction.m_autoHandStartDepth = depth (0-1.25)
--  interaction.m_autoHandEndDepth = depth (0.05-1.3)
-- WEIGHT, MALE VS FEMALE/GIVER VS GETTER (penis)
--  interaction.AutoPenisWeight = weight (0-1)
-------------------------------------------------------------------------------------------------

-- Sex Tweens
-- Active tweens list (for update loop)
local actActiveTweens = {}
-- Fast lookup map: act -> param -> tween
local actActiveTweenMap = {}

-- AutoSexParams
local ActAutoSexTimers = ActAutoSexTimers or {}
local ActAutoSexTickTime = 0.25 -- seconds (game timer frequency)
local ActAutoSexTimerClamp = { Min = 1, Max = 20 } -- seconds (timer to allow new random sex parameter)
-- TweenParams
local ActTweenTimeMinMax = { Min = 0.1, Max = 3 } -- seconds (time for parameter tween duration)

-------------------------------------------------------------------------------------------------

-- BODY HOLE ENUM
ActBody = {
	PenisHand = "PenisHand",
	PenisHole = "PenisHole",
	Mouth = "Mouth",
	Anus = "Anus",
	Vagina = "Vagina",
}

-- INTERACTION PARAMETER ENUM
ActValue = {
	Active = "Active",
	Speed = "Speed",
	Weight = "Weight", -- no hand weight
	Thrust = "Thrust",
	DepthStart = "DepthStart",
	DepthEnd = "DepthEnd",
}

-------------------------------------------------------------------------------------------------

-- GAME PARAMETER NAME ENUM - Act (interaction) Parameters (actual names of values in interaction)
ActParam = {
	ActivePenis = "AutoActive",
	ActiveHand = "m_autoHandActive",
	SpeedPenis = "m_autoSpeed",
	SpeedHand = "m_autoHandSpeed",
	ThrustPenis = "m_autoThrustWeight",
	ThrustHand = "m_autoHandThrustWeight",
	WeightPenis = "AutoPenisWeight", -- no hand weight
	DepthStartPenis = "m_autoStartDepth",
	DepthStartHand = "m_autoHandStartDepth",
	DepthEndPenis = "m_autoEndDepth",
	DepthEndHand = "m_autoHandEndDepth",
}

-- GAME PARAMETER VALUE LIMITS (values as they are in TrueFacials)
ActValueMinMax_Raw = {
	[ActValue.Speed] = { Min = 0.001, Max = 2 },
	[ActValue.Weight] = { Min = 0, Max = 1 },
	[ActValue.Thrust] = { Min = 1, Max = 3 }, -- raw thrust values
	[ActValue.DepthStart] = { Min = 0, Max = 1.2 },
	[ActValue.DepthEnd] = { Min = 0.1, Max = 1.3 }
}

-- TRUEMOAN PARAMETER VALUE LIMITS (values with thrust normalized)
ActValueMinMax = {
	[ActValue.Speed] = { Min = 0.1, Max = 1 },
	[ActValue.Weight] = { Min = 0, Max = 1 },
	[ActValue.Thrust] = { Min = 0, Max = 0.6 },
	[ActValue.DepthStart] = { Min = 0.2, Max = 0.6 },
	[ActValue.DepthEnd] = { Min = 0.5, Max = 1.1 },
}

-------------------------------------------------------------------------------------------------

-- AutoSex Tier "Enum"
AutoSexTier = {
	Idle = "Idle",
	Slow = "Slow",
	Normal = "Normal",
	Fast = "Fast",
	Faster = "Faster",
	Climax = "Climax",
	Orgasm = "Orgasm",
}

-- Default tier set for new humans
AutoSexTier_Default = AutoSexTier.Normal
AutoSexTier_Min = AutoSexTier.Idle
AutoSexTier_Toggle = {
	AutoSexTier.Idle,
	AutoSexTier.Slow,
	AutoSexTier.Normal,
	AutoSexTier.Fast,
	AutoSexTier.Faster,
	AutoSexTier.Climax,
	AutoSexTier.Orgasm,
}


-- AUTOSEX PARAMETER VALUE LIMITS (values with thrust normalized (0-1), delta = movement range)
-- When user modifies the speed, value it will jump up or down the tier
-- These values are used in AutoSex Tiers when user changes the sex speed
AutoSexTierConfig_Idle = {
	[ActValue.Speed] =			{ Min = 0.001,	Max = 0.2,	Delta = 0.03 },
	[ActValue.Weight] =			{ Min = 0.05,	Max = 0.95,	Delta = 0.04 },
	[ActValue.Thrust] =			{ Min = 0.1,	Max = 0.8,	Delta = 0.06 }, -- normalized thrust values
	[ActValue.DepthStart] = 	{ Min = 0.1,	Max = 0.5,	Delta = 0.1 },
	[ActValue.DepthEnd] = { Min = 0.6, Max = 1.2, Delta = 0.1 },
}

AutoSexTierConfig_Slow = {
	[ActValue.Speed] =			{ Min = 0.05,	Max = 0.35,	Delta = 0.05 },
	[ActValue.Weight] =			{ Min = 0.05,	Max = 0.95,	Delta = 0.04 },
	[ActValue.Thrust] =			{ Min = 0.1,	Max = 0.8,	Delta = 0.06 }, -- normalized thrust values
	[ActValue.DepthStart] = 	{ Min = 0.1,	Max = 0.5,	Delta = 0.1 },
	[ActValue.DepthEnd] = { Min = 0.6, Max = 1.2, Delta = 0.1 },
}

AutoSexTierConfig_Normal = {
	[ActValue.Speed] =			{ Min = 0.2,	Max = 0.6,	Delta = 0.07 },
	[ActValue.Weight] =			{ Min = 0.05,	Max = 0.95,	Delta = 0.04 },
	[ActValue.Thrust] =			{ Min = 0.1,	Max = 0.8,	Delta = 0.06 }, -- normalized thrust values
	[ActValue.DepthStart] = 	{ Min = 0.1,	Max = 0.5,	Delta = 0.1 },
	[ActValue.DepthEnd] = { Min = 0.6, Max = 1.2, Delta = 0.1 },
}

AutoSexTierConfig_Fast = {
	[ActValue.Speed] =			{ Min = 0.4,	Max = 0.9,	Delta = 0.08 },
	[ActValue.Weight] =			{ Min = 0.05,	Max = 0.95,	Delta = 0.05 },
	[ActValue.Thrust] =			{ Min = 0.01,	Max = 0.4,	Delta = 0.1 }, -- normalized thrust values
	[ActValue.DepthStart] =		{ Min = 0.1,	Max = 0.5,	Delta = 0.1 },
	[ActValue.DepthEnd] =		{ Min = 0.6,	Max = 1.2,	Delta = 0.1 },
}

AutoSexTierConfig_Faster = {
	[ActValue.Speed] =			{ Min = 0.5,	Max = 1.5,	Delta = 0.12 },
	[ActValue.Weight] =			{ Min = 0.05,	Max = 0.95,	Delta = 0.05 },
	[ActValue.Thrust] =			{ Min = 0.01,	Max = 0.4,	Delta = 0.1 }, -- normalized thrust values
	[ActValue.DepthStart] =		{ Min = 0.1,	Max = 0.5,	Delta = 0.1 },
	[ActValue.DepthEnd] =		{ Min = 0.6,	Max = 1.2,	Delta = 0.1 },
}

AutoSexTierConfig_Climax = {
	[ActValue.Speed] =			{ Min = 0.7,	Max = 1.7,	Delta = 0.15 },
	[ActValue.Weight] =			{ Min = 0.05,	Max = 0.95,	Delta = 0.05 },
	[ActValue.Thrust] =			{ Min = 0.01,	Max = 0.4,	Delta = 0.1 }, -- normalized thrust values
	[ActValue.DepthStart] =		{ Min = 0.1,	Max = 0.5,	Delta = 0.1 },
	[ActValue.DepthEnd] =		{ Min = 0.6,	Max = 1.2,	Delta = 0.1 },
}

AutoSexTierConfig_Orgasm = {
	[ActValue.Speed] =			{ Min = 1,		Max = 2,	Delta = 0.2 },
	[ActValue.Weight] =			{ Min = 0.05,	Max = 0.95,	Delta = 0.05 },
	[ActValue.Thrust] =			{ Min = 0.01,	Max = 0.4,	Delta = 0.1 }, -- normalized thrust values
	[ActValue.DepthStart] =		{ Min = 0.6,	Max = 0.8,	Delta = 0.1 },
	[ActValue.DepthEnd] =		{ Min = 0.9,	Max = 1.2,	Delta = 0.1 },
}

-- Tier switch speed limits and random definitions
AutoSexTierRandom_Default = AutoSexTierConfig_Normal

-- Collection of all the tier parameters, their tier speed and parameter value limits
AutoSexTierConfig = {
	[AutoSexTier.Idle] =	{ Min = 0,		Max = 0.1,	Random = AutoSexTierConfig_Idle },
	[AutoSexTier.Slow] =	{ Min = 0.1,	Max = 0.25,	Random = AutoSexTierConfig_Slow },
	[AutoSexTier.Normal] =	{ Min = 0.25,	Max = 0.5,	Random = AutoSexTierConfig_Normal },
	[AutoSexTier.Fast] =	{ Min = 0.5,	Max = 0.75,	Random = AutoSexTierConfig_Fast },
	[AutoSexTier.Faster] =	{ Min = 0.75,	Max = 1,	Random = AutoSexTierConfig_Faster },
	[AutoSexTier.Climax] =	{ Min = 1,		Max = 1.5,	Random = AutoSexTierConfig_Climax },
	[AutoSexTier.Orgasm] =	{ Min = 1.5,	Max = 2,	Random = AutoSexTierConfig_Orgasm },
}

-------------------------------------------------------------------------------------------------
-- CONFIG VALUES CLAMPING
-------------------------------------------------------------------------------------------------
function SexTweenAllow() return TM_TweenSex and SexTweenTime() > 0 end
function SexTweenTime() return ClampValue(TM_TweenTime, ActTweenTimeMinMax.Min , ActTweenTimeMinMax.Max) end
function AutoSexMinTime() return ClampValue(TM_AutoSexTimeMin, ActAutoSexTimerClamp.Min , ActAutoSexTimerClamp.Max) end
function AutoSexMaxTime() return ClampValue(TM_AutoSexTimeMax, ActAutoSexTimerClamp.Min , ActAutoSexTimerClamp.Max) end
function AutoSexDrift(actValue)
	if actValue == ActValue.Speed then return Clamp01(TM_AutoSexSpeedDrift)
	elseif actValue == ActValue.Thrust then return Clamp01(TM_AutoSexThrustDrift)
	elseif actValue == ActValue.Weight then return Clamp01(TM_AutoSexWeightDrift)
	elseif actValue == ActValue.DepthStart then return Clamp01(TM_AutoSexDepthStartDrift)
	elseif actValue == ActValue.DepthEnd then return Clamp01(TM_AutoSexDepthEndDrift)
	else return 0 end
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- BODY / SEX / INTERACTION
--===============================================================================================
-------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------
-- SEX / BODY HOLES / SEXPARTNER (fucker)
-------------------------------------------------------------------------------------------------
function HasSexPartner_Any(human) return
	HasSexPartner(human, ActBody.PenisHand) or HasSexPartner(human, ActBody.PenisHole) or 
	HasSexPartner(human, ActBody.Mouth) or HasSexPartner(human, ActBody.Anus) or HasSexPartner(human, ActBody.Vagina) end
function HasSexPartner_HoleAny(human) return
	HasSexPartner(human, ActBody.Mouth) or HasSexPartner(human, ActBody.Anus) or HasSexPartner(human, ActBody.Vagina) end
function HasSexPartner_PenisHand(human) return
	HasSexPartner(human, ActBody.PenisHand) end
function HasSexPartner_PenisHole(human) return
	HasSexPartner(human, ActBody.PenisHole) end
function HasSexPartner(human, body)
	if human == nil then return false end
	if body == ActBody.PenisHand and human.Penis.m_holdDepth ~= 0 then return true
	elseif body == ActBody.PenisHole and human.Penis.Hole ~= nil then return true
	elseif body == ActBody.Mouth and human.Mouth.Fucker ~= nil then return true
	elseif body == ActBody.Anus and human.Anus.Fucker ~= nil then return true
	elseif body == ActBody.Vagina and human.Vagina.Fucker ~= nil then return true
	else return false end
end

function SexPartner_Get(human, body)
	if human == nil then return nil end
	if body == ActBody.Mouth and human.Mouth.Fucker ~= nil then return human.Mouth.Fucker
	elseif body == ActBody.Anus and human.Anus.Fucker ~= nil then return human.Anus.Fucker
	elseif body == ActBody.Vagina and human.Vagina.Fucker ~= nil then return human.Vagina.Fucker
	else return nil end
end

function SexPartners_Get(human)
	local partners = {}
	if human == nil then return partners end
	for _, body in pairs(ActBody) do
		if HasSexPartner(human, body) then
			local partner = SexPartner_Get(human, body)
			if partner ~= nil then table.insert(partners, partner) end
		end
	end return partners
end

-------------------------------------------------------------------------------------------------
function IsSexActive_Any(human) return
	IsSexActive(human, ActBody.PenisHand) or IsSexActive(human, ActBody.PenisHole) or 
	IsSexActive(human, ActBody.Mouth) or IsSexActive(human, ActBody.Anus) or IsSexActive(human, ActBody.Vagina) end
function IsSexActive_HoleAny(human) return
	IsSexActive(human, ActBody.Mouth) or IsSexActive(human, ActBody.Anus) or IsSexActive(human, ActBody.Vagina) end
function IsSexActive_PenisHand(human) return
	IsSexActive(human, ActBody.PenisHand) end
function IsSexActive_PenisHole(human) return
	IsSexActive(human, ActBody.PenisHole) end

function IsSexActive(human, body)
	if human == nil or not HasSexPartner(human, body) or ActGet(human, body) == nil then return false end
	if body == ActBody.PenisHand and human.Penis.Interaction.m_autoHandActive == true then return true
	elseif body == ActBody.PenisHole and human.Penis.Interaction.AutoActive == true then return true
	elseif body == ActBody.Mouth and human.Mouth.Fucker.Penis.Interaction.AutoActive == true then return true
	elseif body == ActBody.Anus and human.Anus.Fucker.Penis.Interaction.AutoActive == true then return true
	elseif body == ActBody.Vagina and human.Vagina.Fucker.Penis.Interaction.AutoActive == true then return true
	else return false end
end

function IsAutoSexPartner(human, body)
	if human == nil or not HasSexPartner(human, body) then return false end
	if body == ActBody.Mouth and HasAutoSexAnim(human.Mouth.Fucker) then return true
	elseif body == ActBody.Anus and HasAutoSexAnim(human.Anus.Fucker) then return true
	elseif body == ActBody.Vagina and HasAutoSexAnim(human.Vagina.Fucker) then return true
	else return false end
end

-------------------------------------------------------------------------------------------------
-- WETNESS
-------------------------------------------------------------------------------------------------
function IsWet(human) return IsWetBody(human, ActBody.Mouth) or IsWetBody(human, ActBody.Anus) or IsWetBody(human, ActBody.Vagina) end

function IsWetBody(human, body)
	if body == ActBody.Mouth and human.m_mouth.m_wetness > 0 then return true
	elseif body == ActBody.Anus and human.m_anus.m_wetness > 0 then return true
	elseif body == ActBody.Vagina and human.m_vagina.m_wetness > 0 then return true
	else return false end
end

function WetGet(human, body)
	if body == ActBody.Mouth then return human.m_mouth.m_wetness
	elseif body == ActBody.Anus then return human.m_anus.m_wetness
	elseif body == ActBody.Vagina then return human.m_vagina.m_wetness
	else return 0 end
end

function WetSet(girl, value, actBody)
	if girl == nil or value == nil  or actBody == nil or girl.m_isMale == true then return end
	if actBody == ActBody.Mouth then girl.m_mouth.m_wetness = value
	elseif actBody == ActBody.Anus then girl.m_anus.m_wetness = value
	elseif actBody == ActBody.Vagina then girl.m_vagina.m_wetness = value end
end

function WetAllReset(girl)
	WetSet(girl, 0, ActBody.Vagina)
	WetSet(girl, 0, ActBody.Anus)
	WetSet(girl, 0, ActBody.Mouth)
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- AUTO SEX
--===============================================================================================
-------------------------------------------------------------------------------------------------

function HasAutoSex(human)
	local stats = TMHStatsGet(human)
	return stats and stats.AutoSex
end

function AutoSexActive(human, active)
	if not TM_AutoSex or not human then return end
	local stats = TMHStatsGet(human)
	stats:AutoSexSet(active)
	AutoSexAnim_Handle(human)
end

-- just one direction
function AutoSexToggle(human)
	local stats = TMHStatsGet(human)
	if not stats then return end
	-- If AutoSex is OFF, turn it ON
	if not stats.AutoSex then
		stats:AutoSexSet(true)
		stats:AutoSexTierSet(AutoSexTier_Default)
		AutoSexAnim_Handle(human)
		return
	end
	-- AutoSex is ON, step down tiers
	if stats.AutoSexTier ~= AutoSexTier_Min  then stats.AutoSexTier = StepInOrderedList(AutoSexTier_Toggle, stats.AutoSexTier, -1)
	else stats:AutoSexSet(false) end
	AutoSexAnim_Handle(human)
end

-- -- pint pong (off missing)
-- local autoSexDir = {}
-- function AutoSexToggle(human)
-- 	local stats = TMHStatsGet(human)
-- 	if not stats then return end

-- 	-- init direction
-- 	if autoSexDir[human] == nil then autoSexDir[human] = -1 end

-- 	-- OFF → ON → start climbing up
-- 	if not stats.AutoSex then
-- 		stats:AutoSexSet(true)
-- 		stats:AutoSexTierSet(AutoSexTierDefault)
-- 		autoSexDir[human] = 1
-- 		AutoSexAnimHandle(human)
-- 		return
-- 	end

-- 	local dir = autoSexDir[human]
-- 	local current = stats.AutoSexTier
-- 	local nextTier = StepInOrderedList(AutoSexTierToggle, current, dir)

-- 	-- if we hit an edge, flip direction and step again
-- 	if nextTier == current then
-- 		autoSexDir[human] = -dir
-- 		dir = autoSexDir[human]
-- 		nextTier = StepInOrderedList(AutoSexTierToggle, current, dir)
-- 	end

-- 	-- if still stuck, turn OFF
-- 	if nextTier == current then stats:AutoSexSet(false)
-- 	else stats.AutoSexTier = nextTier end

-- 	AutoSexAnimHandle(human)
-- end

function AutoSexTierSet_BySpeed(human, speed)
	if not human or type(speed) ~= "number" then return end
	local stats = TMHStatsGet(human)
	if not stats then return end
	for tier, mm in pairs(AutoSexTierConfig) do
		if speed >= mm.Min and speed < mm.Max then
			stats:AutoSexTierSet(tier)
			return
		end
	end
end

-------------------------------------------------------------------------------------------------

-- Animation
function AutoSexAnim_NameGet(human) return human.calfNames end
function HasAutoSexAnim(human) return human and game.HasAnim(AutoSexAnim_NameGet(human)) end
function AutoSexAnim_Add(human)
	if HasAutoSexAnim(human) then return end
	game.AddRepeatAnim(ActAutoSexTickTime, || AutoSex_OnTick(human), AutoSexAnim_NameGet(human))
end
function AutoSexAnim_Remove(human) game.RemoveAnim(AutoSexAnim_NameGet(human)) end
function AutoSexAnim_Handle(human)
	local stats = TMHStatsGet(human)
	if not stats then return end
	if stats.AutoSex then if not HasAutoSexAnim(human) then AutoSexAnim_Add(human) end
	else if HasAutoSexAnim(human) then AutoSexAnim_Remove(human) end end
end

-------------------------------------------------------------------------------------------------

-- CALLED FROM GAME REPEATING ANIMATION SYSTEM (game.AddRepeatAnim)
-- Randomize all active interactions
function AutoSex_OnTick(human)
	if not TM_AutoSex or human == nil then return end
	local stats = TMHStatsGet(human)
	if not stats or not stats.AutoSex then return end
	local isPenisHole = IsSexActive(human, ActBody.PenisHole)
	local isPenisHand = IsSexActive(human, ActBody.PenisHand)
	local isMouth = IsSexActive(human, ActBody.Mouth)
	local isAnus = IsSexActive(human, ActBody.Anus) 
	local isVagina = IsSexActive(human, ActBody.Vagina) 
	stats:IsHavingSexSet(isPenisHole or isPenisHand or isMouth or isAnus or isVagina)

	-- Start setting all parameters that are in use
	-- Penis sets params only if hole owners don't (prevents setting params from both sides)
	if isPenisHole and not IsAutoSexPartner(human, ActBody.PenisHole) then AutoSex_OnTickParamsSet(human, ActBody.PenisHole) end
	-- Penis owner
	if isPenisHand then AutoSex_OnTickParamsSet(human, ActBody.PenisHand) end
	-- Holes
	if isMouth then AutoSex_OnTickParamsSet(human, ActBody.Mouth) end
	if isAnus then AutoSex_OnTickParamsSet(human, ActBody.Anus) end
	if isVagina then AutoSex_OnTickParamsSet(human, ActBody.Vagina) end
end

-- START INTERACTION PARAMETER SET (Calculate timer against ticker and fire events for each active interaction)
function AutoSex_OnTickParamsSet(human, body)
	if not TM_AutoSex or not human then return end
	-- Status
	local interaction = ActGet(human, body)
	if not interaction then return end
	-- Interaction
	local stats = TMHStatsGet(human)
	if not stats or not stats.AutoSex or not stats.AutoSexTier then return end
	-- Timers structure timers[interaction][actbody][param]
	-- Init interaction timers holder
	local timers = ActAutoSexTimers[interaction]
	if not timers then timers = {} ActAutoSexTimers[interaction] = timers end
	-- Init body-specific timers
	local bodyTimers = timers[body]
	if not bodyTimers then bodyTimers = {} timers[body] = bodyTimers end
	-- Iterate through all timers, execute ones that have timeouted
	for actValue, paramSetFunc in pairs(ActParamFunctionsSet) do
		-- If AutoSex drift is 0, don't animate parameters
		if AutoSexDrift(actValue) > 0 then
			-- Init or subtract interaction timer (for all parameters)
			bodyTimers[actValue] = (bodyTimers[actValue] or 0) - ActAutoSexTickTime
			if bodyTimers[actValue] <= 0 then
				local tierConfig = AutoSexTier_ConfigGet(stats.AutoSexTier)[actValue]
				if tierConfig then
					local isHand = body == ActBody.PenisHand
					local value = AutoSexValueGen_Random(interaction, actValue, isHand, tierConfig )
					-- START RANDOM TWEEN/RAW INTERACTION PARAMETER VALUE (ActAutoSexParams: Speed, Thrust, DepthStart, DepthEnd, Weight)
					-- If SexTweenAllow() is allowed, this is where the tween starts. If not, raw value is changed directly in the game body property
					if value ~= nil then paramSetFunc(interaction, value, isHand) end
				end
				bodyTimers[actValue] = GetRandom(AutoSexMinTime(), AutoSexMaxTime())
			end
		end
	end
end

-------------------------------------------------------------------------------------------------
-- AUTOSEX RANDOM VALUES (MIN MAX DELTA)
-------------------------------------------------------------------------------------------------
function AutoSexTier_ConfigGet(autoSexTier)
	local tier = AutoSexTierConfig[autoSexTier]
	local values = tier and tier.Random
	return values or AutoSexTierRandom_Default
end

function AutoSexValueGen_Random(interaction, actValue, isHand, tierconfig)
	if not interaction or not tierconfig then return nil end
	local drift = AutoSexDrift(actValue)
	if drift <= 0 then return nil end
	-- GET A RANDOM VALUE, SPECIFIC FUNCTION TYPES
	-- 1. Fixed delta + truncated range - Uniform, unbiased, no edge sticking, no loop (best overall)
	return GetRandomFloatNear_FixedDeltaTruncated(ActValueGet(interaction, actValue, isHand), drift, tierconfig.Min, tierconfig.Max, tierconfig.Delta)
	-- -- 2. Value-dependent delta + truncated range - No boundary bias, safe, but movement slows near zero
	-- return value = GetRandomFloatNear_ValueDeltaTruncated(ActValueGet_Current(interaction, actValue, isHand), drift, tierconfig.Min, tierconfig.Max, tierconfig.Delta)
	-- -- 3. Value-dependent delta + reflect - Fast, but biased and lingers near bounds
	-- return value = GetRandomFloatNear_ReflectValueDelta(ActValueGet_Current(interaction, actValue, isHand), drift, tierconfig.Min, tierconfig.Max, tierconfig.Delta)
	-- -- 4. Value-dependent delta + clamp - Very fast, but strong boundary bias and hard sticking
	-- return value = GetRandomFloatAroundClamped(ActValueGet_Current(interaction, actValue, isHand), drift, tierconfig.Min, tierconfig.Max, tierconfig.Delta)
end

-------------------------------------------------------------------------------------------------
--===============================================================================================
-- INTERACTION
--===============================================================================================
-------------------------------------------------------------------------------------------------

-- Get interaction from human and body part
function ActGet(human, body)
	if not HasSexPartner(human, body) then return nil end
	if body == ActBody.PenisHand then return human.Penis.Interaction
	elseif body == ActBody.PenisHole then return human.Penis.Interaction
	elseif body == ActBody.Mouth then return human.Mouth.Fucker.Penis.Interaction
	elseif body == ActBody.Anus then return human.Anus.Fucker.Penis.Interaction
	elseif body == ActBody.Vagina then return human.Vagina.Fucker.Penis.Interaction
	else return nil end
end

-------------------------------------------------------------------------------------------------
-- (NORMALIZED) INTERACTION PARAMETER VALUE (Speed, Thrust, DepthStart, DepthEnd, Weight)
-------------------------------------------------------------------------------------------------

-- PARAMETER VALUES
function ActValueGet(interaction, actValue, isHand)
	if not interaction or not actValue then return 0 end
	if actValue == ActValue.Active then return ActActiveGet(interaction, actValue, isHand) and 1 or 0 -- unify bool returns as rest
	elseif actValue == ActValue.Speed then return ActSpeedGet(interaction, isHand)
	elseif actValue == ActValue.Weight then return ActWeightGet(interaction, isHand)
	elseif actValue == ActValue.Thrust then return ActThrustGet(interaction, isHand)
	elseif actValue == ActValue.DepthStart then return ActDepthGet(interaction, isHand, true)
	elseif actValue == ActValue.DepthEnd then return ActDepthGet(interaction, isHand, false) end
	return 0
end

function ActValueGet_ByBody(human, actBody, actValue)
	local isHand = actBody == ActBody.PenisHand
	if actValue == ActValue.Active then return ActActiveGet(ActGet(human, actBody), isHand) and 1 or 0 -- unify bool returns as rest
	elseif actValue == ActValue.Speed then return ActSpeedGet(ActGet(human, actBody), isHand)
	elseif actValue == ActValue.Thrust then return ActThrustGet(ActGet(human, actBody), isHand)
	elseif actValue == ActValue.Weight then return ActWeightGet(ActGet(human, actBody), isHand)
	elseif actValue == ActValue.DepthStart then return ActDepthGet(ActGet(human, actBody), isHand, true)
	elseif actValue == ActValue.DepthEnd then return ActDepthGet(ActGet(human, actBody), isHand, false) end
end

-- RANDOM QUICK PARAMETER VALUE (new generated value, used in menu, "quick wide random" for responsive "FeelingLucky")
function ActValueGen_Random(actValue)
	local r = ActValueMinMax[actValue] return r and GetRandomFloat(r.Min, r.Max) or 0
end

-------------------------------------------------------------------------------------------------
-- (RAW) INTERACTION PARAMETER VALUE (Speed, Thrust, DepthStart, DepthEnd, Weight)
-------------------------------------------------------------------------------------------------
-- MAIN RAW PARAMETER VALUE (from interaction or tween target (where it's ending up afer tween))
function ActValueGet_RawOrTween(act, param)
	local actTweenMap = actActiveTweenMap[act]
	if actTweenMap then
		local t = actTweenMap[param]
		-- A) Return tween target value (where the value will be when tween ends)
		if t then return t.targetVal end
	end
	-- B) No tween found, return the interaction value
	return act[param]
end

-- RAW PARAMETER VALUE CLAMP (Clamp to actual game value, might be tweened, tween target is "new value" tween is going to)
function ActValueClamp_Raw(value, actValue)
	local mm = ActValueMinMax_Raw[actValue]
	return mm and ClampValue(value, mm.Min, mm.Max) or value
end

-------------------------------------------------------------------------------------------------
-- RAW PARAMETER VALUE (possibly being tweened)

-- Set Interaction value directly to character
function ActValueSet_Raw(act, actValue, isHand, value) act[ActValueParamNameGet(actValue, isHand)] = value end

-- Get Interaction value from interaction (if object is tweening will get value "on the way to the target")
function ActValueGet_Raw(act, actValue, isHand)
	local function GetActParamValue(act, param) return act[param] end
	if actValue == ActValue.Active then return GetActParamValue(act, ActValueParamNameGet(ActValue.Active, isHand))
	elseif actValue == ActValue.Speed then return GetActParamValue(act, ActValueParamNameGet(ActValue.Speed, isHand))
	elseif actValue == ActValue.Thrust then return GetActParamValue(act, ActValueParamNameGet(ActValue.Thrust, isHand))
	elseif actValue == ActValue.DepthStart then return GetActParamValue(act, ActValueParamNameGet(ActValue.DepthStart, isHand))
	elseif actValue == ActValue.DepthEnd then return GetActParamValue(act, ActValueParamNameGet(ActValue.DepthEnd, isHand))
	elseif actValue == ActValue.Weight then return GetActParamValue(act, ActParam.WeightPenis)
	else return nil end
end

-- Get Interaction parameter
function ActValueParamNameGet(actValue, isHand)
	if actValue == ActValue.Active then return isHand and ActParam.ActiveHand or ActParam.ActivePenis
	elseif actValue == ActValue.Speed then return isHand and ActParam.SpeedHand or ActParam.SpeedPenis
	elseif actValue == ActValue.Thrust then return isHand and ActParam.ThrustHand or ActParam.ThrustPenis
	elseif actValue == ActValue.DepthStart then return isHand and ActParam.DepthStartHand or ActParam.DepthStartPenis
	elseif actValue == ActValue.DepthEnd then return isHand and ActParam.DepthEndHand or ActParam.DepthEndPenis
	elseif actValue == ActValue.Weight then return ActParam.WeightPenis
	else return nil end
end

--===============================================================================================
-- INTERACTION PARAMS (Active, Speed, Weight, Thrust, Depth)
--===============================================================================================

-------------------------------------------------------------------------------------------------
-- INTERACTION ACTIVE
-------------------------------------------------------------------------------------------------
function ActActiveGet(interaction, actValue, isHand) return ActValueGet_RawOrTween(interaction, ActValueParamNameGet(actValue, isHand)) end
function ActActiveSet(interaction, isHand, isActive) ActValueSet_Raw(interaction, ActValue.Active, isHand, isActive) end
function ActActiveSet_Human(human, actBody, isActive) ActActiveSet(ActGet(human, actBody), actBody == ActBody.PenisHand, isActive) end
function ActActiveSetAll_Human(human, isActive)
	if IsSexActive(human, ActBody.PenisHand) then ActActiveSet(ActGet(human, ActBody.PenisHand), true, isActive) end
	if IsSexActive(human, ActBody.PenisHole) then ActActiveSet(ActGet(human, ActBody.PenisHole), false, isActive) end
	if IsSexActive(human, ActBody.Mouth) then ActActiveSet(ActGet(human, ActBody.Mouth), false, isActive) end
	if IsSexActive(human, ActBody.Vagina) then ActActiveSet(ActGet(human, ActBody.Vagina), false, isActive) end
	if IsSexActive(human, ActBody.Anus) then ActActiveSet(ActGet(human, ActBody.Anus), false, isActive) end
end

-------------------------------------------------------------------------------------------------
-- INTERACTION SPEED (PENIS/HAND) (0.001 - 2), UI ALLOWS ONLY (0.001 - 0.5)
-------------------------------------------------------------------------------------------------
-- GET
function ActSpeedGet_Raw(interaction, isHand) return ActValueGet_Raw(interaction, ActValue.Speed, isHand) end
function ActSpeedGet(interaction, isHand) return ActValueGet_RawOrTween(interaction, ActValueParamNameGet(ActValue.Speed, isHand)) end

-- RANDOM
function ActSpeedSet_MenuRandom(interaction, isHand) return ActSpeedSet(interaction, ActValueGen_Random(ActValue.Speed), isHand) end

-- SET
function ActSpeedSet_Step(interaction, speedStep, increase, isHand)
	local speed = ActSpeedGet(interaction, isHand) -- Use Target Value to prevent dampening
	local increment = 1 + (speedStep / (speed ^ 0.6)) -- 1 + (speed multiplier / (speed / curve))
	if increase then speed = speed * increment
	else speed = speed / increment end
	return ActSpeedSet(interaction, speed, isHand)
end

function ActSpeedSet(interaction, speed, isHand)
	local speed = ActValueClamp_Raw(speed, ActValue.Speed)
	ActActiveSet(interaction, isHand, true)
	if SexTweenAllow() then ActTweenTo(interaction, ActValueParamNameGet(ActValue.Speed, isHand), speed, SexTweenTime())
	else ActValueSet_Raw(interaction, ActValue.Speed, isHand, speed) end
	return speed
end

-------------------------------------------------------------------------------------------------
-- INTERACTION WEIGHT (PENIS) (GIVER VS GETTER) (0-1)
-------------------------------------------------------------------------------------------------

-- GET
function ActWeightGet_Raw(interaction, isHand) return ActValueGet_Raw(interaction, ActValue.Weight, isHand) end
function ActWeightGet(interaction, isHand) return isHand and 0 or ActValueGet_RawOrTween(interaction, ActParam.WeightPenis) end

-- RANDOM
function ActWeightSet_MenuRandom(interaction, isHand) return ActWeightSet(interaction, ActValueGen_Random(ActValue.Weight), isHand) end

-- SET
function ActWeightSet_Step(interaction, weightStep, increase, isHand)
	local weight = ActWeightGet(interaction, isHand) -- Use Target Value to prevent dampening
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	return ActWeightSet(interaction, weight, isHand)
end
function ActWeightSet(interaction, weight, isHand)
	if isHand then return end -- no interaction weight in handjobs
	local weight = ActValueClamp_Raw(weight, ActValue.Weight)
	ActActiveSet(interaction, false, true)
	if SexTweenAllow() then ActTweenTo(interaction, ActParam.WeightPenis, weight, SexTweenTime())
	else ActValueSet_Raw(interaction, ActValue.Weight, false, weight) end
	return weight
end

-------------------------------------------------------------------------------------------------
-- INTERACTION THRUST (PENIS/HAND) (normalized 0-1 to actual 1-3)
-------------------------------------------------------------------------------------------------
function ActThrust_Norm(weight) return NormalizeValue(weight, 1, 3) end
function ActThrust_Denorm(weight) return ActValueClamp_Raw(DenormalizeValue(Clamp01(weight), 1, 3), ActValue.Thrust) end

-- GET
function ActThrustGet_Raw(interaction, isHand) return ActThrust_Norm(ActValueGet_Raw(interaction, ActValue.Thrust, isHand)) end
function ActThrustGet(interaction, isHand) return ActThrust_Norm(ActValueGet_RawOrTween(interaction, ActValueParamNameGet(ActValue.Thrust, isHand))) end

-- RANDOM
function ActThrustSet_MenuRandom(interaction, isHand) return ActThrustSet(interaction, ActValueGen_Random(ActValue.Thrust), isHand) end

-- SET
function ActThrustSet_Step(interaction, weightStep, increase, isHand)
	local weight = ActThrustGet(interaction, isHand) -- Use Target Value to prevent dampening
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	return ActThrustSet(interaction, weight, isHand)
end
function ActThrustSet(interaction, weight, isHand)
	local weight = ActThrust_Denorm(weight)
	ActActiveSet(interaction, isHand, true)
	if SexTweenAllow() then ActTweenTo(interaction, ActValueParamNameGet(ActValue.Thrust, isHand), weight, SexTweenTime())
	else ActValueSet_Raw(interaction, ActValue.Thrust, isHand, weight) end
	return weight
end

-------------------------------------------------------------------------------------------------
-- INTERACTION THRUST DEPTH (PENIS/HAND) (0-1)
-------------------------------------------------------------------------------------------------
-- GET
function ActDepthGet_Raw(interaction, isHand, isStartDepth)
	return ActValueGet_Raw(interaction, isStartDepth and ActValue.DepthStart or ActValue.DepthEnd, isHand)
end
function ActDepthGet(interaction, isHand, isStartDepth)
	local param = ActValueParamNameGet(isStartDepth and ActValue.DepthStart or ActValue.DepthEnd, isHand)
	return ActValueGet_RawOrTween(interaction, param)
end

-- RANDOM SPLIT
function ActDepthStartSet_MenuRandom(interaction, isHand) return ActDepthSet(interaction, ActValueGen_Random(ActValue.DepthStart), isHand, true) end
function ActDepthEndSet_MenuRandom(interaction, isHand) return ActDepthSet(interaction, ActValueGen_Random(ActValue.DepthEnd), isHand, false) end

-- RANDOM TOGETHER
function ActDepthSet_MenuRandom(interaction, isHand)
	local startValue = ActDepthSet(interaction, ActValueGen_Random(ActValue.DepthStart), isHand, true)
	local endValue = ActDepthSet(interaction, ActValueGen_Random(ActValue.DepthEnd), isHand, false)
	return startValue, endValue
end

-- SET STEP
function ActDepthSet_Step(interaction, depthStep, increase, isHand, isStartDepth)
	local depth = ActDepthGet(interaction, isHand, isStartDepth) -- Use Target Value to prevent dampening
	if increase then depth = depth + depthStep
	else depth = depth - depthStep end
	return ActDepthSet(interaction, depth, isHand, isStartDepth)
end

-- SET TOGETHER
function ActDepthSet_StartEnd(interaction, depthStart, depthEnd, isHand)
	ActDepthSet(interaction, depthStart, isHand, true)
	ActDepthSet(interaction, depthEnd, isHand, false)
end

-- SET SPLIT
function ActDepthSet_Start(interaction, depth, isHand) ActDepthSet(interaction, depth, isHand, true) end
function ActDepthSet_End(interaction, depth, isHand) ActDepthSet(interaction, depth, isHand, false) end
function ActDepthSet(interaction, depth, isHand, isStartDepth)
	depth = ActValueClamp_Raw(depth, isStartDepth and ActValue.DepthStart or ActValue.DepthEnd )
	ActActiveSet(interaction, isHand, true)
	if SexTweenAllow() then
		local paramName = ActValueParamNameGet(isStartDepth and ActValue.DepthStart or ActValue.DepthEnd, isHand)
		ActTweenTo(interaction, paramName, depth, SexTweenTime())
	elseif isStartDepth then ActValueSet_Raw(interaction, ActValue.DepthStart, isHand, depth)
	else ActValueSet_Raw(interaction, ActValue.DepthEnd, isHand, depth) end
	return depth
end

-------------------------------------------------------------------------------------------------
-- Function definitions after they've been defined up there

ActParamFunctionsSet = {
	[ActValue.Speed] = ActSpeedSet,
	[ActValue.Weight] = ActWeightSet,
	[ActValue.Thrust] = ActThrustSet,
	[ActValue.DepthStart] = ActDepthSet_Start,
	[ActValue.DepthEnd] = ActDepthSet_End,
}

-------------------------------------------------------------------------------------------------
-- QUICK COMMANDS
-------------------------------------------------------------------------------------------------

function ActAll_WeightSwitch(human, isHand)
	local function DoWeightSwitch(interaction)
		if ActWeightGet(interaction, isHand) < 0.5 then ActWeightSet(interaction, 0.9, isHand)
		else ActWeightSet(interaction, 0.1, isHand) end
	end
	local act = ActGet(human, ActBody.PenisHand) if act then DoWeightSwitch(act, true) end
	act = ActGet(human, ActBody.PenisHole) if act then DoWeightSwitch(act, false) end
	act = ActGet(human, ActBody.Mouth) if act then DoWeightSwitch(act, false) end
	act = ActGet(human, ActBody.Anus) if act then DoWeightSwitch(act, false) end
	act = ActGet(human, ActBody.Vagina) if act then DoWeightSwitch(act, false) end
end

function ActDeeper(human)
	local act = ActGet(human, ActBody.PenisHand) if act then ActDepthSet_Step(act, TM_SexDeeperStep, true, false, false) end
	act = ActGet(human, ActBody.PenisHole) if act then ActDepthSet_Step(act, TM_SexDeeperStep, true, false, false) end
	act = ActGet(human, ActBody.Mouth) if act then ActDepthSet_Step(act, TM_SexDeeperStep, true, false, false) end
	act = ActGet(human, ActBody.Anus) if act then ActDepthSet_Step(act, TM_SexDeeperStep, true, false, false) end
	act = ActGet(human, ActBody.Vagina) if act then ActDepthSet_Step(act, TM_SexDeeperStep, true, false, false) end
end


-------------------------------------------------------------------------------------------------
--===============================================================================================
-- TWEENING
--===============================================================================================
-------------------------------------------------------------------------------------------------

-- Start a tween on a specific property of the interaction object
function ActTweenTo(act, param, targetValue, duration)
	if not act or not param then return end
	-- Initialize map for this interaction
	actActiveTweenMap[act] = actActiveTweenMap[act] or {}
	local actMap = actActiveTweenMap[act]
	-- Remove existing tween for this parameter
	local existing = actMap[param]
	if existing then
		for i = #actActiveTweens, 1, -1 do
			if actActiveTweens[i] == existing then
				actActiveTweens[i] = actActiveTweens[#actActiveTweens]
				actActiveTweens[#actActiveTweens] = nil
				break
			end
		end
		actMap[param] = nil
	end
	-- Duration fallback
	duration = duration or 0.5
	-- Instant set
	if duration <= 0.001 then act[param] = targetValue return
	end
	-- Create tween
	local tween = {
		object = act,
		param = param,
		startVal = act[param],
		targetVal = targetValue,
		duration = duration,
		elapsed = 0
	}
	table.insert(actActiveTweens, tween)
	actMap[param] = tween
end

-- Update all active tweens
function OnUpdate_ActTweens(deltaTime)
	if not SexTweenAllow() or #actActiveTweens == 0 then return end
	for i = #actActiveTweens, 1, -1 do
		local t = actActiveTweens[i]
		t.elapsed = t.elapsed + deltaTime
		if t.elapsed >= t.duration then
			-- finish
			t.object[t.param] = t.targetVal
			local actMap = actActiveTweenMap[t.object]
			if actMap then
				actMap[t.param] = nil
				if next(actMap) == nil then
					actActiveTweenMap[t.object] = nil
				end
			end
			-- swap-remove
			actActiveTweens[i] = actActiveTweens[#actActiveTweens]
			actActiveTweens[#actActiveTweens] = nil
		else
			local p = t.elapsed / t.duration
			-- EASING - https://easings.net
			-- local ease = p * p * (3 - 2 * p) --SmoothStep
			local ease = 1 - (1 - p) * (1 - p) --OutQuad
			t.object[t.param] = t.startVal + (t.targetVal - t.startVal) * ease
		end
	end
end