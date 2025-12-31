function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "jill valentine")
actorB = Human(actorB, "leon s kennedy")

local point = MapPoint("map_store", Pos(-2.297, 0.002, -7.086), Rot(0, 0, 0), overridePos, overrideRot, function()
	Skybox("tm_seaside_sunset", -0.7199998, 0.006975001).Light("LightFan", 0, 0, 5E-06).Light("FX_TX_E15A_GSbrodyscreen_Emissive", 0, 0, 9E-08).Light("LightMachineCatching01", 0, 0, 5E-07).Light("TX_Acc_ExitLighting01_Emissive", 0.005999977, 1, 5.592501).Light("TX_Light_CeilingNeon01_Emissive_01", 0, 0, 2E-06).Light("TX_Light_CeilingNeon01_Emissive_02", 0, 0, 2E-06).Light("TX_Light_CeilingNeon01_Emissive", 0, 0, 3E-06).Light("TX_Light_CeilingNeon01_OFF", -0.05849999, -1, 0.295).Light("TX_Light_CeilingNeon01_Mid", 0, 0, 4E-06).Light("LampDesk", 0.05, 0.15, 2E-06).Light("TX_Light_PubSign01_Emissive", 0.008, -0.1, 3E-07).Light("FX_TX_E1_1A_ScreenSaver_Bckground_Emissive", 0, 0, 2E-07).Light("TX_Tech_VendingSoda01_Emissive", 0.6, 0.09, 5E-07)
end)
actorA.PlaceAt(Pos(0.172, 0.001, 0.329), Rot(0, 211.55, 0), point)
actorB.PlaceAt(Pos(-0.172, -0.002, -0.328), Rot(0, 355.176, 0), point)

actorA.Body("Breasts size", -1, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Nipples size", -5, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorB.Body("Fluid speed", 0.09)

actorA.Customize("Gloves", 1, "ElbowPad", 1, "Holster", 1, "Belts", 1, "Boots", 1, "Jeans", 2, "Shirt", 2)
actorB.Customize("CottnBelt", 2, "Pants", 1, "Jacket", 2, "Gloves", 1)

PoseCam(Pos(-2.38, 0.393, 0.987), Pos(0.104, 0.594, -0.248), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.001, 0.405, 0.259)),
	HipsRot(31.85, 0, 0.55),
	Head(0, 0.953, 0.304),
	HeadRot(0.771, 22.217, 334.317),
	EyeL(BoneMesh(TargetActor.A, "Bone_Penis", 0.05, -0.935)),
	EyeR(BoneMesh(TargetActor.A, "Bone_Penis", 0.05, -0.935)),
	FootL(WSurface(TPos(-0.127, -0.034, -0.115), 0, -1)),
	FootR(WSurface(TPos(0.124, -0.064, -0.102), 0, -1)),
	HandL(HPos(0.074, 0.401, 0.291), Wrist(HPoint(0, 0, 0.3, 0, 0, 0, "Bone_Index3_L"), 70)),
	ThumbL(30, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	RingL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	PinkyL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Chest", -0.168, 0.197), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	ElbowL(0.26),
	ElbowR(-0.149),
	KneeL(-0.199),
	KneeR(-0.195),
	AnkleL(-2.313),
	SpineRot(42.45),
	Mouth(-0.145, 0, 0, 0.314, 0.294, 0.162, 0.173, 0.265, 0.265, 0.271, 0.271, 0.112),
	Brows(-0.128, -0.021, 0.165, 0.058),
	EyelidL(),
	EyelidR(),
	Cheeks(-0.628, -0.628)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.Null, "", TargetActor.A, "Hand_L", 0.364, 1.596, 0.992, 0, false, 1, 0.3, 1, 0.2, true, 0.31, 0.907, 0.101, 1.2, 1.928),
	Hips(WPos(0.003, 0.656, -0.298)),
	HipsRot(-24.7, 0, 3.65),
	Head(0.012, 0.842, -0.539),
	HeadRot(2.004, 5.056, 14.138),
	EyeL(BoneMesh(TargetActor.A, "Bone_Head", 1.605, -0.193)),
	EyeR(BoneMesh(TargetActor.A, "Bone_Head", 1.605, -0.193)),
	FootL(WSurface(TPos(-0.392, 0, 0.425), 0, -1)),
	FootR(WSurface(TPos(0.338, 0, 0.506), 0, -1)),
	HandL(WSurface(WPos(-0.284, 0.464, -0.23), 0.051, -0.985, 0.165), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	HandR(WSurface(WPos(0.503, 0.8, -0.09), -0.009, -1, -0.013), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(),
	ElbowR(0.524),
	WristL(),
	WristR(),
	KneeL(),
	KneeR(-0.69),
	SpineRot(3.6),
	Mouth(-0.045, 0, 0, 0.012, 0.061, -0.246, -0.25, 0.034, 0.034, 0.02, 0.02, 0.147),
	Brows(-0.029, 0.029, 0.267, 0.208),
	EyelidL(-0.125),
	EyelidR(-0.125),
	Cheeks(-1, -1)
)
end