-- True Moan Voice Pack - Requires AllVoiceMods(so far) - https://discord.com/channels/620113492208517120/1428535347364630742

-- HOW TO USE:
-- This script adds voices from AllVoiceMod(so far) to TrueMoan moaning system
-- To enable TrueMoan moaning system: Talk Menu/Options/Voice/VoiceMod - set to disabled
-- To automatically assign specific voices to characters, add Name to tm_voice_config.lua (EXAMPLE NAME:"(vm) Ada")

-- To disable specific VoiceMod voice showing in TrueMoan:
-- Add double minus in front of each voice you want disabled (EXAMPLE: --TMVoiceAdd )

-- (A)
-- Ada_gen_moan
-- Adadeep_gen_moan
-- AdalineDirtyTalk_gen_moan
-- AdalineFocused_gen_moan
-- AdalineMatureDirtyTalk_gen_moan
-- AdalineMatureFocused_gen_moan
-- AdalineMatureNeutral_gen_moan
-- AdalineNeutral_gen_moan
-- Aerith_gen_moan
-- Aerithdeep_gen_moan
-- Ashley_gen_moan
-- Ashleydeep_gen_moan
-- Auntcass_gen_moan
-- Auntcassdeep_gen_moan
TMVoiceAdd({ Name = "(vm) Ada",				File = "Ada_gen_moan",				[TMTier.Faster] = TMTier.Fast,		[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Ada(deep)",		File = "Adadeep_gen_moan",			[TMTier.Faster] = TMTier.Fast,		[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Aerith",			File = "Aerith_gen_moan", 			[TMTier.Faster] = TMTier.Fast,		[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Aerith(deep)",	File = "Aerithdeep_gen_moan", 		[TMTier.Faster] = TMTier.Fast,		[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Ashley",			File = "Ashley_gen_moan", 			[TMTier.Faster] = TMTier.Fast,		[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Ashley(deep)",	File = "Ashleydeep_gen_moan", 		[TMTier.Faster] = TMTier.Fast,		[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Auntcass",		File = "Auntcass_gen_moan", 		[TMTier.Faster] = TMTier.Fast,		[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Auntcass(deep)",	File = "Auntcassdeep_gen_moan", 	[TMTier.Faster] = TMTier.Fast,		[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

TMVoiceAdd({ Name = "(vm) AdalineDirtyTalk",		File = "AdalineDirtyTalk_gen_moan",										[TMTier.Faster] = TMTier.Fast,		[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) AdalineFocused",			File = "AdalineFocused_gen_moan",		[TMTier.Fast] = TMTier.Normal,	[TMTier.Faster] = TMTier.Normal,	[TMTier.Wild] = TMTier.Normal,	[TMTier.Max] = TMTier.Normal })
TMVoiceAdd({ Name = "(vm) AdalineMatureDirtyTalk",	File = "AdalineMatureDirtyTalk_gen_moan",								[TMTier.Faster] = TMTier.Fast, 		[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) AdalineMatureFocused",	File = "AdalineMatureFocused_gen_moan",	[TMTier.Fast] = TMTier.Normal,	[TMTier.Faster] = TMTier.Normal,	[TMTier.Wild] = TMTier.Normal,	[TMTier.Max] = TMTier.Normal })
TMVoiceAdd({ Name = "(vm) AdalineMatureNeutral",	File = "AdalineMatureNeutral_gen_moan", 								[TMTier.Faster] = TMTier.Fast,		[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) AdalineNeutral",			File = "AdalineNeutral_gen_moan", 										[TMTier.Faster] = TMTier.Fast,		[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (B)
-- BJ2_gen_moan
-- BJ2deep_gen_moan
-- BJ_gen_moan
-- BJdeep_gen_moan
-- Bayonetta_gen_moan
-- Bayonettadeep_gen_moan
-- Blackcat_gen_moan
-- Blackcatdeep_gen_moan
TMVoiceAdd({ Name = "(vm) BJ2",				File = "BJ2_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) BJ2(deep)",		File = "BJ2deep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) BJ",				File = "BJ_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) BJ(deep)",		File = "BJdeep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Bayonetta",		File = "Bayonetta_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Bayonetta(deep)",	File = "Bayonettadeep_gen_moan",	[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Blackcat",		File = "Blackcat_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Blackcat(deep)",	File = "Blackcatdeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })


-- (C)
-- Cammy_gen_moan
-- Cammydeep_gen_moan
-- Ciri_gen_moan
-- Cirideep_gen_moan
-- Clap_gen_moan
TMVoiceAdd({ Name = "(vm) Cammy",			File = "Cammy_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Cammy(deep)",		File = "Cammydeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Ciri",			File = "Ciri_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Ciri(deep)",		File = "Cirideep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

TMVoiceAdd({ Name = "(vm) Clap",			File = "Clap_gen_moan",			[TMTier.Fast] = TMTier.Normal,	[TMTier.Faster] = TMTier.Normal,[TMTier.Wild] = TMTier.Normal,	[TMTier.Max] = TMTier.Normal })

-- (D)
-- DVa_gen_moan
-- DVadeep_gen_moan
TMVoiceAdd({ Name = "(vm) DVa",				File = "DVa_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) DVa(deep)",		File = "DVadeep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (E)
-- Elizabethyoung_gen_moan
-- Elizabethyoungdeep_gen_moan
-- Ellie_gen_moan
-- Elliedeep_gen_moan
-- Eve_gen_moan
-- Evedeep_gen_moan
TMVoiceAdd({ Name = "(vm) Elizabethyoung",		File = "Elizabethyoung_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Elizabethyoung(deep)",File = "Elizabethyoungdeep_gen_moan",	[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Ellie",				File = "Ellie_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Ellie(deep)",			File = "Elliedeep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Eve",					File = "Eve_gen_moan",					[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Eve(deep)",			File = "Evedeep_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (F)
-- Faye_gen_moan
-- Fayedeep_gen_moan
TMVoiceAdd({ Name = "(vm) Faye",			File = "Faye_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Faye(deep)",		File = "Fayedeep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (G)
-- Gemma_gen_moan
-- Gemmadeep_gen_moan
TMVoiceAdd({ Name = "(vm) Gemma",			File = "Gemma_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Gemma(deep)",		File = "Gemmadeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (I)
-- Ivy_gen_moan
-- Ivydeep_gen_moan
TMVoiceAdd({ Name = "(vm) Ivy",				File = "Ivy_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Ivy(deep)",		File = "Ivydeep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (J)
-- Jessie_gen_moan
-- Jessiedeep_gen_moan
-- Jill_gen_moan
-- Jilldeep_gen_moan
-- Juri_gen_moan
-- Jurideep_gen_moan
TMVoiceAdd({ Name = "(vm) Jessie",			File = "Jessie_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Jessie(deep)",	File = "Jessiedeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Jill",			File = "Jill_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Jill(deep)",		File = "Jilldeep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Juri",			File = "Juri_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Juri(deep)",		File = "Jurideep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (K)
-- Kitana_gen_moan
-- Kitanadeep_gen_moan
TMVoiceAdd({ Name = "(vm) Kitana",			File = "Kitana_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Kitana(deep)",	File = "Kitanadeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (L)
-- Lara_gen_moan
-- Laradeep_gen_moan
-- Leon_gen_moan
-- Leondeep_gen_moan
-- LewdheartMommyDeep_gen_moan
-- LewdheartMommyPlayful_gen_moan
-- LewdheartMommy_gen_moan
-- LewdheartNeutralDeep_gen_moan
-- LewdheartNeutralPlayful_gen_moan
-- LewdheartNeutral_gen_moan
-- LewdheartTomboyDeep_gen_moan
-- LewdheartTomboyPlayful_gen_moan
-- LewdheartTomboy_gen_moan
-- Lili_gen_moan
-- Lilideep_gen_moan
-- Lily_gen_moan
-- Lilydeep_gen_moan
-- Link_gen_moan
-- Linkdeep_gen_moan
TMVoiceAdd({ Name = "(vm) Lara",			File = "Lara_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Lara(deep)",		File = "Laradeep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Leon",			File = "Leon_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Leon(deep)",		File = "Leondeep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Lili",			File = "Lili_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Lili(deep)",		File = "Lilideep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Lily",			File = "Lily_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Lily(deep)",		File = "Lilydeep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Link",			File = "Link_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Link(deep)",		File = "Linkdeep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

TMVoiceAdd({ Name = "(vm) LewdheartMommy(deep)",	File = "LewdheartMommyDeep_gen_moan",										[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) LewdheartMommyPlayful",	File = "LewdheartMommyPlayful_gen_moan",	[TMTier.Fast] = TMTier.Normal,	[TMTier.Faster] = TMTier.Normal,[TMTier.Wild] = TMTier.Normal,	[TMTier.Max] = TMTier.Normal })
TMVoiceAdd({ Name = "(vm) LewdheartMommy",			File = "LewdheartMommy_gen_moan",											[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) LewdheartNeutral(deep)",	File = "LewdheartNeutralDeep_gen_moan",										[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) LewdheartNeutralPlayful",	File = "LewdheartNeutralPlayful_gen_moan",	[TMTier.Fast] = TMTier.Normal,	[TMTier.Faster] = TMTier.Normal,[TMTier.Wild] = TMTier.Normal,	[TMTier.Max] = TMTier.Normal })
TMVoiceAdd({ Name = "(vm) LewdheartNeutral",		File = "LewdheartNeutral_gen_moan",											[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) LewdheartTomboy(deep)",	File = "LewdheartTomboyDeep_gen_moan",										[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) LewdheartTomboyPlayful",	File = "LewdheartTomboyPlayful_gen_moan",	[TMTier.Fast] = TMTier.Normal,	[TMTier.Faster] = TMTier.Normal,[TMTier.Wild] = TMTier.Normal,	[TMTier.Max] = TMTier.Normal })
TMVoiceAdd({ Name = "(vm) LewdheartTomboy",			File = "LewdheartTomboy_gen_moan",											[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (M)
-- Mai_gen_moan
-- Maideep_gen_moan
-- Mercy_gen_moan
-- Mercydeep_gen_moan
TMVoiceAdd({ Name = "(vm) Mai",				File = "Mai_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Mai(deep)",		File = "Maideep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Mercy",			File = "Mercy_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Mercy(deep)",		File = "Mercydeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (P)
-- Pharah_gen_moan
-- Pharahdeep_gen_moan
-- Power_gen_moan
-- Powerdeep_gen_moan
TMVoiceAdd({ Name = "(vm) Pharah",			File = "Pharah_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Pharah(deep)",	File = "Pharahdeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Power",			File = "Power_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Power(deep)",		File = "Powerdeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (Q)
-- Quiet_gen_moan
-- Quietdeep_gen_moan
TMVoiceAdd({ Name = "(vm) Quiet",			File = "Quiet_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Quiet(deep)",		File = "Quietdeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (R)
-- Rangiku_gen_moan
-- Rangikudeep_gen_moan
-- Raven_gen_moan
-- Ravendeep_gen_moan
TMVoiceAdd({ Name = "(vm) Rangiku",			File = "Rangiku_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Rangiku(deep)",	File = "Rangikudeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Raven",			File = "Raven_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Raven(deep)",		File = "Ravendeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (S)
-- Scarlet_gen_moan
-- Scarletdeep_gen_moan
TMVoiceAdd({ Name = "(vm) Scarlet",			File = "Scarlet_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Scarlet(deep)",	File = "Scarletdeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (T)
-- Tifa_gen_moan
-- Tifadeep_gen_moan
-- Tracer_gen_moan
-- Tracerdeep_gen_moan
TMVoiceAdd({ Name = "(vm) Tifa",			File = "Tifa_gen_moan",				[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Tifa(deep)",		File = "Tifadeep_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Tracer",			File = "Tracer_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Tracer(deep)",	File = "Tracerdeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (W)
-- Widowmaker_gen_moan
-- Widowmakerdeep_gen_moan
TMVoiceAdd({ Name = "(vm) Widowmaker",		File = "Widowmaker_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Widowmaker(deep)",File = "Widowmakerdeep_gen_moan",	[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (Y)
-- Yuffie_gen_moan
-- Yuffiedeep_gen_moan
TMVoiceAdd({ Name = "(vm) Yuffie",			File = "Yuffie_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Yuffie(deep)",	File = "Yuffiedeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })

-- (Z)
-- Zelda_gen_moan
-- Zeldadeep_gen_moan
TMVoiceAdd({ Name = "(vm) Zelda",			File = "Zelda_gen_moan",			[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
TMVoiceAdd({ Name = "(vm) Zelda(deep)",		File = "Zeldadeep_gen_moan",		[TMTier.Faster] = TMTier.Fast,	[TMTier.Wild] = TMTier.Fast,	[TMTier.Max] = TMTier.Fast })
