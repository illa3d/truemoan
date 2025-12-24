-- TrueMoan v1.0 by illa3d
-- These values are used every time new scene loads
---------------------------------------------------
-- MAIN DEFAULTS CONFIG, MODIFY TO YOOUR LIKING! --
---------------------------------------------------

-- Ambience
TM_AllowAmbience = true       -- Ambient sounds
TM_AmbienceVolume = 0.6       -- Ambient volume (0 to 1)
-- Options
TM_NakedOnSpawn = false       -- Characters naked when spawning/changing
TM_NakedOnDoubleClick = true  -- ModCharacters naked on double clicking (doesn't work with TalkMenu manager)
TM_MoanOnDoubleClick = true   -- Moan on dobuleclick (doesn't work with TalkMenu manager)
TM_MoanSex = true             -- Moaning during sex
TM_WetSex = true              -- Moisting holes (vag, anus, mouth)
-- Body Edit
TM_BodyEditSafe = true        -- default value on scene change
TM_BreastSafeMin = -0.8       -- some characters fall apart below this value and game crashes
-- Menu
TM_RootHideShowUI = false     -- Display show/hide UI option in TalkMenu first page
TM_ShowSexStyleControl = true -- Show/Hide SexControl/Style controls (Male/Thrust) in the menu

-----------------------------------------------
-- FINE TUNING
-----------------------------------------------
TM_DoubleClickSeconds = 0.2 -- 

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
TM_MenuMod = "<color=#e87435>« MOD MENU</color>"
TM_MenuBack = "<color=#e87435>« BACK</color>"
TM_MenuClose = "<color=#e85035>× CLOSE</color>"
TM_MenuAccent = "#df9c3d"

-----------------------------------------------
-- MUSIC TRACKS (displayed in Options/Music)
-----------------------------------------------
TM_MusicTracks = {
	"01_Dreamy_Whisper",
	"02_Moon-blind",
	"03_OpenMeBabe",
	"04_What_an_Easy_Good-bye",
	"05_Somtimes",
	"06_Love_in_Fareast",
	"07_Tender_Passion",
	"08_Orbit",
	"09_Dancing_Queen",
	"10_Memories_of_Childhood",
	"11_Raggae_Fever",
	"12_Why",
	"13_Comma",
	"14_NoWar",
	"15_Special_Light",
	"16_Enjoy_Yaslef",
	"17_Lyve_Live",
	"18_Aquabelle",
	"19_1st_Mission",
	"20_Time_to_Groove",
	"21_Love_is_Bubble",
	"22_Flower_Bearing",
	"23_Secret_Garden_Before",
	"24_X-ray",
	"25_CallousCall",
	"26_Order_Circle",
	"27_This_is_My_Stage",
	"28_Wait_4_U",
	"29_Welcome_to_Radux_World",
	"30_Journey_to_You",
}