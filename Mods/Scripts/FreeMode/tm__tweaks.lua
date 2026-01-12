-- TrueMoan v2.2 by illa3d
------------------------------------------------------------------------------------------------------------------
-- TRUE MOAN DEFAULTS TWEAKS (change detailed settigns how the game behaves)
------------------------------------------------------------------------------------------------------------------
--                              !!! REMEMBER TO BACKUP BEFORE UPDATING THE MOD !!!                              --
--     Some values will be added through time. If you just copy your backup, you might be losing on options!    --
------------------------------------------------------------------------------------------------------------------
-- AUTOSEX
------------------------------------------------------------------------------------------------------------------

-- AutoSex Default Tiers for UI (Idle, Slow, Normal, Fast, Faster, Wild, Max)
TM_AutoSexTier_Default = AutoSexTier.Normal		-- Default AutoSex tier for all new characters
TM_AutoSexTier_ToggleMin = AutoSexTier.Idle		-- UI AutoSex toggle minimum tier (after which is OFF)
TM_AutoSexTier_ToggleMax = AutoSexTier.Faster	-- UI AutoSex toggle maximum tier (after OFF)

-- AutoSex Arousal
TM_HumanArousalIncrease = 0.3	-- Base rate of arousal increase (multiplied by various factors)
TM_HumanArousalDecrease = 2		-- Base rate of arousal decrease (when not in sex or cumming)

-- AutoSex Timings
TM_AutoSexTimeMin = 2			-- [1-20] Auto Interaction minimum time to change parameter (speed, thrust, depth) 
TM_AutoSexTimeMax = 5			-- [1-20] Auto Interaction maximum time to change parameter (speed, thrust, depth) 
TM_AutoSexClimaxTimeStep = 4	-- pause between each climax step while slowing down (+ random values)

-- AutoSex Drift (bigger values more variety)
TM_AutoSexSpeedDrift = 0.4		-- [0-1] How close in percent will be next step for sex speed
TM_AutoSexThrustDrift = 0.3		-- [0-1] How close in percent will be next step for sex thrust
TM_AutoSexWeightDrift = 0.2		-- [0-1] How close in percent will be next step for sex weight (male female)
TM_AutoSexDepthStartDrift = 0.2	-- [0-1] How close in percent will be next step for sex depth (start/end)
TM_AutoSexDepthEndDrift = 0.3	-- [0-1] How close in percent will be next step for sex depth (start/end)
								-- setting values [24. - 28.] to zero turns them off

------------------------------------------------------------------------------------------------------------------
-- UI CONTROLS
------------------------------------------------------------------------------------------------------------------

-- Body Edit Increments
TM_BodyStepA = 0.1				-- nipples hip, waist, muscle
TM_BodyStepB = 0.05				-- ass, breast, forearm, upperarm, calf, thigh, neck
TM_BodyStepC = 0.025			-- body, penis-length, penis-size

-- Sex Control increments
TM_SexSpeedStep = 0.05			-- non-linear percent (increments: slow = small, fast = big)
TM_SexMaleStep = 0.05			-- giver/getter, linear percent (of UI slider)
TM_SexThrustStep = 0.05			-- easier/harder, linear percent (of UI slider)
TM_SexDepthStep = 0.05			-- shallow/deep, linear percent (of UI slider)
TM_SexDeeperStep = 0.1			-- Deeper command

------------------------------------------------------------------------------------------------------------------
-- SEX REACTIONS
------------------------------------------------------------------------------------------------------------------

-- Moan Sex treshold by sex speeed (Min: 0.001, Max: 2)
TM_MoanTreshold_Climax = 1.3
TM_MoanTreshold_Wild = 0.9
TM_MoanTreshold_Faster = 0.6
TM_MoanTreshold_Fast = 0.3
TM_MoanTreshold_Normal = 0.1

-- Moan Cum frequency (sec)
TM_MoanCumHeadTime = 1			-- Cum in eyes, cheeks, tongue
TM_MoanCumHoleTime = 3			-- Cum on lips, vagina, anus, breasts
TM_MoanCumBodyTime = 5			-- Cum on body
TM_WetnessStep = 200			-- Wetness Control step

-- Cum reactions
TM_CumEffectTime = 0.5			-- [0.3-1] How often does a cum effect (moan, wetness) apply while parner cumming inside
TM_CumPauseTime = 1				-- [0-3 Pause after cumming inside and pull-out (all holes) to start Cum/Cumflation after effects

-- Body deformation
TM_BodyDeformUpdateRate = 0.05	-- [0.1] How often per second does the bulging/cumflation/cumdeflation update 
TM_BodyDeformHipSizeLimit = 1.5	-- Maximum amout to increase to (ugly over 1.5)
TM_CumflateStepUp = 0.005		-- Increment (each 0.1sec once) of hip size increase
TM_CumflateStepDown = 0.02		-- Decrement (each 0.1sec once) of hip size reduction