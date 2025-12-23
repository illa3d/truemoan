-- TrueMoan v0.9 by illa3d
adec = 1

label TMMenuOptions(human)
	+ "Music.." [gold]
		+ MenuBack
			Return (2)
		+ for i, track in ipairs(MusicTracks)
			+ "Play " .. track
				Music(track , 0.05, 0)
				Return()
		+ "Stop Music"
			StopMusic()
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Ambience.. | " .. BoolLabel(AllowAmbience) [gold]
		+ "Refresh" [if AllowAmbience == true]
			Return()
		+ "Next track | " .. WordLabel("Ambience " .. tmAmbienceTrack) [if AllowAmbience]
			TMPlayAmbienceNext()
			Return()
		+ "Ambience | " .. BoolLabel(AllowAmbience) .. " (loops in ".. ValueLabel(TMAmbienceLeftSec()) .. "s)" [if AllowAmbience == true]
			AllowAmbience = false
			Return()
		+ "Ambience | " .. BoolLabel(AllowAmbience) [if AllowAmbience == false]
			AllowAmbience = true
			TMPlayAmbienceCurrent()
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	-- + "Sex.." [gold] --return when options fill up
	+ "Moan Sex | " .. BoolLabel(Moaning) [if Moaning == true]
		Moaning = false
		Return()
	+ "Moan Sex | " .. BoolLabel(Moaning) [if Moaning == false]
		Moaning = true
		Return()
	+ "Moan Cum | " .. BoolLabel(game.FluidReaction) [if game.FluidReaction == true]
		game.FluidReaction = false
		Return()
	+ "Moan Cum | " .. BoolLabel(game.FluidReaction) [if game.FluidReaction == false]
		game.FluidReaction = true
		Return()
	+ "Wet Sex | " .. BoolLabel(WetSex) [if WetSex == true]
		WetSex = false
		Return()
	+ "Wet Sex | " .. BoolLabel(WetSex) [if WetSex == false]
		WetSex = true
		Return()
	-- + MenuBack
	-- 	Return(2)
	-- + MenuClose
	+ "New people | " .. WordLabel("Naked") [if NakedOnSpawn == true]
		NakedOnSpawn = false
		Return()
	+ "New people | " .. WordLabel("Clothed") [if NakedOnSpawn == false]
		NakedOnSpawn = true
		Return()
	+ "Hide UI" [if HG_UIvis == true]
		HG_UIvis = false
		game.m_controlsUI.Show(false)
	+ "Show UI" [if HG_UIvis == false]
		HG_UIvis = true
		game.m_controlsUI.Show()
		Return()
	+ MenuBack
		Return(2)
	+ MenuClose
stop
