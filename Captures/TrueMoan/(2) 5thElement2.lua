function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "leon s kennedy", "dante")
actorB = Human(actorB, "jill valentine", "panam")

local point = MapPoint("map_quietscell", Pos(8.051, -0.029, 6.047), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(1.485999, -140.5501).Skybox("tm_arizona", 0.4274999, -0.3489749).Light("room_lights02_df.002", 0, 0, 10).Light("room_lights_01", -0.3559996, 0.7562499, 9.579998).Light("room_lights_02", -0.3559996, 0.7562499, 9.579998).Light("room_lights_03", -0.3559996, 0.7562499, 9.579998)
	actorA.Material("Hair", 0.01350037, 0.2100001, 0, 0).Material("Coat", 0.1260002, -0.345, 0, 0).Material("CoatParts", 0.1200002, -0.4200001, 0, 0).Material("Shirt", 0.02399965, 2.339999, 0, 0)
	actorB.Material("Jill_Torso", 0, 0, 0.015, -0.02250008).Material("Jill_Face", 0, 0, 0.015, -0.02250008).Material("Jill_Hair", 0.01600114, 2.369998, 0, 0).Material("Belt", 0.02100001, 2.437499, 0, 0).Material("Jacket", 0.03900001, 1.7925, 0, 0).Material("Pants", 0.04900037, 2.8125, 0, 0)
end)
actorA.PlaceAt(Pos(-0.218, 0.066, 0), Rot(0, 83.9, 0), point)
actorB.PlaceAt(Pos(0.217, -0.066, -0.001), Rot(0, 100.402, 0), point)

actorA.Body("Body size", -0.05000001, "Fluid speed", 0.09)
actorB.Body("Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)

actorA.Customize("Pants", 1, "Coat", 1)
actorB.Customize("Shirt", 1, "Pants", 1, "Jacket", 1, "Gloves", 1)

PoseCam(Pos(-1.073, 1.281, -1.895), Pos(0.219, 1.232, 0), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Anus", TargetActor.Null, "", 0.122, 36.769, 276.246, 0, true, 0.729, 0.428, 0.949, 0.312, false, 0.25, 0.65, 1.25, 1.653, 1.2),
	Hips(WPos(-0.001, 1.005, 0.051)),
	HipsRot(-1, 0, 9.925),
	Head(-0.001, 0.999, -0.047),
	HeadRot(25.95, 0.814, 10.785),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.11, -0.006, 0.027), 0, -1)),
	FootR(WSurface(TPos(0.196, -0.006, 0.032), 0, -1)),
	HandL(BoneMesh(TargetActor.A, "Bone_Hips", 0.531, 0.638), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	HandR(BoneMesh(TargetActor.A, "Bone_Hips", 0.56, -0.628), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	ElbowL(),
	ElbowR(),
	WristL(),
	WristR(33.385, 0, 116.231),
	KneeL(),
	KneeR(),
	SpineRot(0.6),
	Mouth(),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.001, 0.995, -0.037)),
	HipsRot(35, -0.3, 10.225),
	Head(-0.018, 0.659, 0.751),
	HeadRot(345.9, 80.182, 349.325),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.081, 0.156, -0.195), 0, -1, 0)),
	FootR(WSurface(TPos(0.126, 0.549, 0.639), -0.181, 0, 0.984)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Thigh_L", 0.729, 0.115), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	HandR(WSurface(WPos(0.233, 1.366, 0.537), -0.181, 0, 0.984), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(-1),
	ElbowR(-0.431),
	WristL(-65.332, 0, 2.322),
	WristR(6.107, 0, -91.334),
	IndexR(20, 0, 0, 12.976, 0, TargetActor.Null, "Null"),
	RingR(20, 0, 0, -7.173, 0, TargetActor.Null, "Null"),
	PinkyR(20, 0, 0, -20, 0, TargetActor.Null, "Null"),
	KneeL(),
	KneeR(),
	AnkleL(17.204),
	AnkleR(5.107),
	SpineRot(56.1),
	Mouth(-0.338, -0.163, 0, 0.295, 0.295, -0.065, -0.065, 1, 0.375, 1, 0.947),
	Brows(0.64, 0.64, 0.375, 0.375),
	EyelidL(-0.034),
	EyelidR(-0.034),
	Cheeks(1, 1)
)
end