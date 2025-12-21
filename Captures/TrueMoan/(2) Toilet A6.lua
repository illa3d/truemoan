function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "lunafreya", "primrose office")
actorB = Human(actorB, "black male", "leon s kennedy")

local point = MapPoint("map_store", Pos(-2.41, 0.091, 6.651), Rot(0, 0, 0), overridePos, overrideRot, function()
	Skybox("illa_arizona", 0, 0).Light("LightFan", 0, 0, 5E-06).Light("FX_TX_E15A_GSbrodyscreen_Emissive", 0, 0, 9E-08).Light("LightMachineCatching01", 0, 0, 5E-07).Light("LightLamp01", 0.07549974, 0.9474996, 2.1385).Light("LampDesk", 0.05, 0.15, 2E-06).Light("FX_TX_E1_1A_ScreenSaver_Bckground_Emissive", 0, 0, 2E-07).Light("TX_Tech_VendingSoda01_Emissive", 0.6, 0.09, 5E-07)
	actorA.Material("Lunafreya_Torso", 0.997, -0.255, 0, 0).Material("Lunafreya_Torso_Nipples", 0.9385002, -0.5624998, 0, 0).Material("Body", 0.997, -0.255, 0, 0).Material("Head", 0.997, -0.255, 0, 0).Material("HairTied1", 0.8664997, -0.6599994, 0, 0).Material("Lingerie", 0.7315001, 0.0674997, -0.5087482, -1).Material("OfficeLady_Shirt", 0.1800001, -0.9525008, 0, 0)
	actorB.Material("ShirtsPart", 0, 0, -0.465, -0.0075)
end)
actorA.PlaceAt(Pos(-0.041, 0.177, -0.417), Rot(0, 17.152, 0), point)
actorB.PlaceAt(Pos(0.042, -0.178, 0.418), Rot(0, 184.778, 0), point)

actorA.Body("Body size", -0.07896727, "Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.09999999, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Fluid speed", 0.09)
actorB.Body("Penis size", 0.1183981, "Penis length", -0.08352512, "Nipples size", 0.3180024, "Fluid speed", 0.09, "Fluid amount", 1.136753)

actorA.Customize("Panties", 1, "Garter", 1, "Vest", 6, "Tie", 1, "Skirt", 1, "Heels", 2)
actorB.Customize("Boots", 1, "CottnBelt", 1, "Pants", 1, "Jacket", 1)

PoseCam(Pos(2.555, 1.118, 0.658), Pos(-0.006, 0.886, -0.243), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.003, 0.819, 0.042)),
	HipsRot(-20.45, 5.175, 14.35),
	Head(-0.02, 0.923, -0.385),
	HeadRot(2.148, 18.076, 357.8),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-1.048, 0.794, 0.176), -0.982, -0.066, -0.177)),
	FootR(WSurface(TPos(0.236, 0.437, 0.192), 0.039, -0.999, -0.007)),
	HandL(HPos(-0.283, -0.906, 0.096), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(WSurface(WPos(0.183, 1.231, -0.124), 0.295, 0, -0.956), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(-0.385),
	ElbowR(0.148),
	WristL(),
	WristR(-17.528, 0, -31.861),
	KneeL(),
	KneeR(-0.662),
	AnkleL(14.175, 0, 8.866),
	AnkleR(8.579, 0, 40),
	SpineRot(5.1),
	Mouth(-0.563, -0.561),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Vagina", TargetActor.Null, "", 0, 0, 0, 0, true, 0.521, 0.507, 1.254, 0.788, false, 0.25, 0.65, 1.25, 1.252, 1.2),
	Hips(WPos(0.002, 1.028, 0.448)),
	HipsRot(-24.425, 0, 2.2),
	Head(-0.004, 0.988, -0.157),
	HeadRot(30.28, 1.281, 10.755),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.143, 0.1, 0.619), 0, -1)),
	FootR(WSurface(TPos(0.113, 0.1, 0.628), 0, -1)),
	HandL(BoneMesh(TargetActor.A, "Bone_Hips", 0.024, -0.471, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	HandR(HPos(0.336, -1.042, -0.015), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(0.226),
	KneeL(-0.074),
	KneeR(-0.26),
	AnkleL(-26.144),
	AnkleR(21.224, 0, 40),
	SpineRot(-57.225),
	Mouth(0, 0, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438)
)
end