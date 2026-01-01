-- TrueMoan v1.8 by illa3d
-- Menu in: tm_menu_body.lua
-------------------------------------------------------------------------------------------------
-- BODY EDIT DEFINITIONS
-------------------------------------------------------------------------------------------------

-- Body Edit Defaults
TMBD_RagdollSizeDefault = 0.228
TMBD_BodyDefault = 0

-- Body Edit Values Definition
-- In runtime, This is a UI copy of the AUTHORITATIVE TM_HumanStats[human].TMBValue <- this is a single source of truth
TMBValue = {
	Neck = 0,
	Forearms = 0,
	UpperArms = 0,
	Calf = 0,
	Thigh = 0,
	Hips = 0,
	Waist = 0,
	Ass = 0,
	Nipples = 0,
	Breasts = 0,
	PenisLength = 0,
	PenisSize = 0,
	Muscle = 0,
	Body = 0,
	PenisSkin = 0,
	PenisRagdoll = TMBD_RagdollSizeDefault,
}

function TMBValueDefaultGet() return TMBValueClone(TMBValue) end
function TMBValueClone(tmbValue) local clone = {} for k, v in pairs(tmbValue) do clone[k] = v end return clone end

-- Body Edit Enum
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
	PenisRagdoll = "PenisRagdoll" -- this is separate function TMBodyEditPenisSkin
}

-- TrueFacials Body parameter names
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
}

-- Body Edit Limits (game min max)
local TMBLimits = {
	Neck = 			{ safemin = 0,		min = -1,	max = 2 },
	Forearms =		{ safemin = 0,		min = -0.5,	max = 2 },
	UpperArms =		{ safemin = 0,		min = -0.5,	max = 2 },
	Calf =			{ safemin = 0,		min = -0.5,	max = 2 },
	Thigh =			{ safemin = 0,		min = -0.5,	max = 2 },
	Hips =			{ safemin = 0,		min = -1.5,	max = 5 },
	Waist =			{ safemin = 0,		min = -1,	max = 5 },
	Ass =			{ safemin = 0,		min = -1,	max = 10 },
	Nipples =		{ safemin = 0,		min = -5,	max = 5 },
	Breasts =		{ safemin = -0.8,	min = -2,	max = 10 },
	PenisLength =	{ safemin = 0,		min = -0.7,	max = 5 },
	PenisSize =		{ safemin = 0,		min = -0.7,	max = 20 },
	Muscle =		{ safemin = 0,		min = -0.3,	max = 1 },
	Body =			{ safemin = 0,		min = -0.9,	max = 10 },
	PenisSkin =		{ safemin = 0,		min = 0,	max = 1 },
	PenisRagdoll =	{ safemin = 0,		min = 0,	max = 2 },
}

-- Body Edit Random Limits (random min max)
local TMBRandomLimits = {
	Neck = 			{ min = -0.2,	max = 0.2 },
	Forearms =		{ min = -0.1,	max = 0.2 },
	UpperArms =		{ min = -0.1,	max = 0.2 },
	Calf =			{ min = -0.1,	max = 0.2 },
	Thigh =			{ min = -0.2,	max = 0.2 },
	Hips =			{ min = -0.2,	max = 0.5 },
	Waist =			{ min = -0.2,	max = 0.5 },
	Ass =			{ min = -1,	max = 1.5 },
	Nipples =		{ min = -1,	max = 1 },
	Breasts =		{ min = -0.8,	max = 1 },
	Muscle =		{ min = -0.3,	max = 0.3 },
	-- PenisLength =	{ min = 0,	max = 0 }, -- ignored for random
	-- PenisSize =		{ min = 0,	max = 0 },
	-- Body =			{ min = 0,	max = 0 },
	-- PenisSkin =		{ min = 0,	max = 0 },
	-- PenisRagdoll =	{ min = 0,	max = 0 },
}

local TMBodyRandomBlocked = {
	[TMBody.PenisLength]	= true,
	[TMBody.PenisSize]		= true,
	[TMBody.Body]			= true,
	[TMBody.PenisSkin]		= true,
	[TMBody.PenisRagdoll]	= true,
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

-------------------------------------------------------------------------------------------------
-- BODY EDIT
-------------------------------------------------------------------------------------------------
function TMBodyEditHuman(human)
	local tmb = TMHStatsGet_TMBValue(human)
	if not tmb then return end
	TMBValue = TMBValueClone(tmb) -- Cloning from AUTHORITATIVE, for UI use only
end

function TMBodyEditAllRandom(human)
	for part, _ in pairs(TMBody) do
		if not TMBodyRandomBlocked[part] then TMBodyEditRandom(human, part) end
	end
end

function TMBodyEditRandom(human, tmBody)
	if not tmBody then return 0 end
	TMBodyEdit(human, tmBody, TMBodyGetRandom(tmBody))
end

function TMBodyEdit_Up(human, tmBody, step)
	if not tmBody then return end
	local value = TMBValue[tmBody]
	local mult = 1 + math.floor(math.abs(value) / 2) -- step function to multiply step for bigger values
	value = value + step * mult
	TMBodyEdit(human, tmBody, value)
end

function TMBodyEdit_Down(human, tmBody, step)
	if not tmBody then return end
	local value = TMBValue[tmBody]
	local mult = 1 + math.floor(math.abs(value) / 2) -- step function to multiply step for bigger values
	value = value - step * mult
	TMBodyEdit(human, tmBody, value)
end

function TMBodyEdit(human, tmBody, value)
	if not tmBody then return end
	TMBValue[tmBody] = TMBodyEdit_ClampMinMax(tmBody, value) -- update UI COPY TMBValue
	TMHStatsSet_BodyEdit(human, tmBody, TMBValue[tmBody], false) -- update AUTHORITATIVE TMBValue, don't APPLY (feedback loop)
	TMBodyEdit_Apply(human, tmBody, TMBValue[tmBody])
end

-- DONT USE - Direct application to the human (called exclusively from BodyEdit and HumanStat functions)
function TMBodyEdit_Apply(human, tmBody, value)
	if not tmBody then return end
	if tmBody == TMBody.PenisSkin and human.Penis then human.Penis.m_penisSkinOut = value
	elseif tmBody == TMBody.PenisRagdoll and human.Penis then human.Penis.m_ragdollLength = value
	else human.Body(TMBodyParamName[tmBody], value) end
end

-------------------------------------------------------------------------------------------------
-- BODY EDIT VALUES
-------------------------------------------------------------------------------------------------

function TMBodyEdit_ResetUIValues()
	TMBValue.Neck = TMBD_BodyDefault
	TMBValue.Forearms = TMBD_BodyDefault
	TMBValue.UpperArms = TMBD_BodyDefault
	TMBValue.Calf = TMBD_BodyDefault
	TMBValue.Thigh = TMBD_BodyDefault
	TMBValue.Waist = TMBD_BodyDefault
	TMBValue.Hips = TMBD_BodyDefault
	TMBValue.Ass = TMBD_BodyDefault
	TMBValue.Nipples = TMBD_BodyDefault
	TMBValue.Breasts = TMBD_BodyDefault
	TMBValue.PenisLength = TMBD_BodyDefault
	TMBValue.PenisSize = TMBD_BodyDefault
	TMBValue.Muscle = TMBD_BodyDefault
	TMBValue.Body = TMBD_BodyDefault
	TMBValue.PenisSkin = TMBD_BodyDefault
	TMBValue.PenisRagdoll = TMBD_RagdollSizeDefault
end

function TMBodyEdit_ApplyUIValues(human)
	local snapshot = TMBValueClone(TMBValue)
	for part, value in pairs(snapshot) do TMBodyEdit(human, part, value) end
end