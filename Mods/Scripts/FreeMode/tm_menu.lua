-- TrueMoan v1.0 by illa3d
label TMTalkMenu(human, hitTri)
	+ "Mod Menu" [if TM_ModMenu ~= nil] [gold]
		TM_ModMenu(human, hitTri)
	+ if TM_RootHideShowUI
		+ "Hide UI" [if HG_UIvis == true]
			HG_UIvis = false
			game.m_controlsUI.Show(false)
		+ "Show UI" [if HG_UIvis == false]
			HG_UIvis = true
			game.m_controlsUI.Show()
			Return()
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
	+ TM_MenuClose
stop