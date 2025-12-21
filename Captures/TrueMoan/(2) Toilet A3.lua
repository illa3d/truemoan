function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "lunafreya", "primrose office")
actorB = Human(actorB, "black male", "leon s kennedy")

local point = MapPoint("map_store", Pos(-2.436, -0.056, 6.841), Rot(0, 0, 0), overridePos, overrideRot, function()
	Skybox("illa_arizona", 0, 0).Light("LightFan", 0, 0, 5E-06).Light("FX_TX_E15A_GSbrodyscreen_Emissive", 0, 0, 9E-08).Light("LightMachineCatching01", 0, 0, 5E-07).Light("LightLamp01", 0.07549974, 0.9474996, 2.1385).Light("LampDesk", 0.05, 0.15, 2E-06).Light("FX_TX_E1_1A_ScreenSaver_Bckground_Emissive", 0, 0, 2E-07).Light("TX_Tech_VendingSoda01_Emissive", 0.6, 0.09, 5E-07)
	actorA.Material("Lunafreya_Torso", 0.997, -0.255, 0, 0).Material("Lunafreya_Torso_Nipples", 0.9385002, -0.5624998, 0, 0).Material("Body", 0.997, -0.255, 0, 0).Material("Head", 0.997, -0.255, 0, 0).Material("HairTied1", 0.8664997, -0.6599994, 0, 0).Material("Lingerie", 0.7315001, 0.0674997, -0.5087482, -1).Material("OfficeLady_Shirt", 0.1800001, -0.9525008, 0, 0)
	actorB.Material("ShirtsPart", 0, 0, -0.465, -0.0075)
end)
actorA.PlaceAt(Pos(-0.069, 0.001, -0.267), Rot(0, 173.526, 0), point)
actorB.PlaceAt(Pos(0.07, -0.002, 0.266), Rot(0, 193.927, 0), point)

actorA.Body("Body size", -0.07896727, "Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.09999999, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Fluid speed", 0.09)
actorB.Body("Penis size", 0.1944304, "Penis length", -0.1795014, "Fluid speed", 0.09)

actorA.Customize("Panties", 1, "Vest", 5, "Tie", 1, "Skirt", 1)
actorB.Customize("Pants", 1, "Jacket", 1)

PoseCam(Pos(2.112, 1.33, 0.228), Pos(0.134, 0.919, -0.295), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 0.928, 0.077)),
	HipsRot(13.7, 0.45, -25),
	Head(0.006, 0.545, 0.838),
	HeadRot(341.953, 300.154, 349.473),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WPos(-0.537, 0.644, 0.017)),
	FootR(WSurface(TPos(0.041, 0.072, -0.051), 0, -1)),
	HandL(WSurface(WPos(-0.275, 1.24, 0.568), 0.113, 0, 0.994), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	HandR(WSurface(WPos(0.295, 1.363, 0.514), 0.113, 0, 0.994), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(),
	ElbowR(),
	WristL(0.973, 0, 1.567),
	WristR(26.78, -35.843, -102.949),
	KneeL(-0.006),
	KneeR(0.622),
	AnkleL(55, 0, 8.866),
	AnkleR(41.916, 0, 40),
	SpineRot(8.925),
	Mouth(),
	Brows(0, 0, 0.376, 0.376),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Anus", TargetActor.Null, "", 0, 0, 0, 0, true, 0.852, 0.3, 0.9, 0.38, false, 0.25, 0.65, 1.25, 1.251, 1.2),
	Hips(WPos(0, 1.122, 0.214)),
	HipsRot(1.75),
	Head(-0.001, 0.962, 0.274),
	HeadRot(30.28, 1.281, 10.755),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.103, 0, 0.23), 0, -1)),
	FootR(WSurface(TPos(0.214, 0.067, 0.288), 0, -1)),
	HandL(BoneMesh(TargetActor.A, "Bone_Head", 1.818, -0.347, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Head"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Head"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Head"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Head"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Head"),
	HandR(BoneMesh(TargetActor.A, "Bone_Hips", 0.032, -0.529, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	ElbowL(-0.585),
	KneeL(-0.074),
	KneeR(0.13),
	AnkleL(19.201),
	AnkleR(26.887),
	SpineRot(-15.3),
	Mouth(0, 0, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438)
)
end