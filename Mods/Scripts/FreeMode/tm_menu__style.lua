-- TrueMoan v2.0 by illa3d
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
function AccBoolYN (bol)
	 return FCol(bol and "Yes" or "No", TM_MenuAccent)
end
function AccStr (str)
	return FCol(str, TM_MenuAccent)
end
function AccNum (value, decimals)
	return FCol(FDec(value, decimals), TM_MenuAccent)
end
function AccTime (timestamp, decimals)
	return AccNum((os.time() - timestamp), decimals) .. "s ago"
end
function AccNumPC (value, decimals)
	return FCol((FDec(value * 100, decimals) .. "%"), TM_MenuAccent)
end
function AccTextNum1 (text, value, decimals)
	return text .. " " .. FCol(FDec(value, decimals), TM_MenuAccent)
end
function AccTextNum2 (text1, value1, text2, value2, decimals)
	return text1 .. " " .. FCol(FDec(value1, decimals), TM_MenuAccent) .. " |" .. text2 .. " " .. FCol(FDec(value2, decimals), TM_MenuAccent)
end
function AccTextNum3 (text1, value1, text2, value2, text3, value3, decimals)
	return text1 .. " " .. FCol(FDec(value1, decimals), TM_MenuAccent) .. " |" .. text2 .. " " .. FCol(FDec(value2, decimals), TM_MenuAccent) .. " |" .. text3 .. " " .. FCol(FDec(value3, decimals), TM_MenuAccent)
end

-------------------------------------------------------------------------------------------------
-- CUSTOM LABELS
-------------------------------------------------------------------------------------------------
function TM_MenuCloseArousal(human)
	return TM_MenuClose .. "		Arousal " .. TMMLabel_Arousal(human, true)
end

function TMMLabel_Cum(human)
	local stats = TMHStatsGet(human)
	if not stats then return "" end
	return AccBoolYN(stats.IsCumming) .. (stats.IsCumming and " | " .. AccNum(stats.CumFrequency) .. "s" or "")
end

function TMMLabel_AutoSex(human)
	local stats = TMHStatsGet(human)
	if not stats then return "" end
	if not TM_AutoSex then return "OFF (global)"
	elseif not stats.AutoSex then return "OFF"
	else return AccStr(stats.AutoSexTier) end
end

function TMMLabel_Arousal(human, skipLetter)
	stats = TMHStatsGet(human)
	if not stats then return "" end
	return (skipLetter and "" or "A ") .. (stats.Climax and AccStr("Climax!") or AccNumPC(stats.Arousal))
end

function TMMLabel_Holes(human)
	local stats = TMHStatsGet(human)
	if not stats or not stats.SexBody or IsTableEmpty(stats.SexBody) then return "" end
	local bodyStr = ""
	for _, actBody in pairs(stats.SexBody) do
		bodyStr = bodyStr .. (bodyStr ~= "" and ", " or "") .. actBody
	end
	return bodyStr ~= "" and bodyStr or "-"
end