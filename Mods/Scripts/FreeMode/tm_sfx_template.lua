-- True Moan SFX Pack
-- See tm_sfx_README.txt for details
if type(TMSfxAdd ) == "function" then TMSfxAdd({
	-- SFX PACK NAME (can have spaces, can have upper-cases. Files must all be lowercase!)
	Name = "",
	-- SFX (remove sfx below for withch you didnt add files, else it disables the SFX!)
	[TMSfx.Fart] =		{ Files = 10, Volume = 1 }, -- Files [1-20], Volume [0-1]
	[TMSfx.Plap] =		{ Files = 10, Volume = 1 }, -- Files [1-20], Volume [0-1]
	[TMSfx.Suck] =		{ Files = 10, Volume = 1 }, -- Files [1-20], Volume [0-1]
	[TMSfx.SuckDeep] =	{ Files = 10, Volume = 1 }, -- Files [1-20], Volume [0-1]
}) end
