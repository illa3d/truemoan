function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "lunafreya", "primrose office")
actorB = Human(actorB, "black male", "leon s kennedy")

local point = MapPoint("map_store", Pos(-2.447, 0.002, 6.85), Rot(0, 0, 0), overridePos, overrideRot, function()
	Skybox("nightsky", 0, 0).Light("LightFan", 0, 0, 5E-06).Light("FX_TX_E15A_GSbrodyscreen_Emissive", 0, 0, 9E-08).Light("LightMachineCatching01", 0, 0, 5E-07).Light("LightLamp01", 0.07549974, 0.9474996, 2.1385).Light("LampDesk", 0.05, 0.15, 2E-06).Light("FX_TX_E1_1A_ScreenSaver_Bckground_Emissive", 0, 0, 2E-07).Light("TX_Tech_VendingSoda01_Emissive", 0.6, 0.09, 5E-07)
	actorA.Material("Lunafreya_Torso", 0.997, -0.255, 0, 0).Material("Lunafreya_Torso_Nipples", 0.9385002, -0.5624998, 0, 0).Material("Body", 0.997, -0.255, 0, 0).Material("Head", 0.997, -0.255, 0, 0).Material("HairTied1", 0.8664997, -0.6599994, 0, 0).Material("Lingerie", 0.7315001, 0.0674997, -0.5087482, -1).Material("OfficeLady_Shirt", 0.1800001, -0.9525008, 0, 0)
	actorB.Material("ShirtsPart", 0, 0, -0.465, -0.0075)
end)
actorA.PlaceAt(Pos(-0.033, 0.001, -0.256), Rot(0, 180.501, 0), point)
actorB.PlaceAt(Pos(0.033, -0.002, 0.256), Rot(0, 176.077, 0), point)

actorA.Body("Body size", -0.07896727, "Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.09999999, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Fluid speed", 0.09)
actorB.Body("Penis size", 0.1944304, "Penis length", -0.1795014, "Fluid speed", 0.09)

actorA.Customize("Panties", 1, "Vest", 3, "Tie", 1, "Skirt", 1)
actorB.Customize("Pants", 1, "Jacket", 1)

PoseCam(Pos(3.507, 1.393, 0.639), Pos(0.135, 0.809, -0.058), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 0.88, -0.055)),
	HipsRot(31.7, 3.45, -25),
	Head(0.002, 0.81, 0.586),
	HeadRot(357.531, 295.519, 9.721),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.248, -0.003, -0.055), 0, -1)),
	FootR(WSurface(TPos(0.014, -0.003, -0.226), 0, -1)),
	HandL(BoneMesh(TargetActor.A, "Bone_Forearm_L", 0.94, -0.266, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	HandR(WSurface(WPos(-0.055, 1.016, 0.427), -0.003, -0.924, 0.383), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(74.787, 84.784, 84.784, 0, 0, TargetActor.Null, "Null"),
	MidR(85, 83.037, 83.037, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(),
	ElbowR(),
	WristL(0.973, 0, 1.567),
	WristR(26.78, -35.843, -102.949),
	KneeL(0.766),
	KneeR(0.622),
	AnkleL(40.599, 0, -10),
	AnkleR(41.916, 0, 40),
	SpineRot(-50.925),
	Mouth(),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Anus", TargetActor.Null, "", 0, 0, 0, 0, true, 0.575, 0.1, 1.012, 0.451, false, 0.25, 0.65, 1.25, 1.074, 1.2),
	Hips(WPos(0, 0.989, 0.081)),
	HipsRot(1.75),
	Head(0, 0.999, 0.042),
	HeadRot(30.28, 1.281, 10.755),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.366, 0, 0.037), 0, -1)),
	FootR(WSurface(TPos(0.173, 0, 0.03), 0, -1)),
	HandL(BoneMesh(TargetActor.A, "Bone_Hips", 0.552, 0.624, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	HandR(BoneMesh(TargetActor.A, "Bone_Hips", 0.012, -0.639, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	ElbowL(-0.585),
	KneeL(-0.43),
	KneeR(-0.178),
	SpineRot(-15.3),
	Mouth(0, 0, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438)
)
end