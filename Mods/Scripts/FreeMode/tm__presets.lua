-- TrueMoan v2.3 by illa3d
-- BODYEDIT PRESETS - WARNING, Breasts < -0.8, Body < -0.9 crash the game on some characters

------------------------------------------------------------------------------------------------
-- PRESETS DISPLAYED IN TALK MENU/BODY/SIZE
------------------------------------------------------------------------------------------------
---@diagnostic disable: exp-in-action, undefined-global, keyword, unknown-symbol, miss-end, miss-symbol, miss-exp, err-nonstandard-symbol
label TMMenuBodySize(human)
	-- # PRESETS START #
	+ "• Fairy Dildo" [if human.Penis.IsActive] [gold]
		HumanClothes(human, false)
		TMBodyEdit_Preset(human, TMBEPreset_Normal)
		TMBodyEdit_Preset(human, TMBEPreset_Dildo)
		TMHumanReset(human)
		Return()
	+ "• Giant"
		TMBodyEdit(human, TMBody.Body, 0.7)
		Return()
	+ "• Huge"
		TMBodyEdit(human, TMBody.Body, 0.15)
		Return()
	+ "• Big"
		TMBodyEdit(human, TMBody.Body, 0.075)
		Return()
	+ "• Normal" [gold]
		TMBodyEdit(human, TMBody.Body, 0)
		Return()
	+ "• Medium"
		TMBodyEdit(human, TMBody.Body, -0.075)
		Return()
	+ "• Small"
		TMBodyEdit(human, TMBody.Body, -0.15)
		Return()
	+ "• Tiny"
		TMBodyEdit(human, TMBody.Body, -0.7)
		Return()
	-- # DONT MODIFY BELOW #

	+ "Generate | " .. AccNum(TMBodyUI(TMBody.Body), 2) [gold]
		TMBodyEdit(human, TMBody.Body, GetRandomFloat(-0.5,0.5))
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

------------------------------------------------------------------------------------------------
-- PRESETS DISPLAYED IN TALK MENU/BODY/TYPE
------------------------------------------------------------------------------------------------
label TMMenuBodyType(human)

	-- # PRESETS START #
	+ "• Obese"
		TMBodyEdit_Preset(human, TMBEPreset_Obese)
		Return()
	+ "• Curvy"
		TMBodyEdit_Preset(human, TMBEPreset_Curvy)
		Return()
	+ "• Normal" [gold]
		TMBodyEdit_Preset(human, TMBEPreset_Normal)
		Return()
	+ "• Slim"
		TMBodyEdit_Preset(human, TMBEPreset_Slim)
		Return()
	+ "• Skinny"
		TMBodyEdit_Preset(human, TMBEPreset_Skinny)
		Return()
	-- # DONT MODIFY BELOW #

	+ "Random •" [gold]
		TMBEPreset_MenuRandom(human)
		Return()
	+ "Generate" [gold]
		TMBodyEditAllRandom(human)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
---@diagnostic enable: exp-in-action, undefined-global, keyword, unknown-symbol, miss-end, miss-symbol, miss-exp, err-nonstandard-symbol

------------------------------------------------------------------------------------------------
-- RANDOM PRESETS ON SPAWN
------------------------------------------------------------------------------------------------
function TMBEPreset_StartRandom(human)
	local StartRandom = {
		-- # PRESETS START #
		TMBEPreset_Obese,
		TMBEPreset_Curvy,
		TMBEPreset_Normal,
		TMBEPreset_Slim,
		TMBEPreset_Skinny,
		-- # DONT MODIFY BELOW #
	} TMBodyEdit_Preset(human, ListItemRandom(StartRandom))
end

------------------------------------------------------------------------------------------------
-- RANDOM PRESETS MENU/BODY/RANDOM
------------------------------------------------------------------------------------------------
function TMBEPreset_MenuRandom(human)
	local MenuRandom = {
		-- # PRESETS START #
		TMBEPreset_Obese,
		TMBEPreset_Curvy,
		TMBEPreset_Normal,
		TMBEPreset_Slim,
		TMBEPreset_Skinny,
		-- # DONT MODIFY BELOW #
	} TMBodyEdit_Preset(human, ListItemRandom(MenuRandom))
end

------------------------------------------------------------------------------------------------
-- PRESET IN MENU/BODY/RESET
------------------------------------------------------------------------------------------------

TMBEPreset_Reset = {
	[TMBody.Neck]			= TMBD_BodyDefault,
	[TMBody.Forearms]		= TMBD_BodyDefault,
	[TMBody.UpperArms]		= TMBD_BodyDefault,
	[TMBody.Calf]			= TMBD_BodyDefault,
	[TMBody.Thigh]			= TMBD_BodyDefault,
	[TMBody.Hips]			= TMBD_BodyDefault,
	[TMBody.Waist]			= TMBD_BodyDefault,
	[TMBody.Ass]			= TMBD_BodyDefault,
	[TMBody.Nipples]		= TMBD_BodyDefault,
	[TMBody.Breasts]		= TMBD_BodyDefault,
	[TMBody.PenisLength]	= TMBD_BodyDefault,
	[TMBody.PenisSize]		= TMBD_BodyDefault,
	[TMBody.Muscle]			= TMBD_BodyDefault,
	[TMBody.Body]			= TMBD_BodyDefault,
	[TMBody.PenisSkin]		= TMBD_BodyDefault,
	[TMBody.PenisRagdoll]	= TMBD_RagdollSizeDefault,
}

------------------------------------------------------------------------------------------------
-- PRESETS
------------------------------------------------------------------------------------------------

TMBEPreset_Dildo = {
	[TMBody.PenisSize]	= 8,
	[TMBody.Body]		= -0.9,
}

TMBEPreset_Obese = {
	[TMBody.Neck]		= 0.2,
	[TMBody.Forearms]	= 0.2,
	[TMBody.UpperArms]	= 0.4,
	[TMBody.Calf]		= 0.2,
	[TMBody.Thigh]		= 0.2,
	[TMBody.Hips]		= 0.8,
	[TMBody.Waist]		= 0.8,
	[TMBody.Ass]		= 2,
	[TMBody.Nipples]	= 0,
	[TMBody.Breasts]	= 0.7,
	[TMBody.Muscle]		= -0.3,
}

TMBEPreset_Curvy = {
	[TMBody.Neck]		= 0.1,
	[TMBody.Forearms]	= 0.1,
	[TMBody.UpperArms]	= 0.2,
	[TMBody.Calf]		= 0.1,
	[TMBody.Thigh]		= 0.1,
	[TMBody.Hips]		= 0.4,
	[TMBody.Waist]		= 0.4,
	[TMBody.Ass]		= 1,
	[TMBody.Nipples]	= 0,
	[TMBody.Breasts]	= 0.3,
	[TMBody.Muscle]		= -0.2,
}

TMBEPreset_Normal = {
	[TMBody.Neck]	= 0,
	[TMBody.Forearms]	= 0,
	[TMBody.UpperArms]	= 0,
	[TMBody.Calf]		= 0,
	[TMBody.Thigh]		= 0,
	[TMBody.Hips]		= 0,
	[TMBody.Waist]		= 0,
	[TMBody.Ass]		= 0,
	[TMBody.Nipples]	= 0,
	[TMBody.Breasts]	= 0,
	[TMBody.Muscle]		= 0,
}

TMBEPreset_Slim = {
	[TMBody.Neck]		= 0,
	[TMBody.Forearms]	= -0.05,
	[TMBody.UpperArms]	= -0.05,
	[TMBody.Calf]		= -0.05,
	[TMBody.Thigh]		= -0.1,
	[TMBody.Hips]		= -0.1,
	[TMBody.Waist]		= 0,
	[TMBody.Ass]		= -0.5,
	[TMBody.Nipples]	= 0,
	[TMBody.Breasts]	= -0.5,
	[TMBody.Muscle]		= 0.2,
}

TMBEPreset_Skinny = {
	[TMBody.Neck]		= 0,
	[TMBody.Forearms]	= -0.1,
	[TMBody.UpperArms]	= -0.1,
	[TMBody.Calf]		= -0.1,
	[TMBody.Thigh]		= -0.2,
	[TMBody.Hips]		= -0.2,
	[TMBody.Waist]		= 0,
	[TMBody.Ass]		= -1,
	[TMBody.Nipples]	= 0,
	[TMBody.Breasts]	= -0.8,
	[TMBody.Muscle]		= 0.3,
	---@diagnostic disable: miss-symbol
}