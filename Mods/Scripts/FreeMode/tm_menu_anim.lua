-- TrueMoan v1.2 by illa3d
label TMMenuAnim(human)
	-- FAUNA
	+ if TMMOD_FaunaLabs
		+ AccStr(TM_PosePrefix_Faun) .. "EDIT Anim.." [gold]
			TMMenuFaunaAnimationLab(human, hitTri)
	-- ORIGINAL
	+ AccStr(TM_PosePrefix_Orig) .. "Poses.." [gold]
		GetMenuItems_Poses(human, TM_PoseBody_Original)
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop