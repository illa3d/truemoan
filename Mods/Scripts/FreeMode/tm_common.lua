-- TrueMoan v1.7 by illa3d
-------------------------------------------------------------------------------------------------
-- SYSTEM
-------------------------------------------------------------------------------------------------

-- CLAMPING
function Clamp01(value) return math.max(0, math.min(value, 1)) end
function ClampValue(value, min, max) return math.max(min, math.min(value, max)) end
-- NORMALIZATION
function NormalizeValue(value, min, max) return (value - min) / (max - min) end
function DenormalizeValue(t, min, max) return min + t * (max - min) end
-- RANDOM FUNCTIONS
function GetRandom(min, max) return (math.random(min ,max)) end
function GetRandomFloat(min, max) return min + (max - min) * math.random() end
function GetRandomFloat01() return (math.random(0,100))/100 end
function GetRandomFloatClose(value, percent)
	percent = Clamp01(percent)
	return GetRandomFloat(value * (1 - percent), value * (1 + percent))
end
function GetRandomFloatCloseMinMax(value, percent, minValue, maxValue)
	percent = Clamp01(percent)
	local delta = value * percent
	local result = value + GetRandomFloat(-delta, delta)
	if minValue and maxValue then result = ClampValue(result, minValue, maxValue) end
	return result
end
function GetRandomFloatCloseMinMaxDelta(value, percent, minValue, maxValue, minDelta)
	percent = Clamp01(percent)
	minDelta = minDelta or 0
	local delta = math.max(math.abs(value) * percent, minDelta)
	local result = value + GetRandomFloat(-delta, delta)
	if minValue ~= nil and maxValue ~= nil then
		if result < minValue then result = minValue + (minValue - result)
		elseif result > maxValue then result = maxValue - (result - maxValue) end
	end return result
end
-- LIST RANDOMIZATION
function GetRandomItem(list)
	if list == nil or #list == 0 then return end
	return list[math.random(1, #list)]
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
		if hadpenis then HumanPenis(human, true)
		else HumanPenis(human, false) end
	end
	return show
end

-- CROSS GENDER STUFF
function HumanPenis(girl, show)
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


-- WET
function HumanWetReset(girl)
	HumanWetSet(girl, 0, "Vagina")
	HumanWetSet(girl, 0, "Anus")
	HumanWetSet(girl, 0, "Mouth")
end

function HumanWetSet(girl, value, holename)
	--holeName:"Vagina" "Anus" Mouth"
	if girl == nil or value == nil or girl.m_isMale == true then return end
	if holename ~= nil and holename == "Mouth" then
		girl.m_mouth.m_wetness = value
	elseif holename ~= nil and holename == "Anus" then
		girl.m_anus.m_wetness = value
	else
		girl.m_vagina.m_wetness = value
	end
	return value
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