function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "jill valentine")
actorB = Human(actorB, "leon s kennedy")

local point = MapPoint("map_store", Pos(-2.292, 0.002, -7.088), Rot(0, 0, 0), overridePos, overrideRot, function()
	Skybox("tm_seaside_sunset", -0.7199998, 0.006975001).Light("LightFan", 0, 0, 5E-06).Light("FX_TX_E15A_GSbrodyscreen_Emissive", 0, 0, 9E-08).Light("LightMachineCatching01", 0, 0, 5E-07).Light("TX_Acc_ExitLighting01_Emissive", 0.005999977, 1, 5.592501).Light("TX_Light_CeilingNeon01_Emissive_01", 0, 0, 2E-06).Light("TX_Light_CeilingNeon01_Emissive_02", 0, 0, 2E-06).Light("TX_Light_CeilingNeon01_Emissive", 0, 0, 3E-06).Light("TX_Light_CeilingNeon01_OFF", -0.05849999, -1, 0.295).Light("TX_Light_CeilingNeon01_Mid", 0, 0, 4E-06).Light("LampDesk", 0.05, 0.15, 2E-06).Light("TX_Light_PubSign01_Emissive", 0.008, -0.1, 3E-07).Light("FX_TX_E1_1A_ScreenSaver_Bckground_Emissive", 0, 0, 2E-07).Light("TX_Tech_VendingSoda01_Emissive", 0.6, 0.09, 5E-07)
end)
actorA.PlaceAt(Pos(0.176, 0.001, 0.326), Rot(0, 213.726, 0), point)
actorB.PlaceAt(Pos(-0.176, -0.002, -0.326), Rot(0, 355.176, 0), point)

actorA.Body("Breasts size", -1, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Nipples size", -5, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorB.Body("Fluid speed", 0.09)

actorA.Customize("Gloves", 1, "ElbowPad", 1, "Holster", 1, "Belts", 1, "Boots", 1, "Jeans", 2, "Shirt", 2)
actorB.Customize("CottnBelt", 2, "Pants", 1, "Jacket", 2, "Gloves", 1)

PoseCam(Pos(-1.044, 0.87, -0.738), Pos(-0.155, 0.665, -0.371), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.013, 0.389, 0.224)),
	HipsRot(7.55, 4.425, 4.3),
	Head(-0.036, 0.628, 0.778),
	HeadRot(341.652, 342.963, 0.09),
	EyeL(BoneMesh(TargetActor.A, "Bone_Head", 1.307, -0.091)),
	EyeR(BoneMesh(TargetActor.A, "Bone_Head", 1.307, -0.091)),
	FootL(WSurface(TPos(-0.3, -0.004, -0.207), 0, -1)),
	FootR(WSurface(TPos(0.22, -0.004, 0.527), 0, -1)),
	HandL(HPos(0.074, 0.401, 0.291), Wrist(HPoint(0, 0, 0.3, 0, 0, 0, "Bone_Index3_L"), 70)),
	ThumbL(30, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	RingL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	PinkyL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.A, "Bone_Thigh_L", 0.271, 0.366), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	ElbowL(0.391),
	ElbowR(0.255),
	WristR(-7.924, 0, 93.156),
	KneeL(-0.124),
	KneeR(-0.541),
	AnkleL(-2.313),
	AnkleR(-5.202, 0, 11.454),
	SpineRot(-2.925),
	Mouth(-0.469, 0, 0, 0.184, 0.146, 0.188, 0.217, -0.065, -0.065, -0.039, -0.039, 0.045),
	Brows(-0.042, 0.042, 0.042, -0.042),
	EyelidL(),
	EyelidR(),
	Cheeks(-0.466, -0.466)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.Null, "", TargetActor.A, "Hand_L", 0.364, 1.596, 0.992, 0, false, 0.13, 0.365, 0.926, 0.473, true, 0.049, 0.794, 0.348, 1.292, 2.129),
	Hips(WPos(0.003, 0.639, -0.289)),
	HipsRot(-24.7, 0, 3.65),
	Head(0.011, 0.921, -0.39),
	HeadRot(2.004, 5.056, 14.138),
	EyeL(BoneMesh(TargetActor.A, "Bone_Head", 1.605, -0.193, 0.03)),
	EyeR(BoneMesh(TargetActor.A, "Bone_Head", 1.605, -0.193, 0.03)),
	FootL(WSurface(TPos(-0.392, 0, 0.425), 0, -1)),
	FootR(WSurface(TPos(0.338, 0, 0.506), 0, -1)),
	HandL(WSurface(WPos(-0.284, 0.464, -0.23), 0.051, -0.985, 0.165), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	HandR(WSurface(WPos(0.418, 0.798, -0.038), 0.016, -1, -0.014), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(),
	ElbowR(0.194),
	WristL(),
	WristR(),
	KneeL(),
	KneeR(-0.69),
	SpineRot(3.6),
	Mouth(-0.189, 0, 0, 0, 0, -0.105, -0.148, -0.098, -0.098, -0.059, -0.059),
	Brows(-0.078, 0.078, 0.078, -0.078),
	EyelidL(-0.125),
	EyelidR(-0.125),
	Cheeks(-1, -1)
)
end