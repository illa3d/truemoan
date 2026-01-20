function Anim_Name(actorA, actorB, actorC, actorD, actorE, actorF, actorG, actorH, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "judy alvarez")
actorB = Human(actorB, "panam")
actorC = Human(actorC, "lara croft")
actorD = Human(actorD, "jill valentine")
actorE = Human(actorE, "ashley")
actorF = Human(actorF, "ciri")
actorG = Human(actorG, "yennefer")
actorH = Human(actorH, "dante")

local point = MapPoint("map_island", Pos(1.932, 8.621, 0.292), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(9.9775, -50.10001).Skybox("tm_beach", 1.365, -0.0027)
end)
actorA.PlaceAt(Pos(1.761, -0.207, 0.498), Rot(0, 297.775, 0), point)
actorB.PlaceAt(Pos(1.546, -0.172, -1.028), Rot(0, 327.251, 0), point)
actorC.PlaceAt(Pos(1.903, 0.277, -0.364), Rot(0, 98.1, 0), point)
actorD.PlaceAt(Pos(1.442, -0.278, -0.147), Rot(0, 118.125, 0), point)
actorE.PlaceAt(Pos(2.035, -0.091, 1.063), Rot(0, 265.8, 0), point)
actorF.PlaceAt(Pos(2.294, -0.091, 2.049), Rot(0, 69.451, 0), point)
actorG.PlaceAt(Pos(1.686, -0.021, -2.05), Rot(0, 286.725, 0), point)
actorH.PlaceAt(Pos(-2.293, -0.091, -0.263), Rot(0, 45.076, 0), point)

actorA.Body("Penis size", 2.384186E-07, "Fluid speed", 0.09)
actorB.Body("Fluid speed", 0.09)
actorC.Body("Penis size", 2.384186E-07, "Fluid speed", 0.09)
actorD.Body("Fluid speed", 0.09)
actorE.Body("Fluid speed", 0.09)
actorF.Body("Fluid speed", 0.09)
actorG.Body("Penis size", 2.145767E-06, "Fluid speed", 0.09)
actorH.Body("Fluid speed", 0.09)

actorA.Customize("Pants", 1)
actorB.Customize("Pants", 1, "Jacket", 1, "Belt", 1)
actorC.Customize("Pants", 1)
actorD.Customize("Gloves", 1, "Belts", 1, "Jeans", 2)
actorE.Customize("Knit", 1, "Scarf", 1, "Skirt", 2)
actorF.Customize("Pants", 2, "Top", 2)
actorG.Customize("Pants", 2, "Clothes", 2)
actorH.Customize("Gloves", 2, "Coat", 1)

PoseCam(Pos(-3.67, 1.537, 0.942), Pos(0.211, 1.106, 0.074), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.01, 1.21, 0.061)),
	HipsRot(35, -11.25, -25),
	Head(-0.004, 0.994, -0.105),
	HeadRot(6.181, 353.326, 354.025),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WPos(-0.14, 1.002, -0.443)),
	FootR(WSurface(TPos(-0.023, -0.021, 0.05), 0, -1)),
	HandL(HPos(-0.137, 0.062, 1.07), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(12.254, 95, 95, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 0, 0, 20, 0, TargetActor.Null, "Null"),
	MidL(20, 0, 0, -4.441, 0, TargetActor.Null, "Null"),
	RingL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(-0.096, 0.231, 1.01), Wrist(HPoint(0, 0, 0.3, 0, 0, 0, "Bone_Index3_L"), 70)),
	ThumbR(24.953, 95, 95, 20, 0, TargetActor.Null, "Null"),
	IndexR(4.497, 0, 0, 20, 0, TargetActor.Null, "Null"),
	MidR(7.458, 0, 0, -2.864, 0, TargetActor.Null, "Null"),
	RingR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	PinkyR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	ElbowL(0.22),
	ElbowR(-0.339),
	WristL(-70, 0, -61.812),
	WristR(-86.106, 0, -87.754),
	KneeL(0.584),
	KneeR(-0.053),
	AnkleL(54.326),
	AnkleR(55),
	SpineRot(-28.65),
	Mouth(-0.19, -0.036, 0, 0.384, 0.384, 0.878, 0.878, 1, 1, 0.994, 0.994),
	Brows(1, 1, 1, 1),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(1, 1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.011, 1.101, -0.025)),
	HipsRot(35, 17.25, 4),
	Head(0.034, 0.997, -0.075),
	HeadRot(345.053, 310.568, 12.351),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.12, 0.126, -0.084), 0, -1)),
	FootR(WSurface(TPos(0.065, 0.126, -0.064), 0, -1)),
	HandL(HPos(-0.35, 1.286, -0.045), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Head", 1.216, -0.728, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	ElbowL(0.385),
	ElbowR(0.152),
	WristL(-50.745, 0, 35.328),
	WristR(22.989, 0, 15.762),
	KneeL(0.317),
	KneeR(1),
	AnkleL(55),
	AnkleR(-27.282),
	SpineRot(2.4),
	Mouth(0, 0, 0, -0.211, -0.211, 0.302, 0.302, -0.356, -0.356, -1, -1, -1, 1),
	Brows(1, 1, 1, 1),
	EyelidL(0.488),
	EyelidR(0.488),
	Cheeks(-1, -1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorC).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.022, 1.297, -0.258)),
	HipsRot(-35, 0, -2.6),
	Head(-0.082, -0.993, 0.082),
	HeadRot(53.629, 182.697, 181.958),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WPos(-0.427, 1.569, -0.589)),
	FootR(WPos(0.374, 1.543, -0.671)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Calf_L", 0.284, -0.05, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Calf_R", 0.22, 0.01, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(0.572, 15.78, 15.78, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_R"),
	ElbowL(0.278),
	ElbowR(0.284),
	WristL(58.81, 0, 72.373),
	WristR(19.226, 0, 89.774),
	KneeL(-0.28),
	KneeR(-0.326),
	AnkleL(5.462),
	AnkleR(-4.986),
	Mouth(-0.363, 0.129, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438),
	Brows(-0.362, -0.362)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorD).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.068, 0.862, 0.093)),
	HipsRot(-21.875, 0, -11.225),
	Head(-0.315, -0.947, 0.058),
	HeadRot(21.347, 169.03, 194.203),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.586, 0.077, 0.04), 0, -1)),
	FootR(WSurface(TPos(0.825, 0.077, 0.214), 0, -1)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Calf_L", 0.143, 0.871, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.962, -0.152, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(-13.425, 0, 0, -20, 0, TargetActor.Null, "Null"),
	IndexR(20, 0, 0, 13.643, 0, TargetActor.Null, "Null"),
	MidR(36.194, 38.793, 38.793, -10.734, 0, TargetActor.Null, "Null"),
	RingR(42.912, 17.522, 17.522, 0.4, 0, TargetActor.Null, "Null"),
	ElbowL(0.107),
	ElbowR(0.336),
	WristL(21.224, 0, 22.882),
	WristR(20.773, 0.806, -41.634),
	PinkyR(20, 0, 0, -5.966, 0, TargetActor.Null, "Null"),
	KneeL(-0.526),
	KneeR(-0.657),
	AnkleL(-37.182, 0, -9.505),
	AnkleR(-34.879, 0, 39.77),
	SpineRot(-80.025),
	Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 1, 0, -1),
	Brows(1, 1, 0.072, 0.072),
	EyelidL(),
	EyelidR(),
	Cheeks(-1, -1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorE).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.001, 0.292, 0.161)),
	HipsRot(-12.325, -3.675, 1.375),
	Head(0.011, 0.351, 0.936),
	HeadRot(340.824, 3.128, 2.161),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WPos(-0.316, 0.112, -0.224)),
	FootR(WPos(0.236, 0.141, -0.272)),
	HandL(WSurface(WPos(-0.087, 0.055, 0.619), 0, -1), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	HandR(WSurface(WPos(0.141, 0.055, 0.845), 0, -1), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(-0.378),
	ElbowR(-0.322),
	WristL(-10.422, 0, -7.306),
	WristR(-6.143, 0, 17.642),
	KneeL(-0.278),
	KneeR(-0.433),
	AnkleL(43.682, 0, -10),
	AnkleR(49.632, 0, -9.644),
	SpineRot(),
	Mouth(-0.468, -0.462, 0, -0.211, -0.211, 0.302, 0.302, -0.356, -0.356, -1, -1, -1, 1),
	Brows(1, 1, -1, -1),
	EyelidL(0.517),
	EyelidR(0.517),
	Cheeks(-1, -1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorF).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.026, 0.936, -0.757)),
	HipsRot(-3.675, 0, -3.45),
	Head(0.388, -0.921, -0.036),
	HeadRot(42.069, 171.351, 163.172),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WPos(-0.849, 1.39, -0.436)),
	FootR(WPos(0.314, 2.063, -0.727)),
	HandL(WSurface(WPos(0.135, -0.003, -0.755), 0.003, -1, -0.003), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	HandR(HPos(1.649, -0.468, 0.309), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(0.655),
	ElbowR(-1),
	WristL(-31.159, 0, -89.506),
	WristR(-28.79, -4.294, -9.926),
	KneeL(0.161),
	KneeR(0.77),
	AnkleL(54.1),
	AnkleR(55),
	SpineRot(),
	Mouth(-0.558, 0.92, 0, 0.384, 0.384, -0.634, -0.634, 0.112, 0.112, 0.922, 0.922),
	Brows(0.312, 0.312, 0.31, 0.31),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(-1, -1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorG).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.004, 1.393, -0.106)),
	HipsRot(33.5, 26.1, 3.925),
	Head(-0.157, 0.923, -0.351),
	HeadRot(351.162, 11.789, 350.471),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WPos(-0.313, 1.143, -0.47)),
	FootR(WPos(-0.143, 1.138, -0.56)),
	HandL(HPos(-0.281, 0.127, 0.335), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(18.468, 58.721, 58.721, 0, 0, TargetActor.Null, "Null"),
	IndexL(9.437, 0, 0, 15.502, 0, TargetActor.Null, "Null"),
	MidL(6.788, 0, 0, -7.787, 0, TargetActor.Null, "Null"),
	RingL(85, 84.597, 84.597, -3.139, 0, TargetActor.Null, "Null"),
	PinkyL(85, 69.908, 69.908, -20, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.281, 0.127, 0.335), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(18.468, 58.721, 58.721, 0, 0, TargetActor.Null, "Null"),
	IndexR(9.437, 0, 0, 15.502, 0, TargetActor.Null, "Null"),
	MidR(6.788, 0, 0, -7.787, 0, TargetActor.Null, "Null"),
	RingR(85, 84.597, 84.597, -3.139, 0, TargetActor.Null, "Null"),
	PinkyR(85, 69.908, 69.908, -20, 0, TargetActor.Null, "Null"),
	ElbowL(0.015),
	ElbowR(-0.02),
	WristL(-18.831, 0, -16.804),
	WristR(-14.363, 0, -74.071),
	KneeL(-0.099),
	KneeR(-0.188),
	AnkleL(-0.816),
	AnkleR(54.104, 0, -10),
	SpineRot(12.675),
	Mouth(0, -0.115, 0, 0, 0, 0, 0, 0.674, 0.674, -1, -1, -1.2, 1.2),
	Brows(1, 1, 1, 1),
	EyelidL(0.26),
	EyelidR(0.26),
	Cheeks(-1, -1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorH).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.001, 1.006, 0.047)),
	HipsRot(-3.95, 0, 7.3),
	Head(-0.047, 0.985, 0.167),
	HeadRot(358.032, 277.42, 4.282),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.106, -0.002, 0.081), -0.004, -1, 0.002)),
	FootR(WSurface(TPos(0.114, -0.003, -0.028), -0.004, -1, 0.002)),
	HandL(HPos(-0.322, -0.341, 0.81), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.621, -0.113, 0.817), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 0, 0, -5.966, 0, TargetActor.Null, "Null"),
	ElbowL(0.196),
	ElbowR(-0.178),
	WristL(-48.977, -35.317, 120),
	WristR(-48.215, 0, 107.816),
	SpineRot(-68.85),
	Mouth(-0.202, -0.202, 0, 0.384, 0.703, -0.489, -0.337, 1, 0.999, 0.759, 0.779),
	Brows(0.998, 0.998),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(-0.942, -0.942)
)
end