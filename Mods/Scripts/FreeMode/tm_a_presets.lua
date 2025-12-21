-------------------------------------------------------------------------------------------------
-- PRESETS for True Moan Body Edit (TMBE)
-- WARNING: Breasts values below -0.8 can crash the game
-------------------------------------------------------------------------------------------------

-- MENU: BODY.. / Presets
label TMMenuBodyPreset(human)
	+ "Obese"
		TMBEPreset_Obese(human)
		Return()
	+ "Curvy"
		TMBEPreset_Curvy(human)
		Return()
	+ "Normal"
		TMBEPreset_Normal(human)
		Return()
	+ "Slim"
		TMBEPreset_Slim(human)
		Return()
	+ "Skinny"
		TMBEPreset_Skinny(human)
		Return()
	+ "Random!" [gold]
		TMBEPreset_Random(human)
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
	-- penislength = EditSet(human,"Penis length", 0)
	-- penissize = EditSet(human,"Penis size", 0)
	musclesize = BodyEditSet(human,"Muscle tone", 0)
	-- bodysize = EditSet(human,"Body size", 0)
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
	-- penislength = EditSet(human,"Penis length", 0)
	-- penissize = EditSet(human,"Penis size", 0)
	musclesize = BodyEditSet(human,"Muscle tone", 0)
	-- bodysize = EditSet(human,"Body size", 0)
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
	-- penislength = EditSet(human,"Penis length", 0)
	-- penissize = EditSet(human,"Penis size", 0)
	musclesize = BodyEditSet(human,"Muscle tone", 0)
	-- bodysize = EditSet(human,"Body size", 0)
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
	-- penislength = EditSet(human,"Penis length", 0)
	-- penissize = EditSet(human,"Penis size", 0)
	musclesize = BodyEditSet(human, "Muscle tone", 0)
	-- bodysize = EditSet(human,"Body size", 0)
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
	-- penislength = EditSet(human,"Penis length", 0)
	-- penissize = EditSet(human,"Penis size", 0)
	musclesize = BodyEditSet(human,"Muscle tone", 0)
	-- bodysize = EditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end