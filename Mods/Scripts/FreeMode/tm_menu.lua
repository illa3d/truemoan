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
	+ "HEY, " .. FBold(human.Name) .. ".." [gold]
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

function AccBool (bol)
	 return FCol(bol and "ON" or "OFF", TM_MenuAccent)
end
function AccStr (str)
	return  FCol(str, TM_MenuAccent)
end
function AccNum (value, decimals)
	return  FCol(FDec(value, decimals), TM_MenuAccent)
end
function AccTextNum1 (text, value, decimals)
	return  text .. FCol(FDec(value, decimals), TM_MenuAccent)
end
function AccTextNum2 (text1, value1, text2, value2, decimals)
	return  text1 .. FCol(FDec(value1, decimals), TM_MenuAccent) .. " | " .. text2 .. FCol(FDec(value2, decimals), TM_MenuAccent)
end
function AccTextNum3 (text1, value1, text2, value2, text3, value3, decimals)
	return  text1 .. FCol(FDec(value1, decimals), TM_MenuAccent) .. " | " .. text2 .. FCol(FDec(value2, decimals), TM_MenuAccent) .. " | " .. text3 .. FCol(FDec(value3, decimals), TM_MenuAccent)
end