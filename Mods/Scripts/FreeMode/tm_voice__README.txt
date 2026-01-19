-- TrueMoan v2.4 by illa3d
----------------------------------------------------------------------------------------------------------------------------
TRUE MOAN VOICE PACK SCRIPT README
-----------------------------------------------------------------------------------------------------------------------------
TO CREATE A NEW VOICE PACK
1. Copy tm_voice_template.lua, rename and modify
2. Add audio files
3. Define remapping for missing audio files

-----------------------------------------------------------------------------------------------------------------------------
1. VOICE PACK SCRIPT FILE "tm_voice_{name}.lua"
-----------------------------------------------------------------------------------------------------------------------------
EXAMPLE: TrueFacials\Mods\Scripts\FreeMode\tm_voice_chiyoru.lua
RULES: must contain tm_voice_ in front

-----------------------------------------------------------------------------------------------------------------------------
2. AUDIO FILES "tm_{name}_{tier} (#).mp3"
-----------------------------------------------------------------------------------------------------------------------------
EXAMPLE: TrueFacials\Mods\Scripts\FreeMode\Voice\tm_Chiyoru_slow (1).mp3
Rules: name can have spaces, tier all lowercase letters, numbers # as 1,2,..,10,11,..,100,101

To best fit to interaction rythm, use following audio length:
_slow 	- audio length: ~1-5s
_normal	- audio length: ~0.8s
_fast	- audio length: ~0.5s
_faster	- audio length: ~0.5s (optional)
_wild	- audio length: ~0.4s (optional)
_max		- audio length: ~0.3s (optional)
_climax  - audio length: ~10-20s (optional - if climax audio is not present, climax will use regular moans)

If name matches the character (must be exact, ie: Primrose Office) that character will automatically use that voice pack
See exact character names in TalkMenu per character, ie: "Hey, Tifa" (capital leters are larger)

-----------------------------------------------------------------------------------------------------------------------------
3. TIER REMAPPING
-----------------------------------------------------------------------------------------------------------------------------
EXAMPLE: [TMTier.Faster] = TMTier.Fast,
Is telling TrueMoan: There are no "tm_Chiyoru_faster (#).mp3" files use "tm_Chiyoru_fast (#).mp3" files instead

If you don't have audio files for specific tiers, you need to remap tiers to existing files (else silence)
Climax is not remapped, it's only played if the audio files exist


-------------------------------------------------------------------------------------------------------------------------------
EXAMPLE A
-------------------------------------------------------------------------------------------------------------------------------
AUDIO: All audio tiers present
REMAP: No remap

TMVoiceAdd({
	Name = "Chiyoru", -- files must have this exact name (upper/lower case matters!)
})

-------------------------------------------------------------------------------------------------------------------------------
EXAMPLE B
-------------------------------------------------------------------------------------------------------------------------------
NO AUDIO: Faster, Wild and Max
REMAP: Missing 3 to Fast

TMVoiceAdd({
	Name = "Chiyoru", -- files must have this exact name (upper/lower case matters!)
	[TMTier.Faster] = TMTier.Fast,
	[TMTier.Wild] = TMTier.Fast,
	[TMTier.Max] = TMTier.Fast,
})

-----------------------------------------------------------------------------------------------------------------------------
EXAMPLE C
-----------------------------------------------------------------------------------------------------------------------------
NO AUDIO: Faster, Wild and Max
REMAP: All tiers evenly

TMVoiceAdd({
	Name = "Chiyoru", -- files must have this exact name (upper/lower case matters!)
	[TMTier.Normal] = TMTier.Slow,
	[TMTier.Fast] = TMTier.Normal,
	[TMTier.Faster] = TMTier.Normal,
	[TMTier.Wild] = TMTier.Fast,
	[TMTier.Max] = TMTier.Fast,
})