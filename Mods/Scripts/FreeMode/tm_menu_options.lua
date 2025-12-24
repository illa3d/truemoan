-- TrueMoan v1.0 by illa3d
label TMMenuOptions(human)
	+ "Hide UI" [if HG_UIvis == true]
		HG_UIvis = false
		game.m_controlsUI.Show(false)
	+ "Show UI" [if HG_UIvis == false]
		HG_UIvis = true
		game.m_controlsUI.Show()
		Return()
	+ "New people | " .. AccStr("Naked") [if TM_NakedOnSpawn == true]
		TM_NakedOnSpawn = false
		Return()
	+ "New people | " .. AccStr("Clothed") [if TM_NakedOnSpawn == false]
		TM_NakedOnSpawn = true
		Return()
	+ "Sex options.." [gold]
		+ "Wet sex | " .. AccBool(TM_WetSex) [if TM_WetSex == true]
			TM_WetSex = false
			Return()
		+ "Wet sex | " .. AccBool(TM_WetSex) [if TM_WetSex == false]
			TM_WetSex = true
			Return()
		+ "Moan sex | " .. AccBool(TM_MoanSex) [if TM_MoanSex == true and TM_AllowMoaning]
			TM_MoanSex = false
			Return()
		+ "Moan sex | " .. AccBool(TM_MoanSex) [if TM_MoanSex == false and TM_AllowMoaning]
			TM_MoanSex = true
			Return()
		+ "Moan cum | " .. AccBool(game.FluidReaction) [if game.FluidReaction == true and TM_AllowMoaning]
			game.FluidReaction = false
			Return()
		+ "Moan cum | " .. AccBool(game.FluidReaction) [if game.FluidReaction == false and TM_AllowMoaning]
			game.FluidReaction = true
			Return()
		+ "Moaning | OFF (VoiceMod detected)" [if not TM_AllowMoaning]
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
		+ "Ambience | " .. AccBool(TM_AllowAmbience) .. " (next in ".. AccNum(TMAmbienceLeftSec()) .. "s)" [if TM_AllowAmbience == true]
			TM_AllowAmbience = false
			Return()
		+ "Ambience | " .. AccBool(TM_AllowAmbience) [if TM_AllowAmbience == false]
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
	+ TM_MenuMod [if TM_ModMenu ~= nil]
		TM_ModMenu(human, hitTri)
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop
