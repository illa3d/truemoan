-- TrueMoan v1.0 by illa3d
label TMTalkMenu(human, hitTri)
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

-- LABELS FORMAT (no need to modify)
TM_EndColor = "</color>"

function TMBoolLabel (bvalue)
	 return TM_MenuNumColor .. (bvalue and "ON" or "OFF") .. TM_EndColor
end
function TMWordLabel (svalue)
	return  TM_MenuNumColor .. svalue .. TM_EndColor
end
function TMValueLabel (value, decimals)
	return  TM_MenuNumColor .. TruncDecimal(value, decimals) .. TM_EndColor
end
function TMValueLabel1 (letter, value, decimals)
	return  letter .. TM_MenuNumColor .. TruncDecimal(value, decimals) .. TM_EndColor
end
function TMValueLabel2 (letter1, value1, letter2, value2, decimals)
	return  letter1 .. TM_MenuNumColor .. TruncDecimal(value1, decimals) .. TM_EndColor .. " | " .. letter2 .. TM_MenuNumColor .. TruncDecimal(value2, decimals) .. TM_EndColor
end