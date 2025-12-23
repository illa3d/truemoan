-- TrueMoan v1.0 by illa3d
-------------------------------------------------------------------------------------------------
-- freemode_main.lua is not required, these functions are overrides (even if it exists in folder)
-- same function in multiple files, alphabetically last one is used
-- THIS FUNCTION IS NEEDED FOR THE FULL MOD TO WORK
-------------------------------------------------------------------------------------------------
label Start()
	-- TrueMoan: Enable clicking outside TalkMenu
	TMOnStart()	
	-- TrueMoan: Ambience
	TMOnStart_Ambience()	
	-- TrueMoan: GenericChat
	TMOnStart_GenericChat()
stop

function OnGameUpdate()
	-- TrueMoan: Unused
	TMOnGameUpdate()
	-- TrueMoan: GenericChat
	TMOnGameUpdate_GenericChat()
end

function OnHumanClick(human, hitTri)
	-- TrueMoan: TM_TalkMenu
	TMOnHumanClick(human, hitTri)
end

function OnCreateHuman(human)
	-- TrueMoan: Naked On Start
	TMOnCreateHuman(human)
end

function OnRemoveHuman(human)
	 -- TrueMoan: Unused
	TMOnRemoveHuman(human)
end

function OnFluidHit(hitActor, bodyArea, shootActor)
	-- TrueMoan: Cum Moaning
	TMOnFluidHit(hitActor, bodyArea, shootActor)
end

function OnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
	-- TrueMoan: Sex Moaning
 	TMOnPenetration(girl, holeName, inVelocity, outVelocity, penetrator)
end