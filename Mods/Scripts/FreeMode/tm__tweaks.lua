-- TrueMoan v2.0 by illa3d
------------------------------------------------------------------------------------------------------------------
-- TRUE MOAN DEFAULTS TWEAKS (change detailed settigns how the game behaves)
------------------------------------------------------------------------------------------------------------------
--                              !!! REMEMBER TO BACKUP BEFORE UPDATING THE MOD !!!                              --
--     Some values will be added through time. If you just copy your backup, you might be losing on options!    --
------------------------------------------------------------------------------------------------------------------

-- AutoSex Time
TM_AutoSexTimeMin = 2			-- [1-20] Auto Interaction minimum time to change parameter (speed, thrust, depth) 
TM_AutoSexTimeMax = 5			-- [1-20] Auto Interaction maximum time to change parameter (speed, thrust, depth) 

-- AutoSex Drift (bigger values more variety)
TM_AutoSexSpeedDrift = 0.4		-- [0-1] How close in percent will be next step for sex speed
TM_AutoSexThrustDrift = 0.3		-- [0-1] How close in percent will be next step for sex thrust
TM_AutoSexWeightDrift = 0.2		-- [0-1] How close in percent will be next step for sex weight (male female)
TM_AutoSexDepthStartDrift = 0.2	-- [0-1] How close in percent will be next step for sex depth (start/end)
TM_AutoSexDepthEndDrift = 0.3	-- [0-1] How close in percent will be next step for sex depth (start/end)
								-- setting values [24. - 28.] to zero turns them off
-- Body Edit Increments
TM_BodyStepA = 0.1		-- nipples hip, waist, muscle
TM_BodyStepB = 0.05		-- ass, penis-length, penis-size, forearm, upperarm, calf, thigh, neck
TM_BodyStepC = 0.025	-- breast, body

-- Sex Control increments
TM_SexSpeedStep = 0.05	-- non-linear percent (increments: slow = small, fast = big)
TM_SexMaleStep = 0.05	-- giver/getter, linear percent (of UI slider)
TM_SexThrustStep = 0.05	-- easier/harder, linear percent (of UI slider)
TM_SexDepthStep = 0.05	-- shallow/deep, linear percent (of UI slider)

-- Sex controls quick command increments
TM_SexDeeperStep = 0.1	-- Deeper command

-- Climax tier ladder-down time for each step
AutoSexClimaxTimeStep = 4

-- Moan Sex treshold by sex speeed (Min: 0.001, Max: 2)
TM_MoanTreshold_Climax = 1.3
TM_MoanTreshold_Wild = 0.9
TM_MoanTreshold_Faster = 0.6
TM_MoanTreshold_Fast = 0.3
TM_MoanTreshold_Normal = 0.1

-- Moan Cum frequency (sec)
TM_MoanCumEyeTime = 1	-- Cum in eye
TM_MoanCumLipsTime = 3	-- Cum on lips
TM_MoanCumBodyTime = 5	-- Cum on body
TM_WetnessStep = 200	-- Wetness Control step

-- Cumflation (belly inflation by cumming inside)
TM_CumflateStepUp = 0.005		-- Increment (each 0.1sec once) of hip size increase
TM_CumflateStepDown = 0.02		-- Decrement (each 0.1sec once) of hip size reduction
TM_CumflateHipSizeLimit = 1.5	-- Maximum amout to increase to (deformed afer 1.5)

-- Arousal
TM_HumanArousalIncrease = 0.003
TM_HumanArousalDecay = 0.01
