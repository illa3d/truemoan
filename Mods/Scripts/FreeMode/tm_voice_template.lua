-- True Moan Voice Pack
-- See tm_voice_README.txt for details
TMVoiceAdd({
	-- VOICE PACK NAME (can have spaces, can have upper-cases. Files must all be lowercase!)
	Name = "",
	-- TIER REMAPPING (leave this in if the following tiers don't have audio files)
	[TMTier.Faster] = TMTier.Fast,
	[TMTier.Wild] = TMTier.Fast,
	[TMTier.Max] = TMTier.Fast,
	-- SFX (remove sfx below for withch you didnt add files, else it disables the SFX!)
	[TMSfx.Plap] =		{ Files = 10, Volume = 1 }, -- Files [1-20], Volume [0-1]
	[TMSfx.Suck] =		{ Files = 10, Volume = 1 }, -- Files [1-20], Volume [0-1]
	[TMSfx.SuckDeep] =	{ Files = 10, Volume = 1 }, -- Files [1-20], Volume [0-1]
})
