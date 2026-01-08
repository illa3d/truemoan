-- TrueMoan v2.0 by illa3d
-- Ambience Constants
tmAmbienceTrackSec = 140	-- depends on the mp3 file length (all files must be of same length)
tmAmbienceTracks = 6		-- number of files: Sounds/tm_ambience (N).mp3 (modify this to add your own)
-- Ambience Variables
tmPlayingAmbience = false
tmLoopingAmbience = false
tmAmbienceTrack = 0
tmAmbienceTimer = "AmbienceTimer"

-- Moan Tier "Enum" (actual filenames)
-- VAR NAMES MUST BE SAME AS AutoSexTier
-- String values are part-filenames: tm_climax (3).mp3
TMMoanTier = {
	Idle = "slow",
	Slow = "slow",
	Normal = "normal",
	Fast = "fast",
	Faster = "faster",
	Wild = "orgasm", -- can't rename string, filenames
	Max = "climax", -- can't rename string, filenames
}

TMMoan = {
	Sex = "Sex", -- dynamic
	Climax = "Climax", -- dynamic
	Cumming = "Cumming",
	CumEye = "CumEye",
	CumMouth = "CumMouth",
	CumBody = "CumBody",
	CumInside = "CumInside",
	Cumflating = "Cumflating",
	Cumdeflating = "Cumdeflating",
	DoubleClick = "DoubleClick",
}

-- Human part positions
HumanPart = {
	Mouth = "Mouth",
	Anus = "Anus",
	Vagina = "Vagina",
	Penis = "Penis",
}

function HumanPosGet(part)
	if not part then return Pos(0,0,0) end
	return Pos(part.transform.position.x, part.transform.position.y, part.transform.position.z)
end

function HumanPartPosGet(human, humanPart)
	if not human then return Pos(0,0,0) end
	function GetPos(part) return Pos(part.transform.position.x, part.transform.position.y, part.transform.position.z) end
	if humanPart == HumanPart.Mouth and human.Mouth then return GetPos(human.Mouth)
	elseif humanPart == HumanPart.Anus and human.Anus then return GetPos(human.Anus)
	elseif humanPart == HumanPart.Vagina and human.Vagina then return GetPos(human.Vagina)
	elseif humanPart == HumanPart.Penis and human.Penis then return GetPos(human.Penis) end
	if not part then return Pos(0,0,0) end
end

-- Cum Moan Sources (random)
TM_Moans_Cumming = { TMMoanTier.Fast, TMMoanTier.Faster, TMMoanTier.Wild }
TM_Moans_CumEye = { TMMoanTier.Faster, TMMoanTier.Wild, TMMoanTier.Max }
TM_Moans_CumMouth = { TMMoanTier.Fast, TMMoanTier.Faster }
TM_Moans_CumBody = { TMMoanTier.Slow, TMMoanTier.Normal }
TM_Moans_CumInside = { TMMoanTier.Slow, TMMoanTier.Normal, TMMoanTier.Fast }
TM_Moans_Cumflating = { TMMoanTier.Fast, TMMoanTier.Faster, TMMoanTier.Wild }
TM_Moans_Cumdeflating = { TMMoanTier.Slow, TMMoanTier.Fast, TMMoanTier.Faster }

-- MOANS
function TMPlayMoan(girl, tmMoan)
	local stats = TMHStatsGet(girl)
	if not stats or stats.Climax then return end
	-- if tmMoanSource == TMMoanSource.Sex then -- dynamic
	-- elseif tmMoanSource == TMMoanSource.Climax then -- dynamic
	if tmMoan == TMMoan.Cumming then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_Cumming))
	elseif tmMoan == TMMoan.CumEye then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_CumEye))
	elseif tmMoan == TMMoan.CumMouth then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_CumMouth))
	elseif tmMoan == TMMoan.CumBody and not stats.IsSexActive then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_CumBody))
	elseif tmMoan == TMMoan.CumInside and not stats.IsSexActive then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_CumInside))
	elseif tmMoan == TMMoan.Cumflating then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_Cumflating))
	elseif tmMoan == TMMoan.Cumdeflating then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_Cumdeflating))
	elseif tmMoan == TMMoan.DoubleClick then TMPlayMoanTier(girl, TableItemRandom(TMMoanTier))
	end
end

function TMPlayEffect(girl, name, humanPart)
	if not TM_AllowVoice() or not girl or girl.m_isMale then return end
	PlaySoundAt(name, HumanPartPosGet(girl, humanPart), 0.5)
end

function TMPlayMoanTier(girl, tmMoanTier)
	-- don't moan with other voice mods
	if not TM_AllowVoice() or not girl or girl.m_isMale then return end
	girl.SayCustom("tm_" .. tmMoanTier)
end

-- MUSIC
function TMPlayMusic(track)
	Music(track , 0.05, 0)
end

-- AMBIENCE
function TMAmbienceLeftSec()
	return FDec(tmAmbienceTrackSec - Timer(tmAmbienceTimer))
end

function TMStopAmbience()
	tmPlayingAmbience = false
end

function TMPlayAmbienceCurrent()
	TMPlayAmbience(tmAmbienceTrack)
end

function TMPlayAmbienceNext()
	track = 1
	if (tmAmbienceTrack == tmAmbienceTracks) then track = 1
	else track = tmAmbienceTrack + 1 end
	TMPlayAmbience(track)
end

function TMPlayAmbienceRandom()
	TMPlayAmbience(math.random(1, tmAmbienceTracks))
end

function TMPlayAmbience(track)
	if TM_AllowAmbience == false then return end

	-- set next ambience to play
	track = math.max(1, math.min(track, tmAmbienceTracks)) -- Clamp
	tmAmbienceTrack = track
	tmPlayingAmbience = true

	-- Loop playback
	if tmLoopingAmbience then return end
	ResetTimer(tmAmbienceTimer)
	tmLoopingAmbience = true
	PlaySound("tm_ambience" .. " (" .. track .. ")", TM_AmbienceVolume)
	Delayed(tmAmbienceTrackSec, function()
		tmLoopingAmbience = false
		if TM_AllowAmbience and tmPlayingAmbience then TMPlayAmbience(tmAmbienceTrack) end
	end)
end
