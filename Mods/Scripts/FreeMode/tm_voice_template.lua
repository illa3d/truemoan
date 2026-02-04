-- True Moan Voice Pack
-- See tm_voice_README.txt for details
if TMVoiceAdd == "function" then TMVoiceAdd({
	-- VOICE PACK NAME (can have spaces, can have upper-cases. Files must all be lowercase!)
	Name = "",
	-- TIER REMAPPING (leave this in if the following tiers don't have audio files)
	[TMTier.Faster] = TMTier.Fast,
	[TMTier.Wild] = TMTier.Fast,
	[TMTier.Max] = TMTier.Fast,
}) end
