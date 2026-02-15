-- TrueMoan v3.0 by illa3d
-------------------------------------------------------------------------------------------------
-- This script is connection between TrueFacials calls, TMMM mod and TrueMoan
-- MODS SUPPORTED: TalkMenuModManager, nf123 VoiceMod, Fauna LABS
-------------------------------------------------------------------------------------------------
TMModName = "True Moan »"
TMMenuName = "TMTalkMenu"

-- MOD DETECTION
TMMOD_TrueMoan = false
TMMOD_TalkMenuModManager = false
TMMOD_VoiceMod = false
TMMOD_Plugins = false
TMMOD_FaunaLabs = false
TMMOD_BetterSpeedsAndFluid = false

local function TMDetectMods()
	TMMOD_TalkMenuModManager = type(TM_ModMenu) == "function"
	TMMOD_VoiceMod = type(VM_VoiceMod_Enable) == "function"
	TMMOD_FaunaLabs = type(fauna_LABS_Menu) == "function"
	TMMOD_BetterSpeedsAndFluid = type(BetterSpeedAndFluidTalkMenu) == "function"
	TMMOD_Plugins = TMMOD_FaunaLabs or TMMOD_BetterSpeedsAndFluid
end

-- MOD JUMPING
TMMOD_Menu_FaunaLabs = "fauna_LABS_Menu"
TMMOD_Menu_BetterSpeedAndFluid = "BetterSpeedAndFluidTalkMenu"
function TMMOD_Jump(modMenuName, human, hitTri) Jump(modMenuName, human, hitTri) end
function TMMOD_AllowDoubleClick()
	if not TMMOD_TalkMenuModManager or TM_DoubleClickInOtherMods then return true end
	return TM_CurrentStickiedMod == TMMenuName
end

-------------------------------------------------------------------------------------------------
-- TRUE MOAN ENABLE/DISABLE
-------------------------------------------------------------------------------------------------
function TM_TrueMoan_Enable()
	if TMMOD_TrueMoan then return end
	TMDetectMods()
	if type(TM_AddFunctionHook) == "function" and type(TM_AddFunctionOverride) == "function" then 
		-- TalkMenuModManager: Add function hooks
		TM_AddFunctionHook(TMModName, "Start", 0, "_TMStart")
		TM_AddFunctionHook(TMModName, "OnCreateHuman", 1, "_TMOnCreateHuman")
		TM_AddFunctionHook(TMModName, "OnRemoveHuman", 1, "_TMOnRemoveHuman")
		TM_AddFunctionHook(TMModName, "OnHumanClick", 2, "_TMOnHumanClick")
		-- Override freemode_main.lua voice functions, priority 199 is less than VoiceMod's 200
		TM_AddFunctionOverride(TMModName, "OnGameUpdate", 0, "_TMOnGameUpdate", 199, true)
		TM_AddFunctionOverride(TMModName, "OnFluidHit", 3, "_TMOnFluidHit", 199, true)
		TM_AddFunctionOverride(TMModName, "OnPenetration", 5, "_TMOnPenetration", 199, true)
		-- VoiceMod SFX compatibility
		if TMMOD_VoiceMod then TM_AddFunctionHook(TMModName, "OnPenetration", 5, "_TMOnPenetrationVM") end
		-- ADD TMMM Menu
		if type(TM_AddMenuMod) == "function" then TM_AddMenuMod(TMModName, TMMenuName) end
		TMMOD_TrueMoan = true
	else
		-- Standalone: Create original TrueFacials FreeMode functions with literal strings (hidden from TrueFacials until loaded)
		load([[function Start() _TMStart() end]])()
		load([[function OnGameUpdate(human, hitTri) _TMOnGameUpdate(human, hitTri) end]])()
		load([[function OnCreateHuman(human) _TMOnCreateHuman(human) end]])()
		load([[function OnRemoveHuman(human) _TMOnRemoveHuman(human) end]])()
		load([[function OnHumanClick(human, hitTri) _TMOnHumanClick_Standalone(human, hitTri) end]])()
		load([[function OnFluidHit(hitActor, bodyArea, shootActor) _TMOnFluidHit(hitActor, bodyArea, shootActor) end]])()
		load([[function OnPenetration(girl, holeName, inVelocity, outVelocity, penetrator) _TMOnPenetration(girl, holeName, inVelocity, outVelocity, penetrator) end]])()
		TMMOD_TrueMoan = true
	end
end

function TM_TrueMoan_Disable()
	if not TMMOD_TrueMoan then return end
	if type(TM_RemoveFunctionOverride) == "function" then 
		-- TalkMenuModManager: Add function hooks
		TM_RemoveFunctionHook("_TMStart")
		TM_RemoveFunctionHook("_TMOnCreateHuman")
		TM_RemoveFunctionHook("_TMOnRemoveHuman")
		TM_RemoveFunctionHook("_TMOnHumanClick")
		TM_RemoveFunctionHook("_TMOnPenetrationVM") -- VoiceMod SFX compatibility
		TM_RemoveFunctionOverride("_TMOnGameUpdate")
		TM_RemoveFunctionOverride("_TMOnFluidHit")
		TM_RemoveFunctionOverride("_TMOnPenetration")
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
	-- TrueMoan: Stats, Tweens, Moaning
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

function _TMOnHumanClick_Standalone(human, hitTri)
	Jump("TMTalkMenu", human, hitTri)
	_TMOnHumanClick(human, hitTri)
end

function _TMOnHumanClick(human, hitTri)
	_TMOnHumanSingleClick(human, hitTri)
	if not TMMOD_AllowDoubleClick() then return end
	local time = Timer("TMDct")
	ResetTimer("TMDct")
	if time <= TM_DoubleClickTime then _TMOnHumanDoubleClick(human, hitTri) end
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
	if VM_VoiceMod_Enabled == true then return end -- Don't run if VoiceMod is enabled
	-- TrueMoan: Sex Moaning
 	TMOnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
end

-- ON PENETRATION VOICEMOD (exclusively used with VoiceMod for SFX support)
function _TMOnPenetrationVM(girl, holeName, inVelocity, outVelocity, penetrator)
	if VM_VoiceMod_Enabled ~= true then return end -- Don't run if VoiceMod is disabled
 	TMOnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
end