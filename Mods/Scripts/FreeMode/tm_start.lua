-- TrueMoan Start Scripts v1.0 by illa3d
-------------------------------------------------------------------------------------------------
-- This script is main connection between TrueFacials calls, TMMM mod and TrueMoan
-- These functions override freemode_main.lua's, because of alphabetical filename order
-- Same function in multiple files, alphabetically last one is used.
-------------------------------------------------------------------------------------------------
-- MODS SUPPORTED: TalkMenuModManager, nf123 VoiceMod
-------------------------------------------------------------------------------------------------
-- YOU CAN COMMENT OUT CALLS TO FEATURES YOU DONT LIKE
-------------------------------------------------------------------------------------------------

-- From TrueFacials
label Start()
	-- TrueMoan: Initialization, don't remove!
	TMOnStart()	
	-- TrueMoan: Ambience
	TMOnStart_Ambience()	
	-- TrueMoan: TrueFacials GenericChat
	TMOnStart_GenericChat()
stop

-- From TrueFacials
function OnGameUpdate()
    -- TrueMoan: Unused
    TMOnGameUpdate()
    -- TrueMoan: TrueFacials GenericChat
    TMOnGameUpdate_GenericChat()
end

--------------------------------------------------------------------------------------------------------------------------------
-- TALK MENU MOD MANAGER INTEGRATION (Mod works both in STANDALONE and TMMM)
-- 1. Rename this file so it's after freemode_main.lua (alphabetically)
-- 2. Enter your mod name displayed in the TMMM menu
YourModName = "True Moan"
-- 2. Rename your menu function "TalkMenu(human)" to ie: "MODTalkMenu(human)"
-- 3. Enter your renamed "MODTalkMenu"
YourTalkMenuFunc = "TMTalkMenu"
-- 4. Pick one of the options (delete/comment the other):

-- --[ OPTION A - Use just TalkMenu ]----------------------------------------------------------------------------------------------
-- if type(TM_AddMenuMod) == "function" then TM_AddMenuMod(YourModName, YourTalkMenuFunc)
-- else local funcCode=[[function TalkMenu(human,hitTri) Jump("]]..YourTalkMenuFunc..[[",human,hitTri) end]] load(funcCode)() end
-- function OnHumanClick(human, hitTri) Jump("TalkMenu", human, hitTri) end -- (don't change this)
-- --[ DONT MODIFY CODE ABOVE ]----------------------------------------------------------------------------------------------------

--[ OPTION B - Use TalkMenu and OnHumanSingleClick / OnHumanDoubleClick ]-------------------------------------------------------
if type(TM_AddMenuMod) == "function" then TM_AddMenuMod(YourModName, "TMMMOnHumanClick")
else local funcCode=[[function OnHumanClick(human,hitTri) TMMMOnHumanClick(human,hitTri) end]] load(funcCode)() end
function TMMMOnHumanClick(human, hitTri) Jump(YourTalkMenuFunc, human, hitTri) TMMMOnhumanSingleClick(human, hitTri)
local time = Timer("TMMDCT") ResetTimer("TMMDCT") if time <= TMMM_DoubleClick then TMMMOnHumanDoubleClick(human, hitTri) end end
--[ DONT MODIFY CODE ABOVE ]----------------------------------------------------------------------------------------------------
TMMM_DoubleClick = 0.25 -- (optional) Time to register double click (0.2 to 0.5 ok values, default 0.2s = 250ms)
function TMMMOnhumanSingleClick(human, hitTri)
	-- 5. Add your single click actions here (MENU IS ALREADY CALLED)
	TMOnHumanClick(human, hitTri) 
end function TMMMOnHumanDoubleClick(human, hitTri)
	-- ! WORKS ONLY IN STANDALONE ! (TMMM uses doubleclick)
	-- 6. Add your double click actions here
	TMOnHumanDoubleClick(human, hitTri)
end 
--------------------------------------------------------------------------------------------------------------------------------

-- From TrueFacials
function OnCreateHuman(human)
	-- TrueMoan: Naked On Start, Remove Wetness, Randomize body type
	TMOnCreateHuman(human)
end

-- From TrueFacials
function OnRemoveHuman(human)
	 -- TrueMoan: Unused for now
	TMOnRemoveHuman(human)
end

-- From TrueFacials
function OnFluidHit(hitActor, bodyArea, shootActor)
	-- TrueMoan: Cum Moaning
	TMOnFluidHit(hitActor, bodyArea, shootActor)
end

-- From TrueFacials
function OnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
	-- TrueMoan: Sex Moaning
 	TMOnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
end