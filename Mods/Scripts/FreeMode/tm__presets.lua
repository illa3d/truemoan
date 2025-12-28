-- TrueMoan v1.3 by illa3d
-------------------------------------------------------------------------------------------------
-- BODYEDIT PRESETS (TMBE - TrueMoanBodyEdit)
-------------------------------------------------------------------------------------------------

-- WARNING:
-- Breasts values below -0.8 can crash the game on some characters
-- Body values below -0.9 crash the game

-- MENU: BODY.. / Size..
label TMMenuBodySize(human)
	+ "• Fairy Dildo" [if human.Penis.IsActive] [gold]
		human "Wtf is this, I feel funny... Weeeeee!\n(Sweet idea @void.branding)"
		TMBEPreset_Dildo(human)	
		Return()
	+ "• Giant"
		TMB_BodySize = TMBodyEditSize(human, 0.7)
		Return()
	+ "• Huge"
		TMB_BodySize = TMBodyEditSize(human, 0.15)
		Return()
	+ "• Big"
		TMB_BodySize = TMBodyEditSize(human, 0.075)
		Return()
	+ "• Normal" [gold]
		TMB_BodySize = TMBodyEditSize(human, 0)
		Return()
	+ "• Medium"
		TMB_BodySize = TMBodyEditSize(human, -0.075)
		Return()
	+ "• Small"
		TMB_BodySize = TMBodyEditSize(human, -0.15)
		Return()
	+ "• Tiny"
		TMB_BodySize = TMBodyEditSize(human, -0.7)
		Return()
	+ "Random | " .. AccNum(TMB_BodySize, 2) [gold]
		TMB_BodySize = TMBodyEditSize(human, GetRandomFloat(-0.5,0.5))
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- MENU: BODY.. / Type..
label TMMenuBodyType(human)
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
		TMBEPreset_Random(human)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-------------------------------------------------------------------------------------------------
-- PRESETS
-------------------------------------------------------------------------------------------------

-- Called from tm_main on character creation
function TMBEPreset_RandomStart(human)
	local randomPresets = {
		TMBEPreset_Skinny,
		TMBEPreset_Slim,
		TMBEPreset_Normal,
		--TMBEPreset_Curvy,
		--TMBEPreset_Obese,
	}
	(randomPresets[math.random(#randomPresets)] or TMBEPreset_Normal)(human)
end

-- Called from BodyEdit menu
function TMBEPreset_Random(human)
	local randomPresets = {
		TMBEPreset_Skinny,
		TMBEPreset_Slim,
		TMBEPreset_Normal,
		TMBEPreset_Curvy,
		TMBEPreset_Obese,
	}
	(randomPresets[math.random(#randomPresets)] or TMBEPreset_Normal)(human)
end

function TMBEPreset_Dildo(human)
	HumanClothes(human, false)
	TMBEPreset_Normal(human)
	TMB_PenisSize = TMBodyEdit(human,TMBE_PenisSize, 8)
	TMB_BodySize = TMBodyEdit(human, -0.9)
	HumanReset(human)
end

function TMBEPreset_Obese(human)
	TMB_NeckSize = TMBodyEdit(human,TMBE_Neck, 0.2)
	TMB_ForearmSize = TMBodyEdit(human,TMBE_Forearms, 0.2)
	TMB_UperArmsize = TMBodyEdit(human,TMBE_Upperarms, 0.4)
	TMB_CalfSize = TMBodyEdit(human,TMBE_Calf, 0.2)
	TMB_ThighSize = TMBodyEdit(human,TMBE_Thigh, 0.2)
	TMB_HipsSize = TMBodyEdit(human,TMBE_Hips, 0.8)
	TMB_WaistSize = TMBodyEdit(human,TMBE_Waist, 0.8)
	TMB_AssSize = TMBodyEdit(human,TMBE_Ass, 2)
	TMB_NipplesSize = TMBodyEdit(human,TMBE_Nipples, 0)
	TMB_BreastSize = TMBodyEdit(human,TMBE_Breasts, 0.7)
	-- TMB_PenisLength = TMBodyEdit(human,TMBE_PenisLen, 0)
	-- TMB_PenisSize = TMBodyEdit(human,TMBE_PenisSize, 0)
	TMB_MuscleSize = TMBodyEdit(human,TMBE_Muscle, -0.3)
	-- TMB_BodySize = TMBodyEdit(human, 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Curvy(human)
	TMB_NeckSize = TMBodyEdit(human,TMBE_Neck, 0.1)
	TMB_ForearmSize = TMBodyEdit(human,TMBE_Forearms, 0.1)
	TMB_UperArmsize = TMBodyEdit(human,TMBE_Upperarms, 0.2)
	TMB_CalfSize = TMBodyEdit(human,TMBE_Calf, 0.1)
	TMB_ThighSize = TMBodyEdit(human,TMBE_Thigh, 0.1)
	TMB_HipsSize = TMBodyEdit(human,TMBE_Hips, 0.4)
	TMB_WaistSize = TMBodyEdit(human,TMBE_Waist, 0.4)
	TMB_AssSize = TMBodyEdit(human,TMBE_Ass, 1)
	TMB_NipplesSize = TMBodyEdit(human,TMBE_Nipples, 0)
	TMB_BreastSize = TMBodyEdit(human,TMBE_Breasts, 0.3)
	-- TMB_PenisLength = TMBodyEdit(human,TMBE_PenisLen, 0)
	-- TMB_PenisSize = TMBodyEdit(human,TMBE_PenisSize, 0)
	TMB_MuscleSize = TMBodyEdit(human,TMBE_Muscle, -0.2)
	-- TMB_BodySize = TMBodyEdit(human, 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Normal(human)
	TMB_NeckSize = TMBodyEdit(human,TMBE_Neck, 0)
	TMB_ForearmSize = TMBodyEdit(human,TMBE_Forearms, 0)
	TMB_UperArmsize = TMBodyEdit(human,TMBE_Upperarms, 0)
	TMB_CalfSize = TMBodyEdit(human,TMBE_Calf, 0)
	TMB_ThighSize = TMBodyEdit(human,TMBE_Thigh, 0)
	TMB_HipsSize = TMBodyEdit(human,TMBE_Hips, 0)
	TMB_WaistSize = TMBodyEdit(human,TMBE_Waist, 0)
	TMB_AssSize = TMBodyEdit(human,TMBE_Ass, 0)
	TMB_NipplesSize = TMBodyEdit(human,TMBE_Nipples, 0)
	TMB_BreastSize = TMBodyEdit(human,TMBE_Breasts, 0)
	-- TMB_PenisLength = TMBodyEdit(human,TMBE_PenisLen, 0)
	-- TMB_PenisSize = TMBodyEdit(human,TMBE_PenisSize, 0)
	TMB_MuscleSize = TMBodyEdit(human,TMBE_Muscle, 0)
	-- TMB_BodySize = TMBodyEdit(human, 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Slim(human)
	TMB_NeckSize = TMBodyEdit(human, TMBE_Neck, 0)
	TMB_ForearmSize = TMBodyEdit(human, TMBE_Forearms, -0.05)
	TMB_UperArmsize = TMBodyEdit(human, TMBE_Upperarms, -0.05)
	TMB_CalfSize = TMBodyEdit(human, TMBE_Calf, -0.05)
	TMB_ThighSize = TMBodyEdit(human, TMBE_Thigh, -0.1)
	TMB_HipsSize = TMBodyEdit(human, TMBE_Hips, -0.1)
	TMB_WaistSize = TMBodyEdit(human, TMBE_Waist, 0)
	TMB_AssSize = TMBodyEdit(human, TMBE_Ass, -0.5)
	TMB_NipplesSize = TMBodyEdit(human, TMBE_Nipples, 0)
	TMB_BreastSize = TMBodyEdit(human, TMBE_Breasts, -0.5)
	-- TMB_PenisLength = TMBodyEdit(human,TMBE_PenisLen, 0)
	-- TMB_PenisSize = TMBodyEdit(human,TMBE_PenisSize, 0)
	TMB_MuscleSize = TMBodyEdit(human, TMBE_Muscle, 0.2)
	-- TMB_BodySize = TMBodyEdit(human, 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Skinny(human)
	TMB_NeckSize = TMBodyEdit(human,TMBE_Neck, 0)
	TMB_ForearmSize = TMBodyEdit(human,TMBE_Forearms, -0.1)
	TMB_UperArmsize = TMBodyEdit(human,TMBE_Upperarms, -0.1)
	TMB_CalfSize = TMBodyEdit(human,TMBE_Calf, -0.1)
	TMB_ThighSize = TMBodyEdit(human,TMBE_Thigh, -0.2)
	TMB_HipsSize = TMBodyEdit(human,TMBE_Hips, -0.2)
	TMB_WaistSize = TMBodyEdit(human,TMBE_Waist, 0)
	TMB_AssSize = TMBodyEdit(human,TMBE_Ass, -1)
	TMB_NipplesSize = TMBodyEdit(human,TMBE_Nipples, 0)
	TMB_BreastSize = TMBodyEdit(human,TMBE_Breasts, -0.8)
	-- TMB_PenisLength = TMBodyEdit(human,TMBE_PenisLen, 0)
	-- TMB_PenisSize = TMBodyEdit(human,TMBE_PenisSize, 0)
	TMB_MuscleSize = TMBodyEdit(human,TMBE_Muscle, 0.3)
	-- TMB_BodySize = TMBodyEdit(human, 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Reset(human)
	TMB_NeckSize = TMBodyEdit(human,TMBE_Neck, 0)
	TMB_ForearmSize = TMBodyEdit(human,TMBE_Forearms, 0)
	TMB_UperArmsize = TMBodyEdit(human,TMBE_Upperarms, 0)
	TMB_CalfSize = TMBodyEdit(human,TMBE_Calf, 0)
	TMB_ThighSize = TMBodyEdit(human,TMBE_Thigh, 0)
	TMB_HipsSize = TMBodyEdit(human,TMBE_Hips, 0)
	TMB_WaistSize = TMBodyEdit(human,TMBE_Waist, 0)
	TMB_AssSize = TMBodyEdit(human,TMBE_Ass, 0)
	TMB_NipplesSize = TMBodyEdit(human,TMBE_Nipples, 0)
	TMB_BreastSize = TMBodyEdit(human,TMBE_Breasts, 0)
	TMB_PenisLength = TMBodyEdit(human,TMBE_PenisLength, 0)
	TMB_PenisSize = TMBodyEdit(human,TMBE_PenisSize, 0)
	TMB_MuscleSize = TMBodyEdit(human,TMBE_Muscle, 0)
	TMB_BodySize = TMBodyEdit(human, 0)
	human.Penis.m_penisSkinOut = 0
end