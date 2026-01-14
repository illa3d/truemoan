-- TrueMoan v2.3 by illa3d
TM_UITips_Options = true
TM_UITip_Options = "Tip: edit defaults in tm-config"
local tmOdec = 2

---@diagnostic disable: exp-in-action, undefined-global, keyword, unknown-symbol, miss-end, miss-symbol, miss-exp, err-nonstandard-symbol, err-assign-as-eq, malformed-number
-- OPTIONS MAIN
label TMMenuOptions(human)
	+ "Pause | " .. AccBool(game.m_freezeAllActors)
		HumansFreeze(not game.m_freezeAllActors)
		Return()
	+ "Hide UI" [if TM_UIVisible]
		TM_UIVisible = ShowUI(false)
	+ "Show UI" [if not TM_UIVisible]
		TM_UIVisible = ShowUI(true)
		Return()
	+ "Audio » | " .. AccBool(TM_SFX_Ambience) [gold]
		TMMenuOptions_Audio(human)
	+ "React »" [gold]
		TMMenuOptions_React(human)
	+ "Sex »" [gold]
		TMMenuOptions_Sex(human)
	+ "Click 2x »" [gold]
		TMMenuOptions_Click2x(human)
	+ "Spawn »" [gold]
		TMMenuOptions_Spawn(human)
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

-- OPTIONS: Ambience
label TMMenuOptions_Audio(human)
	+ AccStr(TM_UITip_Options) [if TM_UITips_Options]
		TM_UITips_Options = false
		Return()
	+ "• Refresh"
		Return()
	+ if TM_SFX_Ambience
		+ "• Next ambience"
			TMPlayAmbienceNext()
			Return()
		+ "Ambience " .. AccStr(TM_AmbienceTrack) .. " | " .. AccBool(TM_SFX_Ambience) .. " (in ".. AccNum(TMAmbienceLeftSec()) .. "s)"
			TM_SFX_Ambience = false
			Return()
	+ else	
		+ "Ambience | " .. AccBool(TM_SFX_Ambience) .. (TMAmbienceLeftSec() > 0 and " (in ".. AccNum(TMAmbienceLeftSec()) .. "s)" or "") 
			TM_SFX_Ambience = true
			TMPlayAmbienceCurrent()
			Return()
	+ "Music »" [gold]
		TMMenuList_Music(TM_MusicTracks)
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- OPTIONS: SFX
label TMMenuOptions_React(human)
	+ AccStr(TM_UITip_Options) [if TM_UITips_Options]
		TM_UITips_Options = false
		Return()
	+ if TM_AllowVoice()
		+ if TM_SFX_AllReactions
			+ "• React futa		| " .. AccBool(TM_SFX_ReactFuta) [if TM_SFX_ReactSex]
				TM_SFX_ReactFuta = not TM_SFX_ReactFuta
				Return()
			+ "• React sex		| " .. AccBool(TM_SFX_ReactSex)
				TM_SFX_ReactSex = not TM_SFX_ReactSex
				Return()
			+ "• React fluid		| " .. AccBool(game.FluidReaction)
				game.FluidReaction = not game.FluidReaction
				Return()
			+ "• React blowjob	| " .. AccBool(TM_SFX_ReactBlowjob)
				TM_SFX_ReactBlowjob = not TM_SFX_ReactBlowjob
				Return()
			+ "• React plap		| " .. AccBool(TM_SFX_ReactPlap)
				TM_SFX_ReactPlap = not TM_SFX_ReactPlap
				Return()
		+ "SFX Reactions	| " .. AccBool(TM_SFX_AllReactions)
			TM_SFX_AllReactions = not TM_SFX_AllReactions
			Return()
	+ else
		+ "SFX True Moan	| Disabled (VoiceMod)"
			Return()
	+ if TMMOD_VoiceMod
		+ "SFX VoiceMod	| " .. AccBoolDE(VM_VoiceMod_Enabled) [if VM_VoiceMod_Enabled]
			VM_VoiceMod_Disable()
			Return()
		+ "SFX VoiceMod	| " .. AccBoolDE(VM_VoiceMod_Enabled) [if not VM_VoiceMod_Enabled]
			VM_VoiceMod_Enable()
			Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- OPTIONS: SEX
label TMMenuOptions_Sex(human)
	+ "Cumflation		| " .. AccBool(TM_Cumflate)
		TM_Cumflate = not TM_Cumflate
		Return()
	+ "Bulging		| " .. AccBool(TM_Bulging)
		TM_Bulging = not TM_Bulging
		Return()
	+ "Wet sex		| " .. AccBool(TM_WetSex)
		TM_WetSex = not TM_WetSex
		Return()
	+ if TM_AutoSex
		+ "• Auto climax	| " .. AccBool(TM_AutoClimax)
			TM_AutoClimax = not TM_AutoClimax
			Return()
		+ "• Auto cum		| " .. AccBool(TM_AutoCum)
			TM_AutoCum = not TM_AutoCum
			Return()
	+ "Auto sex		| " .. AccBool(TM_AutoSex)
		TM_AutoSex = not TM_AutoSex
		Return()
	+ "Tween sex		| " .. AccBool(TM_TweenSex) .. " (".. FDec(SexTweenTime(), tmOdec) .."s)"
		TM_TweenSex = not TM_TweenSex
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- OPTIONS: Click 2x
label TMMenuOptions_Click2x(human)
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
stop

-- OPTIONS: Click 2x
label TMMenuOptions_Spawn(human)
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
stop
