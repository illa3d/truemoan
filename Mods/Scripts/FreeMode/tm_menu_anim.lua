-- TrueMoan v1.2 by illa3d
label TMMenuAnim(human)
	+ if TMMOD_FaunaLabs
		+ AccStr(TM_PosePrefix_Faun) .. "Coming soon! :)"
			Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop