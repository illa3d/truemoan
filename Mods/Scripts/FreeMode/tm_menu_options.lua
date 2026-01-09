-- TrueMoan v2.0 by illa3d
TM_UITips_Options = true
TM_UITip_Options = "Tip: edit defaults in tm-config"
tmOdec = 2

label TMMenuOptions(human)
	+ "Pause | " .. AccBool(game.m_freezeAllActors)
		HumansFreeze(not game.m_freezeAllActors)
		Return()
	+ "Hide UI" [if TM_UIVisible]
		TM_UIVisible = ShowUI(false)
	+ "Show UI" [if not TM_UIVisible]
		TM_UIVisible = ShowUI(true)
		Return()
	+ "Music »" [gold]
		TMMenuList_Music(TM_MusicTracks)

	-- AMBIENCE
	+ "Ambience » | " .. AccBool(TM_AllowAmbience) [gold]
		+ AccStr(TM_UITip_Options) [if TM_UITips_Options]
			TM_UITips_Options = false
			Return()
		+ "Refresh"
			Return()
		+ if TM_AllowAmbience
			+ "Next ambience"
				TMPlayAmbienceNext()
				Return()
			+ "Ambience " .. AccStr(TM_AmbienceTrack) .. " | " .. AccBool(TM_AllowAmbience) .. " (in ".. AccNum(TMAmbienceLeftSec()) .. "s)"
				TM_AllowAmbience = false
				Return()
		+ else	
			+ "Ambience | " .. AccBool(TM_AllowAmbience) .. (TMAmbienceLeftSec() > 0 and " (in ".. AccNum(TMAmbienceLeftSec()) .. "s)" or "") 
				TM_AllowAmbience = true
				TMPlayAmbienceCurrent()
				Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose

	-- MOANING/SEX
	+ "Sex / SFX »" [gold]
		+ AccStr(TM_UITip_Options) [if TM_UITips_Options]
			TM_UITips_Options = false
			Return()
		+ if TM_AllowVoice()
			+ "Moan futa		| " .. AccBool(TM_MoanFuta) [if TM_MoanSex]
				TM_MoanFuta = not TM_MoanFuta
				Return()
			+ "Moan sex		| " .. AccBool(TM_MoanSex)
				TM_MoanSex = not TM_MoanSex
				Return()
			+ "Moan cum		| " .. AccBool(game.FluidReaction)
				game.FluidReaction = not game.FluidReaction
				Return()
			+ "SFX blowjob		| " .. AccBool(TM_AllowSfxBlowjob)
				TM_AllowSfxBlowjob = not TM_AllowSfxBlowjob
				Return()
			+ "SFX sex		| " .. AccBool(TM_AllowSfxSex)
				TM_AllowSfxSex = not TM_AllowSfxSex
				Return()
		+ else
			+ "SFX True Moan	| Disabled (VoiceMod)"
				Return()
		+ if TMMOD_VoiceMod
			+ "SFX VoiceMod		| " .. AccBoolDE(VM_VoiceMod_Enabled)
				if VM_VoiceMod_Enabled
					VM_VoiceMod_Disable()
				else
					VM_VoiceMod_Enable()
				Return()
		+ "Wet sex	| " .. AccBool(TM_WetSex)
			TM_WetSex = not TM_WetSex
			Return()
		+ "Cumflation	| " .. AccBool(TM_Cumflate)
			TM_Cumflate = not TM_Cumflate
			Return()
		+ "Auto sex	| " .. AccBool(TM_AutoSex)
			TM_AutoSex = not TM_AutoSex
			Return()
		+ "Tween sex	| " .. AccBool(TM_TweenSex) .. " (".. FDec(SexTweenTime(), tmOdec) .."s)"
			TM_TweenSex = not TM_TweenSex
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose

	-- DOUBLE CLICK
	+ "Click 2x »" [gold]
		+ AccStr(TM_UITip_Options) [if TM_UITips_Options]
			TM_UITips_Options = false
			Return()
		+ "Delay		| " .. FDec(TM_DoubleClickTime, tmOdec) .. "s"
			-- human "To change this setting edit tm-config"
			Return()
		+ "Reset		| " .. AccBool(TM_DoubleClickReset)
			TM_DoubleClickReset = not TM_DoubleClickReset
			Return()
		+ "Undress	| " .. AccBool(TM_DoubleClickUndress)
			TM_DoubleClickUndress = not TM_DoubleClickUndress
			Return()
		+ "Moaning	| " .. AccBool(TM_DoubleClickMoan) [if not TMMOD_VoiceMod]
			TM_DoubleClickMoan = not TM_DoubleClickMoan
			Return()
		+ "In other mods | " .. AccBool(TM_DoubleClickInOtherMods)
			TM_DoubleClickInOtherMods = not TM_DoubleClickInOtherMods
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose

	-- SPAWN
	+ "Spawn »" [gold]
		+ AccStr(TM_UITip_Options) [if TM_UITips_Options]
			TM_UITips_Options = false
			Return()
		+ "AutoSex 		| " .. AccBool(TM_SpawnAutoSexOn)
			TM_SpawnAutoSexOn = not TM_SpawnAutoSexOn
			Return()
		+ "Random body	| " .. AccBool(TM_SpawnRandomBody)
			TM_SpawnRandomBody = not TM_SpawnRandomBody
			Return()
		+ "Naked			| " .. AccBool(TM_SpawnNaked)
			TM_SpawnNaked = not TM_SpawnNaked
			Return()
		+ "No sex		| " .. AccBool(TM_SpawnReset)
			TM_SpawnReset = not TM_SpawnReset
			Return()
		+ "No futa		| " .. AccBool(TM_SpawnNoFuta)
			TM_SpawnNoFuta = not TM_SpawnNoFuta
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose

	-- MOD MENU OR PLUGINS
	+ if TMMOD_TalkMenuModManager
		+ TM_MenuMod
			TM_ModMenu(human, hitTri)
	+ else
		+ AccStr("PLUGINS »") [gold]
			+ if TMMOD_FaunaLabs
				+ "Fauna LABS »" [if TMMOD_FaunaLabs] [gold]
					TMMOD_Jump(TMMOD_Menu_FaunaLabs, human, hitTri)
			+ else
				+ AccStr("(consider FaunaLABS)")
					-- human "Fauna LABS brings: Poses, Faces, Animations and more!\nTrue, TrueMoan is truly empty without it!"
					Return()
				+ "No plugins"
					Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
