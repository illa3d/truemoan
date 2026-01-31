-- TrueMoan v2.7 by illa3d
local TM_UITips_Options = true
local TM_UITip_Options = "Tip: edit defaults in tm-config"

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
	+ "Music / Ambient »"[gold]
		TMMenuOptions_Audio(human)
	+ "SFX / Voice »" [gold]
		TMMenuOptions_React(human)
	+ "AutoSex / Sex »" [gold]
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
			+ "< Plugins >" [gold]
			+ "BetterSpeedAndFluid »" [if TMMOD_FaunaLabs] [gold] [if TMMOD_BetterSpeedsAndFluid]
				TMMOD_Jump(TMMOD_Menu_BetterSpeedAndFluid, human, hitTri)
			+ "Fauna LABS »" [if TMMOD_FaunaLabs] [gold] [if TMMOD_FaunaLabs]
				TMMOD_Jump(TMMOD_Menu_FaunaLabs, human, hitTri)
			+ AccStr("(consider FaunaLABS)") [if not TMMOD_FaunaLabs]
				-- human "Fauna LABS brings: Poses, Faces, Animations and more!\nTrue, TrueMoan is truly empty without it!"
				Return()
			+ "No plugins" [if not TMMOD_Plugins]
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
	+ "< Music / Ambient >" [gold]
		Return()
	+ if TM_SFX_Ambient
		+ "| Next ambient"
			TMPlayAmbienceNext()
			Return()
		+ "Ambient " .. AccStr(TM_AmbienceTrack) .. " | " .. AccBool(TM_SFX_Ambient) .. " (in ".. AccNum(TMAmbienceLeftSec()) .. "s)"
			TM_SFX_Ambient = false
			Return()
	+ else	
		+ "Ambient | " .. AccBool(TM_SFX_Ambient) .. (TMAmbienceLeftSec() > 0 and " (in ".. AccNum(TMAmbienceLeftSec()) .. "s)" or "") 
			TM_SFX_Ambient = true
			TMPlayAmbienceCurrent()
			Return()
	+ "Music »" [gold]
		TMMenuList_Music(TM_MusicTracks)
	+ "Music STOP"
		StopMusic()
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- OPTIONS: SFX
label TMMenuOptions_React(human)
	+ AccStr(TM_UITip_Options) [if TM_UITips_Options]
		TM_UITips_Options = false
		Return()
	+ "< SFX / Voice | " .. AccStr("Everyone") .. " >" [gold]
		Return()
	+ if TM_SFX
		+ if not VM_VoiceMod_Enabled
			+ if TM_SFX_Voice
				+ "|| Generic chat	| " .. AccBool(TM_SFX_GenericChat)
					TM_SFX_GenericChat = not TM_SFX_GenericChat
					Return()
				+ "|| React fluid	| " .. AccBool(game.FluidReaction)
					game.FluidReaction = not game.FluidReaction
					Return()
				+ "|| Voice male	| " .. AccBool(TM_SFX_VoiceMale)
					TM_SFX_VoiceMale = not TM_SFX_VoiceMale
					Return()
				+ "|| Voice futa	| " .. AccBool(TM_SFX_VoiceFuta)
					TM_SFX_VoiceFuta = not TM_SFX_VoiceFuta
					Return()
			+ "| Voice		| " .. AccBool(TM_SFX_Voice)
				TM_SFX_Voice = not TM_SFX_Voice
				Return()
		+ else
			+ "| Voice		| Disabled (VoiceMod)"
				Return()
		+ "| SFX Fart		| " .. AccBool(TM_SFX_Fart)
			TM_SFX_Fart = not TM_SFX_Fart
			Return()
		+ "| SFX Plap		| " .. AccBool(TM_SFX_Plap)
			TM_SFX_Plap = not TM_SFX_Plap
			Return()
		+ "| SFX Suck		| " .. AccBool(TM_SFX_Suck)
			TM_SFX_Suck = not TM_SFX_Suck
			Return()
	+ "SFX / Voice		| " .. AccBool(TM_SFX)
		TM_SFX = not TM_SFX
		Return()
	+ if TMMOD_VoiceMod
		+ "VoiceMod voices	| " .. AccBoolDE(VM_VoiceMod_Enabled) [if VM_VoiceMod_Enabled]
			VM_VoiceMod_Disable()
			Return()
		+ "VoiceMod voices	| " .. AccBoolDE(VM_VoiceMod_Enabled) [if not VM_VoiceMod_Enabled]
			VM_VoiceMod_Enable()
			Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- OPTIONS: SEX
label TMMenuOptions_Sex(human)
	+ "< Auto sex / Sex | " .. AccStr("Everyone") .. " >" [gold]
		Return()
	+ if TM_AutoSex
		+ "| Auto sex random » " [gold]
			+ "« " .. AccStr("Everyone") .. " »" [gold]
				Return()
			+ "| M vs F		| " .. AccBool(TM_AutoSex_Weight)
				TM_AutoSex_Weight = not TM_AutoSex_Weight
				Return()
			+ "| Speed		| " .. AccBool(TM_AutoSex_Speed)
				TM_AutoSex_Speed = not TM_AutoSex_Speed
				Return()
			+ "| Thrust		| " .. AccBool(TM_AutoSex_Thrust)
				TM_AutoSex_Thrust = not TM_AutoSex_Thrust
				Return()
			+ "| Depth start		| " .. AccBool(TM_AutoSex_DepthStart)
				TM_AutoSex_DepthStart = not TM_AutoSex_DepthStart
				Return()
			+ "| Depth end		| " .. AccBool(TM_AutoSex_DepthEnd)
				TM_AutoSex_DepthEnd = not TM_AutoSex_DepthEnd
				Return()
			+ TM_MenuBack
				Return(2)
			+ TM_MenuClose
		+ "| Auto climax	| " .. AccBool(TM_AutoSex_Climax)
			TM_AutoSex_Climax = not TM_AutoSex_Climax
			Return()
		+ "| Auto cum		| " .. AccBool(TM_AutoSex_Cum)
			TM_AutoSex_Cum = not TM_AutoSex_Cum
			Return()
	+ "Auto sex	| " .. AccBool(TM_AutoSex)
		TM_AutoSex = not TM_AutoSex
		Return()
	+ "Cumflation	| " .. AccBool(TM_Cumflate)
		TM_Cumflate = not TM_Cumflate
		Return()
	+ "Bulging	| " .. AccBool(TM_Bulging)
		TM_Bulging = not TM_Bulging
		Return()
	+ "Wet sex	| " .. AccBool(TM_WetSex)
		TM_WetSex = not TM_WetSex
		Return()
	+ "Tween sex	| " .. AccBool(TM_TweenSex) .. " (".. FDec(SexTweenTime(), TM_Dec_Opt) .."s)"
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
	+ "< Click 2x >" [gold]
		Return()
	+ "Delay			| " .. FDec(TM_DoubleClickTime, TM_Dec_Opt) .. "s"
		-- human "To change this setting edit tm-config"
		Return()
	+ "Reset			| " .. AccBool(TM_DoubleClickReset)
		TM_DoubleClickReset = not TM_DoubleClickReset
		Return()
	+ "Undress		| " .. AccBool(TM_DoubleClickUndress)
		TM_DoubleClickUndress = not TM_DoubleClickUndress
		Return()
	+ "Moaning		| " .. AccBool(TM_DoubleClickMoan) [if not TMMOD_VoiceMod]
		TM_DoubleClickMoan = not TM_DoubleClickMoan
		Return()
	+ "In other mods	| " .. AccBool(TM_DoubleClickInOtherMods)
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
	+ "< Spawn >" [gold]
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
