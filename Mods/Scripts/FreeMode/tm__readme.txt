---------------------------------------------------------------------------------------------------------
--                                               TRUE MOAN                                             --
---------------------------------------------------------------------------------------------------------

**AutoSex Control | BodyEdit | Voice Packs | Realistic Sounds | Sex Reactions | Bulging | Cumflation | Animation | Poses | Ambient Audio | Skyboxes | Improved Menu |**

**MOD FEATURES**
- **Auto Sex Control**
  - Smooth transitions (tweening)
  - Arousal/Climax/Cum mechanic
  - Random Speed/Thrust/Depth control + random + presets
  - Cum/Wetness controls + random + presets
- **Body Edit**
  - Tweak body beyond limits
  - Generate, Copy/Paste, Presets
- **Realistic Moans & SFX**
  - Blowjob & Sex sound effects
  - Voice Packs support
- **TrueFace**
  - Procedural animation system + presets
- **Bulging/Cumflation**
- **Poses/Animation** (FaunaLABS)
- **6x audio ambiences**
- **36 Scenes**
- **Improved Menu UX**
- **Highly Configurable**

**ADDONS** (separate downloads)
- **7x skyboxes** (8/4/2k)

**LATEST FILES**
**TrueMoan_v2.7.zip** - Just TrueMoan
**TrueMoan_v2.7_FLABS_v1.02.zip** - TrueMoan + Fauna LABS **(recommended)**
**TrueMoan_Addon_Skyboxes_4k_v1.0.zip**
**TrueMoan_Addon_VoicePack_AllVoiceMods_v1.0.zip** (requires AllVoiceMods mod)
**Download: ** https://drive.google.com/drive/folders/1XMsyMxDT6qCclCX4SPoU6H769uouaD6c
**Voice packs:** https://discord.com/channels/620113492208517120/1460768562338726090 by @salemvonzombeh 

:warning: For black screen or issues, see **https://discord.com/channels/620113492208517120/1451633202019172462/1451634287987396884** :warning: 

**REQUIREMENTS**
- TrueFacials v0.59
- FaunaLABS v1.02 (for full experience)

**SUPPORTED MODS**
- Nf123 Voice Mod / AllVoiceMods
- Talk Menu Mod Manager
- FaunaLabs
- BetterSpeedAndFluids
- Snappy Sequences

**HOW TO INSTALL**
- Backup your old TrueMoan config files prior to install (optional)
- **Extract to game folder** (overwrite all files)
- If new version config/tweaks don't look the same as ones you have, **don't just overwrite with your configs**, re-set your values in the new files

**HOW TO UNINSTALL**
- Delete TrueMoan files in `Mods/Scripts/FreeMode`: `tm_*.*, Voice/tm_*.mp3, Sounds/tm_*.mp3`



---------------------------------------------------------------------------------------------------------
-- TRUE MOAN VOICE SETUP
---------------------------------------------------------------------------------------------------------
When it comes to moaning you've got a plethera of options.
If you let TrueMoan do the moaning, **all options below can be combined together**.

:warning:**MORE AUDIO FILES, LONGER LOADING**:warning: 

**1) TrueMoan only**
- 1 Voice pack included - Chiyoru

**2) TrueMoan + TrueMoan Voice Packs**
Voice Packs: https://discord.com/channels/620113492208517120/1460768562338726090 by @salemvonzombeh 
- Install individual Voice Packs
- (optional) edit `tm_voice__config.lua` for character defaults

**3) AllVoiceMods (so far) **(TMMM comes integrated)
Collection of all VoiceMods in the modding channel (so far), massive respect @xlmumblelx 
AllVoiceMods: https://discord.com/channels/620113492208517120/1428535347364630742  by @xlmumblelx 
TrueMoan Addon: https://discord.com/channels/620113492208517120/1451633202019172462/1451633202019172462
- Install `TrueMoan_Addon_VoicePack_AllVoiceMods_v1.0.zip` 
- (optional) edit `tm_voice__allvoicemods_config.lua` for allvoicemods character defaults
- (optional) edit `tm_voice__config.lua` for character defaults (overrides allvoicemods_config)
- InGame, Disable VoiceMod `TrueMoan/TalkMenu/Options/Voice/VoiceMod` set to `Disabled`

**4) nf123's Voice Mod + Individual VoiceMods** (TMMM comes integrated)
VoiceMod: https://discord.com/channels/620113492208517120/1358067278746358062 by @nobodyforever123 
VoiceMods: https://discord.com/channels/620113492208517120/1302940308777996298 by @xlmumblelx @denabuneko ...
- Install individual voice packs
- Install `TrueMoan_Addon_VoicePack_AllVoiceMods_v1.0.zip` 
- Edit `tm_voice__allvoicemods_config.lua`
  - Disable all unused VoicePack definitions (add -- for each)
  - Characters will be silent for VoicePacks defined but no mp3 files
- (optional) edit `tm_voice__config.lua` for character defaults (overrides allvoicemods_config)
- InGame, disable VoiceMod `TrueMoan/TalkMenu/Options/Voice/VoiceMod` set to `Disabled`



---------------------------------------------------------------------------------------------------------
-- COMMON ISSUES / BLACK SCREEN
---------------------------------------------------------------------------------------------------------

**:warning: TRUE MOAN COMMON ISSUES, BLACK SCREEN/GREY SCREEN FIX, TIPS & TRICKS :warning:**

**:warning: Bulging/Cumflation realtime body modifications will cause visual artifacts :warning:**
Known: Cum freezing mid-air or behaving weirdly, Shadow glitching

**1) TRUE MOAN REQUIRES ORIGINAL COMMON.LUA SCRIPT**
- make sure it's here: `TrueFacials\Mods\Scripts\FreeMode\Common.lua` 
- if its missing or overwritten from another mod, get the original one from True Facials installation

**2) LONG PATHS**
- move TrueFacials to an less deep folder, long ones can cause black screens with error `DirectoryNotFoundException: Could not find a part of the path`
- bad path example `"D:\New folder (3)\TrueFacials_Pro _ Characters_0.59 (N)\TrueFacials_Pro + Characters_0.59\TrueFacials_Pro_0.59...`
- if that still doesnt work, enable long paths in windows registry - https://www.majorgeeks.com/files/details/enable_or_disable_win32_long_paths.html

**3) OLD CONFIGS/TWEAKS**
- between versions `tm__config.lua` or `tm__tweaks.lua` may change (renamed, added new stuff)
- if you restored your `tm__config.lua` or `tm__tweaks.lua` without checking if the configs have changed through versions this might cause an issue
- restore original version configs, re-set your specific configs or tweaks in the new files

**4) TRY RUNNING WITHOUT OTHER MODS**
- mods that overwrite `Commmon.lua` and `freemode_main.lua` are problematic
- character, map and voice mods should all be compatibile
- Tested ok with: n123's VoiceMod, TalkMenuModManager, FaunaLABS (integrated, you don't need it separately)

**5) SEND AN ERROR REPORT** (if none of the above works)
When reporting issues, please include:
- which True Facials version
- which True Moan version
- did you use old True Moan configs
- which mods are installed besides TrueMoan
- steps to reproduce the issue
- include True facials `Player.log` file
`C:\Users\{username}\AppData\LocalLow\HenryTaiwan\TrueFacials\Player.log`

Thanks!



---------------------------------------------------------------------------------------------------------
-- ADDITIONAL INFO
---------------------------------------------------------------------------------------------------------

**VOICE SETUP**
TrueMoan Voice Setup - https://discord.com/channels/620113492208517120/1451633202019172462/1451637694005510305
How to create VoicePacks - https://github.com/illa3d/truemoan/blob/master/Mods/Scripts/FreeMode/tm_voice__README.txt

**INTEGRATED MODS**
- `faunaLABS_v1.02 - TMMM Ready.zip` https://discord.com/channels/620113492208517120/1358287146791866446/1454138284841369701 by @faunap 
- Selected Plaps & Blowjob moans used from https://discord.com/channels/620113492208517120/1446590801009180804 by @xlmumblelx 

**CONFIG FILES** `Mods/Scripts/FreeMod`
- Config & defaults: `tm__config.lua`
- Body presets: `tm__presets.lua`
- Custom poses: `tm__poses.lua`
- Character clothes: `tm__clothes.lua`
- Music: `tm__music.lua`
- Tweaks: `tm__tweaks.lua` (you may break things)
- Default voices: `tm_voices__config.lua`

**SOURCE**
GitHub Repository - https://github.com/illa3d/truemoan

**LATEST CHANGES**
Full Changelog - https://github.com/illa3d/truemoan/blob/master/Mods/Scripts/FreeMode/tm__readme.txt

[ v2.8 ]
- Improved Menu/Sex/AutoSex toggle
- Climax moaning bugfix (when no climax audio file present)
- Tweaked Arousal to be faster
- Arousal human variation in options

[ v2.7 ]
- Addon: AllVoiceMods(so far) voices in TrueMoan (requires https://discord.com/channels/620113492208517120/1428535347364630742)
- Added custom filename support for VoicePacks
- Added male voice option (see tm__config.lua, TM_SFX_VoiceMale)
- Fixed futa voice option (see tm__config.lua, TM_SFX_VoiceFuta)
- Added voice sub-menu (when more than 10 voices)
- VoicePack support for cumshot audio
- Fixed TMMM menu compatibility

[ v2.6 ]
- Added Fluid controls/random/presets `Menu/Sex/Cum`
- Added config for Character default Voice Pack config `tm_voice__config.lua`
- Added BetterSpeedsAndFluid mod detection `Menu/Options/Plugins`
- Fixed human eyes open/close status
- Menu bugfixes

[ v2.5 ]
- Added VoicePack suppport + readme + template
- Added Void.Branding poses
- Added StopMusic in Options
- SFX turned on with VoiceMod by default (plap, suck, suckdeep)
- Menu polish
- Bugfixes

[ v2.4 ]
- Plap improvements
- AutoSex toggle parameters for everyone in options (speed, weight, thrust, depth)
- AutoSex toggle parameters per character Sex/Auto Options

[ v2.3 ]
- Added bulging option
- Added mixing of bulging and cumflation
- Reworked plap to be by penetration depth
- Moaning toggle per human
- Fixed interaction speed turning on AutoSex

[ v2.2 ]
- Reworked cumming to be more realistic (randomness, delays)
- AutoSex: AutoCum when aroused 100%
- AutoSex: AutoCum/AutoClimax options
- AutoSex: Partner synchronization (sets same AutoSex interaction on partner)
- Arousal tweaks
- Performance optimization

[ v2.1 ]
- Added Futa sex & cum moaning
- Solved sound effects playback while occupied
- Added Blowjob sound effects (ghh)
- Added Sex sound effects (plap)

[ v2.0 ]
- AutoSex Arousal and Climax mechanic (number of partners, speed, cum, cumflation and speed influence rate)
- SexControl Speed tiers/presets (Idle, Slow, Normal,	Fast,	Faster, Wild, Max)

[ v1.9a ]
- AutoSex flag and  Tier (Normal, Fast)  per character
- Tier speed/random values polish
- AutoSex control improvements
- Character status display (autosex, tier, arousal, feels sex, feels cum, is cumflating)

[ v1.9 ]
- Added Cum reaction/effects (moaning, wetness, cumflation)
- BodyEdit now shows values of selected characters
- Added BodyEdit Generate (randomly picks body values)
- Added BodyEdit Copy/Paste functionality
- Added option to toggle VoiceMod/TrueMoan moaning

[ v1.8 ]
- Added TrueFace procedural facial animation system
- Added TrueFace presets (TalkMenu/Face/TrueFace)
- Improved SexControl random for all parameters
- Bugfixes, optimizations (thanks @tamp0844 XD)

[ v1.7 ]
- AutoSex improvements (as an animation instead of flag)
- Multiple actors don't mix with autosex parameters
- Fixed Autosex issue when changing characters/clothes
- AutoSex on spawn option (on by default for all actors)
- FaunaLAB bundled version with - faunaLABS_v1.02 - TMMM-BlackScreen FIX2.zip

[ v1.6 ]
- AutoSex improvements (acts more organically)
- AutoSex setting per actor (was global)
- Sex Controls now leads autosex instead of autosex overwriting them
- Added autosex drift options for speed, thrust, weight, depth
- Fixed handjob thrust & depth
- More depth presets
- Better SexControl UX

[ v1.5 ]
- SexControl Tweening (smooth sex transitions)
- AutoSex option (all holes at once)
- Face loops in menu (FaunaLABS)
- Body Edit added penis foreskin and ragdoll

[ v1.4 ]
- SexControl now has Depth control
- Added Random and presets for (speed, depth, thrust, bodysize)
- Added Feeling Lucky (randomizes 4 parameters from Thrust, Depth)
- Menu UX improvements
- Fixed Ambience options not working
- Fixed BodyEdit neck size not displaying correctly
- Fixed BodyEdit size bug

[ v1.3 ]
- Added Pause option (all actors)
- Added Random clothes option
- Added FaunaLabs animations
- Added FaunaLabs Editor Menus: AnimationLab, FaceLabSpeed, FingerLab, SpeedLab
- BodyEdit sorted items better
- Fixed bodyedit nipple size+

[ v1.2 ]
- Removed all integrated mods
- Added full support for Talk Menu Mod Manager
- Added support for FaunaLABS (through pose/face menus and full FaunaLABS menu)
- Dynamic menu items
- Added cleanup batch script for obsolete files
- DoubleClick: Naked, Reset, Use in other mods (when using TMMM, respects stickied mod or not)
- OnSpawn: Naked, No Sex, No futa
- Penetration option toggle (male/female)
- Males no longer moan
- Changeable clothes (all characters)
- Editable menus: clothes, music, body presets, custom poses(face, body, arm) in config files:
  - Config & defaults: tm__config.lua
  - Body presets: tm__presets.lua
  - Custom pose menu: tm__poses.lua
  - Character clothes: tm__clothes.lua
  - Music: tm__music.lua

[ v1.1 ]
- Added support for Talk Menu Mod Manager
- Solved compatibility with Nf123 Voice Mod (stops moaning)
- Renamed functions/variables to minimize clashing with other FreeMode mods

[ v1.0 ]
- SexControl
  - control all holes from one character (mouth, vagina, anus)
  - control speed, thrust and "male vs female move"
  - responsive controls (some non-linear)
- BodyEdit preset tweaks
- Menu UX, coloring & polish
- Scenes now packed with mod `Captures/TrueMoan`

[ v0.9 ]
- Option to Spawn new characters naked
- BodyEdit presets by size (Fairy, Small, Normal, Huge, Giant, Fairy Dildo)
- BodyEdit presets by type (Skinny, Slim, Normal, Curvy, Obese)
- BodyEdit limit tweaks, increments non-linear
- Menu UX polish

[ v0.8 ]
- 6 Scene ambience sounds
- 7 skyboxes
- Random Body Size in Body editor and Scene start
- Cenralized config in tm_CONFIG.lua

[ v0.7 ]
- WetSex option
- Split the menu files for easier editing / updating
- Extracted Close & Back labels to tm_menu.lua

[ v0.6 ]
- BodyEdit presets (skinny, slim, normal, curvy, obese)
- BodyEdit Safe edit option (breasts below -0.8 crash the game on some characters)
- Renamed mod to "TrueMoan" from "FreemodeHG v0.3 - faunap_edit_0.2 - GenSound01 - Auto ThrustBJ - illa3d_edit"
- Split files for easier updating
- Renamed files so it doesn't overwrite other mods
- "freemode_main.lua" is not required (even if it exists in folder), "tm_main_illa3d.lua" overrides functions
  happens automagically - same function in multiple files, alphabetically last one used!

[ v0.5 ]
- Menu UX improvements
- New moaning tier: Climax
- Sex controls: More presets, better Faster/Slower controls

[ v0.4 ]
- TrueMoan system: Slow, Normal, Fast, Faster, Orgasm
- Menu UX - improvements

[ v0.3 ]
- Menu UX - completely reorganized the menu and unified the style
- Body Edit - reduce/enlarge beyond slider values for all body parts

[ v0.2 ]
- Menu UX - completely reorganized the menu and unified the style
- Main menu fixed item list - dynamic ones appear under "Hey, Lara", "Sex" and "Anim.."
- Character Reset - setting stand up, normal face, stop all animations

[ v0.1 ]
- Menu UX - improvements
- Moaning - Reduced tresholds for slow/normal/fast moans
- Sex speed - Presets, Slower and Faster
- Body Edit - reduce/enlarge beyond slider values for: Body, Breasts, Ass, Penis size, Penis length (revamped "Illegal character customization") 
- Wetness - Presets, Less and More
- Visible values while editing options

[ v0.0 ] Combined multiple mods from FreeModeHG thread to one archive
- @heartgrenade: FreeModeHG v0.3.zip - https://discord.com/channels/620113492208517120/1312401584910631054/1349491994510233661
- @faunap: FreeModeHG v0.3 - faunap_edit_0.2.zip - https://discord.com/channels/620113492208517120/1312401584910631054/1355724274224205984
- @masterchief_87971: Natural AutoBJ AutoThrust - https://discord.com/channels/620113492208517120/1312401584910631054/1355675724932972634
- @callmedrjones6911: Face expression looping - https://discord.com/channels/620113492208517120/1312401584910631054/1349562400105431090



---------------------------------------------------------------------------------------------------------
VSCODE + LUA (by sumaneko) extension
---------------------------------------------------------------------------------------------------------
With diagnostics enabled, you need to wrap all talk menu labels like this
Make sure you define it for just the block, because if you don't re-enable,
all regular functions below will not be under diagnostics.

---@diagnostic disable: exp-in-action, undefined-global, keyword, unknown-symbol, miss-end, miss-symbol, miss-exp, err-nonstandard-symbol, err-assign-as-eq, malformed-number
label MenuName(human, hitTri)
stop 
---@diagnostic enable: exp-in-action, undefined-global, keyword, unknown-symbol, miss-end, miss-symbol, miss-exp, err-nonstandard-symbol, err-assign-as-eq, malformed-number

And define your globals in VSCode/DATA/user-data/User/settings.json

    "Lua.codeLens.enable": true,
    "Lua.diagnostics.globals": [
        "_G",
        "game",
        "label",
        "load",
        "math",
        "next",
        "os",
        "pairs",
        "ipairs",
        "table",
        "type",
        "TargetActor",
        "fauna_LABS_Menu",
        "TM_AddFunctionHook",
        "TM_AddFunctionOverride",
        "TM_AddMenuMod",
        "TM_CurrentStickiedMod",
        "TM_ModMenu",
        "TM_RemoveFunctionHook",
        "TM_RemoveFunctionOverride",
        "VM_VoiceMod_Enable",
        "VM_VoiceMod_Enabled"
    ]