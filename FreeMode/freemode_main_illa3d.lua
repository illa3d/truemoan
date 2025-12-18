-- TrueMoan v0.6 by illa3d

-- Music
tracklist = {"01_Dreamy_Whisper", "02_Moon-blind", "03_OpenMeBabe", "04_What_an_Easy_Good-bye", "05_Somtimes", "06_Love_in_Fareast", "07_Tender_Passion", "08_Orbit", "09_Dancing_Queen", "10_Memories_of_Childhood", "11_Raggae_Fever", "12_Why", "13_Comma", "14_NoWar", "15_Special_Light", "16_Enjoy_Yaslef", "17_Lyve_Live", "18_Aquabelle", "19_1st_Mission", "20_Time_to_Groove", "21_Love_is_Bubble", "22_Flower_Bearing", "23_Secret_Garden_Before", "24_X-ray", "25_CallousCall", "26_Order_Circle", "27_This_is_My_Stage", "28_Wait_4_U", "29_Welcome_to_Radux_World", "30_Journey_to_You"}
-- Sex Variables
sexspeedmin = 0.001
sexspeedmax = 2
wetstep = 200
-- Moan Tier tresholds by speed (0-2)
climaxtreshold = 1.3
orgasmtreshold = 0.9
fastertreshold = 0.6
fasttreshold = 0.3
normaltreshold = 0.1
-- Edit Body Increments
sizestep03 = 0.3 -- nipples
sizestep01 = 0.1 -- hip, waist, ass, breast, muscle
sizestep005 = 0.05 -- neck, forearm, upperarm, calf, thigh, penis-length, penis-size
sizestep002 = 0.02 -- body
-- Variables
moaning = true
cumevery = 0
necksize = 0
forearmsize = 0
uperarmsize = 0
calfsize = 0
thighsize = 0
waistsize = 0
hipssize = 0
asssize = 0
nipplesize = 0
breastssize = 0
penissize = 0
penislength = 0
musclesize = 0
bodysize = 0

-----------------------------------------------------------------------------------------------
-- freemode_main.lua function overrides
-- happens automagically because latest file containing the function with same name is executed
-----------------------------------------------------------------------------------------------

function OnFluidHit(hitActor, bodyArea, shootActor)
	if hitActor == shootActor or shootActor == nil then return end

	local timerKey = "FluidHit_" .. hitActor.Name .. bodyArea
	local lastHitTime = Timer(timerKey)

	if bodyArea == "L_Eye" and lastHitTime > 1 then 
		if game.FluidReaction == true then
			hitActor.SayCustom("gen_moan_faster")
		end
		hitActor.AddInvoluntaryAnim("L_Eye_HitClose", 1, 0.7, 0.7, EyelidL(1))
		ResetTimer(timerKey)
	elseif bodyArea == "R_Eye" and lastHitTime > 1 then 
		if game.FluidReaction == true then
			hitActor.SayCustom("gen_moan_faster")
		end
		hitActor.AddInvoluntaryAnim("R_Eye_HitClose", 1, 0.7, 0.7, EyelidR(1))
		ResetTimer(timerKey)
	elseif bodyArea == "Lips" and lastHitTime > 1 then 
		if game.FluidReaction == true then
			hitActor.SayCustom("gen_moan_fast")
		end
		hitActor.AddInvoluntaryAnim("OpenMouth", 5, 0.4, 0.4, Mouth(-0.83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.73, 0, 0.39))
		Delayed(1, function()
			hitActor.Swallow()
		end)
		ResetTimer(timerKey)
	else
		local genericVoiceKey = "FluidHit_Generic_" .. hitActor.Name
		local lastGenericVoiceTime = Timer(genericVoiceKey)
		if lastGenericVoiceTime > 500 and game.FluidReaction == true then
			hitActor.SayCustom("gen_cumshot")
			hitActor.Say(hitActor.FaceMood >= 0 and "Like" or "Dislike")
			ResetTimer(genericVoiceKey)
		end
		if lastHitTime > 3 and game.FluidReaction == true then
			hitActor.SayCustom("gen_moan_slow")
			ResetTimer(timerKey)
		end
	end
end

function OnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
	if inVelocity < outVelocity or moaning == false then return end

	-- Variables
	local key = "PenetrationMoan_" .. girl.Name .. holeName
	local lastMoanTime = Timer(key)
	local tier = ""
	local pauseMax = 0
	local tierMin = 0
	local tierMax = 0

	-- Tier selection + boundary detection
	if inVelocity > climaxtreshold then
		tier = "climax"
		pauseMax = 0.1 -- Audio files: ~0.3s + pause
		tierMax = climaxtreshold + 1
		tierMin = climaxtreshold
	elseif inVelocity > orgasmtreshold then
		tier = "orgasm"
		pauseMax = 0.4 -- Audio files: ~0.4s + pause
		tierMax = climaxtreshold
		tierMin = orgasmtreshold
	elseif inVelocity > fastertreshold then
		tier = "faster"
		pauseMax = 0.5 -- Audio files: ~0.5s + pause
		tierMax = orgasmtreshold
		tierMin = fastertreshold
	elseif inVelocity > fasttreshold then
		tier = "fast"
		pauseMax = 0.6 -- Audio files: ~0.5s + pause
		tierMax = fastertreshold
		tierMin = fasttreshold
	elseif inVelocity > normaltreshold then
		tier = "normal"
		pauseMax = 1.3 -- Audio files: ~0.8s + pause
		tierMax = fasttreshold
		tierMin = normaltreshold
	else
		tier = "slow"
		pauseMax = 10.0 -- VERY long pauses when not moving
		tierMax = normaltreshold
		tierMin = 0.0
	end

	-- Organic Speed-based pause scaling: longer to zero near tier end
	local t = (inVelocity - tierMin) / (tierMax - tierMin)
	t = math.max(0, math.min(t, 1))
	local cooldown = pauseMax * (1 - t)
	-- Small randomness to avoid mechanical timing
	if tier == "climax" or tier == "orgasm" then 
		cooldown = 0.02
	else
		cooldown = cooldown + math.random() * 0.05
	end

	-- Play
	if lastMoanTime > cooldown then
		girl.SayCustom(girl.Name .. "_moan_" .. tier)
		girl.SayCustom("gen_moan_" .. tier)
		ResetTimer(key)
	end
end