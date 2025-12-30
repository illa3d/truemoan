-- TrueMoan v1.7 by illa3d
TM_UITips_Options = true
TM_UITip_Options = "Tip: edit defaults in tm-config"
tmOdec = 2

label TMMenuOptions(human)
	+ "Pause | " .. AccBool(game.m_freezeAllActors) [if game.m_freezeAllActors]
		HumansFreeze(false)
		Return()
	+ "Pause | " .. AccBool(game.m_freezeAllActors) [if not game.m_freezeAllActors]
		HumansFreeze(true)
		Return()
	+ "Hide UI" [if TM_UIVisible]
		TM_UIVisible = ShowUI(false)
	+ "Show UI" [if not TM_UIVisible]
		TM_UIVisible = ShowUI(true)
		Return()
	+ "Music »" [gold]
		TMMenuItems_Music(TM_MusicTracks)

	-- AMBIENCE
	+ "Ambience.. | " .. AccBool(TM_AllowAmbience) [gold]
		+ AccStr(TM_UITip_Options) [if TM_UITips_Options]
			TM_UITips_Options = false
			Return()
		+ "Refresh"
			Return()
		+ if TM_AllowAmbience
			+ "Next ambience"
				TMPlayAmbienceNext()
				Return()
			+ "Ambience " .. AccStr(tmAmbienceTrack) .. " | " .. AccBool(TM_AllowAmbience) .. " (in ".. AccNum(TMAmbienceLeftSec()) .. "s)"
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
	+ "Moan/sex »" [gold]
		+ AccStr(TM_UITip_Options) [if TM_UITips_Options]
			TM_UITips_Options = false
			Return()
		+ if TM_AllowVoice
			+ "Moan sex	| " .. AccBool(TM_MoanSex) [if TM_MoanSex]
				TM_MoanSex = false
				Return()
			+ "Moan sex	| " .. AccBool(TM_MoanSex) [if not TM_MoanSex]
				TM_MoanSex = true
				Return()
			+ "Moan cum	| " .. AccBool(game.FluidReaction) [if game.FluidReaction]
				game.FluidReaction = false
				Return()
			+ "Moan cum	| " .. AccBool(game.FluidReaction) [if not game.FluidReaction]
				game.FluidReaction = true
				Return()
		+ else
			+ "Moaning	| Disabled (VoiceMod)"
				-- human "I know, right? Don't <b>MOAN</b> about it!\n(VoiceMod active, TrueMoaning disabled)"
				Return(2)
		+ "Wet sex	| " .. AccBool(TM_WetSex) [if TM_WetSex]
			TM_WetSex = false
			Return()
		+ "Wet sex	| " .. AccBool(TM_WetSex) [if not TM_WetSex]
			TM_WetSex = true
			Return()
		+ "Tween sex	| " .. AccBool(TM_TweenSex) [if TM_TweenSex]
			TM_TweenSex = false
			Return()
		+ "Tween sex	| " .. AccBool(TM_TweenSex) [if not TM_TweenSex]
			TM_TweenSex = true
			Return()
		+ "Tween time	| " .. FDec(SexTweenTime(), tmOdec) .. "s"
			-- human "To change this setting edit tm-config"
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose

	-- DOUBLE CLICK
	+ "Click2x »" [gold]
		+ AccStr(TM_UITip_Options) [if TM_UITips_Options]
			TM_UITips_Options = false
			Return()
		+ "Delay		| " .. FDec(TM_DoubleClickTime, tmOdec) .. "s"
			-- human "To change this setting edit tm-config"
			Return()
		+ "Reset		| " .. AccBool(TM_DoubleClickReset) [if TM_DoubleClickReset]
			TM_DoubleClickReset = false
			Return()
		+ "Reset		| " .. AccBool(TM_DoubleClickReset) [if not TM_DoubleClickReset]
			TM_DoubleClickReset = true
			Return()
		+ "Undress	| " .. AccBool(TM_DoubleClickUndress) [if TM_DoubleClickUndress]
			TM_DoubleClickUndress = false
			Return()
		+ "Undress	| " .. AccBool(TM_DoubleClickUndress) [if not TM_DoubleClickUndress]
			TM_DoubleClickUndress = true
			Return()
		+ "Moaning	| " .. AccBool(TM_DoubleClickMoan) [if TM_DoubleClickMoan and not TMMOD_VoiceMod]
			TM_DoubleClickMoan = false
			Return()
		+ "Moaning	| " .. AccBool(TM_DoubleClickMoan) [if not TM_DoubleClickMoan and not TMMOD_VoiceMod]
			TM_DoubleClickMoan = true
			Return()
		+ "In other mods | " .. AccBool(TM_DoubleClickInOtherMods) [if TM_DoubleClickInOtherMods]
			TM_DoubleClickInOtherMods = false
			Return()
		+ "In other mods | " .. AccBool(TM_DoubleClickInOtherMods) [if not TM_DoubleClickInOtherMods]
			TM_DoubleClickInOtherMods = true
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose

	-- SPAWN
	+ "Spawn »" [gold]
		+ AccStr(TM_UITip_Options) [if TM_UITips_Options]
			TM_UITips_Options = false
			Return()
		+ "Random body	| " .. AccBool(TM_SpawnRandomBody) [if TM_SpawnRandomBody]
			TM_SpawnRandomBody = false
			Return()
		+ "Random body	| " .. AccBool(TM_SpawnRandomBody) [if not TM_SpawnRandomBody]
			TM_SpawnRandomBody = true
			Return()
		+ "Naked			| " .. AccBool(TM_SpawnNaked) [if TM_SpawnNaked]
			TM_SpawnNaked = false
			Return()
		+ "Naked			| " .. AccBool(TM_SpawnNaked) [if not TM_SpawnNaked]
			TM_SpawnNaked = true
			Return()
		+ "No sex		| " .. AccBool(TM_SpawnReset) [if TM_SpawnReset]
			TM_SpawnReset = false
			Return()
		+ "No sex		| " .. AccBool(TM_SpawnReset) [if not TM_SpawnReset]
			TM_SpawnReset = true
			Return()
		+ "No futa		| " .. AccBool(TM_SpawnNoFuta) [if TM_SpawnNoFuta]
			TM_SpawnNoFuta = false
			Return()
		+ "No futa		| " .. AccBool(TM_SpawnNoFuta) [if not TM_SpawnNoFuta]
			TM_SpawnNoFuta = true
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
