-- TrueMoan v2.9 by illa3d
----------------------------------------------------------------------------------------------------------------------------
TRUE MOAN SFX PACK SCRIPT README
-----------------------------------------------------------------------------------------------------------------------------
TO CREATE A NEW VOICE PACK
1. Copy tm_sfx_template.lua, rename and modify
2. Add audio files
3. Define SFX sounds

-----------------------------------------------------------------------------------------------------------------------------
1. SFX PACK SCRIPT FILE "tm_sfx_{name}.lua"
-----------------------------------------------------------------------------------------------------------------------------
EXAMPLE: TrueFacials\Mods\Scripts\FreeMode\tm_sfx_sloppy.lua
FILE RULES: all lowercase letters, must begin with tm_sfx_

-----------------------------------------------------------------------------------------------------------------------------
2. AUDIO FILES "tm_{name}_{sfx} (#).mp3"
-----------------------------------------------------------------------------------------------------------------------------
AUDIO FORMAT: mp3, 44000, mono (downmix from stereo), 64-192 kbit (320 is placebo!)
EXAMPLE: TrueFacials\Mods\Scripts\FreeMode\Sounds\tm_sloppy_plap (1).mp3
FILE RULES: all lowercase letters, name can have spaces, numbers # as 1,2...10,11..100,101

SFX: _fart, _plap, _suck, _suckdeep

Add at least 5 files per SFX category, else it gets repetative.
Don't add more than 20 (loading issues). I mean, you can, but ...

-----------------------------------------------------------------------------------------------------------------------------
3. SFX SOUNDS (Plap, Suck, SuckDeep)
-----------------------------------------------------------------------------------------------------------------------------
If this is not defined in the VoicePack - default chiyoru SFX will be used
You must specify: number of files (variants) per SFX, volume per group of SFX.
FILE RULES: all lowercase letters, name can have spaces, numbers # as 1,2...10,11..100,101

EXAMPLES:
[TMSfx.Fart] = { Files = 10, Volume = 0.7 },
FILES: TrueFacials\Mods\Scripts\FreeMode\Sounds\tm_chiyoru_fart (10).mp3 (total 10 files, played at volume of 0.7)

[TMSfx.Plap] = { Files = 10, Volume = 0.7 },
FILES: TrueFacials\Mods\Scripts\FreeMode\Sounds\tm_chiyoru_plap (10).mp3 (total 10 files, played at volume of 0.7)

[TMSfx.Suck] = { Files = 10, Volume = 0.9 },
FILES: TrueFacials\Mods\Scripts\FreeMode\Sounds\tm_chiyoru_suck (10).mp3 (total 10 files, played at volume of 0.9)

[TMSfx.SuckDeep] = { Files = 10, Volume = 0.9 },
FILES: TrueFacials\Mods\Scripts\FreeMode\Sounds\tm_chiyoru_suckdeep (10).mp3 (total 10 files, played at volume of 0.9)



-------------------------------------------------------------------------------------------------------------------------------
EXAMPLE A
-------------------------------------------------------------------------------------------------------------------------------
SFX: All sfx types present, 10 of each

if type(TMSfxAdd ) == "function" then TMVoiceAdd({
	Name = "Sloppy", -- files must have this name, but all lowercase
	[TMSfx.Fart] =		{ Files = 10, Volume = 1 },
	[TMSfx.Plap] =		{ Files = 10, Volume = 1 },
	[TMSfx.Suck] =		{ Files = 10, Volume = 1 },
	[TMSfx.SuckDeep] =	{ Files = 10, Volume = 1 },
}) end

-------------------------------------------------------------------------------------------------------------------------------
EXAMPLE B
-------------------------------------------------------------------------------------------------------------------------------
SFX: Only 10 plap files present
Notice only plap is defined

if type(TMSfxAdd ) == "function" then TMVoiceAdd({
	Name = "Sloppy", -- files must have this name, but all lowercase
	[TMSfx.Plap] =		{ Files = 10, Volume = 1 },
}) end