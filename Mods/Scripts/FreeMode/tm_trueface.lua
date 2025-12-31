-- TRUE FACE v0.1 - Facial muscles procedural animation system (doesn't animate the head or eye movement)

-- Location of the animation stored on human
function TrueFaceGetAnimAnchor(human) return human.headNames end

-- Call this to check if animation is active
function IsTrueFaceActive(human) return game.HasAnim(TrueFaceGetAnimAnchor(human)) end

-- Call this with to stop
function TrueFaceStop(human) game.RemoveAnim(TrueFaceGetAnimAnchor(human)) end

-- Call this with your preset to animate
function TrueFaceStart(human, preset)
	-- ===============================================================================================================
	-- PRESET DEFAULT (COPY & MODIFY, DELETE VALUES YOU DONT NEED IN YOUR FACE ANIM PROFILE, DEFAULTS WILL BE APPLIED)
	-- ==[preset start]===============================================================================================
	local TFPreset_Default = {
		-- UPDATE
		updateRate = 0.05,        -- [0.02 – 0.1] update frequency (lower = smoother, heavier)
		-- TIME SPEEDS
		mouthSpeed = 3.2,         -- [0.5 – 6.0] mouth motion speed (speech energy)
		faceSpeed  = 1.6,         -- [0.3 – 3.0] emotional pulse speed
		browSpeed  = 2.2,         -- [0.3 – 4.0] eyebrow motion speed
		auxSpeed   = 1.0,         -- [0.2 – 3.0] secondary motion speed (tongue / micro motion)
		-- INTENSITY SHAPING
		intensityCurve = 1.4,     -- [0.8 – 2.2] emotional sharpness (higher = punchier peaks)
		-- JAW / MOUTH OPEN
		jawBase = -0.4,           -- [-0.1 – -0.7] resting mouth openness
		jawWave = 0.25,           -- [0.0 – 0.4] rhythmic jaw movement range
		jawPeak = 0.35,           -- [0.0 – 0.6] jaw opening at emotional peaks
		-- SMILE
		smileBase = 0.35,         -- [0.0 – 0.6] resting smile amount
		smileFreq = 0.7,          -- [0.2 – 1.2] smile oscillation speed
		smileWave = 0.4,          -- [0.0 – 0.6] smile movement range
		smilePeak = 0.25,         -- [0.0 – 0.5] smile boost under intensity
		-- CHEEKS
		cheekFromSmile = 0.85,    -- [0.3 – 1.2] cheek lift driven by smile
		cheekPeak = 0.35,         -- [0.0 – 0.6] cheek contraction at peaks
		-- UPPER LIPS
		upperLipFreq = 1.1,       -- [0.3 – 2.0] upper lip movement speed
		upperLipMax  = 0.55,      -- [0.0 – 0.8] maximum upper lip curl
		upperLipPeak = 0.2,       -- [0.0 – 0.4] intensity-based upper lip curl
		-- LOWER LIPS
		lowerLipFreq  = 1.5,      -- [0.3 – 2.5] lower lip movement speed
		lowerLipMax   = 0.45,     -- [0.0 – 0.7] lower lip push/pull range
		lowerLipPress = 0.2,      -- [0.0 – 0.4] downward lip pressure at peaks
		-- INNER JAW / STRAIN
		innerJawFreq = 0.6,       -- [0.2 – 1.5] inner jaw tension speed
		innerJawWave = 0.4,       -- [0.0 – 0.6] base jaw strain motion
		innerJawPeak = 0.35,      -- [0.0 – 0.6] jaw strain at emotional peaks
		-- EYEBROWS
		browInnerLift = 0.45,     -- [0.0 – 0.8] inner eyebrow lift strength
		browInnerPeak = 0.25,     -- [0.0 – 0.5] extra inner brow lift at peaks
		browOuterFreq = 0.8,      -- [0.2 – 1.5] outer eyebrow movement speed
		browOuterPress = 0.25,    -- [0.0 – 0.6] downward outer brow pressure
		browOuterPeak  = 0.2,     -- [0.0 – 0.4] extra outer brow pressure at peaks
		browAsymFreq = 1.1,       -- [0.2 – 2.0] asymmetry oscillation speed
		browAsym = 0.15,          -- [0.0 – 0.35] eyebrow asymmetry strength
		-- LIP PHASE OFFSET
		lipPhaseOffset = 0.35,    -- [0.0 – 0.6] left/right lip timing offset
		-- TONGUE (OPTIONAL)
		tongue = false,           -- [false / true] enable tongue animation
		tongueOut = 0.85,         -- [0.0 – 1.0] tongue forward extension
		tongueUp = 0.55,          -- [0.0 – 0.8] tongue upward curl
		tongueSide = 0.25,        -- [0.0 – 0.5] tongue left/right sweep
		tonguePeak = 0.35,        -- [0.0 – 0.6] tongue intensity boost
		tongueSideFreq = 0.6,     -- [0.2 – 1.2] tongue side movement speed
		tongueUpFreq = 0.8        -- [0.2 – 1.2] tongue curl speed
	}
	-- ==[preset end]=================================================================================================
	
	preset = preset or {}
	for k, v in pairs(TFPreset_Default) do
		if preset[k] == nil then
			preset[k] = v
		end
	end
	local UPDATE_RATE = preset.updateRate
	local mouthT = math.random() * math.pi * 2
	local faceT  = math.random() * math.pi * 2
	local browT  = math.random() * math.pi * 2
	local auxT   = math.random() * math.pi * 2
	local function Tick()
		mouthT = mouthT + UPDATE_RATE * preset.mouthSpeed
		faceT  = faceT  + UPDATE_RATE * preset.faceSpeed
		browT  = browT  + UPDATE_RATE * preset.browSpeed
		auxT   = auxT   + UPDATE_RATE * preset.auxSpeed
		local intensity =
			math.max(0, math.sin(faceT)) ^ preset.intensityCurve
		local jawOpen =
			preset.jawBase +
			math.sin(mouthT) * preset.jawWave +
			intensity * preset.jawPeak
		local smile =
			preset.smileBase +
			math.sin(mouthT * preset.smileFreq) * preset.smileWave +
			intensity * preset.smilePeak
		local cheek =
			smile * preset.cheekFromSmile +
			intensity * preset.cheekPeak
		local upperLipR =
			math.max(0, math.sin(mouthT * preset.upperLipFreq)) * preset.upperLipMax +
			intensity * preset.upperLipPeak
		local upperLipL =
			math.max(0, math.sin(mouthT * preset.upperLipFreq + preset.lipPhaseOffset)) * preset.upperLipMax +
			intensity * preset.upperLipPeak
		local lowerLipR =
			math.sin(mouthT * preset.lowerLipFreq) * preset.lowerLipMax -
			intensity * preset.lowerLipPress
		local lowerLipL =
			math.sin(mouthT * preset.lowerLipFreq + preset.lipPhaseOffset) * preset.lowerLipMax -
			intensity * preset.lowerLipPress
		local innerVertical =
			math.max(0, math.sin(mouthT * preset.innerJawFreq)) * preset.innerJawWave +
			intensity * preset.innerJawPeak
		local browInner =
			math.max(0, math.sin(browT)) * preset.browInnerLift +
			intensity * preset.browInnerPeak
		local browOuter =
			-math.max(0, math.sin(browT * preset.browOuterFreq)) * preset.browOuterPress -
			intensity * preset.browOuterPeak
		local browAsym =
			math.sin(faceT * preset.browAsymFreq) * preset.browAsym
		local tongueSide =
			preset.tongue and math.sin(auxT * preset.tongueSideFreq) * preset.tongueSide or nil
		local tongueOut =
			preset.tongue and (
				math.max(0, math.sin(auxT)) * preset.tongueOut +
				intensity * preset.tonguePeak
			) or nil
		local tongueUp =
			preset.tongue and
			math.max(0, math.sin(auxT * preset.tongueUpFreq)) * preset.tongueUp or nil
		human.Pose(Preset(
			Brows(
				browOuter + browAsym,
				browOuter - browAsym,
				browInner - browAsym,
				browInner + browAsym
			),
			Mouth(
				jawOpen,
				nil, nil,
				upperLipR,
				upperLipL,
				lowerLipR,
				lowerLipL,
				smile,
				smile,
				cheek,
				cheek,
				innerVertical,
				nil,
				tongueSide,
				tongueOut,
				tongueUp
			)
		))
	end
	game.RemoveAnim(TrueFaceGetAnimAnchor(human))
	game.AddRepeatAnim(UPDATE_RATE, Tick, TrueFaceGetAnimAnchor(human))
end
