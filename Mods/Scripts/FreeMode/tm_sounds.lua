-- TrueMoan v0.9 by illa3d
-- Ambience Constants
tmAmbienceTrackSec = 140	-- depends on the mp3 file length (all files must be of same length)
tmAmbienceTracks = 6		-- number of files: Sounds/tm_ambience (N).mp3 (modify this to add your own)
-- Ambience Variables
tmPlayingAmbience = false
tmLoopingAmbience = false
tmAmbienceTrack = 0
ambienceTimer = "AmbienceTimer"

function TMAmbienceLeftSec()
	return NumLabel(tmAmbienceTrackSec - Timer(ambienceTimer))
end

function TMStartSound()
	TMPlayAmbienceRandom()
end

-- AMBIENCE
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
	if AllowAmbience == false then return end

	-- set next ambience to play
	track = math.max(1, math.min(track, tmAmbienceTracks)) -- Clamp
	tmAmbienceTrack = track
	tmPlayingAmbience = true

	-- Loop playback
	if tmLoopingAmbience then return end
	ResetTimer(ambienceTimer)
	tmLoopingAmbience = true
	PlaySound("tm_ambience" .. " (" .. track .. ")", AmbienceVolume)
	Delayed(tmAmbienceTrackSec, function()
		tmLoopingAmbience = false
		if AllowAmbience and tmPlayingAmbience then TMPlayAmbience(tmAmbienceTrack) end
	end)
end
