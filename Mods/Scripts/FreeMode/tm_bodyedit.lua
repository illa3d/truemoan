-- TrueMoan v2.5 by illa3d
-- Menu in: tm_menu_body.lua
-------------------------------------------------------------------------------------------------
-- BODY EDIT DEFINITIONS
-------------------------------------------------------------------------------------------------

-- Body Edit Defaults
TMBD_RagdollSize = 0.228
TMBD_FluidSpeed = 0.1
TMBD_Body = 0
TMB_StepMultiplier = 1

-------------------------------------------------------------------------------------------------
-- BODY EDIT VALUES
-------------------------------------------------------------------------------------------------
-- Body Edit Values Definition
-- This is a AUTHORITATIVE UI stats
-- Each human has TM_HumanStats[human].TMBValue

-- Body Edit "Enum"
TMBody = {
	Neck = "Neck",
	Forearms = "Forearms",
	UpperArms = "UpperArms",
	Calf = "Calf",
	Thigh = "Thigh",
	Hips = "Hips",
	Waist = "Waist",
	Ass = "Ass",
	Nipples = "Nipples",
	Breasts = "Breasts",
	PenisLength = "PenisLength",
	PenisSize = "PenisSize",
	Muscle = "Muscle",
	Body = "Body",
	PenisSkin = "PenisSkin", -- this is separate function TMBodyEditPenisRagdoll
	PenisRagdoll = "PenisRagdoll", -- this is separate function TMBodyEditPenisSkin
	FluidSpeed = "FluidSpeed",
	FluidAmount = "FluidAmount",
	FluidSpread = "FluidSpread",
	FluidForce = "FluidForce",
	FluidGravity = "FluidGravity",
}

-------------------------------------------------------------------------------------------------

TMBodyValueUI = {} -- AUTHORITATIVE UI use only
function TMBodyUI(tmBody) return TMBodyValueUI[tmBody] end

-- COPY PASTE functionality
TMBodyValueCopy = nil
TMBodyValueCopyName = ""
function TMBodyHasCopy() return TMBodyValueCopy ~= nil end
function TMBodyCopy(human) TMBodyValueCopy = TMBodyValueClone(TMBodyValueUI) TMBodyValueCopyName = human.Name end
function TMBodyPaste(human) TMBodyEdit_Preset(human, TMBodyValueCopy) end
function TMBodyCopyClear() TMBodyValueCopy = nil TMBodyValueCopyName = "" end

-------------------------------------------------------------------------------------------------

--- DEFINITION (never update this)
TMBodyValueDefault = {
	[TMBody.Neck] = 0,
	[TMBody.Forearms] = 0,
	[TMBody.UpperArms] = 0,
	[TMBody.Calf] = 0,
	[TMBody.Thigh] = 0,
	[TMBody.Hips] = 0,
	[TMBody.Waist] = 0,
	[TMBody.Ass] = 0,
	[TMBody.Nipples] = 0,
	[TMBody.Breasts] = 0,
	[TMBody.PenisLength] = 0,
	[TMBody.PenisSize] = 0,
	[TMBody.Muscle] = 0,
	[TMBody.Body] = 0,
	[TMBody.PenisSkin] = 0,
	[TMBody.PenisRagdoll] = TMBD_RagdollSize,
	[TMBody.FluidAmount] = 0,
	[TMBody.FluidForce] = 0,
	[TMBody.FluidGravity] = 0,
	[TMBody.FluidSpeed] = TMBD_FluidSpeed,
	[TMBody.FluidSpread] = 0,
}
function TMBodyValueCloneDefault() return TableClone(TMBodyValueDefault) end
function TMBodyValueClone(tmBodyValue) return TableClone(tmBodyValue) end
function TMBodyEdit_ResetUIValues()
	TMBodyValueUI = TMBodyValueCloneDefault()
end
function TMBodyEdit_ApplyUIValues(human)
	local snapshot = TMBodyValueClone(TMBodyValueUI)
	for part, value in pairs(snapshot) do TMBodyEdit(human, part, value) end
end

-- TrueFacials Body parameter "Enum"
TMBodyParamName = {
	[TMBody.Neck] = "Neck size",
	[TMBody.Forearms] = "Forearms size",
	[TMBody.UpperArms] = "Upper arms size",
	[TMBody.Calf] = "Calf size",
	[TMBody.Thigh] = "Thigh size",
	[TMBody.Hips] = "Hips size",
	[TMBody.Waist] = "Waist size",
	[TMBody.Ass] = "Ass size",
	[TMBody.Nipples] = "Nipples size",
	[TMBody.Breasts] = "Breasts size",
	[TMBody.PenisLength] = "Penis length",
	[TMBody.PenisSize] = "Penis size",
	[TMBody.Muscle] = "Muscle tone",
	[TMBody.Body] = "Body size",
	[TMBody.FluidAmount] = "Fluid amount",
	[TMBody.FluidForce] = "Fluid force",
	[TMBody.FluidGravity] = "Fluid gravity",
	[TMBody.FluidSpeed] = "Fluid speed",
	[TMBody.FluidSpread] = "Fluid spread",
}

-- Body Edit Limits (game min max)
local TMBLimits = {
	[TMBody.Neck] = 		{ safemin = 0,		min = -1,	max = 2 },
	[TMBody.Forearms] =		{ safemin = 0,		min = -0.5,	max = 2 },
	[TMBody.UpperArms] =	{ safemin = 0,		min = -0.5,	max = 2 },
	[TMBody.Calf] =			{ safemin = 0,		min = -0.5,	max = 2 },
	[TMBody.Thigh] =		{ safemin = 0,		min = -0.5,	max = 2 },
	[TMBody.Hips] =			{ safemin = 0,		min = -1.5,	max = 5 },
	[TMBody.Waist] =		{ safemin = 0,		min = -1,	max = 5 },
	[TMBody.Ass] =			{ safemin = 0,		min = -1,	max = 10 },
	[TMBody.Nipples] =		{ safemin = 0,		min = -5,	max = 5 },
	[TMBody.Breasts] =		{ safemin = -0.8,	min = -2,	max = 10 },
	[TMBody.PenisLength] =	{ safemin = 0,		min = -0.7,	max = 5 },
	[TMBody.PenisSize] =	{ safemin = 0,		min = -0.7,	max = 20 },
	[TMBody.Muscle] =		{ safemin = 0,		min = -0.3,	max = 1 },
	[TMBody.Body] =			{ safemin = 0,		min = -0.9,	max = 10 },
	[TMBody.PenisSkin] =	{ safemin = 0,		min = 0,	max = 1 },
	[TMBody.PenisRagdoll] =	{ safemin = 0,		min = 0,	max = 2 },
	[TMBody.FluidAmount] =	{ safemin = 0,		min = -0.5,	max = 2 },
	[TMBody.FluidForce] =	{ safemin = 0,		min = -1,	max = 1 },
	[TMBody.FluidGravity] =	{ safemin = 0,		min = -1,	max = 2 },
	[TMBody.FluidSpeed] =	{ safemin = 0,		min = 0,	max = 1 },
	[TMBody.FluidSpread] =	{ safemin = 0,		min = -1,	max = 10 },
}

-- Body Edit Random Limits (random min max)
local TMBRandomLimits = {
	[TMBody.Neck] = 		{ min = -0.2,	max = 0.2 },
	[TMBody.Forearms] =		{ min = -0.1,	max = 0.2 },
	[TMBody.UpperArms] =	{ min = -0.1,	max = 0.2 },
	[TMBody.Calf] =			{ min = -0.1,	max = 0.2 },
	[TMBody.Thigh] =		{ min = -0.2,	max = 0.2 },
	[TMBody.Hips] =			{ min = -0.2,	max = 0.5 },
	[TMBody.Waist] =		{ min = -0.2,	max = 0.5 },
	[TMBody.Ass] =			{ min = -1,	max = 1.5 },
	[TMBody.Nipples] =		{ min = -1,	max = 1 },
	[TMBody.Breasts] =		{ min = -0.8,	max = 1 },
	[TMBody.Muscle] =		{ min = -0.3,	max = 0.3 },
 	-- ignored for random
	-- [TMBody.PenisLength] =	{ min = 0,	max = 0 },
	-- [TMBody.PenisSize] =		{ min = 0,	max = 0 },
	-- [TMBody.Body] =			{ min = 0,	max = 0 },
	-- [TMBody.PenisSkin] =		{ min = 0,	max = 0 },
	-- [TMBody.PenisRagdoll] =	{ min = 0,	max = 0 },
	[TMBody.FluidAmount] =	{ min = -0.5,	max = 2 },
	[TMBody.FluidForce] =	{ min = -1,	max = 1 },
	[TMBody.FluidGravity] =	{ min = -1,	max = 2 },
	[TMBody.FluidSpeed] =	{ min = 0,	max = 1 },
	[TMBody.FluidSpread] =	{ min = -1,	max = 10 },

}

local TMBodyRandomBlocked = {
	[TMBody.PenisLength]	= true,
	[TMBody.PenisSize]		= true,
	[TMBody.Body]			= true,
	[TMBody.PenisSkin]		= true,
	[TMBody.PenisRagdoll]	= true,
	[TMBody.FluidAmount]	= true,
	[TMBody.FluidForce]		= true,
	[TMBody.FluidGravity]	= true,
	[TMBody.FluidSpeed]		= true,
	[TMBody.FluidSpread]	= true,
}

-------------------------------------------------------------------------------------------------

local function TMBodyEdit_ClampMinMax(tmBody, value)
	local limit = TMBLimits[tmBody]
	if not limit then return value end
	if TM_BodyEditSafe and limit.safemin ~= 0 and value < limit.safemin then return limit.safemin end
	return ClampValue(value, limit.min, limit.max)
end

local function TMBodyGetRandom(tmBody)
	local limit = TMBRandomLimits[tmBody]
	if not limit then return 0 end
	return GetRandomFloat(limit.min, limit.max)
end

function TMBodyStepMultiplierToggle()
	if TMB_StepMultiplier == 1 then TMB_StepMultiplier = 1.5
	elseif TMB_StepMultiplier == 1.5 then TMB_StepMultiplier = 2
	elseif TMB_StepMultiplier == 2 then TMB_StepMultiplier = 3
	elseif TMB_StepMultiplier == 3 then TMB_StepMultiplier = 0.5
	elseif TMB_StepMultiplier == 0.5 then TMB_StepMultiplier = 1 end
end

-------------------------------------------------------------------------------------------------
-- BODY EDIT
-------------------------------------------------------------------------------------------------
function TMBodyEditHuman(human)
	local tmBodyValues = TMHStatsGet_TMBValue(human)
	if not tmBodyValues then return end
	TMBodyValueUI = TMBodyValueClone(tmBodyValues)
end

function TMBodyEditRandom_Body(human)
	for part, _ in pairs(TMBody) do
		if not TMBodyRandomBlocked[part] then TMBodyEditRandom(human, part) end
	end
end

function TMBodyEditRandom_Fluid(human)
	TMBodyEditRandom(human, TMBody.FluidAmount)
	TMBodyEditRandom(human, TMBody.FluidForce)
	TMBodyEditRandom(human, TMBody.FluidGravity)
	TMBodyEditRandom(human, TMBody.FluidSpeed)
	TMBodyEditRandom(human, TMBody.FluidSpread)
end

function TMBodyEditRandom(human, tmBody)
	if not tmBody then return 0 end
	TMBodyEdit(human, tmBody, TMBodyGetRandom(tmBody))
end

function TMBodyEdit_Up(human, tmBody, step, linear)
	if not tmBody then return end
	local value = TMBodyValueUI[tmBody]
	local mult = (linear == true) and 1 or (1 + math.floor(math.abs(value) / 1)) -- step function to multiply step for bigger values
	value = value + step * mult * TMB_StepMultiplier
	TMBodyEdit(human, tmBody, value)
end

function TMBodyEdit_Down(human, tmBody, step, linear)
	if not tmBody then return end
	local value = TMBodyValueUI[tmBody]
	local mult = (linear == true) and 1 or (1 + math.floor(math.abs(value) / 1)) -- step function to multiply step for bigger values
	value = value - step * mult * TMB_StepMultiplier 
	TMBodyEdit(human, tmBody, value)
end

function TMBodyEdit(human, tmBody, value)
	if not tmBody then return end
	TMBodyValueUI[tmBody] = TMBodyEdit_ClampMinMax(tmBody, value) -- update UI COPY TMBValue
	TMHStatsSet_BodyEdit(human, tmBody, TMBodyValueUI[tmBody], false) -- update AUTHORITATIVE TMBValue, don't APPLY (feedback loop)
	TMBodyEdit_Apply(human, tmBody, TMBodyValueUI[tmBody])
end

-------------------------------------------------------------------------------------------------

-- PRESETS
function TMBodyEdit_Preset(human, tmbPreset)
	if not human or not tmbPreset then return end
	for tmBody, value in pairs(tmbPreset) do
		TMBodyEdit(human, tmBody, value)
	end
end

-------------------------------------------------------------------------------------------------

-- DONT USE - Direct application to the human (called exclusively from BodyEdit and HumanStat functions)
function TMBodyEdit_Apply(human, tmBody, value)
	if not tmBody then return end
	if tmBody == TMBody.PenisSkin and human.Penis then human.Penis.m_penisSkinOut = value
	elseif tmBody == TMBody.PenisRagdoll and human.Penis then human.Penis.m_ragdollLength = value
	else human.Body(TMBodyParamName[tmBody], value) end
end
