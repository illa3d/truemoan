-- TrueMoan v2.7 by illa3d
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
TM_Voices_Character = {}
function TM_Voices_CountLow() return #TM_Voices_Names < 10 end

-- Voice Tier "Enum" (filename parts) 
TMTier = {
	Idle = "slow",
	Slow = "slow",
	Normal = "normal",
	Fast = "fast",
	Faster = "faster",
	Wild = "wild",
	Max = "max",
	Climax = "climax",
	Cumshot = "cumshot",
}

-- SOUND EFFECTS
TMSfx = {
	Plap = "plap",
	Suck = "suck",
	SuckDeep = "suckdeep",
}

-- TM Moan categories
TMVoice = {
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
	[TMSfx.Plap] = { Files = 20, Volume = 0.7 },
	[TMSfx.Suck] = { Files = 25, Volume = 0.9 },
	[TMSfx.SuckDeep] = { Files = 25, Volume = 0.9 },
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
	---@diagnostic disable-next-line
	return "tm_" ..name:lower().. "_" ..tmSfx.. " (" .. track .. ")"
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
	if not tmVoiceName or not TM_Voices[tmVoiceName] then return TMVoiceDefault end
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
	-- 1. Voice by human.ClothingName
	if human.ClothingName and TMVoiceHas(human.ClothingName) then return TMVoiceGet(human.ClothingName) end
	-- 2. Voice assigned in stats
	local stats = TMHStatsGet(human)
	if stats and stats.VoiceName and TMVoiceHas(stats.VoiceName) then return TMVoiceGet(stats.VoiceName) end
	-- 3. Random fallback
	return TMVoiceGet_Random()
end
-------------------------------------------------------------------------------------------------

function TMVoiceSet_Random(human)
	TMVoiceSet(human, TM_Voices_Names[GetRandom(0, #TM_Voices_Names)])
end

function TMVoiceSet(human, voiceName)
	if not human or not voiceName or voiceName == "" then return end
	local stats = TMHStatsGet(human)
	if not stats then return end
	stats.VoiceName = voiceName
end

function TMVoiceSet_Character(human)
	if not human or not TM_Voices_Character or not TM_Voices_Character[human.ClothingName] or TM_Voices_Character[human.ClothingName] == "" then return end
	local stats = TMHStatsGet(human)
	if not stats or not stats.VoiceName then return end
	stats.VoiceName = TM_Voices_Character[human.ClothingName]
end
-------------------------------------------------------------------------------------------------
-- SFX / SOUND SOURCE POSITION
-------------------------------------------------------------------------------------------------
function TMPlaySFX(human, tmSfx, humanPart, volume)
	if not TM_SFX or not human then return end
	local tmVoice = TMVoiceGet_Human(human)
	local tmVol = (tmVoice and tmVoice[tmSfx] and tmVoice[tmSfx].Volume) and Clamp01(tmVoice[tmSfx].Volume) or 1
	-- if defined volume in param, multiply by volume in config. if not defined, just use volume config
	local vol = tmVol * (volume and volume or 1)
	PlaySoundAt(TMSfxGetFilenameRandom(human, tmSfx), HumanPosGet(human, humanPart), vol)
end

-------------------------------------------------------------------------------------------------
-- VOICES
-------------------------------------------------------------------------------------------------
function TM_SFX_VoiceAllow(human)
	if VM_VoiceMod_Enabled and VM_VoiceMod_Enabled == true then return false end
	if not TM_SFX or not TM_SFX_Voice or not human or (not TM_SFX_VoiceMale and human.m_isMale) or (not TM_SFX_VoiceFuta and not human.m_isMale and HumanHasPenis(human)) then return false end
	return true
end

function TMPlayVoice(human, tmVoice)
	if not TM_SFX_VoiceAllow(human) then return end
	local stats = TMHStatsGet(human)
	if not stats or stats.IsClimax or not stats.IsVoice then return end
	-- if tmVoice == TMVoice.Sex then -- dynamic
	-- elseif tmVoice == TMVoice.Climax then -- dynamic
	if tmVoice == TMVoice.Cumming then TMPlayTier(human, TMTier.Cumshot) TMPlayTier(human, ListItemRandom(TM_Moans_Cumming))
	elseif tmVoice == TMVoice.CumHead then TMPlayTier(human, ListItemRandom(TM_Moans_CumHead))
	elseif tmVoice == TMVoice.CumHole then TMPlayTier(human, ListItemRandom(TM_Moans_CumHole))
	elseif tmVoice == TMVoice.CumBody then TMPlayTier(human, ListItemRandom(TM_Moans_CumBody))
	elseif tmVoice == TMVoice.CumInside then TMPlayTier(human, ListItemRandom(TM_Moans_CumInside))
	elseif tmVoice == TMVoice.Cumflating then TMPlayTier(human, ListItemRandom(TM_Moans_Cumflating))
	elseif tmVoice == TMVoice.Cumdeflating then TMPlayTier(human, ListItemRandom(TM_Moans_Cumdeflating))
	elseif tmVoice == TMVoice.DoubleClick then TMPlayTier(human, TableItemRandom(TMTier))
	end
end

-- SFX: All sfx is played here. Directly calling: Sex, Futa, Cum, Cumflation, Cumdeflation (the rest is above)
function TMPlayTier(human, tmTier)
	-- don't moan with other voice mods
	if not TM_SFX_VoiceAllow(human) then return end
	local stats = TMHStatsGet(human)
	if not stats or not stats.IsVoice or not stats.VoiceName or stats.VoiceName == "" then return end;
	local tmVoice = TMVoiceGet_Human(human)
	if not tmVoice then return end
 	-- VoicePack tier remap
	local tier = tmVoice[tmTier] and tmVoice[tmTier] or tmTier
	---@diagnostic disable-next-line
	local file = tmVoice.File and tmVoice.File or ("tm_" .. tmVoice.Name:lower())
	human.SayCustom(file .. "_" .. tier)
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
	if (TM_AmbienceTrack == TM_SFX_AmbientFiles) then track = 1
	else track = TM_AmbienceTrack + 1 end
	TMPlayAmbience(track)
end

function TMPlayAmbienceRandom()
	TMPlayAmbience(math.random(1, TM_SFX_AmbientFiles))
end

function TMPlayAmbience(track)
	if not TM_SFX_Ambient then return end

	function TMSfxGetFilename(track)
		track = ClampValue(track, 1, TM_SFX_AmbientFiles)
		return "tm_ambience (" .. track .. ")"
	end

	-- set next ambient to play
	TM_AmbienceTrack = ClampValue(track, 1, TM_SFX_AmbientFiles)
	tmPlayingAmbience = true

	-- Loop playback
	if tmLoopingAmbience then return end
	ResetTimer(tmTimerKeyAmbience)
	tmLoopingAmbience = true
	PlaySound(TMSfxGetFilename(track), TM_SFX_AmbientVolume)
	Delayed(tmAmbienceTrackSec, function()
		tmLoopingAmbience = false
		if TM_SFX_Ambient and tmPlayingAmbience then TMPlayAmbience(TM_AmbienceTrack) end
	end)
end
