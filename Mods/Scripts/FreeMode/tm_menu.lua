-- TrueMoan v1.3 by illa3d
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
		TMMenuBody(human)
	+ "HEY, " .. AccStr(human.Name) .. " »" [gold]
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
-- DYNAMIC MENUS (using menu__items.lua)
-------------------------------------------------------------------------------------------------

-- POSES
label TMMenuItems_Poses(human, posePresets)
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
label TMMenuItems_Clothes(human, clothesPresets)
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
	+ "Random" [gold]
		HumanClothesRandom(human)
	+ TM_MenuBack
		Return(2)
	+ TM_MenuClose
stop

-- MUSIC
label TMMenuItems_Music(musicTracks)
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