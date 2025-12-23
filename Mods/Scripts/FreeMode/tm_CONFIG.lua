-- TrueMoan v1.0 by illa3d
-----------------------------------------------
-- MAIN CONFIG FILE, MODIFY TO YOOUR LIKING! --
-----------------------------------------------

-- Ambience
AllowAmbience = true
AmbienceVolume = 0.5 -- 0 to 1

-- Characters spawn naked
NakedOnSpawn = false	-- default value on scene change

-- Body Edit
BodyEditSafe = true	-- default value on scene change
BreastSafeMin = -0.8	-- some characters fall apart below this value and game crashes

-- Body Edit Increments
BodyStepA = 0.1		-- nipples hip, waist, muscle
BodyStepB = 0.05	-- ass, penis-length, penis-size, forearm, upperarm, calf, thigh, neck
BodyStepC = 0.025	-- breast, body

-- Sex speed config
SexSpeedStep = 0.05
SexSpeedMax = 2
SexSpeedFast = 0.9
SexSpeedNormal = 0.5
SexSpeedMedium = 0.25
SexSpeedSlow = 0.1

-- Sex/Moan Tier config
WetSex = true		-- default value on scene change
Moaning = true		-- default value on scene change
WetnessStep = 200	-- Umm. Try lol.

-- Cum moan frequency (seconds)
MoanCumEyeTime = 1
MoanCumLipsTime = 3
MoanCumBodyTime = 5

-- Sex Moan Tresholds (speed 0-2)
ClimaxTreshold = 1.3
OrgasmTreshold = 0.9
FasterTreshold = 0.6
FastTreshold = 0.3
NormalTreshold = 0.1

-- Menu
RootHideShowUI = false						-- Display show/hide UI option in TalkMenu first page
MenuBack = "<color=#e87435>« BACK</color>"	-- Back button style
MenuClose = "<color=#e85035>× CLOSE"		-- Close button style
MenuNumColor = "<color=#df9c3d>"			-- Numerical values

-- Music tracks displayed in Options/Music
MusicTracks = {
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

-------------------------------------------------------------------------------------------------
-- LABELS FORMAT
-------------------------------------------------------------------------------------------------
endcolor = "</color>"

function BoolLabel (bvalue)
	 return MenuNumColor .. (bvalue and "ON" or "OFF") .. endcolor
end
function WordLabel (svalue)
	return  MenuNumColor .. svalue .. endcolor
end
function ValueLabel (value, decimals)
	return  MenuNumColor .. NumLabel(value, decimals) .. endcolor
end
function ValueLabel1 (letter, value, decimals)
	return  letter .. MenuNumColor .. NumLabel(value, decimals) .. endcolor
end
function ValueLabel2 (letter1, value1, letter2, value2, decimals)
	return  letter1 .. MenuNumColor .. NumLabel(value1, decimals) .. endcolor .. " | " .. letter2 .. MenuNumColor .. NumLabel(value2, decimals) .. endcolor
end