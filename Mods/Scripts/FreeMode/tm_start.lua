-- TrueMoan v1.0 by illa3d
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

------------------------------------------------------------------------------------------------------------------------
-- TALK MENU MOD MANAGER INTEGRATION - Mod works both in STANDALONE and TMMM (mandatory)
------------------------------------------------------------------------------------------------------------------------
-- 1. Rename your "label TalkMenu(human)" to label MODTalkMenu(human)" (so its after the letters "fre")
local TMMM_Name = "True Moan.." -- 2. Change name displayed in the TMMM
-- 3. Replace below "TMTalkMenu" with name of your "MODTalkMenu" - [HERE BELOW], in two places!
if type(TM_AddMenuMod) == "function" then TM_AddMenuMod(TMMM_Name, "TMTalkMenu")
else local funcCode = [[ function TalkMenu(human, hitTri) Jump("TMTalkMenu", human, hitTri) end ]] load(funcCode)() end
function OnHumanClick(human, hitTri) -- (called from TrueFacials on clicking humans)
	Jump("TalkMenu", human, hitTri) -- (don't change this)
end -- 4. don't call your functions here (called only in STANDALONE, not TMMM), see below
------------------------------------------------------------------------------------------------------------------------
--- ON HUMAN CLICK FUNCTION (optional)
------------------------------------------------------------------------------------------------------------------------
-- 5. Replace below "TMOnHumanClick" with name of your "MODOnHumanClick(human, hitTri)" function, in two places!
if type(TM_AddMenuMod) == "function" then TM_AddMenuMod(TMMM_Name, "TMOnHumanClick")
else local funcCode = [[ function OnHumanClick(human, hitTri) TMOnHumanClick(human, hitTri) end ]] load(funcCode)() end
------------------------------------------------------------------------------------------------------------------------

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