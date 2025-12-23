-- TrueMoan v1.0 by illa3d
-- Menu in: tm_menu_body.lua
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

function TMBodyEditSet(human, bodypart, value)
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
	human.Body("Neck size", tmNeckSize)
	human.Body("Forearms size", tmForearmSize)
	human.Body("Upper arms size", tmUperArmsize)
	human.Body("Calf size", tmCalfSize)
	human.Body("Thigh size", tmThighSize)
	human.Body("Hips size", tmHipsSize)
	human.Body("Waist size", tmWaistSize)
	human.Body("Ass size", tmAssSize)
	human.Body("Nipples size", tmNipplesSize)
	human.Body("Breasts size", tmBreastSize)
	human.Body("Penis length", tmPenisLength)
	human.Body("Penis size", tmPenisSize)
	human.Body("Muscle tone", tmMuscleSize)
	human.Body("Body size", tmBodySize)
	human.Penis.m_penisSkinOut = 0
end