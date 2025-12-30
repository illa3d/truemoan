function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "triss", "elizabethyoung")
actorB = Human(actorB, "generic male", "dante")

local point = MapPoint("map_feudaljapan", Pos(2.43, 0.033, 8.668), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(1, -21.6).Skybox("tm_beach", -0.6323999, -0.5519261).Light("M_Lantern_02a", 0.05, 0, 1.5E-07).Light("M_Lantern_01a_SwayOnly", 0.02999996, 0.6025001, 10).Light("M_Lantern_04a_SwayOnly_Proc", 0.05, 0, 1.5E-07).Light("M_Lantern_03a", 0.05, 0, 1.5E-07).Light("M_Lantern_03a_copy", 0.05, 0, 1.5E-07)
	actorA.Material("Student_Top", 0.5220001, -0.7424998, 0, 0)
end)
actorA.PlaceAt(Pos(-0.055, 0.126, 0.064), Rot(0, 264.476, 0), point)
actorB.PlaceAt(Pos(0.055, -0.127, -0.064), Rot(0, 258.029, 0), point)

actorA.Body("Breasts size", -0.4, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Nipples size", -3.6, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorB.Body("Body size", 0.04959488, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)

actorA.Customize("Top", 1, "Skirt", 1, "Scarf", 1, "Boots", 1)
actorB.Customize("Shoes", 1, "Shirt", 1, "Pants", 1, "Gloves", 2, "Coat", 1, "Headwrap", 1)

PoseCam(Pos(-0.105, 1.205, -1.573), Pos(-0.276, 1.101, -0.145), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.01, 0.854, 0.293)),
	HipsRot(16.025, 0, -19.4),
	Head(0.071, 0.676, 0.733),
	HeadRot(1.652, 219.576, 344.533),
	EyeL(BoneMesh(TargetActor.A, "Bone_Head", 0.585, 0.029)),
	EyeR(BoneMesh(TargetActor.A, "Bone_Head", 0.585, 0.029)),
	FootL(WSurface(TPos(-0.072, 0.311, 0.928), 0.579, 0, 0.815)),
	FootR(WSurface(TPos(0.199, -0.119, 0.246), -0.187, -0.982, 0.038)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Hips", 0.511, 0.652), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	HandR(HPos(0.278, -1.039, -0.109), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(-0.315),
	ElbowR(),
	WristL(),
	WristR(),
	IndexL(20, 14.934, 14.934, 4.37, 0, TargetActor.Null, "Null"),
	MidL(20, 16.615, 16.615, -6.423, 0, TargetActor.Null, "Null"),
	RingL(20, 21.991, 21.991, -10.226, 0, TargetActor.Null, "Null"),
	PinkyL(20, 24.373, 24.373, -20, 0, TargetActor.Null, "Null"),
	KneeL(-0.158),
	KneeR(),
	AnkleL(17.755, 0, -10),
	AnkleR(24.536),
	SpineRot(-64.425),
	Mouth(-0.692, 0.448),
	Brows(1, 1),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Vagina", TargetActor.Null, "", 0, 0, 0, 0, true, 0.324, 0.281, 0.932, 0.268, false, 0.25, 0.65, 1.25, 1.457, 1.2),
	Hips(WPos(0, 1.164, 0.031)),
	HipsRot(-1.075, 0, 0.4),
	Head(-0.001, 1, 0.015),
	HeadRot(10.999, 358.094, 11.211),
	EyeL(WorldPos(1.405, 1.35, 8.959)),
	EyeR(WorldPos(1.405, 1.35, 8.959)),
	FootL(WSurface(TPos(-0.091, 0.091, 0.304), -0.001, -1, -0.013)),
	FootR(WSurface(TPos(0.203, 0.091, 0.155), 0.021, -1, -0.008)),
	HandL(BoneMesh(TargetActor.A, "Bone_Forearm_L", 0.895, -0.115), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Forearm_L"),
	HandR(BoneMesh(TargetActor.A, "Bone_Hips", 0.251, -0.575), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	ElbowL(),
	ElbowR(),
	WristL(),
	WristR(),
	KneeL(),
	KneeR(),
	AnkleL(1.622),
	AnkleR(5.624, 0, 39.557),
	SpineRot(),
	Mouth(-0.368, -0.171),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
end