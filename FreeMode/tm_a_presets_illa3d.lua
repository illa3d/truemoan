-------------------------------------------------------------------------------------------------
-- BODY PRESET VALUES
-- WARNING: Breasts values below -0.8 can crash the game
-------------------------------------------------------------------------------------------------

function EditPreset_Fat(human)
	necksize = EditSet(human,"Neck size", 0.2)
	forearmsize = EditSet(human,"Forearms size", 0.2)
	uperarmsize = EditSet(human,"Upper arms size", 0.4)
	calfsize = EditSet(human,"Calf size", 0.2)
	thighsize = EditSet(human,"Thigh size", 0.2)
	hipssize = EditSet(human,"Hips size", 0.8)
	waistsize = EditSet(human,"Waist size", 0.8)
	asssize = EditSet(human,"Ass size", 2)
	nipplesize = EditSet(human,"Nipples size", 0)
	breastsize = EditSet(human,"Breasts size", 0.7)
	-- penislength = EditSet(human,"Penis length", 0)
	-- penissize = EditSet(human,"Penis size", 0)
	musclesize = EditSet(human,"Muscle tone", 0)
	-- bodysize = EditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end

function EditPreset_Normal(human)
	necksize = EditSet(human,"Neck size", 0)
	forearmsize = EditSet(human,"Forearms size", 0)
	uperarmsize = EditSet(human,"Upper arms size", 0)
	calfsize = EditSet(human,"Calf size", 0)
	thighsize = EditSet(human,"Thigh size", 0)
	hipssize = EditSet(human,"Hips size", 0)
	waistsize = EditSet(human,"Waist size", 0)
	asssize = EditSet(human,"Ass size", 0)
	nipplesize = EditSet(human,"Nipples size", 0)
	breastsize = EditSet(human,"Breasts size", 0)
	-- penislength = EditSet(human,"Penis length", 0)
	-- penissize = EditSet(human,"Penis size", 0)
	musclesize = EditSet(human,"Muscle tone", 0)
	-- bodysize = EditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end

function EditPreset_Slim(human)
	necksize = EditSet(human,"Neck size", 0)
	forearmsize = EditSet(human,"Forearms size", -0.05)
	uperarmsize = EditSet(human,"Upper arms size", -0.05)
	calfsize = EditSet(human,"Calf size", -0.05)
	thighsize = EditSet(human,"Thigh size", -0.1)
	hipssize = EditSet(human,"Hips size", -0.2)
	waistsize = EditSet(human,"Waist size", 0)
	asssize = EditSet(human,"Ass size", -1)
	nipplesize = EditSet(human,"Nipples size", 0)
	breastsize = EditSet(human,"Breasts size", -0.8)
	-- penislength = EditSet(human,"Penis length", 0)
	-- penissize = EditSet(human,"Penis size", 0)
	musclesize = EditSet(human,"Muscle tone", 0)
	-- bodysize = EditSet(human,"Body size", 0)
	human.Penis.m_penisSkinOut = 0
end