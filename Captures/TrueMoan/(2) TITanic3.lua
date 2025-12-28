function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "triss", "elizabethyoung")
actorB = Human(actorB, "generic male", "dante")

local point = MapPoint("map_feudaljapan", Pos(0.353, 0.029, 7.195), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(1, -21.6).Skybox("tm_beach", -0.6323999, -0.5519261).Light("M_Lantern_02a", 0.05, 0, 1.5E-07).Light("M_Lantern_01a_SwayOnly", 0.02999996, 0.6025001, 10).Light("M_Lantern_04a_SwayOnly_Proc", 0.05, 0, 1.5E-07).Light("M_Lantern_03a", 0.05, 0, 1.5E-07).Light("M_Lantern_03a_copy", 0.05, 0, 1.5E-07)
	actorA.Material("Student_Top", 0.5220001, -0.7424998, 0, 0)
end)
actorA.PlaceAt(Pos(0.097, 0.018, 0.139), Rot(0, 27.476, 0), point)
actorB.PlaceAt(Pos(-0.096, -0.019, -0.14), Rot(0, 28.753, 0), point)

actorA.Body("Breasts size", -0.4, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Nipples size", -3.6, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorB.Body("Body size", 0.04959488, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)

actorA.Customize("Top", 1, "Skirt", 1, "Scarf", 1)
actorB.Customize("Shirt", 1, "Pants", 1, "Gloves", 2, "Headwrap", 1)

PoseCam(Pos(2.17, 1.237, 0.507), Pos(0.325, 1.322, 0.37), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.001, 0.999, 0.096)),
	HipsRot(35, 0, -0.875),
	Head(-0.017, 0.456, 0.89),
	HeadRot(349.873, 34.87, 353.076),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.163, 0.115, 0.121), 0.003, -1, -0.001)),
	FootR(WSurface(TPos(0.038, -0.005, -0.033), 0, -1)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Head", 0.2, -0.273), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Head", 0.148, 0.191), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	ElbowL(0.027),
	ElbowR(-0.142),
	WristL(-14.657, 0, -25.189),
	WristR(80.03, 0, 124.922),
	PinkyR(-0.559, 0, 0, 0, 0, TargetActor.Null, "Null"),
	KneeL(-0.625),
	KneeR(-0.431),
	AnkleL(53.787),
	AnkleR(55),
	SpineRot(7.8),
	Mouth(-0.288, -0.079, 0, 0.677, 0.179, -0.118, -0.118, 1, 0.746, -0.651, -0.585),
	Brows(1, 1, -0.891, -0.838),
	EyelidL(),
	EyelidR(),
	Cheeks(-0.053, -0.053)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Vagina", TargetActor.Null, "", 0, 0, 0, 0, true, 1, 0.3, 0.9, 0.188, false, 0.25, 0.65, 1.25, 1.251, 1.2),
	Hips(WPos(0.02, 1.214, 0.054)),
	HipsRot(-10.9, -1.35, 1.075),
	Head(-0.05, 0.965, 0.259),
	HeadRot(27.958, 8.563, 347.561),
	EyeL(WorldPos(0.919, 1.386, 7.799)),
	EyeR(WorldPos(0.919, 1.386, 7.799)),
	FootL(WSurface(TPos(-0.345, 0.068, 0.1), 0, -1, -0.002)),
	FootR(WSurface(TPos(0.196, -0.006, 0.032), 0, -1)),
	HandL(BoneMesh(TargetActor.A, "Bone_Hips", 0.212, 0.532), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	HandR(BoneMesh(TargetActor.A, "Bone_Hips", 0.017, -0.576), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	ElbowL(),
	ElbowR(),
	WristL(53.465, 0, 68.057),
	WristR(),
	ThumbR(-5.619, 0, 0, 0, 0, TargetActor.Null, "Null"),
	IndexR(25.644, 14.233, 14.233, 0, 0, TargetActor.Null, "Null"),
	KneeL(),
	KneeR(),
	AnkleL(16.44),
	AnkleR(27.613),
	SpineRot(7.5),
	Mouth(-0.243, 0.089, 0, 0, 0, -0.301, -0.301, 0.984, 0.984, 0.792, 0.792),
	Brows(0, 0, -0.037, -0.037),
	EyelidL(-0.082),
	EyelidR(-0.082),
	Cheeks()
)
end