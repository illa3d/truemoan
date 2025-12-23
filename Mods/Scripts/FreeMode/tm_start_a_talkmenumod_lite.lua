-- TrueMoan v1.0 by illa3d
-------------------------------------------------------------------------------------------------
-- Used for integration with Talk Menu Mod Manager
-------------------------------------------------------------------------------------------------
if type(TM_AddMenuMod) == "function" then
	TM_AddMenuMod("True Moan", "TMTalkMenu")
else
	local funcCode = [[
	function TalkMenu(human, hitTri)
		Jump("TMTalkMenu", human, hitTri)
	end
	]]
	load(funcCode)()
end