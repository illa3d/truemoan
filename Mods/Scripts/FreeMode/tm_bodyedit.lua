-- TrueMoan v1.8 by illa3d
-- Menu in: tm_menu_body.lua
-------------------------------------------------------------------------------------------------
-- BODY EDIT DEFINITIONS
-------------------------------------------------------------------------------------------------

-- Body Edit Defaults
TMBD_RagdollSizeDefault = 0.228
TMBD_BodyDefault = 0

-- Body Edit Definitions
TMBE_Neck = "Neck size"
TMBE_Forearms = "Forearms size"
TMBE_Upperarms = "Upper arms size"
TMBE_Calf = "Calf size"
TMBE_Thigh = "Thigh size"
TMBE_Hips = "Hips size"
TMBE_Waist = "Waist size"
TMBE_Ass = "Ass size"
TMBE_Nipples = "Nipples size"
TMBE_Breasts = "Breasts size"
TMBE_PenisLength = "Penis length"
TMBE_PenisSize = "Penis size"
TMBE_Muscle = "Muscle tone"
TMBE_Body = "Body size"

-- Body Edit Variables
TMB_NeckSize = 0
TMB_ForearmSize = 0
TMB_UperArmsize = 0
TMB_CalfSize = 0
TMB_ThighSize = 0
TMB_WaistSize = 0
TMB_HipsSize = 0
TMB_AssSize = 0
TMB_NipplesSize = 0
TMB_BreastSize = 0
TMB_PenisSize = 0
TMB_PenisLength = 0
TMB_MuscleSize = 0
TMB_BodySize = 0
TMB_PenisSkin = 0
TMB_PenisRagdoll = TMBD_RagdollSizeDefault

-- Body Edit Limits
local TMB_BodyLimits = {
	{ name = TMBE_Neck,			safemin = 0, min = -1, max = 2 },
	{ name = TMBE_Forearms,		safemin = 0, min = -0.5, max = 2 },
	{ name = TMBE_Upperarms,	safemin = 0, min = -0.5, max = 2 },
	{ name = TMBE_Calf,			safemin = 0, min = -0.5, max = 2 },
	{ name = TMBE_Thigh,		safemin = 0, min = -0.5, max = 2 },
	{ name = TMBE_Hips,			safemin = 0, min = -1.5, max = 5 },
	{ name = TMBE_Waist,		safemin = 0, min = -1, max = 5 },
	{ name = TMBE_Ass,			safemin = 0, min = -1, max = 10 },
	{ name = TMBE_Nipples,		safemin = 0, min = -5, max = 5 },
	{ name = TMBE_Breasts,	 safemin = -0.8, min = -2, max = 10 },
	{ name = TMBE_PenisLength,	safemin = 0, min = -0.7, max = 5 },
	{ name = TMBE_PenisSize,	safemin = 0, min = -0.7, max = 20 },
	{ name = TMBE_Muscle,		safemin = 0, min = -0.3, max = 1 },
	{ name = TMBE_Body,			safemin = 0, min = -0.9, max = 10 },
}

local function TMGetBodyPartLimit(bodypart)
	for _, limit in ipairs(TMB_BodyLimits) do
		if limit.name == bodypart then
			return limit
		end
	end
	return { safemin = 0, min = -1, max = 1 }
end

-------------------------------------------------------------------------------------------------
-- BODY EDIT
-------------------------------------------------------------------------------------------------

function TMBodyEditUp(human, bodypart, value, step)
	local limit = TMGetBodyPartLimit(bodypart)
	local mult = 1 + math.floor(math.abs(value) / 2) -- step function to multiply step for bigger values
	value = value + step * mult
	if limit.max ~= 0 and value > limit.max then value = limit.max end
	human.Body(bodypart, value)
	return value
end

function TMBodyEditDown(human, bodypart, value, step)
	local limit = TMGetBodyPartLimit(bodypart)
	local mult = 1 + math.floor(math.abs(value) / 2) -- step function to multiply step for bigger values
	value = value - step * mult
	if TM_BodyEditSafe and limit.safemin ~= 0 and value < limit.safemin then value = limit.safemin
	elseif limit.min ~= 0 and value < limit.min then value = limit.min end
	human.Body(bodypart, value)
	return value
end

function TMBodyEditSize(human, value)
	human.Body(TMBE_Body, value)
	return value
end

function TMBodyEdit(human, bodypart, value)
	if not bodypart or type(bodypart) ~= "string" then return value end
	human.Body(bodypart, value)
	return value
end

function TMBodyEditPenisRagdoll(human, value)
	value = ClampValue(value, 0, 2)
	human.Penis.m_ragdollLength = value
	return value
end

function TMBodyEditPenisSkin(human, value)
	value = Clamp01(value)
	human.Penis.m_penisSkinOut = value
	return value
end

-------------------------------------------------------------------------------------------------
-- BODY EDIT VALUES
-------------------------------------------------------------------------------------------------

function TMBodyEditResetValues()
	TMB_NeckSize = TMBD_BodyDefault
	TMB_ForearmSize = TMBD_BodyDefault
	TMB_UperArmsize = TMBD_BodyDefault
	TMB_CalfSize = TMBD_BodyDefault
	TMB_ThighSize = TMBD_BodyDefault
	TMB_HipsSize = TMBD_BodyDefault
	TMB_WaistSize = TMBD_BodyDefault
	TMB_AssSize = TMBD_BodyDefault
	TMB_NipplesSize = TMBD_BodyDefault
	TMB_BreastSize = TMBD_BodyDefault
	TMB_PenisLength = TMBD_BodyDefault
	TMB_PenisSize = TMBD_BodyDefault
	TMB_MuscleSize = TMBD_BodyDefault
	TMB_BodySize = TMBD_BodyDefault
	TMB_PenisSkin = TMBD_BodyDefault
	TMB_PenisRagdoll = TMBD_RagdollSizeDefault
end

function TMBodyEditApplyValues(human)
	human.Body(TMBE_Neck, TMB_NeckSize)
	human.Body(TMBE_Forearms, TMB_ForearmSize)
	human.Body(TMBE_Upperarms, TMB_UperArmsize)
	human.Body(TMBE_Calf, TMB_CalfSize)
	human.Body(TMBE_Thigh, TMB_ThighSize)
	human.Body(TMBE_Hips, TMB_HipsSize)
	human.Body(TMBE_Waist, TMB_WaistSize)
	human.Body(TMBE_Ass, TMB_AssSize)
	human.Body(TMBE_Nipples, TMB_NipplesSize)
	human.Body(TMBE_Breasts, TMB_BreastSize)
	human.Body(TMBE_PenisLength, TMB_PenisLength)
	human.Body(TMBE_PenisSize, TMB_PenisSize)
	human.Body(TMBE_Muscle, TMB_MuscleSize)
	human.Body(TMBE_Body, TMB_BodySize)
	human.Penis.m_ragdollLength = TMB_PenisRagdoll
	human.Penis.m_penisSkinOut = TMB_PenisSkin
end