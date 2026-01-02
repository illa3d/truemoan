-- TrueMoan v1.8 by illa3d
-------------------------------------------------------------------------------------------------
-- BODYEDIT PRESETS (TMBE - TrueMoanBodyEdit)
-------------------------------------------------------------------------------------------------

-- WARNING:
-- Breasts values below -0.8 can crash the game on some characters
-- Body values below -0.9 crash the game

-- MENU: BODY.. / Size..
label TMMenuBodySize(human)
-- MENU PRESETS START ===========================================================================================================================
	+ "• Fairy Dildo" [if human.Penis.IsActive] [gold]
		TMBEPreset_Dildo(human)	
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
-- MENU PRESETS END ===========================================================================================================================
	+ "Random | " .. AccNum(TMBodyValueUI.Body, 2) [gold]
		TMBodyEdit(human, TMBody.Body, GetRandomFloat(-0.5,0.5))
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- MENU: BODY.. / Type..
label TMMenuBodyType(human)
	-- MENU PRESETS - !!ADD MENU PRESETS HERE!!
	+ "• Obese"
		TMBEPreset_Obese(human)
		Return()
	+ "• Curvy"
		TMBEPreset_Curvy(human)
		Return()
	+ "• Normal" [gold]
		TMBEPreset_Normal(human)
		Return()
	+ "• Slim"
		TMBEPreset_Slim(human)
		Return()
	+ "• Skinny"
		TMBEPreset_Skinny(human)
		Return()
	+ "Random" [gold]
		TMBEPreset_RandomPreset(human)
		Return()
	+ "Generate" [gold]
		TMBodyEditAllRandom(human)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

------------------------------------------------------------------------------------------------
----- PRESETS
------------------------------------------------------------------------------------------------

-- Called from tm_main on character creation
function TMBEPreset_RandomStart(human)
	local randomPresets = {
-- SPAWN RANDOM PRESETS ========================================================================
		TMBEPreset_Skinny,
		TMBEPreset_Slim,
		TMBEPreset_Normal,
		TMBEPreset_Curvy,
		TMBEPreset_Obese,
-- SPAWN RANDOM PRESETS END ===========================================================================================================================
	} (randomPresets[math.random(#randomPresets)] or TMBEPreset_Normal)(human)
end

-- Called from BodyEdit menu
function TMBEPreset_RandomPreset(human)
	local randomPresets = {
-- MENU RANDOM PRESETS MENU ====================================================================
		TMBEPreset_Slim,
		TMBEPreset_Normal,
		TMBEPreset_Curvy,
		TMBEPreset_Obese,
-- RANDOM PRESETS END ==========================================================================
	}
	(randomPresets[math.random(#randomPresets)] or TMBEPreset_Normal)(human)
end

-- PRESETS START  ==============================================================================
function TMBEPreset_Dildo(human)
	HumanClothes(human, false)
	TMBEPreset_Normal(human)
	TMBodyEdit(human, TMBody.PenisSize, 8)
	TMBodyEdit(human, TMBody.Body, -0.9)
	HumanReset(human)
end

function TMBEPreset_Obese(human)
	TMBodyEdit(human, TMBody.Neck, 0.2)
	TMBodyEdit(human, TMBody.Forearms, 0.2)
	TMBodyEdit(human, TMBody.UpperArms, 0.4)
	TMBodyEdit(human, TMBody.Calf, 0.2)
	TMBodyEdit(human, TMBody.Thigh, 0.2)
	TMBodyEdit(human, TMBody.Hips, 0.8)
	TMBodyEdit(human, TMBody.Waist, 0.8)
	TMBodyEdit(human, TMBody.Ass, 2)
	TMBodyEdit(human, TMBody.Nipples, 0)
	TMBodyEdit(human, TMBody.Breasts, 0.7)
	TMBodyEdit(human, TMBody.Muscle, -0.3)
end

function TMBEPreset_Curvy(human)
	TMBodyEdit(human, TMBody.Neck, 0.1)
	TMBodyEdit(human, TMBody.Forearms, 0.1)
	TMBodyEdit(human, TMBody.UpperArms, 0.2)
	TMBodyEdit(human, TMBody.Calf, 0.1)
	TMBodyEdit(human, TMBody.Thigh, 0.1)
	TMBodyEdit(human, TMBody.Hips, 0.4)
	TMBodyEdit(human, TMBody.Waist, 0.4)
	TMBodyEdit(human, TMBody.Ass, 1)
	TMBodyEdit(human, TMBody.Nipples, 0)
	TMBodyEdit(human, TMBody.Breasts, 0.3)
	TMBodyEdit(human,TMBody.Muscle, -0.2)
end

function TMBEPreset_Normal(human)
	TMBodyEdit(human, TMBody.Neck, 0)
	TMBodyEdit(human, TMBody.Forearms, 0)
	TMBodyEdit(human, TMBody.UpperArms, 0)
	TMBodyEdit(human, TMBody.Calf, 0)
	TMBodyEdit(human, TMBody.Thigh, 0)
	TMBodyEdit(human, TMBody.Hips, 0)
	TMBodyEdit(human, TMBody.Waist, 0)
	TMBodyEdit(human, TMBody.Ass, 0)
	TMBodyEdit(human, TMBody.Nipples, 0)
	TMBodyEdit(human, TMBody.Breasts, 0)
	TMBodyEdit(human, TMBody.Muscle, 0)
end

function TMBEPreset_Slim(human)
	TMBodyEdit(human, TMBody.Neck, 0)
	TMBodyEdit(human, TMBody.Forearms, -0.05)
	TMBodyEdit(human, TMBody.UpperArms, -0.05)
	TMBodyEdit(human, TMBody.Calf, -0.05)
	TMBodyEdit(human, TMBody.Thigh, -0.1)
	TMBodyEdit(human, TMBody.Hips, -0.1)
	TMBodyEdit(human, TMBody.Waist, 0)
	TMBodyEdit(human, TMBody.Ass, -0.5)
	TMBodyEdit(human, TMBody.Nipples, 0)
	TMBodyEdit(human, TMBody.Breasts, -0.5)
	TMBodyEdit(human, TMBody.Muscle, 0.2)
end

function TMBEPreset_Skinny(human)
	TMBodyEdit(human, TMBody.Neck, 0)
	TMBodyEdit(human, TMBody.Forearms, -0.1)
	TMBodyEdit(human, TMBody.UpperArms, -0.1)
	TMBodyEdit(human, TMBody.Calf, -0.1)
	TMBodyEdit(human, TMBody.Thigh, -0.2)
	TMBodyEdit(human, TMBody.Hips, -0.2)
	TMBodyEdit(human, TMBody.Waist, 0)
	TMBodyEdit(human, TMBody.Ass, -1)
	TMBodyEdit(human, TMBody.Nipples, 0)
	TMBodyEdit(human, TMBody.Breasts, -0.8)
	TMBodyEdit(human, TMBody.Muscle, 0.3)
end
-- PRESETS END  ==============================================================================

function TMBEPreset_Reset(human)
	TMBodyEdit(human, TMBody.Neck, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.Forearms, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.UpperArms, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.Calf, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.Thigh, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.Hips, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.Waist, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.Ass, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.Nipples, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.Breasts, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.PenisLength, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.PenisSize, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.Muscle, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.Body, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.PenisLength, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.PenisSkin, TMBD_BodyDefault)
	TMBodyEdit(human, TMBody.PenisRagdoll, TMBD_RagdollSizeDefault)
end