-- TrueMoan v0.9 by illa3d
label TalkMenu(human, hitTri)
	+ "OPTIONS.." [gold]
		TMMenuOptions(human)
	+ "POSE.." [gold]
		TMMenuPose(human)
	+ "FACE.."[gold]
		TMMenuFace(human)
	+ "ANIM.." [gold]
		TMMenuAnim(human)
	+ "SEX.." [gold]
		TMMenuSex(human)
	+ "BODY.." [gold]
		TMMenuBody(human)
	+ "HEY, " .. human.Name ..".." [gold]
		TMMenuHeyHuman(human)
	+ if game.PovHuman ~= human
		+ "POV"
			game.PovHuman = human
			Return()
	+ if game.PovHuman ~= nil
		+ "Exit POV"
			game.PovHuman = nil
			Return()
	+ MenuClose
stop