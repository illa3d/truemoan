-- Ambience settings
tmAllowAmbience = true
tmAmbienceVolume = 0.4

-- Ambience Variables
tmAmbienceTracks = 6
tmAmbienceTrackSec = 140
tmAmbienceName = "tm_ambience"
tmPlayingAmbience = false
tmLoopingAmbience = false
tmAmbienceTrack = 0

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
	if tmAllowAmbience == false then return end

	-- set next ambience to play
	track = math.max(1, math.min(track, tmAmbienceTracks)) -- Clamp
	tmAmbienceTrack = track
	tmPlayingAmbience = true

	-- Loop playback
	if tmLoopingAmbience then return end
	tmLoopingAmbience = true
	PlaySound(tmAmbienceName .. " (" .. track .. ")", tmAmbienceVolume)
	Delayed(tmAmbienceTrackSec, function()
		tmLoopingAmbience = false
		if tmAllowAmbience and tmPlayingAmbience then TMPlayAmbience(tmAmbienceTrack) end
	end)
end
