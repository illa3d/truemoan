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

function Clamp01(value) return math.max(0, math.min(value, 1)) end
function ClampValue(value, min, max) return math.max(min, math.min(value, max)) end

function GetRandomFloat01() return (math.random(0,100))/100 end
function GetRandom(min, max) return (math.random(min ,max)) end
function GetRandomFloat(min, max) return (math.random(min*100 ,max*100))/100 end
function GetRandomItem(list)
	if list == nil or #list == 0 then return end
	return list[math.random(1, #list)]
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

function HumanClothesRandom(human)
	if TM_Clothes_Custom == nil or #TM_Clothes_Custom == 0 then return end
	HumanClothesReplace(human, GetRandomItem(TM_Clothes_Custom))
end

function HumanClothesReplace(human, targetCharacterName)
	if human == nil or targetCharacterName == nil or type(targetCharacterName) ~= "string" then return end
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

-------------------------------------------------------------------------------------------------
-- INTERACTION
-------------------------------------------------------------------------------------------------
-- -- ENABLE
-- interaction.AutoActive = true
-- interaction.m_autoHandActive = true
-- -- SPEED
-- interaction.m_autoSpeed = speed
-- interaction.m_autoHandSpeed = speed
-- -- GIVER VS GETTER
-- interaction.AutoPenisWeight = weight
-- -- THRUST
-- interaction.m_autoThrustWeight = weight
-- interaction.m_autoHandThrustWeight = weight
-- -- DEPTH
-- interaction.m_autoStartDepth = depth
-- interaction.m_autoEndDepth = depth

function SetInteractionActive(interaction, isActive, isHand)
	if isHand then interaction.m_autoHandActive = isActive
	else interaction.AutoActive = isActive end
end

-------------------------------------------------------------------------------------------------
-- INTERACTION SPEED (0.001 - 2)
-------------------------------------------------------------------------------------------------
function ClampInteractionSpeed(value) return ClampValue(value, 0.001, 2) end -- speed value range

function GetInteractionSpeed(interaction, isHand)
	return isHand and interaction.m_autoHandSpeed or interaction.m_autoSpeed
end

function SetInteractionSpeed(interaction, speed, isHand)
	speed = ClampInteractionSpeed(speed)
	SetInteractionActive(interaction, true, isHand)
	if isHand then interaction.m_autoHandSpeed = speed
	else interaction.m_autoSpeed = speed end
	return speed
end

function SetInteractionSpeedRandom(interaction, isHand)
	SetInteractionSpeed(interaction, GetRandomFloat(0.1, 1), isHand)
end

function SetInteractionSpeedStep(interaction, speedStep, increase, isHand)
	local speed = isHand and interaction.m_autoHandSpeed or interaction.m_autoSpeed
	local increment = 1 + (speedStep / (speed ^ 0.6)) -- 1 + (speed multiplier / (speed / curve))
	if increase then speed = speed * increment
	else speed = speed / increment end
	speed = ClampInteractionSpeed(speed)
	SetInteractionActive(interaction, true, isHand)
	if isHand then interaction.m_autoHandSpeed = speed
	else interaction.m_autoSpeed = speed end
	return speed
end

-------------------------------------------------------------------------------------------------
-- (PENIS) INTERACTION WEIGHT (GIVER VS GETTER) (0-1)
-------------------------------------------------------------------------------------------------
function GetInteractionPenisWeight(interaction, isHand)
	return (isHand) and 0 or interaction.AutoPenisWeight -- no interaction weight in handjobs
end

function SetInteractionPenisWeight(interaction, weight, isHand)
	if isHand then return end -- no interaction weight in handjobs
	weight = Clamp01(weight)
	SetInteractionActive(interaction, true, isHand)
	interaction.AutoPenisWeight = weight
	return weight
end

function SetInteractionPenisWeightRandom(interaction, isHand)
	SetInteractionPenisWeight(interaction, GetRandomFloat01(), isHand)
end

function SetInteractionPenisWeightStep(interaction, weightStep, increase, isHand)
	if isHand then return end -- no interaction weight in handjobs
	local weight = interaction.AutoPenisWeight
	if increase then weight = weight + weightStep
	else weight = weight - weightStep end
	weight = Clamp01(weight)
	SetInteractionActive(interaction, true, isHand)
	interaction.AutoPenisWeight = weight
	return weight
end

-------------------------------------------------------------------------------------------------
-- (PENIS/HAND) INTERACTION THRUST WEIGHT (normalized 0-1 to actual 1-3)
-------------------------------------------------------------------------------------------------
function ClampInteractionThrustWeight(weight) return ClampValue(weight, 1, 3) end -- thrust value range

function GetInteractionThrustWeight(interaction, isHand)
	return isHand and ((interaction.m_autoHandThrustWeight-1)/2) or ((interaction.m_autoThrustWeight-1)/2) -- 3(max) - 1(min) = 2(range)
end

function SetInteractionThrustWeightRandom(interaction, isHand)
	SetInteractionThrustWeight(interaction, GetRandomFloat(0,0.6), isHand)
end

function SetInteractionThrustWeight(interaction, weight, isHand)
	weight = 2 * weight + 1 -- 3(max) - 1(min) = 2
	weight = ClampInteractionThrustWeight(weight)
	SetInteractionActive(interaction, true, isHand)
	if isHand then interaction.m_autoHandThrustWeight = weight
	else interaction.m_autoThrustWeight = weight end
	return weight
end

function SetInteractionThrustWeightStep(interaction, weightStep, increase, isHand)
	local weight = isHand and interaction.m_autoHandThrustWeight or interaction.m_autoThrustWeight
	if increase then weight = weight + (2 * weightStep) -- 3(max) - 1(min) = 2(range)
	else weight = weight - (2 * weightStep) end
	weight = ClampInteractionThrustWeight(weight)
	SetInteractionActive(interaction, true, isHand)
	if isHand then interaction.m_autoHandThrustWeight = weight
	else interaction.m_autoThrustWeight = weight end
	return weight
end

-------------------------------------------------------------------------------------------------
-- (PENIS/HAND) INTERACTION THRUST DEPTH (0-1)
-------------------------------------------------------------------------------------------------
function ClampInteractionDepth(depth, isStartDepth)
	if isStartDepth then return ClampValue(depth, 0, 0.95) -- start depth value range
	else return ClampValue(depth, 0.05,1) end -- end depth value range
end

function GetInteractionDepth(interaction, isStartDepth)
	if isStartDepth then return interaction.m_autoStartDepth
	else return interaction.m_autoEndDepth end
end

function SetInteractionDepth(interaction, depth, isHand, isStartDepth)
	depth = ClampInteractionDepth(depth, isStartDepth)
	SetInteractionActive(interaction, true, isHand)
	if isStartDepth then interaction.m_autoStartDepth = depth
	else interaction.m_autoEndDepth = depth	end
	return depth
end

function SetInteractionDepthRandom(interaction, isHand)
	local start = SetInteractionDepth(interaction, GetRandomFloat(0.2, 0.6), isHand, true)
	SetInteractionDepth(interaction, GetRandomFloat(start + 0.05, 1), isHand, false)
end

function SetInteractionDepthStep(interaction, depthStep, increase, isHand, isStartDepth)
	local depth = GetInteractionDepth(interaction, isStartDepth)
	if increase then depth = depth + depthStep
	else depth = depth - depthStep end
	depth = ClampInteractionDepth(depth, isStartDepth)
	SetInteractionActive(interaction, true, isHand)
	if isStartDepth then interaction.m_autoStartDepth = depth
	else interaction.m_autoEndDepth = depth	end
	return depth
end