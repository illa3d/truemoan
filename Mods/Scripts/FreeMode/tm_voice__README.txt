-- TrueMoan v3.0 by illa3d
----------------------------------------------------------------------------------------------------------------------------
TRUE MOAN VOICE PACK SCRIPT README
-----------------------------------------------------------------------------------------------------------------------------
TO CREATE A NEW VOICE PACK
1. Copy tm_voice_template.lua, rename and modify
2. Add audio files
3. Define remapping for missing audio tiers

-----------------------------------------------------------------------------------------------------------------------------
1. VOICE PACK SCRIPT FILE "tm_voice_{name}.lua"
-----------------------------------------------------------------------------------------------------------------------------
EXAMPLE: TrueFacials\Mods\Scripts\FreeMode\tm_voice_chiyoru.lua
FILE RULES: all lowercase letters, must begin with tm_voice_

-----------------------------------------------------------------------------------------------------------------------------
2. AUDIO FILES "tm_{name}_{tier} (#).mp3"
-----------------------------------------------------------------------------------------------------------------------------
AUDIO FORMAT: mp3, 44000, mono (downmix from stereo), 64-192 kbit (320 is placebo!)
EXAMPLE: TrueFacials\Mods\Scripts\FreeMode\Voice\tm_chiyoru_slow (1).mp3
FILE RULES: all lowercase letters, name can have spaces, numbers # as 1,2...10,11..100,101

To best fit to interaction rythm, use following audio length:
_slow 	 - audio length: ~1-5s
_normal	 - audio length: ~0.8s
_fast	 - audio length: ~0.5s
_faster	 - audio length: ~0.5s (optional)
_wild	 - audio length: ~0.4s (optional)
_max	 - audio length: ~0.3s (optional)
_climax	 - audio length: ~10-20s (optional - if climax audio is not present, uses regular moans)
_cumshot - audio length: ~10-20s (optional - if cumshot audio is not present, uses regular moans)

Add at least 4 files for each category you're adding else it's repetative.

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


-------------------------------------------------------------------------------------------------------------------------------
EXAMPLE A
-------------------------------------------------------------------------------------------------------------------------------
AUDIO: All audio tiers present
REMAP: No remap

if type(TMVoiceAdd) == "function" then TMVoiceAdd({
	Name = "Chiyoru", -- files must have this name, but all lowercase
	IsMale = false, -- you can set this to true to be a male only Voice Pack or don't define it at all (empty line)
}) end

if type(TMVoiceAdd) == "function" then TMVoiceAdd({
	Name = "Leon", -- files must have this name, but all lowercase
	IsMale = true, -- Male Voice Pack!
}) end


-------------------------------------------------------------------------------------------------------------------------------
EXAMPLE B
-------------------------------------------------------------------------------------------------------------------------------
NO AUDIO: Faster, Wild and Max
REMAP: Missing 3 to Fast

if type(TMVoiceAdd) == "function" then TMVoiceAdd({
	Name = "Chiyoru", -- files must have this name, but all lowercase
	[TMTier.Faster] = TMTier.Fast,
	[TMTier.Wild] = TMTier.Fast,
	[TMTier.Max] = TMTier.Fast,
}) end

-----------------------------------------------------------------------------------------------------------------------------
EXAMPLE C
-----------------------------------------------------------------------------------------------------------------------------
NO AUDIO: Faster, Wild and Max
REMAP: All tiers evenly

if type(TMVoiceAdd) == "function" then TMVoiceAdd({
	Name = "Chiyoru", -- files must have this name, but all lowercase
	[TMTier.Normal] = TMTier.Slow,
	[TMTier.Fast] = TMTier.Normal,
	[TMTier.Faster] = TMTier.Normal,
	[TMTier.Wild] = TMTier.Fast,
	[TMTier.Max] = TMTier.Fast,
}) end