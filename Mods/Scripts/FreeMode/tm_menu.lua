-- TrueMoan v1.9 by illa3d
-------------------------------------------------------------------------------------------------
-- MAIN MENU
-------------------------------------------------------------------------------------------------

label TMTalkMenu(human, hitTri)
	+ "OPTIONS »" ..(game.m_freezeAllActors and " (paused)" or "") [gold]
		TMMenuOptions(human)
	+ if TM_Menu_HideShowUI
		+ "Hide UI" [if TM_UIVisible]
			TM_UIVisible = false
			game.m_controlsUI.Show(false)
		+ "Show UI" [if not TM_UIVisible]
			TM_UIVisible = true
			game.m_controlsUI.Show()
			Return()
	+ "FAUNA LABS »" [if TMMOD_FaunaLabs and TM_Menu_FaunaLabs] [gold]
		TMMOD_Jump(TMMOD_Menu_FaunaLabs, human, hitTri)
	+ "POSE »" [gold]
		TMMenuPose(human)
	+ "FACE »"[gold]
		TMMenuFace(human)
	+ "ANIM »" [gold]
		TMMenuAnim(human)
	+ "SEX »" [gold]
		TMMenuSex(human)
	+ "BODY »" [gold]
		TMBodyEditHuman(human)
		TMMenuBody(human)
	+ "HEY, " .. AccStr(human.Name) [gold]
		TMMenuHeyHuman(human)
	+ if game.PovHuman ~= human
		+ "POV"
			game.PovHuman = human
			Return()
	+ if game.PovHuman ~= nil
		+ "Exit POV"
			game.PovHuman = nil
			Return()
	+ TM_MenuCloseArousal(human)
stop

-------------------------------------------------------------------------------------------------
-- DYNAMIC MENUS (using menu__items.lua)
-------------------------------------------------------------------------------------------------
-- TRUE FACE
label TMMenuList_TrueFace(human, faceItems)
	-- ModPosePresets = { { name = "MenuName", preset = PoseFunction }, ... }
	+ if faceItems == nil or #faceItems == 0
		+ "-empty- " .. AccStr("(tm--faces.lua)")
			Return()
	+ else
		+ TM_MenuBack
			Return(2)
		+ for i, pair in ipairs(faceItems)
			+ AccStr(#faceItems - i .. ". ") .. pair.name
				TMMenu_TrueFacePreset(human, pair.preset)
				Return()
			+ if i % TM_MenuBackButtonEvery == 0
				+ TM_MenuBack
					Return(2)
	+ "Stop TrueFace" [if (IsTrueFaceActive(human))]
		TrueFaceStop(human)
		Return()
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- POSES
label TMMenuList_Poses(human, posePresets)
	-- ModPosePresets = { { name = "MenuName", preset = PoseFunction }, ... }
	+ if posePresets == nil or #posePresets == 0
		+ "-empty- " .. AccStr("(tm--presets.lua)")
			Return()
	+ else
		+ TM_MenuBack
			Return(2)
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
label TMMenuList_Clothes(human, clothesPresets)
	-- ModClothesCharacters = { character, character }
	+ if clothesPresets == nil or #clothesPresets == 0
		+ "-empty- " .. AccStr("(tm--clothes.lua)")
			Return()
	+ else
		+ TM_MenuBack
			Return(2)
		+ for i, item in ipairs(clothesPresets)
			+ AccStr(i .. ". ") .. item
				HumanClothesReplace(human, item)
			+ if i % TM_MenuBackButtonEvery == 0
				+ TM_MenuBack
					Return(2)
	+ "Random" [gold]
		HumanClothesRandom(human)
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- MUSIC
label TMMenuList_Music(musicTracks)
	-- ModClothesCharacters = { character, character }
	+ if musicTracks == nil or #musicTracks == 0
		+ "-empty- " .. AccStr("(tm--music.lua)")
			Return()
	+ else
		+ TM_MenuBack
			Return(2)
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