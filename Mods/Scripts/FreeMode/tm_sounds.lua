-- TrueMoan v1.9 by illa3d
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
TMMoanTier = {
	Idle = "slow",
	Slow = "slow",
	Normal = "normal",
	Fast = "fast",
	Faster = "faster",
	Wild = "orgasm", -- leftover from old system
	Climax = "climax",
}

-- MOANS
function TMPlayGirlMoan(girl, tmMoanTier)
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
