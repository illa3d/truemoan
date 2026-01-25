-- TrueMoan v2.6 by illa3d
----------------------------------------------------------------------------------------------------------------------------
TRUE MOAN VOICE PACK SCRIPT README
-----------------------------------------------------------------------------------------------------------------------------
TO CREATE A NEW VOICE PACK
1. Copy tm_voice_template.lua, rename and modify
2. Add audio files
3. Define remapping for missing audio files
4. (OPTIONAL) Define SFX sounds (plap, suck, suckdeep)

-----------------------------------------------------------------------------------------------------------------------------
1. VOICE PACK SCRIPT FILE "tm_voice_{name}.lua"
-----------------------------------------------------------------------------------------------------------------------------
EXAMPLE: TrueFacials\Mods\Scripts\FreeMode\tm_voice_chiyoru.lua
FILE RULES: all lowercase letters, must begin with tm_voice_

-----------------------------------------------------------------------------------------------------------------------------
2. AUDIO FILES "tm_{name}_{tier} (#).mp3"
-----------------------------------------------------------------------------------------------------------------------------
EXAMPLE: TrueFacials\Mods\Scripts\FreeMode\Voice\tm_chiyoru_slow (1).mp3
FILE RULES: all lowercase letters, name can have spaces, numbers # as 1,2...10,11..100,101

To best fit to interaction rythm, use following audio length:
_slow 	- audio length: ~1-5s
_normal	- audio length: ~0.8s
_fast	- audio length: ~0.5s
_faster	- audio length: ~0.5s (optional)
_wild	- audio length: ~0.4s (optional)
_max	- audio length: ~0.3s (optional)
_climax	- audio length: ~10-20s (optional - if climax audio is not present, climax will use regular moans)

If voice pack name matches the character filename, character will automatically use that voice pack
Character name is filename in TrueFacials\Mods\Characters (letter case matters!)
EXAMPLE: TrueFacials\Mods\Characters\judy alvarez.tfa - "judy alvarez"

-----------------------------------------------------------------------------------------------------------------------------
3. TIER REMAPPING
-----------------------------------------------------------------------------------------------------------------------------
EXAMPLE: [TMTier.Faster] = TMTier.Fast,

Is telling TrueMoan: There are no "tm_chiyoru_faster (#).mp3" files use "tm_chiyoru_fast (#).mp3" files instead
If you don't have audio files for specific tiers, you need to remap tiers to existing files (else silence)
Climax is not remapped, it's only played if the audio files exist. If it doesnt, moans are played instead.

-----------------------------------------------------------------------------------------------------------------------------
4. (OPTIONAL) SFX SOUNDS (Plap, Suck, SuckDeep)
-----------------------------------------------------------------------------------------------------------------------------
If this is not defined in the VoicePack - default chiyoru SFX will be used
You must specify: number of files (variants) per SFX, volume per group of SFX.
FILE RULES: all lowercase letters, name can have spaces, numbers # as 1,2...10,11..100,101

EXAMPLES:
[TMSfx.Plap] = { Files = 10, Volume = 0.7 },
FILES: TrueFacials\Mods\Scripts\FreeMode\Sounds\tm_chiyoru_plap (10).mp3 (total 10 files, played at volume of 0.7)

[TMSfx.Suck] = { Files = 10, Volume = 0.9 },
FILES: TrueFacials\Mods\Scripts\FreeMode\Sounds\tm_chiyoru_suck (10).mp3 (total 10 files, played at volume of 0.9)

[TMSfx.SuckDeep] = { Files = 10, Volume = 0.9 },
FILES: TrueFacials\Mods\Scripts\FreeMode\Sounds\tm_chiyoru_suckdeep (10).mp3 (total 10 files, played at volume of 0.9)



-------------------------------------------------------------------------------------------------------------------------------
EXAMPLE A
-------------------------------------------------------------------------------------------------------------------------------
AUDIO: All audio tiers present
SFX: All sfx present, 10 files (variants) each
REMAP: No remap

TMVoiceAdd({
	Name = "Chiyoru", -- files must have this name, but all lowercase
	[TMSfx.Plap] =		{ Files = 10, Volume = 0.7 },
	[TMSfx.Suck] =		{ Files = 10, Volume = 0.9 },
	[TMSfx.SuckDeep] =	{ Files = 10, Volume = 0.9 },
})

-------------------------------------------------------------------------------------------------------------------------------
EXAMPLE B
-------------------------------------------------------------------------------------------------------------------------------
NO AUDIO: Faster, Wild and Max
SFX: All sfx present, 10 files (variants) each
REMAP: Missing 3 to Fast

TMVoiceAdd({
	Name = "Chiyoru", -- files must have this name, but all lowercase
	[TMTier.Faster] = TMTier.Fast,
	[TMTier.Wild] = TMTier.Fast,
	[TMTier.Max] = TMTier.Fast,
	[TMSfx.Plap] =		{ Files = 10, Volume = 0.7 },
	[TMSfx.Suck] =		{ Files = 10, Volume = 0.9 },
	[TMSfx.SuckDeep] =	{ Files = 10, Volume = 0.9 },
})

-----------------------------------------------------------------------------------------------------------------------------
EXAMPLE C
-----------------------------------------------------------------------------------------------------------------------------
NO AUDIO: Faster, Wild and Max
SFX: All sfx present, 10 files (variants) each
REMAP: All tiers evenly

TMVoiceAdd({
	Name = "Chiyoru", -- files must have this name, but all lowercase
	[TMTier.Normal] = TMTier.Slow,
	[TMTier.Fast] = TMTier.Normal,
	[TMTier.Faster] = TMTier.Normal,
	[TMTier.Wild] = TMTier.Fast,
	[TMTier.Max] = TMTier.Fast,
	[TMSfx.Plap] =		{ Files = 20, Volume = 0.7 },
	[TMSfx.Suck] =		{ Files = 25, Volume = 0.9 },
	[TMSfx.SuckDeep] =	{ Files = 25, Volume = 0.9 },
})