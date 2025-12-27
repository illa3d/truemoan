-- TrueMoan v1.3 by illa3d
-- Menu in: tm_menu_body.lua

-- Edit Body Definitions
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

-- Edit Body Variables
tmNeckSize = 0
tmForearmSize = 0
tmUperArmsize = 0
tmCalfSize = 0
tmThighSize = 0
tmWaistSize = 0
tmHipsSize = 0
tmAssSize = 0
tmNipplesSize = 0
tmBreastSize = 0
tmPenisSize = 0
tmPenisLength = 0
tmMuscleSize = 0
tmBodySize = 0

function TMBodyEditUp(human, bodypart, value, step, valuemax, valuesafe)
	local mult = 1 + math.floor(math.abs(value) / 2) -- step function to multiply step for bigger values
	value = value + step * mult
	if TM_BodyEditSafe and valuesafe ~= nil and valuesafe ~= 0 and value > valuesafe then 
		value = valuesafe
	elseif value > valuemax then
		value = valuemax
	end
	human.Body(bodypart, value)
	return value
end

function TMBodyEditDown(human, bodypart, value, step, valuemin, valuesafe)
	local mult = 1 + math.floor(math.abs(value) / 2) -- step function to multiply step for bigger values
	value = value - step * mult
	if TM_BodyEditSafe and valuesafe ~= nil and valuesafe ~= 0 and value < valuesafe then 
		value = valuesafe
	elseif value < valuemin then
		value = valuemin
	end
	human.Body(bodypart, value)
	return value
end

function TMBodyEditSize(human, value)
	human.Body(TMBE_Body, value)
	return value
end

function TMBodyEdit(human, bodypart, value)
	human.Body(bodypart, value)
	return value
end

function TMBodyEditResetValues()
	tmNeckSize = 0
	tmForearmSize = 0
	tmUperArmsize = 0
	tmCalfSize = 0
	tmThighSize = 0
	tmHipsSize = 0
	tmWaistSize = 0
	tmAssSize = 0
	tmNipplesSize = 0
	tmBreastSize = 0
	tmPenisLength = 0
	tmPenisSize = 0
	tmMuscleSize = 0
	tmBodySize = 0
end

function TMBodyEditApplyValues(human)
	human.Body(TMBE_Neck, tmNeckSize)
	human.Body(TMBE_Forearms, tmForearmSize)
	human.Body(TMBE_Upperarms, tmUperArmsize)
	human.Body(TMBE_Calf, tmCalfSize)
	human.Body(TMBE_Thigh, tmThighSize)
	human.Body(TMBE_Hips, tmHipsSize)
	human.Body(TMBE_Waist, tmWaistSize)
	human.Body(TMBE_Ass, tmAssSize)
	human.Body(TMBE_Nipples, tmNipplesSize)
	human.Body(TMBE_Breasts, tmBreastSize)
	human.Body(TMBE_PenisLen, tmPenisLength)
	human.Body(TMBE_PenisSize, tmPenisSize)
	human.Body(TMBE_Muscle, tmMuscleSize)
	human.Body(TMBE_Body, tmBodySize)
	human.Penis.m_penisSkinOut = 0
end