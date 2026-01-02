-- TrueMoan v1.8 by illa3d
-- MENU STYLES for True Moan

-------------------------------------------------------------------------------------------------
-- MENU ELEMENTS
-------------------------------------------------------------------------------------------------

TM_MenuOk = "<color=#e87435>» OK</color>"
TM_MenuCancel = "<color=#e85035>× CANCEL</color>"
TM_MenuMod = "<color=#e87435>« MOD MENU</color>"
TM_MenuBack = "<color=#e87435>« BACK</color>"
TM_MenuClose = "<color=#e85035>× CLOSE</color>"
TM_MenuAccent = "#df9c3d"
TM_EndColor = "</color>"
TM_UP = "|>| "
TM_DN = "|<| "

-------------------------------------------------------------------------------------------------
-- ACCENT VALUES FORMATTING
-------------------------------------------------------------------------------------------------

function AccBool (bol)
	 return FCol(bol and "ON" or "OFF", TM_MenuAccent)
end
function AccBoolDE (bol)
	 return FCol(bol and "Enabled" or "Disabled", TM_MenuAccent)
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