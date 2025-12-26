-- TrueMoan v1.2 by illa3d
------------------------------------------------------------------------------------------------------------------
-- TRUE MOAN DEFAULTS CONFIG
-- These values are used every time new scene loads
------------------------------------------------------------------------------------------------------------------
--                              !!! REMEMBER TO BACKUP BEFORE UPDATING THE MOD !!!                              --
--     Some values will be added through time. If you just copy your backup, you might be losing on options!    --
------------------------------------------------------------------------------------------------------------------
-- MAIN DEFAULTS
------------------------------------------------------------------------------------------------------------------

-- Menu
TM_Menu_FaunaLabs = false          -- Display Fauna labs Maoin Menu (if FaunaLABS is present)
TM_Menu_HideShowUI = false         -- Display Show/hide UI option in Main Menu
TM_MenuBackButtonEvery = 20        -- [5-20] After how many items back button appear in item lists

-- Sex Menu
TM_ShowSexStyleControl = true      -- Show/Hide SexControl/Style controls (Male/Thrust) in the menu

-- Double click
TM_DoubleClickInOtherMods = false  -- Allows double clicking in other mods (works only with TMMM stickied option)
TM_DoubleClickReset = true         -- Reset character pose/activity/face/animations on double click
TM_DoubleClickUndress = true         -- Take clothes off on double click
TM_DoubleClickMoan = true          -- Moan on dobuleclick (doesn't work with VoiceMod)
TM_DoubleClickSec = 0.25           -- [0.2-0.4] Time to register double click (0.25 = 250ms, 200-400ms is fine)

-- People
TM_NakedOnSpawn = false            -- Characters naked when spawning/changing
TM_MoanSex = true                  -- Moaning during sex
TM_WetSex = true                   -- Moisting holes (vag, anus, mouth)

-- Body Edit
TM_BodyEditSafe = true             -- default value on scene change
TM_BreastSafeMin = -0.8            -- some characters fall apart below this value and game crashes

-- SFX Ambience
TM_AllowAmbience = true            -- Ambient sounds
TM_AmbienceVolume = 0.6            -- [0-1] Ambient volume

------------------------------------------------------------------------------------------------------------------
-- FINE TUNING
------------------------------------------------------------------------------------------------------------------

-- Body Edit Increments
TM_BodyStepA = 0.1   -- nipples hip, waist, muscle
TM_BodyStepB = 0.05  -- ass, penis-length, penis-size, forearm, upperarm, calf, thigh, neck
TM_BodyStepC = 0.025 -- breast, body

TM_SexSpeedStep = 0.05         -- non-linear percent (increments: slow = small, fast = big)
TM_SexMaleStep = 0.1           -- giver/getter, linear percent (of UI slider)
TM_SexThrustStep = 0.1         -- easier/harder, linear percent (of UI slider)

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
TM_MoanCumEyeTime = 1
TM_MoanCumLipsTime = 3
TM_MoanCumBodyTime = 5
TM_WetnessStep = 200

-- Menu Style
TM_MenuMod = "<color=#e87435>«« MOD MENU</color>"
TM_MenuBack = "<color=#e87435>« BACK</color>"
TM_MenuClose = "<color=#e85035>× CLOSE</color>"
TM_MenuAccent = "#df9c3d"