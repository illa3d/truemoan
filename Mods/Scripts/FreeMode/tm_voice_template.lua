-- True Moan Voice Pack
-- See tm_voice_README.txt for details
TMVoiceAdd({
	-- VOICE PACK NAME
	Name = "",
	-- TIER REMAPPING (if tier files are not provided)
	[TMTier.Faster] = TMTier.Fast,
	[TMTier.Wild] = TMTier.Fast,
	[TMTier.Max] = TMTier.Fast,
	-- SFX
	[TMSfx.Plap] =		{ Files = 10, Volume = 1 }, -- Files [1-20], Volume [0-1]
	[TMSfx.Suck] =		{ Files = 10, Volume = 1 }, -- Files [1-20], Volume [0-1]
	[TMSfx.SuckDeep] =	{ Files = 10, Volume = 1 }, -- Files [1-20], Volume [0-1]
})
