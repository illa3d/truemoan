function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "panam", "tifa")
actorB = Human(actorB, "black male", "leon s kennedy")

local point = MapPoint("map_gym", Pos(-0.872, -0.069, 2.682), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(10, 163.65).Skybox("tm_seaside", -0.1649998, 0.0144).Light("LampLight_02", 0.02699999, 0.32875, 9.872499).Light("LampLight_03", -0.009, 0.7537501, 10)
end)
actorA.PlaceAt(Pos(-0.409, 0.02, 0.096), Rot(0, 334.976, 0), point)
actorB.PlaceAt(Pos(0.41, -0.021, -0.096), Rot(0, 347.727, 0), point)

actorA.Body("Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.09999999, "Calf size", -0.09999999, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Fluid speed", 0.09)
actorB.Body("Fluid speed", 0.09)

actorA.Customize("Skirt", 2, "Arms", 1, "Legs", 2)
actorB.Customize("CottnBelt", 1, "Jacket", 2)

PoseCam(Pos(2.461, 1.471, 1.201), Pos(-0.627, 1.303, 0.194), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 1.142, -0.01)),
	HipsRot(6.95, 0, 11.725),
	Head(-0.001, 0.98, -0.199),
	HeadRot(348.825, 99.729, 9.616),
	EyeL(BoneMesh(TargetActor.A, "Bone_Head", 0.973, -0.391)),
	EyeR(BoneMesh(TargetActor.A, "Bone_Head", 0.973, -0.391)),
	FootL(WSurface(TPos(-0.11, -0.006, 0.027), 0, -1)),
	FootR(WSurface(TPos(0.26, 0.075, -0.119), 0, -1)),
	HandL(HPos(-0.312, -0.097, 0.977), Wrist(HPoint(0, 0, 0.3, 0, 0, 0, "Bone_Index3_L"), 70)),
	ThumbL(30, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	RingL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	PinkyL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.31, -0.742, -0.027), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(),
	ElbowR(),
	WristL(-56.737, 1.499, 104.248),
	WristR(-10.873, 11.084, 91.463),
	KneeL(),
	KneeR(),
	AnkleL(-18.878, 0, 8.866),
	AnkleR(15.914, 0, 40),
	SpineRot(58.125),
	Mouth(-0.429, -0.146, 0, 0, 0.706, -0.118, 0.104, 0.588, 0.588, 0.647, 0.647),
	Brows(0.562, 0.562, 1, 1),
	EyelidL(-0.217),
	EyelidR(-0.217),
	Cheeks(-1, -1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.001, 1.154, -0.011)),
	HipsRot(20.3, -10.35, 3.775),
	Head(0.003, 0.984, -0.18),
	HeadRot(357.574, 350.283, 3.416),
	EyeL(WorldPos(-0.589, 1.703, 3.967)),
	EyeR(WorldPos(-0.589, 1.703, 3.967)),
	FootL(WSurface(TPos(-0.221, 0.125, 0.05), 0, -1)),
	FootR(WSurface(TPos(0.171, 0.125, 0.118), 0, -1)),
	HandL(HPos(-0.243, -0.524, 0.629), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Head", 1.732, -0.991), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	ElbowL(),
	ElbowR(0.481),
	WristL(-41.423, 0, 118.136),
	WristR(),
	KneeL(),
	KneeR(),
	AnkleL(-14.2, 0, 24.259),
	AnkleR(-1.893, 0, 35.342),
	SpineRot(0.75),
	Mouth(-0.289, 0.309, 0, 0.005, 0, -1, 0, 0.878, 0.878, 0.97, 0.251),
	Brows(1, 1, 1, 1),
	EyelidL(),
	EyelidR(),
	Cheeks(-1, -1)
)
end