-- TrueMoan v1.8 by illa3d
------------------------------------------------------------------------------------------------------------------
-- TRUE MOAN DEFAULTS CONFIG (Values changed in options reset after scene load, here you set that permanent)
------------------------------------------------------------------------------------------------------------------
--                              !!! REMEMBER TO BACKUP BEFORE UPDATING THE MOD !!!                              --
--     Some values will be added through time. If you just copy your backup, you might be losing on options!    --
------------------------------------------------------------------------------------------------------------------

-- Menu
TM_Menu_FaunaLabs = false			-- 1. Display Fauna labs Maoin Menu (if FaunaLABS is present)
TM_Menu_HideShowUI = false			-- 2. Display Show/hide UI option in Main Menu
TM_MenuBackButtonEvery = 20			-- 3. [10-20] After how many items back button appear in item lists

-- Sex Menu
TM_ShowSexStyleControl = true		-- 4. Show Thrust and Depth controls

-- Double click
TM_DoubleClickInOtherMods = false	-- 5. Allows double clicking in other mods (works only with TMMM stickied option)
TM_DoubleClickReset = true			-- 6. Reset character pose/activity/face/animations on double click
TM_DoubleClickUndress = true		-- 7. Take clothes off on double click
TM_DoubleClickMoan = true			-- 8. Moan on dobuleclick (doesn't work with VoiceMod)
TM_DoubleClickTime = 0.25			-- 9. [sec, 0.2-0.4] Time to register double click (0.25 = 250ms, 200-400ms is fine)

-- People
TM_SpawnNaked = false				-- 10. Characters naked when spawned / changing
TM_SpawnReset = false				-- 11. Characters reset when spawned / changing (no sucking lol)
TM_SpawnNoFuta = false				-- 12. Females spawn without penises (no sucking lol)
TM_SpawnRandomBody = false			-- 13. Randomizes body types on start (overwrites body sizes from saves/captures!!)
TM_SpawnAutoSexOn = true			-- 14. AutoSex on for everyone at spawn
TM_MoanSex = true					-- 15. Moaning during sex
TM_WetSex = true					-- 16. Moisting holes (vag, anus, mouth)
TM_Cumflate = true					-- 17. Allow belly inflation by cumming inside
TM_TweenSex = true					-- 18. Soft transitions on changing sex values (speed, thrust, depth)
TM_TweenTime = 1					-- 19. [0 = off, max 3] Time in seconds to transition between sex values (speed, thrust, depth)

-- Body Edit
TM_BodyEditSafe = true				-- 20. Turns on safe body editing using SafeMin values

-- SFX Ambience
TM_AllowAmbience = true				-- 21. Ambient sounds
TM_AmbienceVolume = 0.7				-- 22. [0-1] Ambient volume

-- AutoInteraction
TM_AutoSexTimeMin = 2				-- 23. [1-20] Auto Interaction minimum time to change parameter (speed, thrust, depth) 
TM_AutoSexTimeMax = 7				-- 24. [1-20] Auto Interaction maximum time to change parameter (speed, thrust, depth) 
TM_AutoSexSpeedDrift = 0.3			-- 25. [0-1] How close in percent will be next step for sex speed
TM_AutoSexThrustDrift = 0.2			-- 26. [0-1] How close in percent will be next step for sex thrust
TM_AutoSexWeightDrift = 0.1			-- 27. [0-1] How close in percent will be next step for sex weight (male female)
TM_AutoSexDepthStartDrift = 0.2		-- 28. [0-1] How close in percent will be next step for sex depth (start/end)
TM_AutoSexDepthEndDrift = 0.3		-- 29. [0-1] How close in percent will be next step for sex depth (start/end)
									-- setting values [24. - 28.] to zero turns them off

------------------------------------------------------------------------------------------------------------------
-- FINE TUNING
------------------------------------------------------------------------------------------------------------------

-- Body Edit Increments
TM_BodyStepA = 0.1		-- nipples hip, waist, muscle
TM_BodyStepB = 0.05		-- ass, penis-length, penis-size, forearm, upperarm, calf, thigh, neck
TM_BodyStepC = 0.025	-- breast, body

TM_SexSpeedStep = 0.05	-- non-linear percent (increments: slow = small, fast = big)
TM_SexMaleStep = 0.05	-- giver/getter, linear percent (of UI slider)
TM_SexThrustStep = 0.05	-- easier/harder, linear percent (of UI slider)
TM_SexDepthStep = 0.05	-- shallow/deep, linear percent (of UI slider)

-- Sex speed (Min: 0.001, Max: 2)
TM_SexSpeedMax = 2
TM_SexSpeedFast = 0.9
TM_SexSpeedNormal = 0.5
TM_SexSpeedMedium = 0.25
TM_SexSpeedSlow = 0.1

-- Moan Sex treshold by sex speeed (Min: 0.001, Max: 2)
TM_ClimaxTreshold = 1.3
TM_OrgasmTreshold = 0.9
TM_FasterTreshold = 0.6
TM_FastTreshold = 0.3
TM_NormalTreshold = 0.1

-- Moan Cum frequency (sec)
TM_MoanCumEyeTime = 1	-- Cum in eye
TM_MoanCumLipsTime = 3	-- Cum on lips
TM_MoanCumBodyTime = 5	-- Cum on body
TM_WetnessStep = 200	-- Wetness Control step

-- Cumflation (belly inflation by cumming inside)
TM_CumflateStepUp = 0.005		-- Increment (each 0.1sec once) of hip size increase
TM_CumflateStepDown = 0.02		-- Decrement (each 0.1sec once) of hip size reduction
TM_CumflateHipSizeLimit = 1.5	-- Maximum amout to increase to (deformed afer 1.5)