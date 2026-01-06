-- TrueMoan v1.9 by illa3d
-------------------------------------------------------------------------------------------------
-- AUTO SEX - AUTOMATICALLY ADJUST INTERACTION PARAMETERS DYNAMICALLY (speed, weight, thrust, depth)
-------------------------------------------------------------------------------------------------
-- Requires tm_human.lua TMHumanStats to work

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
	if stats.AutoSexTier ~= AutoSexTier_Min  then stats.AutoSexTier = ListItemStep(AutoSexTier_Toggle, stats.AutoSexTier, -1)
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
	-- Start setting all parameters that are in use
	-- Penis sets params only if hole owners don't (prevents setting params from both sides)
	if stats.PenisHole and not IsAutoSexPartner(human, ActBody.PenisHole) then AutoSex_OnTickParamsSet(human, ActBody.PenisHole) end
	-- Penis owner
	if stats.PenisHand then AutoSex_OnTickParamsSet(human, ActBody.PenisHand) end
	-- Holes
	if stats.Mouth then AutoSex_OnTickParamsSet(human, ActBody.Mouth) end
	if stats.Anus then AutoSex_OnTickParamsSet(human, ActBody.Anus) end
	if stats.Vagina then AutoSex_OnTickParamsSet(human, ActBody.Vagina) end
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