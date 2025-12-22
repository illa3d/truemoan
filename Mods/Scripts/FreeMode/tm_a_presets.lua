-------------------------------------------------------------------------------------------------
-- PRESETS for True Moan Body Edit (TMBE)
-- WARNING:
-- Breasts values below -0.8 can crash the game on some characters
-- Body values below -0.9 crash the game
-------------------------------------------------------------------------------------------------

-- MENU: BODY.. / Size..
label TMMenuBodySize(human)
	+ "Fairy Dildo"
		human "Wtf is this, I feel funny...\nSweet idea void.branding :)"
		ShowPenis(human, true)
		TMBEPreset_Dildo(human)
		ResetPose(human)
		Return()
	+ "5 Giant"
		bodysize = BodyEditSet(human,"Body size", 1)
		Return()
	+ "4 Huge"
		bodysize = BodyEditSet(human,"Body size", 0.5)
		Return()
	+ "3 Normal"
		bodysize = BodyEditSet(human,"Body size", 1)
		Return()
	+ "2 Small"
		bodysize = BodyEditSet(human,"Body size", -0.1)
		Return()
	+ "1 Fairy"
		bodysize = BodyEditSet(human,"Body size", -0.8)
		Return()
	+ "RESET Size" [gold]
		bodysize = BodyEditSet(human,"Body size", 0)
		Return()
	+ MenuBack
		Return(2)
	+ MenuClose
stop

-- MENU: BODY.. / Type..
label TMMenuBodyType(human)
	+ "5 Obese"
		TMBEPreset_Obese(human)
		Return()
	+ "4 Curvy"
		TMBEPreset_Curvy(human)
		Return()
	+ "3 Normal"
		TMBEPreset_Normal(human)
		Return()
	+ "2 Slim"
		TMBEPreset_Slim(human)
		Return()
	+ "1 Skinny"
		TMBEPreset_Skinny(human)
		Return()
	+ "Random" [gold]
		TMBEPreset_Random(human)
		Return()
	+ "RESET Type" [gold]
		TMBEPreset_Reset(human)
		Return()
	+ MenuBack
		Return(2)
	+ MenuClose
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
	necksize = BodyEditSet(human,"Neck size", 0)
	forearmsize = BodyEditSet(human,"Forearms size", 0)
	uperarmsize = BodyEditSet(human,"Upper arms size", 0)
	calfsize = BodyEditSet(human,"Calf size", 0)
	thighsize = BodyEditSet(human,"Thigh size", 0)
	hipssize = BodyEditSet(human,"Hips size", 0)
	waistsize = BodyEditSet(human,"Waist size", 0)
	asssize = BodyEditSet(human,"Ass size", 0)
	nipplesize = BodyEditSet(human,"Nipples size", 0)
	breastsize = BodyEditSet(human,"Breasts size", 0)
	penislength = BodyEditSet(human,"Penis length", 0)
	penissize = BodyEditSet(human,"Penis size", 8)
	musclesize = BodyEditSet(human,"Muscle tone", 0)
	bodysize = BodyEditSet(human,"Body size", -0.9)
	human.Customize("Penis", 1)
	human.Penis.m_penisSkinOut = 0
	ShowClothes(human, false)
end

function TMBEPreset_Obese(human)
	necksize = BodyEditSet(human,"Neck size", 0.2)
	forearmsize = BodyEditSet(human,"Forearms size", 0.2)
	uperarmsize = BodyEditSet(human,"Upper arms size", 0.4)
	calfsize = BodyEditSet(human,"Calf size", 0.2)
	thighsize = BodyEditSet(human,"Thigh size", 0.2)
	hipssize = BodyEditSet(human,"Hips size", 0.8)
	waistsize = BodyEditSet(human,"Waist size", 0.8)
	asssize = BodyEditSet(human,"Ass size", 2)
	nipplesize = BodyEditSet(human,"Nipples size", 0)
	breastsize = BodyEditSet(human,"Breasts size", 0.7)
	-- penislength = BodyEditSet(human,"Penis length", 0)
	-- penissize = BodyEditSet(human,"Penis size", 0)
	musclesize = BodyEditSet(human,"Muscle tone", 0)
	-- bodysize = BodyEditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Curvy(human)
	necksize = BodyEditSet(human,"Neck size", 0.1)
	forearmsize = BodyEditSet(human,"Forearms size", 0.1)
	uperarmsize = BodyEditSet(human,"Upper arms size", 0.2)
	calfsize = BodyEditSet(human,"Calf size", 0.1)
	thighsize = BodyEditSet(human,"Thigh size", 0.1)
	hipssize = BodyEditSet(human,"Hips size", 0.4)
	waistsize = BodyEditSet(human,"Waist size", 0.4)
	asssize = BodyEditSet(human,"Ass size", 1)
	nipplesize = BodyEditSet(human,"Nipples size", 0)
	breastsize = BodyEditSet(human,"Breasts size", 0.3)
	-- penislength = BodyEditSet(human,"Penis length", 0)
	-- penissize = BodyEditSet(human,"Penis size", 0)
	musclesize = BodyEditSet(human,"Muscle tone", 0)
	-- bodysize = BodyEditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Normal(human)
	necksize = BodyEditSet(human,"Neck size", 0)
	forearmsize = BodyEditSet(human,"Forearms size", 0)
	uperarmsize = BodyEditSet(human,"Upper arms size", 0)
	calfsize = BodyEditSet(human,"Calf size", 0)
	thighsize = BodyEditSet(human,"Thigh size", 0)
	hipssize = BodyEditSet(human,"Hips size", 0)
	waistsize = BodyEditSet(human,"Waist size", 0)
	asssize = BodyEditSet(human,"Ass size", 0)
	nipplesize = BodyEditSet(human,"Nipples size", 0)
	breastsize = BodyEditSet(human,"Breasts size", 0)
	-- penislength = BodyEditSet(human,"Penis length", 0)
	-- penissize = BodyEditSet(human,"Penis size", 0)
	musclesize = BodyEditSet(human,"Muscle tone", 0)
	-- bodysize = BodyEditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Slim(human)
	necksize = BodyEditSet(human, "Neck size", 0)
	forearmsize = BodyEditSet(human, "Forearms size", -0.05)
	uperarmsize = BodyEditSet(human, "Upper arms size", -0.05)
	calfsize = BodyEditSet(human, "Calf size", -0.05)
	thighsize = BodyEditSet(human, "Thigh size", -0.05)
	hipssize = BodyEditSet(human, "Hips size", -0.1)
	waistsize = BodyEditSet(human, "Waist size", 0)
	asssize = BodyEditSet(human, "Ass size", -0.5)
	nipplesize = BodyEditSet(human, "Nipples size", 0)
	breastsize = BodyEditSet(human, "Breasts size", -0.4)
	-- penislength = BodyEditSet(human,"Penis length", 0)
	-- penissize = BodyEditSet(human,"Penis size", 0)
	musclesize = BodyEditSet(human, "Muscle tone", 0)
	-- bodysize = BodyEditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Skinny(human)
	necksize = BodyEditSet(human,"Neck size", 0)
	forearmsize = BodyEditSet(human,"Forearms size", -0.1)
	uperarmsize = BodyEditSet(human,"Upper arms size", -0.1)
	calfsize = BodyEditSet(human,"Calf size", -0.1)
	thighsize = BodyEditSet(human,"Thigh size", -0.1)
	hipssize = BodyEditSet(human,"Hips size", -0.2)
	waistsize = BodyEditSet(human,"Waist size", 0)
	asssize = BodyEditSet(human,"Ass size", -1)
	nipplesize = BodyEditSet(human,"Nipples size", 0)
	breastsize = BodyEditSet(human,"Breasts size", -0.8)
	-- penislength = BodyEditSet(human,"Penis length", 0)
	-- penissize = BodyEditSet(human,"Penis size", 0)
	musclesize = BodyEditSet(human,"Muscle tone", 0)
	-- bodysize = BodyEditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end

function TMBEPreset_Reset(human)
	necksize = BodyEditSet(human,"Neck size", 0)
	forearmsize = BodyEditSet(human,"Forearms size", 0)
	uperarmsize = BodyEditSet(human,"Upper arms size", 0)
	calfsize = BodyEditSet(human,"Calf size", 0)
	thighsize = BodyEditSet(human,"Thigh size", 0)
	hipssize = BodyEditSet(human,"Hips size", 0)
	waistsize = BodyEditSet(human,"Waist size", 0)
	asssize = BodyEditSet(human,"Ass size", 0)
	nipplesize = BodyEditSet(human,"Nipples size", 0)
	breastsize = BodyEditSet(human,"Breasts size", 0)
	penislength = BodyEditSet(human,"Penis length", 0)
	penissize = BodyEditSet(human,"Penis size", 0)
	musclesize = BodyEditSet(human,"Muscle tone", 0)
	bodysize = BodyEditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end