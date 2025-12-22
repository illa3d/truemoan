-- TrueMoan v0.9 by illa3d
label TMMenuOptions(human)
	+ "Anim Speed.. | " .. CL_SMult [gold]
		+ "Speed >"
			CL_SMult = CL_SMult + SpeedIncrement_A
			Return()
		+ "< Speed"
			CL_SMult = CL_SMult - SpeedIncrement_A
			Return()
		+ "RESET | "  .. CL_SMult [gold]
			CL_SMult = 1
			Return()
		+ MenuBack.." (applied to new anims)"
			Return(2)
		+ MenuClose
	+ "Anim Ease.. | " .. CLV2_A .. "/" .. CLV2_B [gold]
		+ "Ease In >"
			CLV2_A = CLV2_A + EaseIncrement_A
			Return()
		+ "< Ease In"
			CLV2_A = CLV2_A - EaseIncrement_A
			Return()
		+ "RESET Ease In |".. CLV2_A [gold]
			CLV2_A = 2
			Return()
		+ "Ease Out >"
			CLV2_B = CLV2_B + EaseIncrement_A
			Return()
		+ "< Ease Out"
			CLV2_B = CLV2_B - EaseIncrement_A
			Return()
		+ "RESET Ease Out | ".. CLV2_B [gold]
			CLV2_B = 2
			Return()
		+ MenuBack.." (applied to new anims)"
			Return(2)
		+ MenuClose
	+ "Ambience.." [gold]
		+ "Refresh" [if AllowAmbience == true]
			Return()
		+ "Next track | Ambience " .. tmAmbienceTrack [if AllowAmbience]
			TMPlayAmbienceNext()
			Return()
		+ "Ambience | ON (loop in ".. TMAmbienceLeftSec() .. "s)" [if AllowAmbience == true]
			AllowAmbience = false
			Return()
		+ "Ambience | OFF" [if AllowAmbience == false]
			AllowAmbience = true
			TMPlayAmbienceCurrent()
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
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
	+ "Sex.." [gold]
		+ "Moan Sex | ON" [if Moaning == true]
			Moaning = false
			Return()
		+ "Moan Sex | OFF" [if Moaning == false]
			Moaning = true
			Return()
		+ "Moan Cum | ON" [if game.FluidReaction == true]
			game.FluidReaction = false
			Return()
		+ "Moan Cum | OFF" [if game.FluidReaction == false]
			game.FluidReaction = true
			Return()
		+ "Wet Sex | ON" [if WetSex == true]
			WetSex = false
			Return()
		+ "Wet Sex | OFF" [if WetSex == false]
			WetSex = true
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "New people | Naked" [if NakedOnSpawn == true]
		NakedOnSpawn = false
		Return()
	+ "New people | Clothed" [if NakedOnSpawn == false]
		NakedOnSpawn = true
		Return()
	+ "Hide UI" [if HG_UIvis == true]
		HG_UIvis = false
		game.m_controlsUI.Show(false)
		Return()
	+ "Show UI" [if HG_UIvis == false]
		HG_UIvis = true
		game.m_controlsUI.Show()
		Return()
	+ MenuBack
		Return(2)
	+ MenuClose
stop
