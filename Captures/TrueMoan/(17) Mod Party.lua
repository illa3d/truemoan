function Anim_Name(actorA, actorB, actorC, actorD, actorE, actorF, actorG, actorH, actorI, actorK, actorL, actorM, actorN, actorO, actorP, actorQ, actorT, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "lara croft")
actorB = Human(actorB, "judy alvarez")
actorC = Human(actorC, "panam")
actorD = Human(actorD, "eva")
actorE = Human(actorE, "jill valentine")
actorF = Human(actorF, "tachy", "android 18")
actorG = Human(actorG, "tifa")
actorH = Human(actorH, "dante")
actorI = Human(actorI, "harley quinn")
actorK = Human(actorK, "mrx")
actorL = Human(actorL, "geralt")
actorM = Human(actorM, "primrose office")
actorN = Human(actorN, "cloud")
actorO = Human(actorO, "juliet")
actorP = Human(actorP, "generic male", "leon s kennedy")
actorQ = Human(actorQ, "generic male", "dante")
actorT = Human(actorT, "ashley")

local point = MapPoint("ff7_tifa's apartment", Pos(-0.237, 0.161, 2.449), Rot(0, 0, 0), overridePos, overrideRot, function()
	Skybox("tm_arizona", 0, 0).Light("Submesh_35_Apartment_01_7thSlum", 0.1, 0.3, 3.5E-06).Light("LampA", 0.0575, 0.2875, 6.697501).Light("LampB", 0, 0, 10).Light("Submesh_139_SmallTable_01_7thSlum", 0.05, 0.3, 1.5E-06)
	actorD.Material("Suit", 0, 0, 0.13875, 0.04125)
end)
actorA.PlaceAt(Pos(0.141, -0.167, -2.093), Rot(0, 254.202, 0), point)
actorB.PlaceAt(Pos(-0.305, -0.203, -1.972), Rot(0, 131.128, 0), point)
actorC.PlaceAt(Pos(-0.055, -0.161, -3.097), Rot(0, 260.694, 0), point)
actorD.PlaceAt(Pos(0.21, -0.139, -1.259), Rot(0, 195.144, 0), point)
actorE.PlaceAt(Pos(-0.751, -0.118, 1.162), Rot(0, 182.019, 0), point)
actorF.PlaceAt(Pos(-0.895, -0.14, -2.829), Rot(0, 196.344, 0), point)
actorG.PlaceAt(Pos(1.166, -0.098, -2.7), Rot(0, 209.694, 0), point)
actorH.PlaceAt(Pos(1.604, 0.306, -2.779), Rot(0, 179.32, 0), point)
actorI.PlaceAt(Pos(1.424, -0.124, -1.865), Rot(0, 202.869, 0), point)
actorK.PlaceAt(Pos(1.555, -0.14, 0.167), Rot(0, 224.244, 0), point)
actorL.PlaceAt(Pos(-0.026, -0.14, -0.095), Rot(0, 178.644, 0), point)
actorM.PlaceAt(Pos(-1.427, -0.14, -2.754), Rot(0, 238.944, 0), point)
actorN.PlaceAt(Pos(-1.603, -0.307, -1.469), Rot(0, 99.444, 0), point)
actorO.PlaceAt(Pos(-0.758, -0.14, -1.224), Rot(0, 250.194, 0), point)
actorP.PlaceAt(Pos(-0.325, -0.14, 1.775), Rot(0, 177.069, 0), point)
actorQ.PlaceAt(Pos(0.944, -0.134, 3.097), Rot(0, 40.494, 0), point)
actorT.PlaceAt(Pos(1.164, -0.14, -1.265), Rot(0, 277.794, 0), point)

actorA.Body("Penis size", 2.384186E-07, "Fluid speed", 0.09)
actorB.Body("Penis size", 2.384186E-07, "Breasts size", -0.5, "Ass size", -0.5, "Hips size", -0.09999999, "Thigh size", -0.09999999, "Calf size", -0.05, "Upper arms size", -0.05000001, "Forearms size", -0.05, "Muscle tone", 0.2, "Fluid speed", 0.09)
actorC.Body("Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.09999999, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorD.Body("Penis size", 2.384186E-07, "Breasts size", -0.5, "Ass size", -0.5, "Hips size", -0.1, "Thigh size", -0.09999999, "Calf size", -0.05, "Upper arms size", -0.05000001, "Forearms size", -0.05, "Muscle tone", 0.2, "Fluid speed", 0.09)
actorE.Body("Fluid speed", 0.09)
actorF.Body("Breasts size", -0.5, "Ass size", -0.5, "Hips size", -0.1, "Thigh size", -0.09999999, "Calf size", -0.05, "Upper arms size", -0.05000001, "Forearms size", -0.05000001, "Muscle tone", 0.2, "Fluid speed", 0.09)
actorG.Body("Penis size", 2.384186E-07, "Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.1, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorH.Body("Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.273, "Fluid speed", 0.09)
actorI.Body("Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.1, "Forearms size", -0.09999998, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorK.Body("Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.09999999, "Upper arms size", -0.1, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorL.Body("Fluid speed", 0.09)
actorM.Body("Penis size", 1.192093E-07, "Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.1, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorN.Body("Penis size", 2.384186E-07, "Ass size", -0.5, "Hips size", -0.1, "Thigh size", -0.1, "Calf size", -0.05, "Upper arms size", -0.05000001, "Forearms size", -0.05, "Muscle tone", 0.2, "Fluid speed", 0.09)
actorO.Body("Penis size", 2.384186E-07, "Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.1, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorP.Body("Fluid speed", 0.09)
actorQ.Body("Ass size", -0.5, "Hips size", -0.1, "Thigh size", -0.1, "Calf size", -0.05, "Upper arms size", -0.05000001, "Forearms size", -0.05000001, "Muscle tone", 0.2, "Fluid speed", 0.09)
actorT.Body("Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 0.09)

actorG.Customize("Arms", 2)
actorH.Customize("Gloves", 2, "Coat", 1)
actorK.Customize("Coat", 2)
actorL.Customize("Armour", 2)
actorM.Customize("Vest", 1)
actorN.Customize("Gloves", 1, "Armor", 1)
actorT.Customize("Jacket", 1)

PoseCam(Pos(-1.678, 1.886, -4.805), Pos(-0.547, 1.338, -3.027), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 0.975, 0.009)),
	HipsRot(20.3, 0, 3.775),
	Head(-0.002, 0.995, 0.102),
	HeadRot(350.913, 342.555, 357.322),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.11, -0.006, 0.027), 0, -1)),
	FootR(WSurface(TPos(0.196, -0.006, 0.032), 0, -1)),
	HandL(HPos(0.227, 0.131, 0.903), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.377, -0.92, -0.37), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(-0.551),
	ElbowR(),
	WristL(),
	WristR(),
	KneeL(),
	KneeR(),
	AnkleL(55),
	SpineRot(),
	Mouth(-0.46, 0.052, 0, 0, 0, 1, 1, 1, 1, 1, 1),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.066, 0.957, -0.01)),
	HipsRot(25.55, 12.75, 14.125),
	Head(0.057, 0.96, -0.275),
	HeadRot(354.094, 65.188, 347.196),
	EyeL(WorldPos(-0.936, 1.45, -0.545)),
	EyeR(WorldPos(-0.936, 1.45, -0.545)),
	FootL(WSurface(TPos(-0.11, -0.006, 0.027), 0, -1)),
	FootR(WSurface(TPos(0.196, -0.006, 0.032), 0, -1)),
	HandL(HPos(-0.919, 0.205, 0.467), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.696, -0.214, 0.589), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(),
	ElbowR(0.103),
	WristL(),
	WristR(-52.975, 0.308, 21.909),
	KneeL(),
	KneeR(),
	SpineRot(),
	Mouth(-0.289, -0.008, 0, 0, 0, -0.588, -0.588, 1, 1, 1, 1),
	Brows(),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(-1, -1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorC).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.001, 1.042, 0.04)),
	HipsRot(19.6, -39.075, -11.575),
	Head(0.026, 0.994, -0.106),
	HeadRot(351.581, 314.576, 0.578),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(0.043, -0.033, -0.02), 0.024, -1, 0.002)),
	FootR(WSurface(TPos(0.178, -0.029, 0.109), 0.024, -1, 0.002)),
	HandL(HPos(-0.6, 0.219, -0.195), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.09, 0.105, 0.642), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowR(-0.019),
	WristL(-60.234, 0, 81.743),
	WristR(-81.524, 0, 106.793),
	KneeL(-0.336),
	AnkleL(0, 0, -10),
	AnkleR(0, 0, -10),
	SpineRot(-64.35),
	Mouth(-0.195, 0.168, 0, 0.135, 0.473, 0, 0.004, 0.833, 1, 0.438, 0.781),
	Brows(1, 1, 1, 1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorD).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.004, 1.059, -0.015)),
	HipsRot(0.75, 0, -0.675),
	Head(-0.176, 0.935, -0.307),
	HeadRot(1.155, 5.198, 358.247),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.295, -0.002, 0.007), 0, -1)),
	FootR(WSurface(TPos(0.314, -0.002, 0.021), 0, -1)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Hips", 0.6, 0.9, 0.03), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.5, -0.87, 0.03), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(0.26),
	ElbowR(0.26),
	WristL(-25, 0, -65),
	WristR(-25, 0, -70),
	KneeL(),
	KneeR(),
	AnkleR(25.456),
	SpineRot(),
	Mouth(0, 0, 0, 0, 0, 0, 0, 1, 1, -0.024, -0.024),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks(-0.31, -0.31)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorE).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 0.966, 0.039)),
	HipsRot(12.475, -1.05, 11.5),
	Head(0, 0.998, -0.069),
	HeadRot(355.366, 9.112, 351.772),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(0.039, 0.02, 0.222), 0.007, -1, -0.023)),
	FootR(WSurface(TPos(-0.082, 0.019, 0.237), 0.007, -1, -0.023)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Hips", 0.267, -0.011, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Hand_L", 0.047, -0.642, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hand_L"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hand_L"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hand_L"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hand_L"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hand_L"),
	Mouth(0, -0.709, 0, 0.257, 0.257, 0, 0, 0.923, 0.923, 0.959, 0.959)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorF).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.001, 0.982, 0.073)),
	HipsRot(7.675, 0, -25),
	Head(0.003, 0.974, 0.225),
	HeadRot(348.979, 348.685, 336.459),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.106, -0.002, 0.081), -0.004, -1, 0.002)),
	FootR(WSurface(TPos(0.114, -0.003, -0.028), -0.004, -1, 0.002)),
	HandL(HPos(-0.47, 0.591, 0.182), Wrist(HPoint(0, 0, 0.3, 0, 0, 0, "Bone_Index3_L"), 70)),
	ThumbL(30, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	RingL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	PinkyL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.205, 0.677, 0.173), Wrist(HPoint(0, 0, 0.3, 0, 0, 0, "Bone_Index3_L"), 70)),
	ThumbR(30, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	RingR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	PinkyR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	ElbowR(-0.685),
	WristL(-32.729, 25, 46.302),
	WristR(36.996, 0, -0.444),
	KneeR(-0.367),
	Mouth(-0.356, 0.192, 0, 0.384, 0.384, -0.503, -0.503, 0.833, 0.833, 0.438, 0.438),
	Brows(1, 1, 1, 1),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(-1, -1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorG).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.005, 0.539, -0.24)),
	HipsRot(-27.925, 0, -7.55),
	Head(0, 0.89, 0.456),
	HeadRot(338.181, 329.226, 5.306),
	EyeL(WorldPos(1.507, 1.022, -1.467)),
	EyeR(WorldPos(1.507, 1.022, -1.467)),
	FootL(WSurface(TPos(0.131, -0.05, 0.346), 0.014, -1, -0.02)),
	FootR(WSurface(TPos(0.224, -0.094, 0.262), 0.014, -1, -0.02)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Thigh_L", 0.993, -0.467, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	HandR(HPos(-0.485, 0.771, 0.601), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(49.392, 28.96, 28.96, 0, 0, TargetActor.Null, "Null"),
	RingR(54.042, 41.047, 41.047, 0, 0, TargetActor.Null, "Null"),
	PinkyR(85, 71.613, 71.613, -20, 0, TargetActor.Null, "Null"),
	ElbowL(-0.531),
	ElbowR(-1),
	WristL(),
	WristR(),
	KneeL(-0.524),
	KneeR(-0.263),
	AnkleL(42.55),
	SpineRot(),
	Mouth(-0.631, 0.592, 0, 0.384, 0.384, 0, 0, 1, 1, 0.774, 0.774)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorH).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.015, 0.131, 0.047)),
	HipsRot(-0.175, 82.95, 25),
	Head(0.02, 0.1, 0.995),
	HeadRot(342.473, 133.673, 352.741),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WPos(-0.3, 0.011, -0.912)),
	FootR(WPos(-0.417, 0.028, -0.793)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Head", 1.118, -0.393, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	HandR(HPos(0.573, -0.672, -0.117), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(49.392, 28.96, 28.96, 0, 0, TargetActor.Null, "Null"),
	RingR(54.042, 41.047, 41.047, 0, 0, TargetActor.Null, "Null"),
	PinkyR(23.138, 23.371, 23.371, 0, 0, TargetActor.Null, "Null"),
	ElbowL(0.649),
	ElbowR(-0.106),
	WristL(71.308, 0, 112.063),
	WristR(-3.235, 0, 70.244),
	KneeL(0.073),
	KneeR(0.582),
	AnkleR(54.118, 0, -10),
	SpineRot(90),
	Mouth(-0.311, 0.659, 0, 0.384, 0.384, -0.563, -0.563, 0.833, 0.833, 0.438, 0.438)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorI).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.001, 0.866, 0.044)),
	HipsRot(10.225, 0, -9.575),
	Head(-0.403, 0.908, -0.118),
	HeadRot(336.807, 13.966, 328.387),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.106, -0.002, 0.081), -0.004, -1, 0.002)),
	FootR(WSurface(TPos(0.114, -0.003, -0.028), -0.004, -1, 0.002)),
	HandL(HPos(-0.279, 0.794, -0.53), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(51.748, 24.915, 24.915, 0, 0, TargetActor.Null, "Null"),
	MidL(29.71, 65.441, 65.441, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 0, 0, -16.946, 0, TargetActor.Null, "Null"),
	PinkyL(-21.767, 0, 0, -20, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.661, 0.8, 0.661), Wrist(HPoint(0, -0.1, 0.15, 0, 0, 0, "Bone_Mid_L"), 15)),
	ThumbR(28.924, 95, 95, 14.71, 0, TargetActor.Null, "Null"),
	IndexR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	Mouth(-0.849, 0.007, 0, 0.384, 0.384, -1, -1, 0.833, 0.833, 0.438, 0.438),
	Brows(1, 1, 1, 1),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(-1, -1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorK).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 1.111, 0.149)),
	HipsRot(8.875, 0, -5.45),
	Head(0, 0.969, -0.249),
	HeadRot(330.899, 356.121, 351.522),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.106, -0.002, 0.081), -0.004, -1, 0.002)),
	FootR(WSurface(TPos(0.114, -0.003, -0.028), -0.004, -1, 0.002)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Head", 1.335, -0.217, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Head", 1.754, 0.133), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	ElbowL(0.325),
	ElbowR(0.337),
	WristR(-28.034, 0, 55.982),
	Mouth(-0.659, 0.323, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438),
	Brows(1, 1),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(-1, -1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorL).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 0.953, 0.053)),
	HipsRot(8.8, 0, 24.025),
	Head(0, 0.997, -0.071),
	HeadRot(337.589, 31.685, 357.465),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.149, 0.026, 0.074), 0.001, -1, -0.024)),
	FootR(WSurface(TPos(0.586, 0.023, 0.234), 0.001, -1, -0.024)),
	HandL(HPos(-0.087, 0.558, 0.02), Wrist(HPoint(0, -0.1, 0.15, 0, 0, 0, "Bone_Mid_L"), 15)),
	ThumbL(28.924, 95, 95, 14.71, 0, TargetActor.Null, "Null"),
	IndexL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.968, 0.648, 0.141), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(-0.235),
	ElbowR(0.769),
	WristL(46.627, 0, 51.34),
	WristR(9.068, 0, 23.033),
	KneeL(-0.408),
	AnkleR(0, 0, 40),
	Mouth(-0.233, 1, 0, 0.384, 0.384, -0.302, -0.302, 0.833, 0.833, 0.438, 0.438),
	Brows(0.283, 0.283, 1, 1),
	Cheeks(-0.989, -0.989)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorM).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 0.976, 0.045)),
	HipsRot(3.4, -43.425, -5.3),
	Head(-0.001, 0.997, -0.069),
	HeadRot(345.368, 306.502, 20.873),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.106, -0.002, 0.081), -0.004, -1, 0.002)),
	FootR(WSurface(TPos(0.114, -0.003, -0.028), -0.004, -1, 0.002)),
	HandL(HPos(-0.363, -0.77, 0.063), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(-8.287, 31.748, 31.748, 0, 0, TargetActor.Null, "Null"),
	IndexL(67.943, 59.474, 59.474, 0, 0, TargetActor.Null, "Null"),
	MidL(61.08, 91.601, 91.601, 0, 0, TargetActor.Null, "Null"),
	RingL(69.841, 21.615, 21.615, 0, 0, TargetActor.Null, "Null"),
	PinkyL(56.382, 42.302, 42.302, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.336, -1.042, -0.015), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(62.833, 60.498, 60.498, 0, 0, TargetActor.Null, "Null"),
	IndexR(29.69, 31.941, 31.941, 0, 0, TargetActor.Null, "Null"),
	MidR(36.66, 6.542, 6.542, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	SpineRot(-76.2),
	Mouth(-0.3, -0.236, 0, 0.384, 0.384, 0, 0, 1, 1, 1, 1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorN).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.092, 1.243, 0.044)),
	HipsRot(2.575, 0, -15.8),
	Head(0.411, 0.912, 0.004),
	HeadRot(2.433, 17.282, 353.133),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.106, -0.002, 0.081), -0.004, -1, 0.002)),
	FootR(WSurface(TPos(0.378, 0.159, 0.251), -0.024, -1, 0.001)),
	HandL(HPos(0.061, -0.523, 0.591), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.595, 0.292, 1.098), Wrist(HPoint(0, 0, 0.3, 0, 0, 0, "Bone_Index3_L"), 70)),
	ThumbR(30, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	RingR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	PinkyR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	WristL(),
	WristR(-27.009, 0, 36.467),
	AnkleR(0, 0, 40),
	SpineRot(60.525),
	Mouth(-0.327, 1, 0, 0.384, 0.384, -0.998, -0.998, 1, 1, 0.647, 0.647)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorO, actorN).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 1.032, 0.031)),
	HipsRot(3.4, 0, -5.3),
	Head(0, 0.861, 0.508),
	HeadRot(352.647, 342.597, 2.483),
	EyeL(BoneMesh(TargetActor.A, "Bone_Head", 0.149, -0.135)),
	EyeR(BoneMesh(TargetActor.A, "Bone_Head", 0.149, -0.135)),
	FootL(WSurface(TPos(-0.106, -0.002, 0.081), -0.004, -1, 0.002)),
	FootR(WSurface(TPos(0.306, 0.004, 0.026), 0.021, -1, -0.013)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Chest", 0.7, -0.092), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	HandR(BoneMesh(TargetActor.A, "Bone_Forearm_L", 0.475, -0.388), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	Mouth(-0.183, -0.544, 0, 0.384, 0.384, -1, -1, 1, 1, 0.874, 0.874),
	Brows(0.887, 0.887, 1, 1),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(-0.83, -0.83)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorP).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.057, 1.208, 0.016)),
	HipsRot(5.275, 0.45, -6.5),
	Head(-0.508, 0.82, 0.266),
	HeadRot(10.523, 21.935, 2.989),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(0.128, 0.063, -0.036), 0, -1, -0.024)),
	FootR(WPos(0.501, 0.089, -0.208)),
	HandL(HPos(-0.283, -0.906, 0.096), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.336, -1.042, -0.015), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	AnkleL(7.511, 0, 39.532),
	Mouth(0, 0, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorQ).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 1.061, 0.067)),
	HipsRot(25.9, 0, 0.625),
	Head(-0.002, 0.805, -0.593),
	HeadRot(347.924, 337.041, 13.712),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.361, 0.099, 0.121), -0.017, -1, 0.017)),
	FootR(WSurface(TPos(0.107, 0.085, -0.273), -0.017, -1, 0.017)),
	HandL(HPos(-0.003, 0.985, 0.201), Wrist(HPoint(0, -0.1, 0.15, 0, 0, 0, "Bone_Mid_L"), 15)),
	ThumbL(28.924, 95, 95, 14.71, 0, TargetActor.Null, "Null"),
	IndexL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.282, 0.831, 0.519), Wrist(HPoint(0, -0.1, 0.15, 0, 0, 0, "Bone_Mid_L"), 15)),
	ThumbR(28.924, 95, 95, 14.71, 0, TargetActor.Null, "Null"),
	IndexR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	ElbowL(0.531),
	AnkleR(20.395),
	SpineRot(-2.025),
	Mouth(0, 0, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorT).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.003, 0.939, 0.018)),
	HipsRot(3.325, 0, -10.525),
	Head(0.257, 0.966, -0.009),
	HeadRot(359.861, 320.277, 0.723),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.106, -0.002, 0.081), -0.004, -1, 0.002)),
	FootR(WSurface(TPos(0.114, -0.003, -0.028), -0.004, -1, 0.002)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Hips", 0.076, 0.466), Wrist(HPoint(0, -0.1, 0.15, 0, 0, 0, "Bone_Mid_L"), 15)),
	ThumbL(28.924, 95, 95, 14.71, 0, TargetActor.Null, "Null"),
	IndexL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.533, 0.855, 0.079), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	WristR(27.005, 0, 16.842),
	Mouth(-0.479, 1, 0, 0.384, 0.384, -1, -1, 0.833, 0.833, 0.438, 0.438),
	Brows(1, 1),
	EyelidL(-0.35),
	EyelidR(-0.35)
)
end