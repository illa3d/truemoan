-- TrueMoan v1.2 by illa3d
TM_UIVisible = true

label TMMenuOptions(human)
	+ "Hide UI" [if TM_UIVisible]
		TM_UIVisible = ShowUI(false)
	+ "Show UI" [if not TM_UIVisible]
		TM_UIVisible = ShowUI(true)
		Return()
	+ "New people | " .. AccStr("Naked") [if TM_NakedOnSpawn]
		TM_NakedOnSpawn = false
		Return()
	+ "New people | " .. AccStr("Clothed") [if not TM_NakedOnSpawn]
		TM_NakedOnSpawn = true
		Return()
	+ "Sex options.." [gold]
		+ "Wet sex | " .. AccBool(TM_WetSex) [if TM_WetSex]
			TM_WetSex = false
			Return()
		+ "Wet sex | " .. AccBool(TM_WetSex) [if not TM_WetSex]
			TM_WetSex = true
			Return()
		+ "Moan sex | " .. AccBool(TM_MoanSex) [if TM_MoanSex and TM_AllowMoaning]
			TM_MoanSex = false
			Return()
		+ "Moan sex | " .. AccBool(TM_MoanSex) [if not TM_MoanSex and TM_AllowMoaning]
			TM_MoanSex = true
			Return()
		+ "Moan cum | " .. AccBool(game.FluidReaction) [if game.FluidReaction and TM_AllowMoaning]
			game.FluidReaction = false
			Return()
		+ "Moan cum | " .. AccBool(game.FluidReaction) [if not game.FluidReaction and TM_AllowMoaning]
			game.FluidReaction = true
			Return()
		+ "Moaning | Disabled (VoiceMod)" [if not TM_AllowMoaning]
			human "I know, right? Don't <b>MOooAhN</b> about it tho!"
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
	+ TM_MenuMod [if TM_Mod_TalkModMenuManager]
		TM_ModMenu(human, hitTri)
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
