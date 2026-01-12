function Anim_Name(actorA, actorB, actorC, actorD, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "panam", "tifa")
actorB = Human(actorB, "black male", "leon s kennedy")
actorC = Human(actorC, "generic male", "dante")
actorD = Human(actorD, "tifa lifeguard")

local point = MapPoint("map_gym", Pos(4.584, 0.033, 5.306), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(2.926002, 375.7493).Skybox("tm_seaside", 3.6675, 0.1836001).Light("LampLight_02", 0.02699999, 0.32875, 9.872499).Light("LampLight_03", -0.009, 0.7537501, 10)
	actorC.Material("Shirt", 0.07650003, 2.355001, 0, 0).Material("Pants", 0.5155002, 2.1675, 0, 0)
end)
actorA.PlaceAt(Pos(0.75, 0.082, 0.643), Rot(0, 92.427, 0), point)
actorB.PlaceAt(Pos(-0.305, -0.082, 1.037), Rot(0, 142.378, 0), point)
actorC.PlaceAt(Pos(-0.751, -0.028, -1.038), Rot(0, 59.818, 0), point)
actorD.PlaceAt(Pos(-0.38, -0.021, -0.166), Rot(0, 134.292, 0), point)

actorA.Body("Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.09999999, "Calf size", -0.09999999, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Fluid speed", 0.09)
actorB.Body("Fluid speed", 0.09)
actorC.Body("Fluid speed", 0.09)
actorD.Body("Fluid speed", 0.09)

actorA.Customize("Skirt", 2, "Arms", 2, "Legs", 2)
actorB.Customize("CottnBelt", 2, "Jacket", 2)
actorC.Customize("Gloves", 2, "Coat", 1, "Headwrap", 1)
actorD.Customize("Hat", 1, "Gloves", 1, "Elbowpad", 1)

PoseCam(Pos(0.757, 1.592, -3.246), Pos(0.336, 1.05, 0.695), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 1.109, 0.008)),
	HipsRot(-21.65, -6.15, -1.55),
	Head(0, 0.891, 0.454),
	HeadRot(346.214, 11.949, 357.353),
	EyeL(WorldPos(5.679, 1.88, 4.916)),
	EyeR(WorldPos(5.679, 1.88, 4.916)),
	FootL(WPos(-0.019, 0.964, -0.663)),
	FootR(WSurface(TPos(0.015, 0.072, 0.398), 0, -1)),
	HandL(HPos(-0.23, 0.106, 0.909), Wrist(HPoint(0, -0.1, 0.15, 0, 0, 0, "Bone_Mid_L"), 15)),
	ThumbL(28.924, 95, 95, -8.984, 0, TargetActor.Null, "Null"),
	IndexL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.214, -0.961, -0.086), Wrist(HPoint(0, -0.1, 0.15, 0, 0, 0, "Bone_Mid_L"), 15)),
	ThumbR(28.924, 95, 95, 14.71, 0, TargetActor.Null, "Null"),
	IndexR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	ElbowL(-0.544),
	ElbowR(-1),
	WristL(-2.11, 1.499, 20.631),
	WristR(-11.656, -15.222, 13.438),
	KneeL(0.617),
	KneeR(),
	AnkleL(28.901, 0, 8.866),
	AnkleR(23.756, 0, 6.433),
	SpineRot(-6.45),
	Mouth(-0.534, -0.093, 0, 0, 0.706, -0.118, 0.104, -0.007, -0.007, 1, 1),
	Brows(0.841, 0.841, 0.123, 0.123),
	EyelidL(-0.217),
	EyelidR(-0.217),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.042, 1.125, -0.094)),
	HipsRot(1.475, 0, 3.1),
	Head(0.08, 0.959, 0.272),
	HeadRot(353.84, 353.192, 5.848),
	EyeL(EyeContact(TargetActor.A)),
	EyeR(EyeContact(TargetActor.A)),
	FootL(WSurface(TPos(-0.11, -0.006, 0.027), 0, -1)),
	FootR(WSurface(TPos(0.196, -0.006, 0.032), 0, -1)),
	HandL(HPos(-0.169, -0.951, 0.276), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(85, 0, 0, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.182, 1.13, 0.133), Wrist(HPoint(0, -0.1, 0.15, 0, 0, 0, "Bone_Mid_L"), 15)),
	ThumbR(28.924, 95, 95, 14.71, 0, TargetActor.Null, "Null"),
	IndexR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	ElbowL(),
	ElbowR(0.346),
	WristL(),
	WristR(),
	KneeL(-0.267),
	KneeR(-0.223),
	AnkleL(3.289, 0, 24.259),
	AnkleR(39.562, 0, 35.342),
	SpineRot(),
	Mouth(-0.563, 0.383, 0, 0, 0, -0.467, -0.467, 0.791, 0.791, 0.822, 0.822),
	Brows(1, 1, 0.161, 0.161),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(-1, -1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorC).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.002, 0.911, 0.291)),
	HipsRot(12.175, 0, 10.825),
	Head(-0.003, 0.984, -0.18),
	HeadRot(310.585, 352.211, 12.543),
	EyeL(WorldPos(4.539, 1.958, 3.699)),
	EyeR(WorldPos(4.539, 1.958, 3.699)),
	FootL(WSurface(TPos(-0.218, 0, 0.424), 0, -1)),
	FootR(WSurface(TPos(0.363, 0, 0.689), 0, -1)),
	HandL(HPos(-0.565, 1.007, 0.403), Wrist(HPoint(0, -0.1, 0.15, 0, 0, 0, "Bone_Mid_L"), 15)),
	ThumbL(10.732, 72.691, 72.691, 14.71, 0, TargetActor.Null, "Null"),
	IndexL(9.62, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidL(20.884, 0, 0, 0, 0, TargetActor.Null, "Null"),
	RingL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.429, 0.519, -0.226), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(-3.381, 0, 0, 0, 0, TargetActor.Null, "Null"),
	IndexR(17.098, 0, 0, -2.032, 0, TargetActor.Null, "Null"),
	MidR(5.471, 0, 0, 0, 0, TargetActor.Null, "Null"),
	RingR(3.091, 0, 0, -12.847, 0, TargetActor.Null, "Null"),
	PinkyR(-14.367, 0, 0, -20, 0, TargetActor.Null, "Null"),
	ElbowL(-0.38),
	ElbowR(0.426),
	WristL(-8.046, 0, -31.263),
	KneeL(-0.285),
	KneeR(-1),
	SpineRot(24.15),
	Mouth(-0.864, -0.668, 0, 1, 1, -1, -1, 0.376, 0.376, 0.223, 0.223),
	Brows(0.692, 0.692, 1, 1),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(-0.993, -0.993)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorD, actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.094, 0.968, -0.019)),
	HipsRot(20.3, 0, 3.775),
	Head(0.208, 0.975, -0.074),
	HeadRot(353.067, 334.885, 359.028),
	EyeL(EyeContact(TargetActor.A)),
	EyeR(EyeContact(TargetActor.A)),
	FootL(WSurface(TPos(-0.11, -0.006, 0.027), 0, -1)),
	FootR(WSurface(TPos(0.196, -0.006, 0.032), 0, -1)),
	HandL(HPos(-0.089, -0.776, -0.178), Wrist(HPoint(0, -0.1, 0.15, 0, 0, 0, "Bone_Mid_L"), 15)),
	ThumbL(10.732, 72.691, 72.691, 14.71, 0, TargetActor.Null, "Null"),
	IndexL(9.62, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidL(20.884, 0, 0, 0, 0, TargetActor.Null, "Null"),
	RingL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Thigh_R", 0.239, -0.219), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	ElbowL(),
	ElbowR(),
	WristL(),
	WristR(),
	KneeL(),
	KneeR(-0.465),
	SpineRot(),
	Mouth(-0.217, 0.139, 0, 0, 0, 0, 0, 0.858, 0.858, 0.983, 0.983),
	Brows(0.12, 0.12),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
end