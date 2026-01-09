-- TrueMoan v2.1 by illa3d
-- Ambience Constants
local tmAmbienceTrackSec = 140	-- depends on the mp3 file length (all files must be of same length)

-- Ambience publicVariables
TM_AmbienceTrack = 0
-- Ambience Variables
local tmPlayingAmbience = false
local tmLoopingAmbience = false
local tmAmbienceTimer = "TM_AmbienceTimer"
local TMSfxPlayedTracks = {}

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

-- TM Moan categories
TMMoan = {
	Sex = "Sex", -- dynamic
	Climax = "Climax", -- dynamic
	Cumming = "Cumming",
	CumHead = "CumHead",
	CumHole = "CumHole",
	CumBody = "CumBody",
	CumInside = "CumInside",
	Cumflating = "Cumflating",
	Cumdeflating = "Cumdeflating",
	DoubleClick = "DoubleClick",
}

-- Cum body area moan tiers (random from)
TM_Moans_Cumming = { TMMoanTier.Fast, TMMoanTier.Faster, TMMoanTier.Wild }
TM_Moans_CumHead = { TMMoanTier.Faster, TMMoanTier.Wild, TMMoanTier.Max }
TM_Moans_CumHole = { TMMoanTier.Normal, TMMoanTier.Fast }
TM_Moans_CumBody = { TMMoanTier.Slow, TMMoanTier.Normal }
TM_Moans_CumInside = { TMMoanTier.Slow, TMMoanTier.Normal, TMMoanTier.Fast }
TM_Moans_Cumflating = { TMMoanTier.Fast, TMMoanTier.Faster, TMMoanTier.Wild }
TM_Moans_Cumdeflating = { TMMoanTier.Slow, TMMoanTier.Fast, TMMoanTier.Faster }

-- Human part positions
TMHumanSource = {
	Mouth = "Mouth",
	Anus = "Anus",
	Vagina = "Vagina",
	Penis = "Penis",
}

-- SOUND EFFECTS
TMSfx = {
	Ambience = "Ambience",
	Blowjob = "Blowjob",
	Blowjob_Deep = "Blowjob_Deep",
	Plap = "Plap",
}
-- Tracks = number of files: Sounds/tm_sfxname (N).mp3 (modify this to add your own)
TMSfxData = {
	[TMSfx.Ambience] =		{ Tracks = 6, Volume = 0 }, -- volume in config
	[TMSfx.Blowjob] =		{ Tracks = 25, Volume = 0.9 },
	[TMSfx.Blowjob_Deep] =	{ Tracks = 25, Volume = 0.9 },
	[TMSfx.Plap] =			{ Tracks = 20, Volume = 0.7 },
}

function TMSfxGetFilename(tmSfx, track)
	track = ClampValue(track, 1, TMSfxData[tmSfx].Tracks)
	return "tm_" .. tmSfx:lower() .. " (" .. track .. ")" end
function TMSfxGetTrackClamp(tmSfx, track)
	return ClampValue(track, 1, TMSfxData[tmSfx].Tracks) end

-- TRUE RANDOM
function TMSfxGetFilenameRandom(tmSfx)
	local data = TMSfxData[tmSfx]
	if not data or data.Tracks <= 0 then return nil end
	-- Init remembered tracks
	if not TMSfxPlayedTracks[tmSfx] then
		TMSfxPlayedTracks[tmSfx] = { Played = {}, Count = 0 }
	end
	local mem = TMSfxPlayedTracks[tmSfx]
	-- Reset ONLY when all tracks have been used
	if mem.Count >= data.Tracks then
		mem.Played = {}
		mem.Count = 0
	end
	-- Hard safety limit (prevent infinite loops)
	for _ = 1, 20 do
		local track = math.random(1, data.Tracks)
		if not mem.Played[track] then
			mem.Played[track] = true
			mem.Count = mem.Count + 1
			return TMSfxGetFilename(tmSfx, track)
		end
	end
	-- Fallback
	local track = math.random(1, data.Tracks)
	return TMSfxGetFilename(tmSfx, track)
end

-------------------------------------------------------------------------------------------------
-- SFX / SOUND SOURCE POSITION
-------------------------------------------------------------------------------------------------
TMHumanSource = {
	Mouth = "Mouth",
	Anus = "Anus",
	Vagina = "Vagina",
	Penis = "Penis",
}

function TMHumanHolePosGet(part)
	if not part then return Pos(0,0,0) end
	return Pos(part.m_autoTarget.transform.position.x, part.m_autoTarget.transform.position.y, part.m_autoTarget.transform.position.z)
	-- return Pos(part.m_entry.transform.position.x, part.m_entry.transform.position.y, part.m_entry.transform.position.z) -- too in forward
	-- return Pos(part.transform.position.x, part.transform.position.y, part.transform.position.z) -- this is not following actual head, just human roughly
end

function TMHumanPenisPosGet(part)
	if not part then return Pos(0,0,0) end
	return Pos(part.transform.position.x, part.transform.position.y, part.transform.position.z)
end

function TMSoundSourcePosGet(human, tmHumanSource)
	if not human then return Pos(0,0,0) end
	if tmHumanSource == TMHumanSource.Mouth and human.Mouth then return TMHumanHolePosGet(human.Mouth)
	elseif tmHumanSource == TMHumanSource.Anus and human.Anus then return TMHumanHolePosGet(human.Anus)
	elseif tmHumanSource == TMHumanSource.Vagina and human.Vagina then return TMHumanHolePosGet(human.Vagina)
	elseif tmHumanSource == TMHumanSource.Penis and human.Penis then return TMHumanPenisPosGet(human.Penis) end
	if not part then return Pos(0,0,0) end
end

function TMPlayHumanSFX(girl, tmSfx, humanPart, volume)
	if not TM_AllowVoice() or not TM_SFX_AllReactions or not girl or girl.m_isMale then return end
	-- if defined volume in param, multiply by volume in config. if not defined, just use volume config
	local vol = volume and (volume * TMSfxData[tmSfx].Volume) or TMSfxData[tmSfx].Volume
	PlaySoundAt(TMSfxGetFilenameRandom(tmSfx), TMSoundSourcePosGet(girl, humanPart), vol)
end

-------------------------------------------------------------------------------------------------
-- MOANING
-------------------------------------------------------------------------------------------------

function TMPlayMoan(girl, tmMoan)
	if not TM_AllowVoice() or not TM_SFX_AllReactions or not girl or girl.m_isMale then return end
	local stats = TMHStatsGet(girl)
	if not stats or stats.Climax then return end
	-- if tmMoanSource == TMMoanSource.Sex then -- dynamic
	-- elseif tmMoanSource == TMMoanSource.Climax then -- dynamic
	if tmMoan == TMMoan.Cumming and TM_SFX_ReactSex then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_Cumming))
	elseif tmMoan == TMMoan.CumHead then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_CumHead))
	elseif tmMoan == TMMoan.CumHole then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_CumHole))
	elseif tmMoan == TMMoan.CumBody then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_CumBody))
	elseif tmMoan == TMMoan.CumInside and TM_SFX_ReactSex and not stats.IsSexActive then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_CumInside))
	elseif tmMoan == TMMoan.Cumflating and TM_SFX_ReactSex then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_Cumflating))
	elseif tmMoan == TMMoan.Cumdeflating and TM_SFX_ReactSex then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_Cumdeflating))
	elseif tmMoan == TMMoan.DoubleClick then TMPlayMoanTier(girl, TableItemRandom(TMMoanTier))
	end
end

-- SFX: All sfx is played here. Directly calling: Sex, Futa, Cum, Cumflation, Cumdeflation (the rest is above)
function TMPlayMoanTier(girl, tmMoanTier)
	-- don't moan with other voice mods
	if not TM_AllowVoice() or not TM_SFX_AllReactions or not girl or girl.m_isMale then return end
	girl.SayCustom("tm_" .. tmMoanTier)
end

-------------------------------------------------------------------------------------------------
-- MUSIC
-------------------------------------------------------------------------------------------------

function TMPlayMusic(track)
	Music(track , 0.05, 0)
end

-------------------------------------------------------------------------------------------------
-- AMBIENCE
-------------------------------------------------------------------------------------------------

function TMAmbienceLeftSec()
	return FDec(tmAmbienceTrackSec - Timer(tmAmbienceTimer))
end

function TMStopAmbience()
	tmPlayingAmbience = false
end

function TMPlayAmbienceCurrent()
	TMPlayAmbience(TM_AmbienceTrack)
end

function TMPlayAmbienceNext()
	track = 1
	if (TM_AmbienceTrack == TMSfxData[TMSfx.Ambience].Tracks) then track = 1
	else track = TM_AmbienceTrack + 1 end
	TMPlayAmbience(track)
end

function TMPlayAmbienceRandom()
	TMPlayAmbience(math.random(1, TMSfxData[TMSfx.Ambience].Tracks))
end

function TMPlayAmbience(track)
	if not TM_SFX_Ambience then return end
	-- set next ambience to play
	TM_AmbienceTrack = TMSfxGetTrackClamp(TMSfx.Ambience, track)
	tmPlayingAmbience = true

	-- Loop playback
	if tmLoopingAmbience then return end
	ResetTimer(tmAmbienceTimer)
	tmLoopingAmbience = true
	PlaySound(TMSfxGetFilename(TMSfx.Ambience, track), TM_SFX_AmbienceVolume)
	Delayed(tmAmbienceTrackSec, function()
		tmLoopingAmbience = false
		if TM_SFX_Ambience and tmPlayingAmbience then TMPlayAmbience(TM_AmbienceTrack) end
	end)
end
