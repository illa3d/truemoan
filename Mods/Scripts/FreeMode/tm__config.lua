-- TrueMoan v1.3 by illa3d
------------------------------------------------------------------------------------------------------------------
-- TRUE MOAN DEFAULTS CONFIG (Values changed in options reset after scene load, here you set that permanent)
------------------------------------------------------------------------------------------------------------------
--                              !!! REMEMBER TO BACKUP BEFORE UPDATING THE MOD !!!                              --
--     Some values will be added through time. If you just copy your backup, you might be losing on options!    --
------------------------------------------------------------------------------------------------------------------

-- Menu
TM_Menu_FaunaLabs = false			-- 1. Display Fauna labs Maoin Menu (if FaunaLABS is present)
TM_Menu_HideShowUI = false			-- 2. Display Show/hide UI option in Main Menu
TM_MenuBackButtonEvery = 20			-- 3. [5-20] After how many items back button appear in item lists

-- Sex Menu
TM_ShowSexStyleControl = true		-- 4. Show Thrust and Depth controls

-- Double click
TM_DoubleClickInOtherMods = false	-- 5. Allows double clicking in other mods (works only with TMMM stickied option)
TM_DoubleClickReset = true			-- 6. Reset character pose/activity/face/animations on double click
TM_DoubleClickUndress = true		-- 7. Take clothes off on double click
TM_DoubleClickMoan = true			-- 8. Moan on dobuleclick (doesn't work with VoiceMod)
TM_DoubleClickDelay = 0.25			-- 9. [0.2-0.4] Time to register double click (0.25 = 250ms, 200-400ms is fine)

-- People
TM_SpawnNaked = false				-- 10. Characters naked when spawned / changing
TM_SpawnReset = false				-- 11. Characters reset when spawned / changing (no sucking lol)
TM_SpawnNoFuta = false				-- 12. Females spawn without penises (no sucking lol)
TM_SpawnRandomTypes = true			-- 13. Randomizes body types on start, configurable in tm__presets.lua
TM_MoanSex = true					-- 14. Moaning during sex
TM_WetSex = true					-- 15. Moisting holes (vag, anus, mouth)

-- Body Edit
TM_BodyEditSafe = true				-- 16. Turns on safe body editing using SafeMin values
TM_BreastSafeMin = -0.8				-- 17. Some characters fall apart below this value and game crashes

-- SFX Ambience
TM_AllowAmbience = true				-- 18. Ambient sounds
TM_AmbienceVolume = 0.7				-- 19. [0-1] Ambient volume

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