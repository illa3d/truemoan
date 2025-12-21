function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "lunafreya", "primrose office")
actorB = Human(actorB, "black male", "leon s kennedy")

local point = MapPoint("map_store", Pos(-2.515, -0.036, 6.861), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(3.545, 1.05).Skybox("illa_arizona", 0, 0).Light("LightFan", 0, 0, 5E-06).Light("FX_TX_E15A_GSbrodyscreen_Emissive", 0, 0, 9E-08).Light("LightMachineCatching01", 0, 0, 5E-07).Light("LightLamp01", 0.07549974, 0.9474996, 2.1385).Light("LampDesk", 0.05, 0.15, 2E-06).Light("FX_TX_E1_1A_ScreenSaver_Bckground_Emissive", 0, 0, 2E-07).Light("TX_Tech_VendingSoda01_Emissive", 0.6, 0.09, 5E-07)
	actorA.Material("Lunafreya_Torso", 0, -0.2175, 0, 0).Material("Lunafreya_Torso_Nipples", 0.9385002, -0.5624998, 0, 0).Material("Body", 0, -0.2175, 0, 0).Material("Head", 0, -0.2175, 0, 0).Material("HairTied1", 0.8664997, -0.6599994, 0, 0).Material("Lingerie", 0.7315001, 0.0674997, -0.5087482, -1).Material("OfficeLady_Shirt", 0.1800001, -0.9525008, 0, 0)
	actorB.Material("ShirtsPart", 0, 0, -0.465, -0.0075)
end)
actorA.PlaceAt(Pos(0.031, -0.018, 0.03), Rot(0, 72.052, 0), point)
actorB.PlaceAt(Pos(-0.031, 0.019, -0.029), Rot(0, 64.852, 0), point)

actorA.Body("Body size", -0.07896727, "Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.09999999, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Fluid speed", 0.09)
actorB.Body("Penis size", 0.1944304, "Penis length", -0.1795014, "Fluid speed", 0.09)

actorA.Customize("Panties", 1, "Garter", 1, "Vest", 6, "Tie", 1, "Skirt", 1, "Heels", 2)
actorB.Customize("CottnBelt", 1, "Pants", 1, "Jacket", 1)

PoseCam(Pos(3.917, 1.387, 0.693), Pos(0.026, 0.765, 0.007), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.021, 0.863, -0.105)),
	HipsRot(1.775, 18.375, 13.45),
	Head(0.09, 0.956, -0.28),
	HeadRot(0.831, 17.89, -0.001),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WPos(-0.411, 1.043, 0.437)),
	FootR(WSurface(TPos(0.764, 0.856, 0.044), 0.046, -0.999, -0.001)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Calf_L", -0.42, 0.322), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	HandR(BoneMesh(TargetActor.A, "Bone_Forearm_R", 0.607, -0.121), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_R"),
	ElbowL(),
	ElbowR(0.313),
	WristL(-18.201, 0, -1.108),
	WristR(),
	KneeL(-0.199),
	KneeR(),
	AnkleL(27.131, 0, 8.866),
	AnkleR(32.586, 0, 40),
	SpineRot(-8.1),
	Mouth(),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Anus", TargetActor.Null, "", 0, 0, 0, 0, true, 0.42, 0.1, 1.056, 0.5, false, 0.25, 0.65, 1.25, 1.251, 1.2),
	Hips(WPos(0.001, 0.635, -0.237)),
	HipsRot(-34.7, 0, -12.65),
	Head(-0.003, 0.958, -0.288),
	HeadRot(8.045, 329.742, 354.66),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.251, 0.021, 0.178), 0, -1, 0)),
	FootR(WSurface(TPos(0.37, 0.021, 0.012), 0, -1, 0)),
	HandL(BoneMesh(TargetActor.A, "Bone_Thigh_L", 0.489, 0.899), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	HandR(BoneMesh(TargetActor.A, "Bone_Chest", -0.487, 0.333), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	ElbowL(-0.585),
	KneeL(-0.074),
	KneeR(0.13),
	AnkleL(-7.1),
	AnkleR(22.226, 0, 40),
	SpineRot(),
	Mouth(0, 0, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438)
)
end