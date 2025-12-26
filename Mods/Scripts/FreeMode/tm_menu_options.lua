-- TrueMoan v1.2 by illa3d
TM_UIVisible = true

label TMMenuOptions(human)
	+ "Hide UI" [if TM_UIVisible]
		TM_UIVisible = ShowUI(false)
	+ "Show UI" [if not TM_UIVisible]
		TM_UIVisible = ShowUI(true)
		Return()
	+ "Sex options.." [gold]
		+ "Wet sex | " .. AccBool(TM_WetSex) [if TM_WetSex]
			TM_WetSex = false
			Return()
		+ "Wet sex | " .. AccBool(TM_WetSex) [if not TM_WetSex]
			TM_WetSex = true
			Return()
		+ "Moan sex | " .. AccBool(TM_MoanSex) [if TM_MoanSex and TM_AllowVoice]
			TM_MoanSex = false
			Return()
		+ "Moan sex | " .. AccBool(TM_MoanSex) [if not TM_MoanSex and TM_AllowVoice]
			TM_MoanSex = true
			Return()
		+ "Moan cum | " .. AccBool(game.FluidReaction) [if game.FluidReaction and TM_AllowVoice]
			game.FluidReaction = false
			Return()
		+ "Moan cum | " .. AccBool(game.FluidReaction) [if not game.FluidReaction and TM_AllowVoice]
			game.FluidReaction = true
			Return()
		+ "Moaning | Disabled (VoiceMod)" [if not TM_AllowVoice]
			human "I know, right? Don't <b>MOAN</b> about it!\n(VoiceMod is present, TrueMoaning disabled!)"
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "Double click.." [gold]
		+ "Delay | " .. AccNum(TM_DoubleClickDelay, 1) .. "s (edit config)"
			Return()
		+ "Reset | " .. AccBool(TM_DoubleClickReset) [if TM_DoubleClickReset]
			TM_DoubleClickReset = false
			Return()
		+ "Reset | " .. AccBool(TM_DoubleClickReset) [if not TM_DoubleClickReset]
			TM_DoubleClickReset = true
			Return()
		+ "Undress |" .. AccBool(TM_DoubleClickUndress) [if TM_DoubleClickUndress]
			TM_DoubleClickUndress = false
			Return()
		+ "Undress | " .. AccBool(TM_DoubleClickUndress) [if not TM_DoubleClickUndress]
			TM_DoubleClickUndress = true
			Return()
		+ "Moan | " .. AccBool(TM_DoubleClickMoan) [if TM_DoubleClickMoan and not TMMOD_VoiceMod]
			TM_DoubleClickMoan = false
			Return()
		+ "Moan | " .. AccBool(TM_DoubleClickMoan) [if not TM_DoubleClickMoan and not TMMOD_VoiceMod]
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
	+ "New people | " .. AccStr("Naked") [if TM_NakedOnSpawn]
		TM_NakedOnSpawn = false
		Return()
	+ "New people | " .. AccStr("Dressed") [if not TM_NakedOnSpawn]
		TM_NakedOnSpawn = true
		Return()
	+ "Music.." [gold]
		+ TM_MenuBack
			Return (2)
		+ for i, track in ipairs(TM_MusicTracks)
			+ "Play " .. track
				Music(track , 0.05, 0)
				Return()
		+ "STOP Music" [gold]
			StopMusic()
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "Ambience.. | " .. AccBool(TM_AllowAmbience) [gold]
		+ "Refresh" [if TM_AllowAmbience == true]
			Return()
		+ "Next track | " .. AccStr("Ambience " .. tmAmbienceTrack) [if TM_AllowAmbience]
			TMPlayAmbienceNext()
			Return()
		+ "Ambience | " .. AccBool(TM_AllowAmbience) .. " (next in ".. AccNum(TMAmbienceLeftSec()) .. "s)" [if TM_AllowAmbience]
			TM_AllowAmbience = false
			Return()
		+ "Ambience | " .. AccBool(TM_AllowAmbience) [if not TM_AllowAmbience]
			TM_AllowAmbience = true
			TMPlayAmbienceCurrent()
			Return()
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ "Plugins.." .. AccStr(" (mod menu)") [gold]
		+ "Fauna LABS.." [if TMMOD_FaunaLabs] [gold]
			TMMOD_Jump(TMMOD_Menu_FaunaLabs, human, hitTri)
		+ TM_MenuMod [if TMMOD_TalkMenuModManager]
			TM_ModMenu(human, hitTri)
		+ TM_MenuBack
			Return(2)
		+ TM_MenuClose
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
