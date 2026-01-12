-- TrueMoan v2.2 by illa3d
-------------------------------------------------------------------------------------------------
-- HUMAN FUNCTIONS
-------------------------------------------------------------------------------------------------
-- HUMAN NAMES (used with game.AddRepeatAnim(... and game.RemoveAnim(...)
-- -- Head & Face
-- human.headNames
-- human.browNames
-- human.upperEyelidNames
-- human.lowerEyelidNames
-- human.eyeNames
-- human.noseNames
-- human.cheekNames
-- human.jawNames
-- human.lipsCornerNames
-- human.upperLipsNames
-- human.lowerLipsNames
-- human.tongueNames
-- -- Neck & Upper Torso
-- human.neckNames
-- human.shoulderNames
-- human.chestNames
-- human.breastNames
-- -- Spine & Core
-- human.spineNames
-- human.hipsNames
-- -- Arms & Hands
-- human.upperarmNames
-- human.forearmNames
-- human.handNames
-- human.thumbNames
-- human.indexNames
-- human.middleNames
-- human.ringNames
-- human.pinkyNames
-- -- Lower Body & Legs
-- human.thighNames
-- human.calfNames
-- -- Feet
-- -- human.footNames
-- human.toeNames
-- -- Other / Non-anatomical
-- human.ignoreNames

-- DEFINITIONS
-- Used with GetHumanPos, values correspond with "holeName" from OnPenetration, except Penis
HumanPart = {
	Penis = "Penis",
	Mouth = "Mouth",
	Anus = "Anus",
	Vagina = "Vagina",
}

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
	HumanClothesReplace(human, ListItemRandom(TM_Clothes_Custom))
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

function HumanPosGet(human, humanPart)
	if not human or not humanPart then return Pos(0,0,0) end
	-- transform is somewhere usually off body location, prefer not to use it
	function PosGet_Transform(part) return Pos(part.transform.position.x, part.transform.position.y, part.transform.position.z) end
	function PosGet_PenisBase(part) return Pos(part.PhysicsWorldPos.x, part.PhysicsWorldPos.y, part.PhysicsWorldPos.z) end
	function PosGet_HoleOutside(part) return Pos(part.m_entry.transform.position.x, part.m_entry.transform.position.y, part.m_entry.transform.position.z) end
	function PosGet_HoleInside(part) return Pos(part.m_autoTarget.transform.position.x, part.m_autoTarget.transform.position.y, part.m_autoTarget.transform.position.z) end
	if humanPart == HumanPart.Penis and human.Penis then return PosGet_PenisBase(human.Penis)
	elseif humanPart == HumanPart.Mouth and human.Mouth then return PosGet_HoleInside(human.Mouth)
	elseif humanPart == HumanPart.Anus and human.Anus then return PosGet_HoleOutside(human.Anus)
	elseif humanPart == HumanPart.Vagina and human.Vagina then return PosGet_HoleOutside(human.Vagina)
	end return Pos(0,0,0)
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