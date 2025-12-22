-- TrueMoan v0.8 by illa3d
-- Menu in: tm_menu_body.lua
-- Edit Body Variables
necksize = 0
forearmsize = 0
uperarmsize = 0
calfsize = 0
thighsize = 0
waistsize = 0
hipssize = 0
asssize = 0
nipplesize = 0
breastsize = 0
penissize = 0
penislength = 0
musclesize = 0
bodysize = 0

function BodyEditUp(human, bodypart, value, step, valuemax, valuesafe)
	local mult = 1 + math.floor(math.abs(value) / 2) -- step function to multiply step for bigger values
	value = value + step * mult
	if BodyEditSafe and valuesafe ~= nil and valuesafe ~= 0 and value > valuesafe then 
		value = valuesafe
	elseif value > valuemax then
		value = valuemax
	end
	human.Body(bodypart, value)
	return value
end

function BodyEditDown(human, bodypart, value, step, valuemin, valuesafe)
	local mult = 1 + math.floor(math.abs(value) / 2) -- step function to multiply step for bigger values
	value = value - step * mult
	if BodyEditSafe and valuesafe ~= nil and valuesafe ~= 0 and value < valuesafe then 
		value = valuesafe
	elseif value < valuemin then
		value = valuemin
	end
	human.Body(bodypart, value)
	return value
end

function BodyEditSet(human, bodypart, value)
	human.Body(bodypart, value)
	return value
end

function BodyEditResetValues()
	necksize = 0
	forearmsize = 0
	uperarmsize = 0
	calfsize = 0
	thighsize = 0
	hipssize = 0
	waistsize = 0
	asssize = 0
	nipplesize = 0
	breastsize = 0
	penislength = 0
	penissize = 0
	musclesize = 0
	bodysize = 0
end

function BodyEditApplyValues(human)
	human.Body("Neck size", necksize)
	human.Body("Forearms size", forearmsize)
	human.Body("Upper arms size", uperarmsize)
	human.Body("Calf size", calfsize)
	human.Body("Thigh size", thighsize)
	human.Body("Hips size", hipssize)
	human.Body("Waist size", waistsize)
	human.Body("Ass size", asssize)
	human.Body("Nipples size", nipplesize)
	human.Body("Breasts size", breastsize)
	human.Body("Penis length", penislength)
	human.Body("Penis size", penissize)
	human.Body("Muscle tone", musclesize)
	human.Body("Body size", bodysize)
	human.Penis.m_penisSkinOut = 0
end