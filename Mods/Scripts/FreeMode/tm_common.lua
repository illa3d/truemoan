-- TrueMoan Common Scripts v1.0
-- MODS SUPPORTED: TalkMenuModManager, Nf123VoiceMod

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

function ShowUI(show)
	game.m_controlsUI.Show(show)
	return show
end

function GetRandomItem(list)
	if list == nil or #list == 0 then return end
	return list[math.random(1, #list)]
end

-------------------------------------------------------------------------------------------------
-- HUMAN FUNCTIONS
-------------------------------------------------------------------------------------------------

function HumansFreeze(frozen)
	game.m_freezeAllActors = frozen
end

function HumanClothesReplace(human, targetCharacterName)
	if human == nil or targetCharacterName == nil or type(param) ~= "string" then return end
	game.ReplaceClothing(human, targetCharacterName)
end

-- CLOTHES STUFF
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

-------------------------------------------------------------------------------------------------
-- INTERACTION
-------------------------------------------------------------------------------------------------

-- INTERACTION SPEED (0.001-20)
function GetInteractionSpeed(interaction, ishand)
	return (ishand ~= nill and ishand) and interaction.m_autoHandSpeed or interaction.m_autoSpeed
end

function SetInteractionSpeed(interaction, speed, ishand)
	speed = math.max(0.001, math.min(speed, 2)) -- clamp min max
	if ishand ~= nil and ishand then 
		interaction.m_autoHandActive = true
		interaction.m_autoHandSpeed = speed
	else
		interaction.AutoActive = true
		interaction.m_autoSpeed = speed
	end
end

function SetInteractionSpeedStep(interaction, speedStep, increase, ishand)
	local speed = (ishand ~= nill and ishand) and interaction.m_autoHandSpeed or interaction.m_autoSpeed
	local increment = 1 + (speedStep / (speed ^ 0.6)) -- 1 + (speed multiplier / (speed / curve))
	if increase then speed = speed * increment
	else speed = speed / increment end
	speed = math.max(0.001, math.min(speed, 2)) -- clamp min max
	if ishand ~= nil and ishand then 
		interaction.m_autoHandActive = true
		interaction.m_autoHandSpeed = speed
	else
		interaction.AutoActive = true
		interaction.m_autoSpeed = speed
	end
end

-- INTERACTION WEIGHT (0-1)
function GetInteractionWeight(interaction, ishand)
	return (ishand ~= nil and ishand) and 0 or interaction.AutoPenisWeight -- no interaction weight in handjobs
end

function SetInteractionWeight(interaction, weight, ishand)
	if ishand ~= nil and ishand then return end -- no interaction weight in handjobs
	weight = math.max(0, math.min(weight, 1)) -- clamp min max

	interaction.AutoActive = true
	interaction.AutoPenisWeight = weight
end

function SetInteractionWeightStep(interaction, weightStep, increase, ishand)
	if ishand ~= nil and ishand then return end -- no interaction weight in handjobs
	local weight = interaction.AutoPenisWeight
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	weight = math.max(0, math.min(weight, 1)) -- clamp min max (0-1)

	interaction.AutoActive = true
	interaction.AutoPenisWeight = weight
end

-- INTERACTION THRUST WEIGHT (normalize 0-1 to actual 1-3)
function GetInteractionThrustWeight(interaction, ishand)
	return (ishand ~= nill and ishand) and ((interaction.m_autoHandThrustWeight-1)/2) or ((interaction.m_autoThrustWeight-1)/2) -- 3(max) - 1(min) = 2
end

function SetInteractionThrustWeight(interaction, weight, ishand)
	weight = 2 * weight + 1 -- 3(max) - 1(min) = 2
	weight = math.max(1, math.min(weight, 3)) -- clamp min max (1-3) ui slider range
	if ishand ~= nil and ishand then 
		interaction.m_autoHandActive = true
		interaction.m_autoHandThrustWeight = weight
	else
		interaction.AutoActive = true
		interaction.m_autoThrustWeight = weight
	end
end

function SetInteractionThrustWeightStep(interaction, weightStep, increase, ishand)
	local weight = (ishand ~= nill and ishand) and interaction.m_autoHandThrustWeight or interaction.m_autoThrustWeight
	if increase then weight = weight + (2 * weightStep) -- 3(max) - 1(min) = 2
	else weight = weight - (2 * weightStep) end
	weight = math.max(1, math.min(weight, 3)) -- clamp min max (0-3) ui slider range
	if ishand ~= nil and ishand then 
		interaction.m_autoHandActive = true
		interaction.m_autoHandThrustWeight = weight
	else
		interaction.AutoActive = true
		interaction.m_autoThrustWeight = weight
	end
end