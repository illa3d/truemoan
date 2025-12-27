-- TrueMoan v1.2 by illa3d
tmAdec = 2 -- decimals

label TMMenuAnim(human)
	-- FAUNA
	+ if TMMOD_FaunaLabs
		+ AccStr(TM_PosePrefix_Faun) .. "Speed.. | " .. AccNum(CL_SMult, tmAdec) [gold]
			+ "| > Speed"
				CL_SMult = CL_SMult + Faun_SpeedIncrement
				Return()
			+ "| < Speed"
				CL_SMult = CL_SMult - Faun_SpeedIncrement
				Return()
			+ "RESET | " .. AccNum(CL_SMult, tmAdec) [gold]
				CL_SMult = 1
				Return()
			+ TM_MenuBack.. " (applied to new anims)"
				Return(2)
			+ TM_MenuClose
		+ AccStr(TM_PosePrefix_Faun) .. "Ease.. | " .. AccTextNum2("I", CLV_A, "O", CLV_B, tmAdec) [gold]
			+ "| > Ease In"
				CLV_A = CLV_A + Faun_EaseIncrement
				Return()
			+ "| < Ease In"
				CLV_A = CLV_A - Faun_EaseIncrement
				Return()
			+ "RESET Ease In | ".. AccNum(CLV_A, tmAdec) [gold]
				CLV_A = 2
				Return()
			+ "| > Ease Out"
				CLV_B = CLV_B + Faun_EaseIncrement
				Return()
			+ "| < Ease Out"
				CLV_B = CLV_B - Faun_EaseIncrement
				Return()
			+ "RESET Ease Out | " .. AccNum(CLV_B, tmAdec) [gold]
				CLV_B = 2
				Return()
			+ TM_MenuBack.. " (applied to new anims)"
				Return(2)
			+ TM_MenuClose
		+ AccStr(TM_PosePrefix_Faun) .. "EDIT Anim.." [gold]
			TMMenuFaunaAnimationLab(human, hitTri)
	-- ORIGINAL
	+ AccStr(TM_PosePrefix_Orig) .. "Poses.." [gold]
		GetMenuItems_Poses(human, TM_PoseBody_Original)
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop