-- TrueMoan v0.6 by illa3d
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
	+ "Music.." [gold]
		+ MenuBack
			Return (2)
		+ for i, track in ipairs(tracklist)
			+ "Play " .. track
				Music(track , 0.05, 0)
				Return()
		+ "Stop Music"
			StopMusic()
			Return()
		+ MenuBack
			Return(2)
		+ MenuClose
	+ "Safe Body Edit | ON" [if editsafe == true]
		editsafe = false
		Return()
	+ "Safe Body Edit | OFF (could crash app)" [if editsafe == false]
		editsafe = true
		Return()
	+ "Sex Moan | ON" [if moaning == true]
		moaning = false
		Return()
	+ "Sex Moan | OFF" [if moaning == false]
		moaning = true
		Return()
	+ "Cum Moan | ON" [if game.FluidReaction == true]
		game.FluidReaction = false
		Return()
	+ "Cum Moan | OFF" [if game.FluidReaction == false]
		game.FluidReaction = true
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
