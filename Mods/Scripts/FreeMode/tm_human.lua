-- TrueMoan v2.4 by illa3d
-------------------------------------------------------------------------------------------------
-- HUMAN FUNCTIONS
-------------------------------------------------------------------------------------------------

-- Used with GetHumanPos, values correspond with "holeName" from OnPenetration, except Penis
HumanPos = {
	Penis = "Penis",
	Mouth = "Mouth",
	Anus = "Anus",
	Vagina = "Vagina",
}

-- HUMAN PARTS
-- used with game.AddRepeatAnim(... and game.RemoveAnim(...)
HumanPart = {
	-- Penis
	Penis = "Penis",
	-- Holes
	Mouth = "Mouth",
	Vagina = "Vagina",
	Anus = "Anus",
	-- Head & Face
	Head = "headNames",
	Brow = "browNames",
	UpperEyelid = "upperEyelidNames",
	LowerEyelid = "lowerEyelidNames",
	Eye = "eyeNames",
	Nose = "noseNames",
	Cheek = "cheekNames",
	Jaw = "jawNames",
	LipsCorner = "lipsCornerNames",
	UpperLips = "upperLipsNames",
	LowerLips = "lowerLipsNames",
	Tongue = "tongueNames",
	-- Neck & Upper Torso",
	Neck = "neckNames",
	Shoulder = "shoulderNames",
	Chest = "chestNames",
	Breast = "breastNames",
	-- Spine & Core",
	Spine = "spineNames",
	Hips = "hipsNames",
	-- Arms & Hands",
	Upperarm = "upperarmNames",
	Forearm = "forearmNames",
	Hand = "handNames",
	Thumb = "thumbNames",
	Index = "indexNames",
	Middle = "middleNames",
	Ring = "ringNames",
	Pinky = "pinkyNames",
	-- Lower Body & Legs",
	Thigh = "thighNames",
	Calf = "calfNames",
	-- Feet",
	Foot = "footNames",
	Toe = "toeNames",
	-- Other / Non-anatomical",
	Ignore = "ignoreNames",
}

local HumanPartFunc = {
	-- Penis
	[HumanPart.Penis] = function(h) return h.Penis end,
	-- Holes
	[HumanPart.Mouth] = function(h) return h.Mouth end,
	[HumanPart.Vagina] = function(h) return h.Vagina end,
	[HumanPart.Anus] = function(h) return h.Anus end,
	-- Head & Face
	[HumanPart.Head] = function(h) return h.headNames end,
	[HumanPart.Brow] = function(h) return h.browNames end,
	[HumanPart.UpperEyelid] = function(h) return h.upperEyelidNames end,
	[HumanPart.LowerEyelid] = function(h) return h.lowerEyelidNames end,
	[HumanPart.Eye] = function(h) return h.eyeNames end,
	[HumanPart.Nose] = function(h) return h.noseNames end,
	[HumanPart.Cheek] = function(h) return h.cheekNames end,
	[HumanPart.Jaw] = function(h) return h.jawNames end,
	[HumanPart.LipsCorner] = function(h) return h.lipsCornerNames end,
	[HumanPart.UpperLips] = function(h) return h.upperLipsNames end,
	[HumanPart.LowerLips] = function(h) return h.lowerLipsNames end,
	[HumanPart.Tongue] = function(h) return h.tongueNames end,
	-- Neck & Upper Torso
	[HumanPart.Neck] = function(h) return h.neckNames end,
	[HumanPart.Shoulder] = function(h) return h.shoulderNames end,
	[HumanPart.Chest] = function(h) return h.chestNames end,
	[HumanPart.Breast] = function(h) return h.breastNames end,
	-- Spine & Core
	[HumanPart.Spine] = function(h) return h.spineNames end,
	[HumanPart.Hips] = function(h) return h.hipsNames end,
	-- Arms & Hands
	[HumanPart.Upperarm] = function(h) return h.upperarmNames end,
	[HumanPart.Forearm] = function(h) return h.forearmNames end,
	[HumanPart.Hand] = function(h) return h.handNames end,
	[HumanPart.Thumb] = function(h) return h.thumbNames end,
	[HumanPart.Index] = function(h) return h.indexNames end,
	[HumanPart.Middle] = function(h) return h.middleNames end,
	[HumanPart.Ring] = function(h) return h.ringNames end,
	[HumanPart.Pinky] = function(h) return h.pinkyNames end,
	-- Lower Body & Legs
	[HumanPart.Thigh] = function(h) return h.thighNames end,
	[HumanPart.Calf] = function(h) return h.calfNames end,
	-- Feet
	[HumanPart.Foot] = function(h) return h.footNames end,
	[HumanPart.Toe] = function(h) return h.toeNames end,
	-- Other / Non-anatomical
	[HumanPart.Ignore] = function(h) return h.ignoreNames end,
}

-------------------------------------------------------------------------------------------------

function HumanRemove(human, immediate)
	if immediate then game.RemoveHuman(human)
	else HumanReset(human) Delayed(1, function () game.RemoveHuman(human) end) end
end

function HumansFreeze(frozen)
	game.m_freezeAllActors = frozen
end

function HumanTalkStop(human)
	if not human then return end
	human.StopTalking()
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
		local hadpenis = human.Penis.IsActive
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
	---@diagnostic disable: exp-in-action, undefined-global, err-nonstandard-symbol, miss-exp, miss-symbol, unknown-symbol
	game.AddRepeatAnim(sec, || human.Shoot(), human.Penis)
	---@diagnostic enable: exp-in-action, undefined-global, err-nonstandard-symbol, miss-exp, miss-symbol, unknown-symbol
	return sec
end

function HumanCumStop(human)
	game.RemoveAnim(human.Penis)
	return 0
end

function HumanIsCumming(human)
	return human and human.Penis and game.HasAnim(human.Penis)
end

function HumanPosGet(human, humanPos)
	if not human or not humanPos then return Pos(0,0,0) end
	-- transform is somewhere usually off body location, prefer not to use it
	function PosGet_Transform(part) return Pos(part.transform.position.x, part.transform.position.y, part.transform.position.z) end
	function PosGet_PenisBase(part) return Pos(part.PhysicsWorldPos.x, part.PhysicsWorldPos.y, part.PhysicsWorldPos.z) end
	function PosGet_HoleOutside(part) return Pos(part.m_entry.transform.position.x, part.m_entry.transform.position.y, part.m_entry.transform.position.z) end
	function PosGet_HoleInside(part) return Pos(part.m_autoTarget.transform.position.x, part.m_autoTarget.transform.position.y, part.m_autoTarget.transform.position.z) end
	if humanPos == HumanPos.Penis and human.Penis then return PosGet_PenisBase(human.Penis)
	elseif humanPos == HumanPos.Mouth and human.Mouth then return PosGet_HoleInside(human.Mouth)
	elseif humanPos == HumanPos.Anus and human.Anus then return PosGet_HoleOutside(human.Anus)
	elseif humanPos == HumanPos.Vagina and human.Vagina then return PosGet_HoleOutside(human.Vagina)
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

-------------------------------------------------------------------------------------------------
-- HUMAN ANIMATION
-------------------------------------------------------------------------------------------------

function HumanPartGet(human, humanPart)
	local PartGet = HumanPartFunc[humanPart]
	return PartGet and PartGet(human) or nil
end

function HumanAnimHas(human, humanPart)
	local part = HumanPartGet(human, humanPart)
	return part and game.HasAnim(part) or false
end

function HumanAnimRemove(human, humanPart)
	local part = HumanPartGet(human, humanPart)
	if part then game.RemoveAnim(part) end
	return part and true or false
end

function HumanAnimRepeatAdd(human, humanPart, repeatSec, func)
	local part = HumanPartGet(human, humanPart)
	if part then game.AddRepeatAnim(repeatSec, func, part) end
	return part and true or false
end
