-- TrueMoan v2.7 by illa3d

-- execute once per load for math.random() function
math.randomseed(os.time())

-------------------------------------------------------------------------------------------------
-- SYSTEM
-------------------------------------------------------------------------------------------------

-- FLOORING
function FloorToInt(value) return math.floor(value) end

-- CLAMPING
function Clamp01(value) return math.max(0, math.min(value, 1)) end
function ClampValue(value, min, max) return math.max(min, math.min(value, max)) end

-- NORMALIZATION
function NormalizeValue(value, min, max) return (value - min) / (max - min) end
function DenormalizeValue(t, min, max) return min + t * (max - min) end

-- INCREMENTS
function IncrementStep(value, step) return value + step end
function IncrementRandom(value, min, max) return value + GetRandomFloat(min, max) end
function IncrementMultiplier(oldValue, value, mult) return oldValue + (value * mult) end
function IncrementMultiplierRandom(oldValue, value, multMin, multMax) return oldValue + (value * GetRandomFloat(multMin, multMax)) end

function Lerp(a, b, t)
	if a == nil or b == nil or t == nil then return a or b or 0 end
	return a + (b - a) * Clamp01(t)
end

-------------------------------------------------------------------------------------------------
-- LISTS
-------------------------------------------------------------------------------------------------

-- Steps forward/backward in an ordered list. dir=1 next, dir = -1 previous
function ListItemStep(list, current, dir)
	if type(list) ~= "table" or current == nil or (dir ~= 1 and dir ~= -1) then return current end
	for i = 1, #list do if list[i] == current then return list[i + dir] or current end end
	return current
end

-- Returns a random element from a list
function ListItemRandom(list)
	if list == nil or #list == 0 then return end
	return list[math.random(1, #list)]
end

-------------------------------------------------------------------------------------------------
-- TABLES
-------------------------------------------------------------------------------------------------

function TableClone(source)
	if not source then return nil end
	local clone = {} for k, v in pairs(source) do clone[k] = v end
	return clone
end

function IsTableEmpty(t)
	return t == nil or next(t) == nil
end

function TableCount(t)
	if t == nil then return 0 end
	local count = 0
	for _ in pairs(t) do
		count = count + 1
	end
	return count
end

function TableHasValue(t, value)
	if t == nil then return false end
	for _, v in pairs(t) do
		if v == value then return true end
	end
	return false
end

function TableRemoveValue(t, value)
	if t == nil then return end
	for k, v in pairs(t) do
		if v == value then
			t[k] = nil
			return
		end
	end
end

function TableItemRandom(t)
	local keys = {}
	for k in pairs(t) do keys[#keys + 1] = k end
	local randomKey = keys[math.random(#keys)]
	return t[randomKey]
end

-------------------------------------------------------------------------------------------------
-- RANDOM
-------------------------------------------------------------------------------------------------

-- Returns true/false if chance to win
function IsRandomChance(chance01) return GetRandomFloat01() < Clamp01(chance01) end

-- Returns a random integer between min and max (inclusive).
function GetRandom(min, max) return (math.random(min ,max)) end

-- Returns a random float between min and max.
function GetRandomFloat(min, max) return min + (max - min) * math.random() end

-- Returns a random float between 0 and 1.
function GetRandomFloat01() return math.random() end

-- Returns a random float within ±percent of value, clamped to [0,1].
function GetRandomFloatAround(value, percent)
	percent = Clamp01(percent)
	return GetRandomFloat(value * (1 - percent), value * (1 + percent))
end

-------------------------------------------------------------------------------------------------
-- RANGED RANDOM - Returns a random float around specific value and clamps it to min/max
-------------------------------------------------------------------------------------------------

-- 1. Fixed delta + truncated range - Uniform, unbiased, no edge sticking, no loop (best overall)
function GetRandomFloatNear_FixedDeltaTruncated(value, percent, minValue, maxValue, minDelta)
	percent = Clamp01(percent)
	minDelta = minDelta or 0
	local range = maxValue - minValue
	local delta = math.max(range * percent, minDelta)
	local low  = math.max(-delta, minValue - value)
	local high = math.min( delta, maxValue - value)
	if low > high then return ClampValue(value, minValue, maxValue) end
	return value + GetRandomFloat(low, high)
end

-- 2. Value-dependent delta + truncated range - No boundary bias, safe, but movement slows near zero
function GetRandomFloatNear_ValueDeltaTruncated(value, percent, minValue, maxValue, minDelta)
	percent = Clamp01(percent)
	minDelta = minDelta or 0
	local delta = math.max(math.abs(value) * percent, minDelta)
	local low  = math.max(-delta, minValue - value)
	local high = math.min( delta, maxValue - value)
	if low > high then return ClampValue(value, minValue, maxValue) end
	return value + GetRandomFloat(low, high)
end

-- 3. Value-dependent delta + reflect - Fast, but biased and lingers near bounds
function GetRandomFloatNear_ReflectValueDelta(value, percent, minValue, maxValue, minDelta)
	percent = Clamp01(percent)
	minDelta = minDelta or 0
	local delta = math.max(math.abs(value) * percent, minDelta)
	local result = value + GetRandomFloat(-delta, delta)
	if result < minValue then result = minValue + (minValue - result)
	elseif result > maxValue then result = maxValue - (result - maxValue) end
	return result
end

-- 4. Value-dependent delta + clamp - Very fast, but strong boundary bias and hard sticking
function GetRandomFloatAroundClamped(value, percent, minValue, maxValue)
	percent = Clamp01(percent)
	local delta = value * percent
	local result = value + GetRandomFloat(-delta, delta)
	if minValue and maxValue then result = ClampValue(result, minValue, maxValue) end
	return result
end

-------------------------------------------------------------------------------------------------
-- FORMATTING
-------------------------------------------------------------------------------------------------

-- TRUNCATE DECIMAL PLACES (for UI number display without gazillion decimals)
function FDec(value, decimals)
	if decimals == nil then return math.floor(value)
	else return math.floor(value * 10^decimals + 0.5) / 10^decimals end
end

function FBold(text) return "<b>" .. text .. "</b>" end
function FIta(text) return "<i>" .. text .. "</i>" end
function FCol(text, color) return "<color=" .. color .. ">" .. text .. "</color>" end

-------------------------------------------------------------------------------------------------
-- UI
-------------------------------------------------------------------------------------------------

function ShowUI(show)
	game.m_controlsUI.Show(show)
	return show
end