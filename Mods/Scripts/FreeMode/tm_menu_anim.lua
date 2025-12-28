-- TrueMoan v1.3 by illa3d
tmAdec = 2 -- decimals

label TMMenuAnim(human)
	-- FAUNA
	+ if TMMOD_FaunaLabs
		+ TM_MenuBack
			Return(2)
		+ AccStr(TM_PosePrefix_Faun) .. "SET Speed »	| " .. AccNum(CL_SMult, tmAdec) [gold]
			+ TM_UP.."Speed"
				CL_SMult = CL_SMult + Faun_SpeedIncrement
				Return()
			+ TM_DN.."Speed"
				CL_SMult = CL_SMult - Faun_SpeedIncrement
				Return()
			+ "RESET | " .. AccNum(CL_SMult, tmAdec) [gold]
				CL_SMult = 1
				Return()
			+ TM_MenuBack.. " (applied to new anims)"
				Return(2)
			+ TM_MenuClose
		+ AccStr(TM_PosePrefix_Faun) .. "SET Ease »		| " .. AccTextNum2("I", CLV_A, "O", CLV_B, tmAdec) [gold]
			+ TM_UP.."Ease In"
				CLV_A = CLV_A + Faun_EaseIncrement
				Return()
			+ TM_DN.."Ease In"
				CLV_A = CLV_A - Faun_EaseIncrement
				Return()
			+ "RESET Ease In | ".. AccNum(CLV_A, tmAdec) [gold]
				CLV_A = 2
				Return()
			+ TM_UP.."Ease Out"
				CLV_B = CLV_B + Faun_EaseIncrement
				Return()
			+ TM_DN.."Ease Out"
				CLV_B = CLV_B - Faun_EaseIncrement
				Return()
			+ "RESET Ease Out | " .. AccNum(CLV_B, tmAdec) [gold]
				CLV_B = 2
				Return()
			+ TM_MenuBack.. " (applied to new anims)"
				Return(2)
			+ TM_MenuClose
		+ AccStr(TM_PosePrefix_Faun) .. AccStr("EDIT Anim »") [gold]
			TMMenuFaunaAnimLab(human, hitTri)
		+ AccStr(TM_PosePrefix_Faun) .. "Feet »" [gold]
		-- + AccStr(TM_PosePrefix_Faun) .. "Feet »" [if bot game.HasAnim(human.footNames) == false] [gold]
			TMMenuFaunaAnim_Feet(human, hitTri)
		+ AccStr(TM_PosePrefix_Faun) .. "Licking »" [gold]
		-- + AccStr(TM_PosePrefix_Faun) .. "Licking »" [if not game.HasAnim(human.m_mouth) == false] [gold]
			TMMenuFaunaAnim_Licking(human, hitTri)
		+ AccStr(TM_PosePrefix_Faun) .. "Blowjob »" [gold]
			TMMenuFaunaAnim_Blowjob(human, hitTri)
		+ AccStr(TM_PosePrefix_Faun) .. "Neck »" [if not game.HasAnim(human.headNames) == false] [gold]
		-- + AccStr(TM_PosePrefix_Faun) .. "Neck »" [if not game.HasAnim(human.headNames) == false] [gold]
			TMMenuFaunaAnim_Neck(human, hitTri)
		+ AccStr(TM_PosePrefix_Faun) .. "Hand R »" [gold]
		-- + AccStr(TM_PosePrefix_Faun) .. "Hand R »" [if not game.HasAnim(human.handNames) == false] [gold]
			TMMenuFaunaAnim_HandR(human, hitTri)
		+ AccStr(TM_PosePrefix_Faun) .. "Hand L »" [gold]
		-- + AccStr(TM_PosePrefix_Faun) .. "Hand L »" [if not game.HasAnim(human.forearmNames) == false] [gold]
			TMMenuFaunaAnim_HandL(human, hitTri)
		+ AccStr(TM_PosePrefix_Faun) .. "Hips »" [gold]
			TMMenuFaunaAnim_Hips(human, hitTri)
		+ AccStr(TM_PosePrefix_Faun) .. "Breasts »" [gold]
		-- + AccStr(TM_PosePrefix_Faun) .. "Breasts »" [if not game.HasAnim(human.chestNames) == false] [gold]
			TMMenuFaunaAnim_Breasts(human, hitTri)
		+ AccStr(TM_PosePrefix_Faun) .. "Bouncing »" [gold]
		-- + AccStr(TM_PosePrefix_Faun) .. "Bouncing »" [if game.HasAnim(human.breastNames) == false] [gold]
			TMMenuFaunaAnim_Bouncing(human, hitTri)

		-- START FreemodeHG version 0.3 ~ fauna_LABS_v1.02 (partial menu extract)
		+ "STOP Shaking" [if game.HasAnim(human.chestNames) == true]
			game.RemoveAnim(human.chestNames)
			Return()
		+ "STOP Bouncing" [if game.HasAnim(human.breastNames) == true]
			game.RemoveAnim(human.breastNames)
			Return()
		+ "STOP Hand L" [if game.HasAnim(human.forearmNames) == true]
			game.RemoveAnim(human.forearmNames)
			Return()
		+ "STOP Hand R" [if game.HasAnim(human.handNames) == true]
			game.RemoveAnim(human.handNames)
			Return()
		+ "STOP Licking" [if game.HasAnim(human.m_mouth) == true]
			game.RemoveAnim(human.m_mouth)
			Return()
		+ "STOP Neck"[if game.HasAnim(human.headNames) == true]
			game.RemoveAnim(human.headNames)
			Return()
		+ "STOP Hips" [if game.HasAnim(human.Anus) == true]
			game.RemoveAnim(human.Anus)
			Return()
		+ "STOP Legs" [if game.HasAnim(human.footNames) == true]
			game.RemoveAnim(human.footNames)
			Return()
		+ "STOP Twisting" [if game.HasAnim(human.thighNames) == true]
			game.RemoveAnim(human.thighNames)
			Return(2)
		+ "STOP Humping"[if game.HasAnim(human) == true]
			game.RemoveAnim(human)
			Return()
		+ "STOP Head" [if game.HasAnim(human.spineNames) == true]
			game.RemoveAnim(human.spineNames)
			Return()
		-- END FreemodeHG version 0.3 ~ fauna_LABS_v1.02 (partial menu extract)		
	+ else
		+ AccStr("(requires faunalabs)") [gold]
			human "You were supposed to click the FaunaLABS bundle download!\nNow I suffer in lack of life, I'm like a robot, look at me!"
			Return(2)
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop