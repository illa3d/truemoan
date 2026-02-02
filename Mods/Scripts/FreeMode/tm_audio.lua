-- TrueMoan v2.9 by illa3d
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

-- SFX
TM_Sfxs = {}
TM_Sfxs_Names = {}
function TM_Sfxs_CountLow() return #TM_Sfxs_Names < 10 end

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
	Fart = "fart",
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
}

TMSfxDefault = {
	Name = "TrueMoan",
	[TMSfx.Fart] = { Files = 7, Volume = 0.5 },
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
--===============================================================================================
-- SFX PACKS
--===============================================================================================
-------------------------------------------------------------------------------------------------

function TMSfxsHas() return #TM_Sfxs_Names > 0 end

-- Add new SFX pack definition
function TMSfxAdd(tmSfxPack)
	if type(tmSfxPack) ~= "table" or not tmSfxPack.Name or tmSfxPack.Name == "" or TM_Sfxs[tmSfxPack.Name] then return end
	TM_Sfxs[tmSfxPack.Name] = TableClone(tmSfxPack)
	table.insert(TM_Sfxs_Names, tmSfxPack.Name)
end

-- Check SFX pack by name
function TMSfxHas(tmSfxName)
	if not tmSfxName then return false end
	return TM_Sfxs[tmSfxName] ~= nil
end

-- Get SFX pack by name
function TMSfxGet(tmSfxName)
	if not tmSfxName or not TM_Sfxs[tmSfxName] then return TMSfxDefault end
	return TM_Sfxs[tmSfxName]
end

-- Get SFX Pack
function TMSfxGet_Random()
	if  IsTableEmpty(TM_Sfxs) then return TMSfxDefault end
	return TableItemRandom(TM_Sfxs)
end

-- Get SFX Pack name
function TMSfxGet_RandomName()
	if  IsTableEmpty(TM_Sfxs_Names) then return TMSfxDefault.Name end
	return ListItemRandom(TM_Sfxs_Names)
end

-- Get SFX Pack
function TMSfxGet_Human(human)
	if not human then return TMSfxDefault end
	-- 1. sfx assigned in stats
	local stats = TMHStatsGet(human)
	if stats and stats.SfxName and TMSfxHas(stats.SfxName) then return TMSfxGet(stats.SfxName) end
	-- 2. Random fallback
	return TMSfxGet_Random()
end

-- Get a random filename
function TMSfxGetFilenameRandom(human, tmSfx)
	if not human or not tmSfx then return end
	local sfxPack = TMSfxGet_Human(human)
	if not sfxPack or not sfxPack[tmSfx] or not sfxPack[tmSfx].Files or type(sfxPack[tmSfx].Files) ~= "number" or sfxPack[tmSfx].Files < 1 then
		sfxPack = TMSfxDefault
	end
	local name = sfxPack.Name
	local files = FloorToInt(sfxPack[tmSfx].Files)
	local track = GetRandom(1, files)
	---@diagnostic disable-next-line
	return "tm_" ..name:lower().. "_" ..tmSfx.. " (" .. track .. ")"
end

-------------------------------------------------------------------------------------------------

function TMSfxSet_Random(human)
	TMSfxSet(human, TM_Sfxs_Names[GetRandom(0, #TM_Sfxs_Names)])
end

function TMSfxSet(human, sfxName)
	if not human or not sfxName or sfxName == "" then return end
	local stats = TMHStatsGet(human)
	if not stats then return end
	stats.SfxName = sfxName
end

-------------------------------------------------------------------------------------------------
-- SFX PLAYBACK
-------------------------------------------------------------------------------------------------
function TMSfxAllow(human)
	if not TM_SFX or not human then return false end
	return true
end

function TMPlaySFX(human, tmSfx, humanPart, volume)
	if not TMSfxAllow(human) or not human then return end
	local stats = TMHStatsGet(human)
	if not stats or not stats.IsSfx then return end
	local sfxPack = TMSfxGet_Human(human)
	local tmVol = (sfxPack and sfxPack[tmSfx] and sfxPack[tmSfx].Volume) and Clamp01(sfxPack[tmSfx].Volume) or 1
	-- if defined volume in param, multiply by volume in config. if not defined, just use volume config
	local vol = tmVol * (volume and volume or 1)
	PlaySoundAt(TMSfxGetFilenameRandom(human, tmSfx), HumanPosGet(human, humanPart), vol)
end



-------------------------------------------------------------------------------------------------
--===============================================================================================
-- VOICE PACKS
--===============================================================================================
-------------------------------------------------------------------------------------------------

function TMVoicesHas() return #TM_Voices_Names > 0 end

-- Add a new voice definition
function TMVoiceAdd(tmVoicePack)
	if type(tmVoicePack) ~= "table" or not tmVoicePack.Name or tmVoicePack.Name == "" or TM_Voices[tmVoicePack.Name] then return end
	TM_Voices[tmVoicePack.Name] = TableClone(tmVoicePack)
	table.insert(TM_Voices_Names, tmVoicePack.Name)
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
-- VOICE PLAYBACK
-------------------------------------------------------------------------------------------------
function TMVoiceAllow(human)
	if VM_VoiceMod_Enabled == true then return false end
	if not TM_SFX or not TM_Voice or not human or (not TM_VoiceMale and human.m_isMale) or (not TM_VoiceFuta and not human.m_isMale and HumanHasPenis(human)) then return false end
	return true
end

-- Voice playback
function TMPlayVoice(human, tmVoice)
	if not TMVoiceAllow(human) or not human or not tmVoice then return end
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

-- Voice tier playback (called from: TMPlayVoice, Sex, Futa, Cum, Cumflation, Cumdeflation)
function TMPlayTier(human, tmTier)
	-- don't moan with other voice mods
	if not TMVoiceAllow(human) then return end
	local stats = TMHStatsGet(human)
	if not stats or not stats.IsVoice then return end
	local tmVoice = TMVoiceGet_Human(human)
	if not tmVoice then return end
 	-- VoicePack tier remap
	local tier = tmVoice[tmTier] and tmVoice[tmTier] or tmTier
	---@diagnostic disable-next-line
	local file = tmVoice.File and tmVoice.File or ("tm_" .. tmVoice.Name:lower())
	human.SayCustom(file .. "_" .. tier)
end



-------------------------------------------------------------------------------------------------
--===============================================================================================
-- MUSIC
--===============================================================================================
-------------------------------------------------------------------------------------------------

function TMPlayMusic(track)
	Music(track , 0.05, 0)
end



-------------------------------------------------------------------------------------------------
--===============================================================================================
-- AMBIENCE
--===============================================================================================
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
