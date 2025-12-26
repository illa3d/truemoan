-- TrueMoan v1.2 by illa3d
-------------------------------------------------------------------------------------------------
-- This script is connection between TrueFacials calls, TMMM mod and TrueMoan
-- MODS SUPPORTED: TalkMenuModManager, nf123 VoiceMod, Fauna LABS
-------------------------------------------------------------------------------------------------

-- MOD DETECTION
TMMOD_TrueMoan = false
TMMOD_TalkMenuModManager = false
TMMOD_VoiceMod = false
TMMOD_FaunaLabs = false

-- MOD JUMPING
TMMOD_Menu_FaunaLabs = "fauna_LABS_Menu"
function TMMOD_Jump(modMenuName, human, hitTri) Jump(modMenuName, human, hitTri) end

-------------------------------------------------------------------------------------------------
-- TRUE MOAN ENABLE/DISABLE
-------------------------------------------------------------------------------------------------
function TM_TrueMoan_Enable()
	if TMMOD_TrueMoan then return end
	if type(TM_AddFunctionOverride) == "function" then 
		-- TalkMenuModManager: Add function hooks
		local modname = "TrueMoan"
		TM_AddFunctionHook(modname, "Start", 0, "_TMStart", true, false)
		TM_AddFunctionHook(modname, "OnGameUpdate", 0, "_TMOnGameUpdate", true, false)
		TM_AddFunctionHook(modname, "OnCreateHuman", 1, "_TMOnCreateHuman", true, true)
		TM_AddFunctionHook(modname, "OnRemoveHuman", 1, "_TMOnRemoveHuman", true, true)
		TM_AddFunctionHook(modname, "OnHumanClick", 2, "_TMOnHumanClick", true, true)
		TM_AddFunctionHook(modname, "OnFluidHit", 3, "_TMOnFluidHit", 200, false)
		TM_AddFunctionHook(modname, "OnPenetration", 5, "_TMOnPenetration", 200, false)
		if type(TM_AddMenuMod) == "function" then TM_AddMenuMod(modname, "TMTalkMenu") end
		TMMOD_TrueMoan = true
	else
		-- Standalone: Create original TrueFacials FreeMode functions with literal strings (hidden from TrueFacials until loaded)
		load([[function Start() _TMStart() end]])()
		load([[function OnGameUpdate(human, hitTri) _TMOnGameUpdate(human, hitTri) end]])()
		load([[function OnCreateHuman(human) _TMOnCreateHuman(human) end]])()
		load([[function OnRemoveHuman(human) _TMOnRemoveHuman(human) end]])()
		load([[function OnHumanClick(human, hitTri) _TMOnHumanClick(human, hitTri) end]])()
		load([[function OnFluidHit(hitActor, bodyArea, shootActor) _TMOnFluidHit(hitActor, bodyArea, shootActor) end]])()
		load([[function OnPenetration(girl, holeName, inVelocity, outVelocity, penetrator) _TMOnPenetration(girl, holeName, inVelocity, outVelocity, penetrator) end]])()
		TMMOD_TrueMoan = true
	end
	TMDetectMods()
end

function TMDetectMods()
	-- Detect other mods
	TMMOD_TalkMenuModManager = type(TM_ModMenu) == "function"
	TMMOD_VoiceMod = type(VM_VoiceMod_Enable) == "function"
	TMMOD_FaunaLabs = type(fauna_LABS_Menu) == "function"
end

function TM_TrueMoan_Disable()
	if not TMMOD_TrueMoan then return end
	if type(TM_RemoveFunctionOverride) == "function" then 
		-- TalkMenuModManager: Add function hooks
		TM_RemoveFunctionHook("_TMStart")
		TM_RemoveFunctionHook("_TMOnGameUpdate")
		TM_RemoveFunctionHook("_TMOnCreateHuman")
		TM_RemoveFunctionHook("_TMOnRemoveHuman")
		TM_RemoveFunctionHook("_TMOnHumanClick")
		TM_RemoveFunctionHook("_TMOnFluidHit")
		TM_RemoveFunctionHook("_TMOnPenetration")
		TMMOD_TrueMoan = false
	end
end

-------------------------------------------------------------------------------------------------
-- TRUE FACIALS FUNCTIONS -> TRUE MOAN HOOKS
-------------------------------------------------------------------------------------------------

-- ON GAME START
function _TMStart()
	-- TrueMoan: Initialization, don't remove!
	TMOnStart_Init()	
	-- TrueMoan: Ambience
	TMOnStart_Ambience()
	-- TrueMoan: TrueFacials GenericChat
	TMOnStart_GenericChat()
end

-- ON GAME UPDATE
function _TMOnGameUpdate()
	-- TrueMoan: Unused
	TMOnUpdate()
	-- TrueMoan: TrueFacials GenericChat
	TMOnUpdate_GenericChat()
end

-- ON HUMAN
function _TMOnCreateHuman(human)
	-- TrueMoan: Naked On Start, Remove Wetness, Randomize body type
	TMOnCreateHuman(human)
end

function _TMOnRemoveHuman(human)
	-- TrueMoan: Unused
	TMOnRemoveHuman(human)
end

function _TMOnHumanClick(human, hitTri)
	Jump("TMTalkMenu", human, hitTri)
	_TMOnHumanSingleClick(human, hitTri)
	local time = Timer("TMDct")
	ResetTimer("TMDct")
	 -- Time to register double click (0.2 to 0.5 ok values, default 0.2s = 250ms)
	if time <= 0.25 then _TMOnHumanDoubleClick(human, hitTri) end
end

function _TMOnHumanSingleClick(human, hitTri)
	-- TrueMoan: Unused
	TMOnHumanSingleClick(human, hitTri) 
end

function _TMOnHumanDoubleClick(human, hitTri)
	-- TrueMoan: Naked, Reset
	TMOnHumanDoubleClick(human, hitTri)
end

-- ON FLUID
function _TMOnFluidHit(hitActor, bodyArea, shootActor)
	-- TrueMoan: Cum Moaning
	TMOnFluidHit(hitActor, bodyArea, shootActor)
end

-- ON PENETRATION
function _TMOnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
	-- TrueMoan: Sex Moaning
 	TMOnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
end