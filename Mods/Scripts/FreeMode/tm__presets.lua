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
		tmBodySize = TMBodyEditSize(human, 0.7)
		Return()
	+ "• Huge"
		tmBodySize = TMBodyEditSize(human, 0.15)
		Return()
	+ "• Big"
		tmBodySize = TMBodyEditSize(human, 0.075)
		Return()
	+ "• Normal" [gold]
		tmBodySize = TMBodyEditSize(human, 0)
		Return()
	+ "• Medium"
		tmBodySize = TMBodyEditSize(human, -0.075)
		Return()
	+ "• Small"
		tmBodySize = TMBodyEditSize(human, -0.15)
		Return()
	+ "• Tiny"
		tmBodySize = TMBodyEditSize(human, -0.7)
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
	+ "Random"
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
	tmPenisSize = TMBodyEdit(human,TMBE_PenisSize, 8)
	tmBodySize = TMBodyEdit(human, -0.9)
	HumanReset(human)
end

function TMBEPreset_Obese(human)
	tmNeckSize = TMBodyEdit(human,TMBE_Neck, 0.2)
	tmForearmSize = TMBodyEdit(human,TMBE_Forearms, 0.2)
	tmUperArmsize = TMBodyEdit(human,TMBE_Upperarms, 0.4)
	tmCalfSize = TMBodyEdit(human,TMBE_Calf, 0.2)
	tmThighSize = TMBodyEdit(human,TMBE_Thigh, 0.2)
	tmHipsSize = TMBodyEdit(human,TMBE_Hips, 0.8)
	tmWaistSize = TMBodyEdit(human,TMBE_Waist, 0.8)
	tmAssSize = TMBodyEdit(human,TMBE_Ass, 2)
	tmNipplesSize = TMBodyEdit(human,TMBE_Nipples, 0)
	tmBreastSize = TMBodyEdit(human,TMBE_Breasts, 0.7)
	-- tmPenisLength = TMBodyEdit(human,TMBE_PenisLen, 0)
	-- tmPenisSize = TMBodyEdit(human,TMBE_PenisSize, 0)
	tmMuscleSize = TMBodyEdit(human,TMBE_Muscle, -0.3)
	-- tmBodySize = TMBodyEdit(human, 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Curvy(human)
	tmNeckSize = TMBodyEdit(human,TMBE_Neck, 0.1)
	tmForearmSize = TMBodyEdit(human,TMBE_Forearms, 0.1)
	tmUperArmsize = TMBodyEdit(human,TMBE_Upperarms, 0.2)
	tmCalfSize = TMBodyEdit(human,TMBE_Calf, 0.1)
	tmThighSize = TMBodyEdit(human,TMBE_Thigh, 0.1)
	tmHipsSize = TMBodyEdit(human,TMBE_Hips, 0.4)
	tmWaistSize = TMBodyEdit(human,TMBE_Waist, 0.4)
	tmAssSize = TMBodyEdit(human,TMBE_Ass, 1)
	tmNipplesSize = TMBodyEdit(human,TMBE_Nipples, 0)
	tmBreastSize = TMBodyEdit(human,TMBE_Breasts, 0.3)
	-- tmPenisLength = TMBodyEdit(human,TMBE_PenisLen, 0)
	-- tmPenisSize = TMBodyEdit(human,TMBE_PenisSize, 0)
	tmMuscleSize = TMBodyEdit(human,TMBE_Muscle, -0.2)
	-- tmBodySize = TMBodyEdit(human, 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Normal(human)
	tmNeckSize = TMBodyEdit(human,TMBE_Neck, 0)
	tmForearmSize = TMBodyEdit(human,TMBE_Forearms, 0)
	tmUperArmsize = TMBodyEdit(human,TMBE_Upperarms, 0)
	tmCalfSize = TMBodyEdit(human,TMBE_Calf, 0)
	tmThighSize = TMBodyEdit(human,TMBE_Thigh, 0)
	tmHipsSize = TMBodyEdit(human,TMBE_Hips, 0)
	tmWaistSize = TMBodyEdit(human,TMBE_Waist, 0)
	tmAssSize = TMBodyEdit(human,TMBE_Ass, 0)
	tmNipplesSize = TMBodyEdit(human,TMBE_Nipples, 0)
	tmBreastSize = TMBodyEdit(human,TMBE_Breasts, 0)
	-- tmPenisLength = TMBodyEdit(human,TMBE_PenisLen, 0)
	-- tmPenisSize = TMBodyEdit(human,TMBE_PenisSize, 0)
	tmMuscleSize = TMBodyEdit(human,TMBE_Muscle, 0)
	-- tmBodySize = TMBodyEdit(human, 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Slim(human)
	tmNeckSize = TMBodyEdit(human, TMBE_Neck, 0)
	tmForearmSize = TMBodyEdit(human, TMBE_Forearms, -0.05)
	tmUperArmsize = TMBodyEdit(human, TMBE_Upperarms, -0.05)
	tmCalfSize = TMBodyEdit(human, TMBE_Calf, -0.05)
	tmThighSize = TMBodyEdit(human, TMBE_Thigh, -0.1)
	tmHipsSize = TMBodyEdit(human, TMBE_Hips, -0.1)
	tmWaistSize = TMBodyEdit(human, TMBE_Waist, 0)
	tmAssSize = TMBodyEdit(human, TMBE_Ass, -0.5)
	tmNipplesSize = TMBodyEdit(human, TMBE_Nipples, 0)
	tmBreastSize = TMBodyEdit(human, TMBE_Breasts, -0.5)
	-- tmPenisLength = TMBodyEdit(human,TMBE_PenisLen, 0)
	-- tmPenisSize = TMBodyEdit(human,TMBE_PenisSize, 0)
	tmMuscleSize = TMBodyEdit(human, TMBE_Muscle, 0.2)
	-- tmBodySize = TMBodyEdit(human, 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Skinny(human)
	tmNeckSize = TMBodyEdit(human,TMBE_Neck, 0)
	tmForearmSize = TMBodyEdit(human,TMBE_Forearms, -0.1)
	tmUperArmsize = TMBodyEdit(human,TMBE_Upperarms, -0.1)
	tmCalfSize = TMBodyEdit(human,TMBE_Calf, -0.1)
	tmThighSize = TMBodyEdit(human,TMBE_Thigh, -0.2)
	tmHipsSize = TMBodyEdit(human,TMBE_Hips, -0.2)
	tmWaistSize = TMBodyEdit(human,TMBE_Waist, 0)
	tmAssSize = TMBodyEdit(human,TMBE_Ass, -1)
	tmNipplesSize = TMBodyEdit(human,TMBE_Nipples, 0)
	tmBreastSize = TMBodyEdit(human,TMBE_Breasts, -0.8)
	-- tmPenisLength = TMBodyEdit(human,TMBE_PenisLen, 0)
	-- tmPenisSize = TMBodyEdit(human,TMBE_PenisSize, 0)
	tmMuscleSize = TMBodyEdit(human,TMBE_Muscle, 0.3)
	-- tmBodySize = TMBodyEdit(human, 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Reset(human)
	tmNeckSize = TMBodyEdit(human,TMBE_Neck, 0)
	tmForearmSize = TMBodyEdit(human,TMBE_Forearms, 0)
	tmUperArmsize = TMBodyEdit(human,TMBE_Upperarms, 0)
	tmCalfSize = TMBodyEdit(human,TMBE_Calf, 0)
	tmThighSize = TMBodyEdit(human,TMBE_Thigh, 0)
	tmHipsSize = TMBodyEdit(human,TMBE_Hips, 0)
	tmWaistSize = TMBodyEdit(human,TMBE_Waist, 0)
	tmAssSize = TMBodyEdit(human,TMBE_Ass, 0)
	tmNipplesSize = TMBodyEdit(human,TMBE_Nipples, 0)
	tmBreastSize = TMBodyEdit(human,TMBE_Breasts, 0)
	tmPenisLength = TMBodyEdit(human,TMBE_PenisLength, 0)
	tmPenisSize = TMBodyEdit(human,TMBE_PenisSize, 0)
	tmMuscleSize = TMBodyEdit(human,TMBE_Muscle, 0)
	tmBodySize = TMBodyEdit(human, 0)
	human.Penis.m_penisSkinOut = 0
end