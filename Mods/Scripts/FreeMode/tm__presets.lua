-------------------------------------------------------------------------------------------------
-- PRESETS for True Moan Body Edit (TMBE)
-- WARNING:
-- Breasts values below -0.8 can crash the game on some characters
-- Body values below -0.9 crash the game
-------------------------------------------------------------------------------------------------

-- MENU: BODY.. / Size..
label TMMenuBodySize(human)
	+ "• Fairy Dildo" [if human.Penis.IsActive] [gold]
		human "Wtf is this, I feel funny... Weeeeee!\n(Sweet idea @void.branding)"
		TMBEPreset_Dildo(human)	
		Return()
	+ "• Giant"
		tmBodySize = TMBodyEditSet(human,"Body size", 0.7)
		Return()
	+ "• Huge"
		tmBodySize = TMBodyEditSet(human,"Body size", 0.15)
		Return()
	+ "• Big"
		tmBodySize = TMBodyEditSet(human,"Body size", 0.075)
		Return()
	+ "• Normal" [gold]
		tmBodySize = TMBodyEditSet(human,"Body size", 0)
		Return()
	+ "• Medium"
		tmBodySize = TMBodyEditSet(human,"Body size", -0.075)
		Return()
	+ "• Small"
		tmBodySize = TMBodyEditSet(human,"Body size", -0.15)
		Return()
	+ "• Tiny"
		tmBodySize = TMBodyEditSet(human,"Body size", -0.7)
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
	ShowClothes(human, false)
	TMBEPreset_Normal(human)
	tmPenisSize = TMBodyEditSet(human,"Penis size", 8)
	tmBodySize = TMBodyEditSet(human,"Body size", -0.9)
	ResetHuman(human)
end

function TMBEPreset_Obese(human)
	tmNeckSize = TMBodyEditSet(human,"Neck size", 0.2)
	tmForearmSize = TMBodyEditSet(human,"Forearms size", 0.2)
	tmUperArmsize = TMBodyEditSet(human,"Upper arms size", 0.4)
	tmCalfSize = TMBodyEditSet(human,"Calf size", 0.2)
	tmThighSize = TMBodyEditSet(human,"Thigh size", 0.2)
	tmHipsSize = TMBodyEditSet(human,"Hips size", 0.8)
	tmWaistSize = TMBodyEditSet(human,"Waist size", 0.8)
	tmAssSize = TMBodyEditSet(human,"Ass size", 2)
	tmNipplesSize = TMBodyEditSet(human,"Nipples size", 0)
	tmBreastSize = TMBodyEditSet(human,"Breasts size", 0.7)
	-- penislength = BodyEditSet(human,"Penis length", 0)
	-- penissize = BodyEditSet(human,"Penis size", 0)
	tmMuscleSize = TMBodyEditSet(human,"Muscle tone", -0.3)
	-- bodysize = BodyEditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Curvy(human)
	tmNeckSize = TMBodyEditSet(human,"Neck size", 0.1)
	tmForearmSize = TMBodyEditSet(human,"Forearms size", 0.1)
	tmUperArmsize = TMBodyEditSet(human,"Upper arms size", 0.2)
	tmCalfSize = TMBodyEditSet(human,"Calf size", 0.1)
	tmThighSize = TMBodyEditSet(human,"Thigh size", 0.1)
	tmHipsSize = TMBodyEditSet(human,"Hips size", 0.4)
	tmWaistSize = TMBodyEditSet(human,"Waist size", 0.4)
	tmAssSize = TMBodyEditSet(human,"Ass size", 1)
	tmNipplesSize = TMBodyEditSet(human,"Nipples size", 0)
	tmBreastSize = TMBodyEditSet(human,"Breasts size", 0.3)
	-- penislength = BodyEditSet(human,"Penis length", 0)
	-- penissize = BodyEditSet(human,"Penis size", 0)
	tmMuscleSize = TMBodyEditSet(human,"Muscle tone", -0.2)
	-- bodysize = BodyEditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Normal(human)
	tmNeckSize = TMBodyEditSet(human,"Neck size", 0)
	tmForearmSize = TMBodyEditSet(human,"Forearms size", 0)
	tmUperArmsize = TMBodyEditSet(human,"Upper arms size", 0)
	tmCalfSize = TMBodyEditSet(human,"Calf size", 0)
	tmThighSize = TMBodyEditSet(human,"Thigh size", 0)
	tmHipsSize = TMBodyEditSet(human,"Hips size", 0)
	tmWaistSize = TMBodyEditSet(human,"Waist size", 0)
	tmAssSize = TMBodyEditSet(human,"Ass size", 0)
	tmNipplesSize = TMBodyEditSet(human,"Nipples size", 0)
	tmBreastSize = TMBodyEditSet(human,"Breasts size", 0)
	-- penislength = BodyEditSet(human,"Penis length", 0)
	-- penissize = BodyEditSet(human,"Penis size", 0)
	tmMuscleSize = TMBodyEditSet(human,"Muscle tone", 0)
	-- bodysize = BodyEditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Slim(human)
	tmNeckSize = TMBodyEditSet(human, "Neck size", 0)
	tmForearmSize = TMBodyEditSet(human, "Forearms size", -0.05)
	tmUperArmsize = TMBodyEditSet(human, "Upper arms size", -0.05)
	tmCalfSize = TMBodyEditSet(human, "Calf size", -0.05)
	tmThighSize = TMBodyEditSet(human, "Thigh size", -0.1)
	tmHipsSize = TMBodyEditSet(human, "Hips size", -0.1)
	tmWaistSize = TMBodyEditSet(human, "Waist size", 0)
	tmAssSize = TMBodyEditSet(human, "Ass size", -0.5)
	tmNipplesSize = TMBodyEditSet(human, "Nipples size", 0)
	tmBreastSize = TMBodyEditSet(human, "Breasts size", -0.5)
	-- penislength = BodyEditSet(human,"Penis length", 0)
	-- penissize = BodyEditSet(human,"Penis size", 0)
	tmMuscleSize = TMBodyEditSet(human, "Muscle tone", 0.2)
	-- bodysize = BodyEditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Skinny(human)
	tmNeckSize = TMBodyEditSet(human,"Neck size", 0)
	tmForearmSize = TMBodyEditSet(human,"Forearms size", -0.1)
	tmUperArmsize = TMBodyEditSet(human,"Upper arms size", -0.1)
	tmCalfSize = TMBodyEditSet(human,"Calf size", -0.1)
	tmThighSize = TMBodyEditSet(human,"Thigh size", -0.2)
	tmHipsSize = TMBodyEditSet(human,"Hips size", -0.2)
	tmWaistSize = TMBodyEditSet(human,"Waist size", 0)
	tmAssSize = TMBodyEditSet(human,"Ass size", -1)
	tmNipplesSize = TMBodyEditSet(human,"Nipples size", 0)
	tmBreastSize = TMBodyEditSet(human,"Breasts size", -0.8)
	-- penislength = BodyEditSet(human,"Penis length", 0)
	-- penissize = BodyEditSet(human,"Penis size", 0)
	tmMuscleSize = TMBodyEditSet(human,"Muscle tone", 0.3)
	-- bodysize = BodyEditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Reset(human)
	tmNeckSize = TMBodyEditSet(human,"Neck size", 0)
	tmForearmSize = TMBodyEditSet(human,"Forearms size", 0)
	tmUperArmsize = TMBodyEditSet(human,"Upper arms size", 0)
	tmCalfSize = TMBodyEditSet(human,"Calf size", 0)
	tmThighSize = TMBodyEditSet(human,"Thigh size", 0)
	tmHipsSize = TMBodyEditSet(human,"Hips size", 0)
	tmWaistSize = TMBodyEditSet(human,"Waist size", 0)
	tmAssSize = TMBodyEditSet(human,"Ass size", 0)
	tmNipplesSize = TMBodyEditSet(human,"Nipples size", 0)
	tmBreastSize = TMBodyEditSet(human,"Breasts size", 0)
	tmPenisLength = TMBodyEditSet(human,"Penis length", 0)
	tmPenisSize = TMBodyEditSet(human,"Penis size", 0)
	tmMuscleSize = TMBodyEditSet(human,"Muscle tone", 0)
	tmBodySize = TMBodyEditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end