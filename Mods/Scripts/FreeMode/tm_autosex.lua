-- TrueMoan v2.1 by illa3d
-------------------------------------------------------------------------------------------------
-- AUTO SEX - AUTOMATICALLY ADJUST INTERACTION PARAMETERS DYNAMICALLY (speed, weight, thrust, depth)
-- Requires tm_act.lua, tm_human.lua
-------------------------------------------------------------------------------------------------
-- AUTOSEX: Game Timer (ActAutoSexTickTime) -> AutoSexTick -> AutoSexBodyParamSet (each full hole interaction, 5 params)
-- 		Get Random time between TM_AutoSexTimeMin and TM_AutoSexTimeMax (config)
-- 		ActAutoSexTickTime = 0.5 (subtract each tick from random time passed game time in seconds)
-- 			Start parameter change (TWEEN or raw set)
-------------------------------------------------------------------------------------------------

-- AutoSex Variabless
local ActAutoSexTimers = ActAutoSexTimers or {}
local ActAutoSexTickTime = 0.25 -- seconds (game timer frequency)

-------------------------------------------------------------------------------------------------

-- AUTOSEX TIER ENUM
AutoSexTier = {
	Idle = "Idle",
	Slow = "Slow",
	Normal = "Normal",
	Fast = "Fast",
	Faster = "Faster",
	Wild = "Wild",
	Max = "Max",
}

-- AUTOSEX TIER WHEN TOGGLING BY SPEED
AutoSexTier_Toggle = {
	AutoSexTier.Idle,
	AutoSexTier.Slow,
	AutoSexTier.Normal,
	AutoSexTier.Fast,
	AutoSexTier.Faster,
	AutoSexTier.Wild,
	AutoSexTier.Max,
}

-- Default tier set for new humans
AutoSexTier_Default = AutoSexTier.Normal

-- Minimum tier when toggling (jumps to off from it)
AutoSexTier_ToggleMin = AutoSexTier.Idle
AutoSexTier_ToggleDefault = AutoSexTier.Faster

local ActAutoSexTimerRange = { Min = 1, Max = 20 } -- seconds (timer to allow new random sex parameter)

-------------------------------------------------------------------------------------------------
-- AUTOSEX PARAMETER VALUE LIMITS (values with thrust normalized (0-1), delta = movement range)
-------------------------------------------------------------------------------------------------
-- When user modifies the speed, value it will jump up or down the tier
-- These values are used in AutoSex Tiers when user changes the sex speed
AutoSexTierConfig_Idle = {
	[ActParam.Speed] =			{ Min = 0.001,	Max = 0.1,	Delta = 0.03 },	-- 0.001 - 2
	[ActParam.Weight] =			{ Min = 0.05,	Max = 0.95,	Delta = 0.04 },	-- 0 - 1
	[ActParam.Thrust] =			{ Min = 0,		Max = 0.9,	Delta = 0.06 },	-- 0 - 1 (normalized)
	[ActParam.DepthStart] =		{ Min = 0.1,	Max = 0.5,	Delta = 0.1 },	-- (0 - 1.25)
	[ActParam.DepthEnd] =		{ Min = 0.6,	Max = 1.2,	Delta = 0.1 },	-- (0.05 - 1.3)
}

AutoSexTierConfig_Slow = {
	[ActParam.Speed] =			{ Min = 0.05,	Max = 0.35,	Delta = 0.05 },	-- 0.001 - 2
	[ActParam.Weight] =			{ Min = 0.05,	Max = 0.95,	Delta = 0.04 },	-- 0 - 1
	[ActParam.Thrust] =			{ Min = 0,		Max = 0.7,	Delta = 0.06 },	-- 0 - 1 (normalized)
	[ActParam.DepthStart] =		{ Min = 0.1,	Max = 0.5,	Delta = 0.1 },	-- (0 - 1.25)
	[ActParam.DepthEnd] =		{ Min = 0.6,	Max = 1.1, Delta = 0.1 },	-- (0.05 - 1.3)
}

AutoSexTierConfig_Normal = {
	[ActParam.Speed] =			{ Min = 0.2,	Max = 0.5,	Delta = 0.07 },	-- 0.001 - 2
	[ActParam.Weight] =			{ Min = 0.05,	Max = 0.95,	Delta = 0.04 },	-- 0 - 1
	[ActParam.Thrust] =			{ Min = 0,		Max = 0.5,	Delta = 0.06 },	-- 0 - 1 (normalized)
	[ActParam.DepthStart] = 	{ Min = 0.1,	Max = 0.5,	Delta = 0.1 },	-- (0 - 1.25)
	[ActParam.DepthEnd] =		{ Min = 0.6,	Max = 1.1,	Delta = 0.1 },	-- (0.05 - 1.3)
}

AutoSexTierConfig_Fast = {
	[ActParam.Speed] =			{ Min = 0.4,	Max = 0.9,	Delta = 0.08 },	-- 0.001 - 2
	[ActParam.Weight] =			{ Min = 0.05,	Max = 0.95,	Delta = 0.05 },	-- 0 - 1
	[ActParam.Thrust] =			{ Min = 0,		Max = 0.5,	Delta = 0.1 },	-- 0 - 1 (normalized)
	[ActParam.DepthStart] =		{ Min = 0.1,	Max = 0.5,	Delta = 0.1 },	-- (0 - 1.25)
	[ActParam.DepthEnd] =		{ Min = 0.6,	Max = 1.1,	Delta = 0.1 },	-- (0.05 - 1.3)
}

AutoSexTierConfig_Faster = {
	[ActParam.Speed] =			{ Min = 0.5,	Max = 1.5,	Delta = 0.12 },	-- 0.001 - 2
	[ActParam.Weight] =			{ Min = 0.05,	Max = 0.95,	Delta = 0.05 },	-- 0 - 1
	[ActParam.Thrust] =			{ Min = 0,		Max = 0.3,	Delta = 0.1 },	-- normalized
	[ActParam.DepthStart] =		{ Min = 0.1,	Max = 0.7,	Delta = 0.1 },	-- (0 - 1.25)
	[ActParam.DepthEnd] =		{ Min = 0.7,	Max = 1.1,	Delta = 0.1 },	-- (0.05 - 1.3)
}

AutoSexTierConfig_Wild = {
	[ActParam.Speed] =			{ Min = 0.7,	Max = 1.7,	Delta = 0.15 },	-- 0.001 - 2
	[ActParam.Weight] =			{ Min = 0.05,	Max = 0.95,	Delta = 0.05 },	-- 0 - 1
	[ActParam.Thrust] =			{ Min = 0,		Max = 0.2,	Delta = 0.1 },	-- 0 - 1 (normalized)
	[ActParam.DepthStart] =		{ Min = 0.1,	Max = 0.6,	Delta = 0.1 },	-- (0 - 1.25)
	[ActParam.DepthEnd] =		{ Min = 0.8,	Max = 1.1,	Delta = 0.1 },	-- (0.05 - 1.3)
}

AutoSexTierConfig_Climax = {
	[ActParam.Speed] =			{ Min = 1,		Max = 2,	Delta = 0.2 },	-- 0.001 - 2
	[ActParam.Weight] =			{ Min = 0.05,	Max = 0.95,	Delta = 0.05 },	-- 0 - 1
	[ActParam.Thrust] =			{ Min = 0,		Max = 0.2,	Delta = 0.1 },	-- 0 - 1 (normalized)
	[ActParam.DepthStart] =		{ Min = 0.3,	Max = 0.7,	Delta = 0.1 },	-- (0 - 1.25)
	[ActParam.DepthEnd] =		{ Min = 0.9,	Max = 1.1,	Delta = 0.1 },	-- (0.05 - 1.3)
}

-- Tier switch speed limits and random definitions
AutoSexTierRandom_Default = AutoSexTierConfig_Normal

-- Collection of all the tier parameters, their tier speed and parameter value limits
AutoSexTierConfig = {
	[AutoSexTier.Idle] =	{ Min = 0,		Mid = 0.1,	Max = 0.2,	Arousal = 0.1,	Random = AutoSexTierConfig_Idle },
	[AutoSexTier.Slow] =	{ Min = 0.3,	Mid = 0.5,	Max = 0.6,	Arousal = 0.5,	Random = AutoSexTierConfig_Slow },
	[AutoSexTier.Normal] =	{ Min = 0.6,	Mid = 0.7,	Max = 0.8,	Arousal = 1,	Random = AutoSexTierConfig_Normal },
	[AutoSexTier.Fast] =	{ Min = 0.7,	Mid = 0.9,	Max = 1,	Arousal = 1.5,	Random = AutoSexTierConfig_Fast },
	[AutoSexTier.Faster] =	{ Min = 0.9,	Mid = 1.1,	Max = 1.2,	Arousal = 2,	Random = AutoSexTierConfig_Faster },
	[AutoSexTier.Wild] =	{ Min = 1,		Mid = 1.3,	Max = 1.5,	Arousal = 2.5,	Random = AutoSexTierConfig_Wild },
	[AutoSexTier.Max] =		{ Min = 1.4,	Mid = 1.9,	Max = 2,	Arousal = 3.0,	Random = AutoSexTierConfig_Climax },
}

-------------------------------------------------------------------------------------------------
-- CONFIG VALUES CLAMPING
-------------------------------------------------------------------------------------------------

function AutoSexMinTime() return ClampValue(TM_AutoSexTimeMin, ActAutoSexTimerRange.Min , ActAutoSexTimerRange.Max) end
function AutoSexMaxTime() return ClampValue(TM_AutoSexTimeMax, ActAutoSexTimerRange.Min , ActAutoSexTimerRange.Max) end
function AutoSexDrift(actParam)
	if actParam == ActParam.Speed then return Clamp01(TM_AutoSexSpeedDrift)
	elseif actParam == ActParam.Thrust then return Clamp01(TM_AutoSexThrustDrift)
	elseif actParam == ActParam.Weight then return Clamp01(TM_AutoSexWeightDrift)
	elseif actParam == ActParam.DepthStart then return Clamp01(TM_AutoSexDepthStartDrift)
	elseif actParam == ActParam.DepthEnd then return Clamp01(TM_AutoSexDepthEndDrift)
	else return 0 end
end

-------------------------------------------------------------------------------------------------
-- AUTOSEX
-------------------------------------------------------------------------------------------------

function HasAutoSex(human)
	local stats = TMHStatsGet(human)
	return stats and stats.AutoSex
end

function AutoSexActive(human, active, excludeMales)
	if not TM_AutoSex or not human then return end
	if human.m_isMale == true and excludeMales == true then return end
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
		stats:AutoSexTierSet(AutoSexTier_ToggleDefault)
		AutoSexAnim_Handle(human)
		return
	end
	-- AutoSex is ON, step down tiers
	if stats.AutoSexTier ~= AutoSexTier_ToggleMin  then stats.AutoSexTier = ListItemStep(AutoSexTier_Toggle, stats.AutoSexTier, -1)
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
	if not stats or stats.Climax then return end
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

function HasAutoSexMaleOverride(human, body)
	if human == nil or not HasSexPartner(human, body) then return false end
	if body == ActBody.PenisHand then return false -- don't know path: penis -> hand? -> human?
	elseif body == ActBody.PenisHole then return false -- ton't know path: penis -> hole -> human?
	elseif body == ActBody.Mouth and HasAutoSexAnim(human.Mouth.Fucker) then return true
	elseif body == ActBody.Anus and HasAutoSexAnim(human.Anus.Fucker) then return true
	elseif body == ActBody.Vagina and HasAutoSexAnim(human.Vagina.Fucker) then return true
	else return false end
end

-------------------------------------------------------------------------------------------------

-- RANDOMIZE ALL INTERACTION PARAMETERS (Called from game repeating animation system - game.AddRepeatAnim)
function AutoSex_OnTick(human)
	if not TM_AutoSex or human == nil then return end
	local stats = TMHStatsGet(human)
	if not stats or not stats.AutoSex then return end
	-- Start setting all parameters that are in use
	if stats.PenisHole then AutoSex_OnTickParamsSet(human, ActBody.PenisHole) end
	if stats.PenisHand then AutoSex_OnTickParamsSet(human, ActBody.PenisHand) end
	-- Holes (set params only if male doesn't override)
	if stats.Mouth and not HasAutoSexMaleOverride(human, ActBody.Mouth) then AutoSex_OnTickParamsSet(human, ActBody.Mouth) end
	if stats.Anus and not HasAutoSexMaleOverride(human, ActBody.Anus) then AutoSex_OnTickParamsSet(human, ActBody.Anus) end
	if stats.Vagina and not HasAutoSexMaleOverride(human, ActBody.Vagina) then AutoSex_OnTickParamsSet(human, ActBody.Vagina) end
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
	for actParam, paramSetFunc in pairs(ActParamFunctionSet) do
		-- If AutoSex drift is 0, don't animate parameters
		if AutoSexDrift(actParam) > 0 then
			-- Init or subtract interaction timer (for all parameters)
			bodyTimers[actParam] = (bodyTimers[actParam] or 0) - ActAutoSexTickTime
			if bodyTimers[actParam] <= 0 then
				local tierConfig = AutoSexTier_ConfigGet(stats.AutoSexTier)[actParam]
				if tierConfig then
					local isHand = body == ActBody.PenisHand
					local value = AutoSexValueGen_Random(interaction, actParam, isHand, tierConfig )
					-- START RANDOM TWEEN/RAW INTERACTION PARAMETER VALUE (ActAutoSexParams: Speed, Thrust, DepthStart, DepthEnd, Weight)
					-- If SexTweenAllow() is allowed, this is where the tween starts. If not, raw value is changed directly in the game body property
					if value ~= nil then paramSetFunc(interaction, value, isHand) end
				end
				bodyTimers[actParam] = GetRandom(AutoSexMinTime(), AutoSexMaxTime())
			end
		end
	end
end

function AutoSex_ResetTimers(human, actParam)
	if not human then return end
	for interaction, bodies in pairs(ActAutoSexTimers) do
		if interaction and interaction.Owner == human then
			for body, bodyTimers in pairs(bodies) do
				for actVal in pairs(bodyTimers) do
					if actVal == actParam then bodyTimers[actVal] = 0 end
				end
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

function AutoSexValueGen_Random(interaction, actParam, isHand, tierconfig)
	if not interaction or not tierconfig then return nil end
	local drift = AutoSexDrift(actParam)
	if drift <= 0 then return nil end
	-- GET A RANDOM VALUE, SPECIFIC FUNCTION TYPES
	-- 1. Fixed delta + truncated range - Uniform, unbiased, no edge sticking, no loop (best overall)
	return GetRandomFloatNear_FixedDeltaTruncated(ActValueGet(interaction, actParam, isHand), drift, tierconfig.Min, tierconfig.Max, tierconfig.Delta)
	-- -- 2. Value-dependent delta + truncated range - No boundary bias, safe, but movement slows near zero
	-- return value = GetRandomFloatNear_ValueDeltaTruncated(ActValueGet_Current(interaction, actParam, isHand), drift, tierconfig.Min, tierconfig.Max, tierconfig.Delta)
	-- -- 3. Value-dependent delta + reflect - Fast, but biased and lingers near bounds
	-- return value = GetRandomFloatNear_ReflectValueDelta(ActValueGet_Current(interaction, actParam, isHand), drift, tierconfig.Min, tierconfig.Max, tierconfig.Delta)
	-- -- 4. Value-dependent delta + clamp - Very fast, but strong boundary bias and hard sticking
	-- return value = GetRandomFloatAroundClamped(ActValueGet_Current(interaction, actParam, isHand), drift, tierconfig.Min, tierconfig.Max, tierconfig.Delta)
end