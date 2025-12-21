-------------------------------------------------------------------------------------------------
-- BODY PRESET VALUES
-- WARNING: Breasts values below -0.8 can crash the game
-------------------------------------------------------------------------------------------------

-- MENU
label TMMenuBodyPreset(human)
	+ "Obese"
		EditPreset_Obese(human)
		Return()
	+ "Curvy"
		EditPreset_Curvy(human)
		Return()
	+ "Normal"
		EditPreset_Normal(human)
		Return()
	+ "Slim"
		EditPreset_Slim(human)
		Return()
	+ "Skinny"
		EditPreset_Skinny(human)
		Return()
	+ MenuBack
		Return(2)
	+ MenuClose
stop

-- PRESETS
function EditPreset_Obese(human)
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

function EditPreset_Curvy(human)
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

function EditPreset_Normal(human)
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

function EditPreset_Slim(human)
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

function EditPreset_Skinny(human)
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