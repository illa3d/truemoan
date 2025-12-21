function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "lunafreya", "primrose office")
actorB = Human(actorB, "black male", "leon s kennedy")

local point = MapPoint("map_store", Pos(-2.482, 0.002, 6.762), Rot(0, 0, 0), overridePos, overrideRot, function()
	Skybox("illa_arizona", 0, 0).Light("LightFan", 0, 0, 5E-06).Light("FX_TX_E15A_GSbrodyscreen_Emissive", 0, 0, 9E-08).Light("LightMachineCatching01", 0, 0, 5E-07).Light("LightLamp01", 0.07549974, 0.9474996, 2.1385).Light("LampDesk", 0.05, 0.15, 2E-06).Light("FX_TX_E1_1A_ScreenSaver_Bckground_Emissive", 0, 0, 2E-07).Light("TX_Tech_VendingSoda01_Emissive", 0.6, 0.09, 5E-07)
	actorA.Material("Lunafreya_Torso", 0.997, -0.255, 0, 0).Material("Lunafreya_Torso_Nipples", 0.9385002, -0.5624998, 0, 0).Material("Body", 0.997, -0.255, 0, 0).Material("Head", 0.997, -0.255, 0, 0).Material("HairTied1", 0.8664997, -0.6599994, 0, 0).Material("Lingerie", 0.7315001, 0.0674997, -0.5087482, -1).Material("OfficeLady_Shirt", 0.1800001, -0.9525008, 0, 0)
	actorB.Material("ShirtsPart", 0, 0, -0.465, -0.0075)
end)
actorA.PlaceAt(Pos(-0.069, 0.002, -0.344), Rot(0, 28.477, 0), point)
actorB.PlaceAt(Pos(0.07, -0.002, 0.344), Rot(0, 176.077, 0), point)

actorA.Body("Body size", -0.07896727, "Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.09999999, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Fluid speed", 0.09)
actorB.Body("Penis size", -0.1807473, "Penis length", -0.03117466, "Fluid speed", 0.09)

actorA.Customize("Panties", 1, "Vest", 3, "Tie", 1)
actorB.Customize("Pants", 1, "Jacket", 1)

PoseCam(Pos(3.869, 1.213, 0.792), Pos(0.247, 0.841, 0.195), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.001, 0.395, 0.16)),
	HipsRot(22.175, 0, 3.85),
	Head(-0.008, 0.944, 0.33),
	HeadRot(352.484, 354.454, 8.304),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.099, -0.015, -0.069), 0.024, -1, 0.001)),
	FootR(WSurface(TPos(0.124, -0.064, -0.102), 0, -1)),
	HandL(HPos(-0.061, 0.443, 0.024), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.A, "Bone_Thigh_L", 0.928, 0.067, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	ElbowL(0.729),
	ElbowR(),
	WristL(),
	WristR(),
	KneeL(0.061),
	KneeR(0.115),
	AnkleL(40.599, 0, -10),
	AnkleR(41.916, 0, 40),
	SpineRot(),
	Mouth(-0.036, -0.598, 0, -0.211, -0.211, 0.302, 0.302, -0.356, -0.356, -1, -1, -1, 1),
	Brows(1, 1, 0.072, 0.072),
	EyelidL(),
	EyelidR(),
	Cheeks(-1, -1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Mouth", TargetActor.A, "Hand_L", 0.546, 16.902, 0.823, 0, true, 0, 0.3, 0.639, 0.2, true, 0.344, 0.699, 0.158, 1.251, 1.3),
	Hips(WPos(0, 0.971, 0.082)),
	HipsRot(1.75),
	Head(0, 0.999, 0.039),
	HeadRot(30.28, 1.281, 10.755),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.366, 0, 0.037), 0, -1)),
	FootR(WSurface(TPos(0.173, 0, 0.03), 0, -1)),
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
	ElbowL(-0.585),
	KneeL(-0.43),
	KneeR(-0.178),
	SpineRot(-15.3),
	Mouth(0, 0, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438)
)
end