------------------------------------------------------------------------------------------------------------------------------
-- TRUE MOAN VOICE PACK SCRIPT
-------------------------------------------------------------------------------------------------------------------------------
-- SCRIPT FOLDER: TrueFacials\Mods\Scripts\FreeMode
-- SCRIPT FILENAME: "tm_voice_{name}.lua" (no spaces) IE: tm_voice_chiyoru.lua

-- AUDIO FOLDER: TrueFacials\Mods\Scripts\FreeMode\Voice
-- AUDIO FILENAME: tm_{name}_{tier} (#).mp3 (no spaces) IE: tm_Chiyoru_slow (1).mp3

-------------------------------------------------------------------------------------------------------------------------------
-- MOAN TIERS
-------------------------------------------------------------------------------------------------------------------------------
-- Tier depends on the penetration velocity
-- To best fit within interaction rythm, keep audio files roughly of this length:
--  [TMTier.Idle]	(unused, using slow tier, just bigger pauses)
--  [TMTier.Slow]	Audio length: ~1-5s
--  [TMTier.Normal]	Audio length: ~0.8s
--  [TMTier.Fast]	Audio length: ~0.5s
--  [TMTier.Faster]	Audio length: ~0.5s (optional, remapped to Fast)
--  [TMTier.Wild]	Audio length: ~0.4s (optional, remapped to Fast)
--  [TMTier.Max]	Audio length: ~0.3s (optional, remapped to Fast)
--  [TMTier.Climax]	Audio length: ~10-20s (optional, unique audio for climax, if not present climax will user regular moans)

-------------------------------------------------------------------------------------------------------------------------------
-- TIER REMAPPING
-------------------------------------------------------------------------------------------------------------------------------
-- You can skip creating audio files for specific tiers, but then you need to remap missing tiers.
-- IE: [TMTier.Faster] = TMTier.Fast, -- missing files from faster tier are using files from fast, etc.

-- -- EXAMPLE A) No audio files for: Faster, Wild and Max - Remapping high tiers to Fast
-- TMVoiceAdd({
-- 	Name = "Chiyoru", -- files must have this exact name (upper/lower case matters!)
-- 	[TMTier.Faster] = TMTier.Fast,
-- 	[TMTier.Wild] = TMTier.Fast,
-- 	[TMTier.Max] = TMTier.Fast,
--  [TMTier.Climax] -- is never remapped, only played if the audio files exist
-- })

-- -- EXAMPLE B) No audio files for: Faster, Wild and Max - Remapping all voices evenly
-- TMVoiceAdd({
-- 	Name = "Chiyoru", -- files must have this exact name (upper/lower case matters!)
-- 	[TMTier.Slow] = TMTier.Slow,
-- 	[TMTier.Normal] = TMTier.Slow,
-- 	[TMTier.Fast] = TMTier.Normal,
-- 	[TMTier.Faster] = TMTier.Normal,
-- 	[TMTier.Wild] = TMTier.Fast,
-- 	[TMTier.Max] = TMTier.Fast,
--  [TMTier.Climax] -- is never remapped, only played if the audio files exist
-- })

-------------------------------------------------------------------------------------------------------------------------------
-- VOICE PACK REGISTRATION
-------------------------------------------------------------------------------------------------------------------------------
TMVoiceAdd({
	Name = "Chiyoru", -- files must have this exact name (upper/lower case matters!)
	-- No remapping since all Chiyoru audio tiers are present
})
