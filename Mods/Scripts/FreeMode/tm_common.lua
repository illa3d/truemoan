-- TrueMoan v1.9 by illa3d
-------------------------------------------------------------------------------------------------
-- SYSTEM
-------------------------------------------------------------------------------------------------

-- CLAMPING
function Clamp01(value) return math.max(0, math.min(value, 1)) end
function ClampValue(value, min, max) return math.max(min, math.min(value, max)) end

-- NORMALIZATION
function NormalizeValue(value, min, max) return (value - min) / (max - min) end
function DenormalizeValue(t, min, max) return min + t * (max - min) end

-- TABLES
function GetTableClone(source)
	if not source then return nil end
	local clone = {} for k, v in pairs(source) do clone[k] = v end
	return clone
end

-------------------------------------------------------------------------------------------------
-- RANDOM
-------------------------------------------------------------------------------------------------

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
-- LISTS
-------------------------------------------------------------------------------------------------

-- Steps forward/backward in an ordered list. dir=1 next, dir = -1 previous
function StepInOrderedList(list, current, dir)
	if type(list) ~= "table" or current == nil or (dir ~= 1 and dir ~= -1) then return current end
	for i = 1, #list do if list[i] == current then return list[i + dir] or current end end
	return current
end

-- Returns a random element from a list
function GetRandomItem(list)
	if list == nil or #list == 0 then return end
	return list[math.random(1, #list)]
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

-------------------------------------------------------------------------------------------------
-- HUMAN FUNCTIONS
-------------------------------------------------------------------------------------------------

function HumanRemove(human, immediate)
	if immediate then game.RemoveHuman(human)
	else HumanReset(human) Delayed(1, function () game.RemoveHuman(human) end) end
end

function HumansFreeze(frozen)
	game.m_freezeAllActors = frozen
end

-- CLOTHES STUFF
function HumanClothesRandom(human)
	if TM_Clothes_Custom == nil or #TM_Clothes_Custom == 0 then return end
	HumanClothesReplace(human, GetRandomItem(TM_Clothes_Custom))
end

function HumanClothesReplace(human, targetCharacterName)
	if human == nil or targetCharacterName == nil or type(targetCharacterName) ~= "string" then return end
	game.ReplaceClothing(human, targetCharacterName)
end

function HumanClothes(human, show)
	if show then
		human.CustomizeAll(0)
		-- no simple way of keeping futa penis
		-- dictionary of characters and their hadpenis
	else
		hadpenis = human.Penis.IsActive
		human.CustomizeAll(99)
		if hadpenis then HumanPenisSet(human, true)
		else HumanPenisSet(human, false) end
	end
	return show
end

-- PENIS/VAGINA
function HumanHasPenis(human)
	return human and human.Penis and human.Penis.IsActive
end

function HumanPenisSet(girl, show)
	if show then girl.Customize("Penis", 1)
	else girl.Customize("Penis", 0) end
end

function HumanMaleSet(male, isMale)
	male.m_isMale = isMale
end

-- CUM
function HumanCumEvery(human, sec)
	game.AddRepeatAnim(sec, || human.Shoot(), human.Penis)
	return sec
end

function HumanCumStop(human)
	game.RemoveAnim(human.Penis)
	return 0
end

function HumanIsCumming(human)
	return human and human.Penis and game.HasAnim(human.Penis)
end

-------------------------------------------------------------------------------------------------
-- HUMAN POSES
-------------------------------------------------------------------------------------------------

function HumanLookAt(human, position)
	human.Pose(Preset(EyeL(position), EyeR(position)))
end

function HumanFaceAt(human, position)
	human.Pose(Preset(HeadLookAt(position)))
end

function HumanEyesOpen(human, isopen) -- open = 0, closed = 1
	if isopen == nil then state = 0
	else state = isopen and 0 or 1 end
	human.Pose(Preset(EyelidL(state), EyelidR(state)))
	return isopen
end

function HumanReset(human, resetsex, resetanim, resetpose, resetface)
	if resetsex == nil or resetsex then
		if human.Penis ~= nil and human.Penis.Interaction ~= nil then human.Penis.Interaction.AutoActive = false end
		if human.Mouth.Fucker ~= nil and human.Mouth.Fucker.Penis ~= nil and human.Mouth.Fucker.Penis.Interaction ~= nil then human.Mouth.Fucker.Penis.Interaction.AutoActive = false end
		if human.Vagina.Fucker ~= nil and human.Vagina.Fucker.Penis ~= nil and human.Vagina.Fucker.Penis.Interaction ~= nil then human.Vagina.Fucker.Penis.Interaction.AutoActive = false end
		if human.Anus.Fucker ~= nil and human.Anus.Fucker.Penis ~= nil and human.Anus.Fucker.Penis.Interaction ~= nil then human.Anus.Fucker.Penis.Interaction.AutoActive = false end
	end
	if resetanim == nil or resetanim then
		game.RemoveAnim(human)
		game.RemoveAnim(human.chestNames)
		game.RemoveAnim(human.breastNames)
		game.RemoveAnim(human.forearmNames)
		game.RemoveAnim(human.handNames)
		game.RemoveAnim(human.m_mouth)
		game.RemoveAnim(human.headNames)
		game.RemoveAnim(human.Anus)
		game.RemoveAnim(human.footNames)
		game.RemoveAnim(human.thighNames)
	end
	if resetpose == nil or resetpose then
		human.Pose(StandUp())
	end
	if resetface == nil or resetface then
		human.Pose(FaceNeutral())
	end
end