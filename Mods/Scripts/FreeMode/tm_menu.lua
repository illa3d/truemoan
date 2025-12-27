-- TrueMoan v1.3 by illa3d
-------------------------------------------------------------------------------------------------
-- MAIN MENU
-------------------------------------------------------------------------------------------------

label TMTalkMenu(human, hitTri)
	+ "OPTIONS.." ..(game.m_freezeAllActors and " (paused)" or "") [gold]
		TMMenuOptions(human)
	+ if TM_Menu_HideShowUI
		+ "Hide UI" [if TM_UIVisible]
			TM_UIVisible = false
			game.m_controlsUI.Show(false)
		+ "Show UI" [if not TM_UIVisible]
			TM_UIVisible = true
			game.m_controlsUI.Show()
			Return()
	+ "FAUNA LABS.." [if TMMOD_FaunaLabs and TM_Menu_FaunaLabs] [gold]
		TMMOD_Jump(TMMOD_Menu_FaunaLabs, human, hitTri)
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
	+ "HEY, " .. AccStr(human.Name) .. ".." [gold]
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

-------------------------------------------------------------------------------------------------
-- DYNAMIC MENUS
-------------------------------------------------------------------------------------------------

-- POSES
label GetMenuItems_Poses(human, posePresets)
	-- ModPosePresets = { { name = "MenuName", preset = PoseFunction }, ... }
	+ TM_MenuBack
		Return(2)
	+ if posePresets == nil or #posePresets == 0
		+ "-empty- " .. AccStr("(tm--presets.lua)")
			Return()
	+ else
		+ for i, pair in ipairs(posePresets)
			+ AccStr(#posePresets - i .. ". ") .. pair.name
				human.Pose(human, pair.preset())
				Return()
			+ if i % TM_MenuBackButtonEvery == 0
				+ TM_MenuBack
					Return(2)
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- CLOTHES
label GetMenuItems_Clothes(human, clothesPresets)
	-- ModClothesCharacters = { character, character }
	+ TM_MenuBack
		Return(2)
	+ if clothesPresets == nil or #clothesPresets == 0
		+ "-empty- " .. AccStr("(tm--clothes.lua)")
			Return()
	+ else
		+ for i, item in ipairs(clothesPresets)
			+ AccStr(i .. ". ") .. item
				HumanClothesReplace(human, item)
			+ if i % TM_MenuBackButtonEvery == 0
				+ TM_MenuBack
					Return(2)
	+ "Random Clothes"
		HumanClothesRandom(human)
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- MUSIC
label GetMenuItems_Music(musicTracks)
	-- ModClothesCharacters = { character, character }
	+ TM_MenuBack
		Return(2)
	+ if musicTracks == nil or #musicTracks == 0
		+ "-empty- " .. AccStr("(tm--music.lua)")
			Return()
	+ else
		+ for i, item in ipairs(musicTracks)
			+ AccStr("> ") .. item
				TMPlayMusic(item)
				Return()
			+ if i % TM_MenuBackButtonEvery == 0
				+ TM_MenuBack
					Return(2)
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-------------------------------------------------------------------------------------------------
-- LABELS FORMAT (no need to modify)
-------------------------------------------------------------------------------------------------

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