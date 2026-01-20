-- TrueMoan v2.5 by illa3d
-- Requires tm_common.lua

-- Ambience Constants
local tmAmbienceTrackSec = 140	-- depends on the mp3 file length (all files must be of same length)

-- Ambience publicVariables
TM_AmbienceTrack = 0
-- Ambience Variables
local tmPlayingAmbience = false
local tmLoopingAmbience = false
local tmTimerKeyAmbience = "TM_AmbienceTimer"

-- Voices
TM_Voices = {}
TM_Voices_Names = {}

-- Moan Tier "Enum" (actual filenames)
-- VAR NAMES MUST BE SAME AS AutoSexTier
-- String values are part-filenames: tm_climax (3).mp3
TMTier = {
	Idle = "slow",
	Slow = "slow",
	Normal = "normal",
	Fast = "fast",
	Faster = "faster",
	Wild = "wild",
	Max = "max",
	Climax = "climax",
}

-- SOUND EFFECTS
TMSfx = {
	Plap = "plap",
	Suck = "suck",
	SuckDeep = "suckdeep",
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

TMVoiceDefault = {
	Name = "Chiyoru",
	[TMTier.Idle] = TMTier.Idle,
	[TMTier.Slow] = TMTier.Slow,
	[TMTier.Normal] = TMTier.Normal,
	[TMTier.Fast] = TMTier.Fast,
	[TMTier.Faster] = TMTier.Faster,
	[TMTier.Wild] = TMTier.Wild,
	[TMTier.Max] = TMTier.Max,
	[TMSfx.Plap] =		{ Files = 20, Volume = 0.7 },
	[TMSfx.Suck] =		{ Files = 25, Volume = 0.9 },
	[TMSfx.SuckDeep] =	{ Files = 25, Volume = 0.9 },
}

-- Cum body area moan tiers (random from)
TM_Moans_CummingPause = 0.6 -- between two moans on cumming
TM_Moans_Cumming = { TMTier.Fast, TMTier.Faster, TMTier.Wild }
TM_Moans_CumHead = { TMTier.Faster, TMTier.Wild, TMTier.Max }
TM_Moans_CumHole = { TMTier.Normal, TMTier.Fast }
TM_Moans_CumBody = { TMTier.Slow, TMTier.Normal }
TM_Moans_CumInside = { TMTier.Slow, TMTier.Normal, TMTier.Fast }
TM_Moans_Cumflating = { TMTier.Fast, TMTier.Faster, TMTier.Wild }
TM_Moans_Cumdeflating = { TMTier.Slow, TMTier.Fast, TMTier.Faster }

-------------------------------------------------------------------------------------------------

-- RANDOM
function TMSfxGetFilenameRandom(human, tmSfx)
	if not human or not tmSfx then return end
	local tmVoice = TMVoiceGet_Human(human)
	if not tmVoice or not tmVoice[tmSfx] or not tmVoice[tmSfx].Files or type(tmVoice[tmSfx].Files) ~= "number" or tmVoice[tmSfx].Files < 1 then
		tmVoice = TMVoiceDefault
	end
	local name = tmVoice.Name
	local files = FloorToInt(tmVoice[tmSfx].Files)
	local track = GetRandom(1, files)
	return "tm_" ..name.. "_" ..tmSfx.. " (" .. track .. ")"
end

-------------------------------------------------------------------------------------------------
-- VOICES
-------------------------------------------------------------------------------------------------

function TMVoicesHas() return #TM_Voices_Names > 0 end

-- Add a new voice definition
-- tmVoice = { Name = "VoiceName", [TMTier.X] = TMTier.Y, ... }
function TMVoiceAdd(tmVoice)
	if type(tmVoice) ~= "table" or not tmVoice.Name or tmVoice.Name == "" or TM_Voices[tmVoice.Name] then return end
	TM_Voices[tmVoice.Name] = TableClone(tmVoice)
	table.insert(TM_Voices_Names, tmVoice.Name)
end

-- Check if a voice exists by name
function TMVoiceHas(tmVoiceName)
	if not tmVoiceName then return false end
	return TM_Voices[tmVoiceName] ~= nil
end

-- Get a voice table by name
function TMVoiceGet(tmVoiceName)
	if not tmVoiceName then return TMVoiceDefault end
	return TM_Voices[tmVoiceName]
end

-- Get a random registered voice or default
function TMVoiceGet_Random()
	if  IsTableEmpty(TM_Voices) then return TMVoiceDefault end
	return TableItemRandom(TM_Voices)
end

function TMVoiceGet_RandomName()
	if  IsTableEmpty(TM_Voices_Names) then return TMVoiceDefault.Name end
	return ListItemRandom(TM_Voices_Names)
end

function TMVoiceGet_Human(human)
	if not human then return TMVoiceDefault end
	-- 1. Voice by human.Name
	if human.Name and TMVoiceHas(human.Name) then return TMVoiceGet(human.Name) end
	-- 2. Voice assigned in stats
	local stats = TMHStatsGet(human)
	if stats and stats.Voice and TMVoiceHas(stats.Voice) then return TMVoiceGet(stats.Voice) end
	-- 3. Random fallback
	return TMVoiceGet_Random()
end

-------------------------------------------------------------------------------------------------
-- SFX / SOUND SOURCE POSITION
-------------------------------------------------------------------------------------------------
function TMPlayHumanSFX(girl, tmSfx, humanPart, volume)
	if not TM_AllowVoice() or not TM_SFX_AllReactions or not girl or girl.m_isMale then return end
	local tmVoice = TMVoiceGet_Human(girl)
	local tmVol = (tmVoice and tmVoice[tmSfx] and tmVoice[tmSfx].Volume) and Clamp01(tmVoice[tmSfx].Volume) or 1
	-- if defined volume in param, multiply by volume in config. if not defined, just use volume config
	local vol = tmVol * (volume and volume or 1)
	PlaySoundAt(TMSfxGetFilenameRandom(girl, tmSfx), HumanPosGet(girl, humanPart), vol)
end

-------------------------------------------------------------------------------------------------
-- MOANING
-------------------------------------------------------------------------------------------------

function TMPlayMoan(girl, tmMoan)
	if not TM_AllowVoice() or not TM_SFX_AllReactions or not girl or girl.m_isMale then return end
	local stats = TMHStatsGet(girl)
	if not stats or stats.IsClimax or not stats.AllowMoaning then return end
	-- if tmMoanSource == TMMoanSource.Sex then -- dynamic
	-- elseif tmMoanSource == TMMoanSource.IsClimax then -- dynamic
	if tmMoan == TMMoan.Cumming and TM_SFX_ReactSex then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_Cumming))
	elseif tmMoan == TMMoan.CumHead then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_CumHead))
	elseif tmMoan == TMMoan.CumHole then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_CumHole))
	elseif tmMoan == TMMoan.CumBody then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_CumBody))
	elseif tmMoan == TMMoan.CumInside and TM_SFX_ReactSex and not stats.IsSexActive then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_CumInside))
	elseif tmMoan == TMMoan.Cumflating and TM_SFX_ReactSex then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_Cumflating))
	elseif tmMoan == TMMoan.Cumdeflating and TM_SFX_ReactSex then TMPlayMoanTier(girl, ListItemRandom(TM_Moans_Cumdeflating))
	elseif tmMoan == TMMoan.DoubleClick then TMPlayMoanTier(girl, TableItemRandom(TMTier))
	end
end

-- SFX: All sfx is played here. Directly calling: Sex, Futa, Cum, Cumflation, Cumdeflation (the rest is above)
function TMPlayMoanTier(girl, tmTier)
	-- don't moan with other voice mods
	if not TM_AllowVoice() or not TM_SFX_AllReactions or not girl or girl.m_isMale then return end
	local stats = TMHStatsGet(girl)
	if not stats or not stats.AllowMoaning then return end;
	local tmVoice = TMVoiceGet_Human(girl)
	local tier = (tmVoice and tmVoice[tmTier]) and tmVoice[tmTier] or tmTier
	if stats.IsClimax then girl.SayCustom("tm_" .. tmVoice.Name .. "_" .. TMTier.Climax) end
	girl.SayCustom("tm_" .. tmVoice.Name .. "_" .. tier)
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
	return FDec(tmAmbienceTrackSec - Timer(tmTimerKeyAmbience))
end

function TMStopAmbience()
	tmPlayingAmbience = false
end

function TMPlayAmbienceCurrent()
	TMPlayAmbience(TM_AmbienceTrack)
end

function TMPlayAmbienceNext()
	local track = 1
	if (TM_AmbienceTrack == TM_SFX_AmbienceFiles) then track = 1
	else track = TM_AmbienceTrack + 1 end
	TMPlayAmbience(track)
end

function TMPlayAmbienceRandom()
	TMPlayAmbience(math.random(1, TM_SFX_AmbienceFiles))
end

function TMPlayAmbience(track)
	if not TM_SFX_Ambience then return end

	function TMSfxGetFilename(track)
		track = ClampValue(track, 1, TM_SFX_AmbienceFiles)
		return "tm_ambience (" .. track .. ")"
	end

	-- set next ambience to play
	TM_AmbienceTrack = ClampValue(track, 1, TM_SFX_AmbienceFiles)
	tmPlayingAmbience = true

	-- Loop playback
	if tmLoopingAmbience then return end
	ResetTimer(tmTimerKeyAmbience)
	tmLoopingAmbience = true
	PlaySound(TMSfxGetFilename(track), TM_SFX_AmbienceVolume)
	Delayed(tmAmbienceTrackSec, function()
		tmLoopingAmbience = false
		if TM_SFX_Ambience and tmPlayingAmbience then TMPlayAmbience(TM_AmbienceTrack) end
	end)
end
