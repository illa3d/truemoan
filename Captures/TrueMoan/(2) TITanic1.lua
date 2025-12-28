function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "triss", "elizabethyoung")
actorB = Human(actorB, "generic male", "dante")

local point = MapPoint("map_feudaljapan", Pos(0.733, 0.312, 7.349), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(0.001, -21.6).Skybox("tm_beach", -0.6323999, -0.5519261).Light("M_Lantern_02a", 0.05, 0, 1.5E-07).Light("M_Lantern_01a_SwayOnly", 0.02999996, 0.6025001, 10).Light("M_Lantern_04a_SwayOnly_Proc", 0.05, 0, 1.5E-07).Light("M_Lantern_03a", 0.05, 0, 1.5E-07).Light("M_Lantern_03a_copy", 0.05, 0, 1.5E-07)
	actorA.Material("Student_Top", 0.5220001, -0.7424998, 0, 0)
end)
actorA.PlaceAt(Pos(0.001, 0.227, 0.161), Rot(0, 163.376, 0), point)
actorB.PlaceAt(Pos(-0.001, -0.227, -0.162), Rot(0, 356.277, 0), point)

actorA.Body("Breasts size", -0.4, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Nipples size", -3.6, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorB.Body("Body size", 0.04959488, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)

actorA.Customize("Top", 1, "Skirt", 1, "Scarf", 1)
actorB.Customize("Shirt", 1, "Pants", 1, "Gloves", 2, "Headwrap", 1)

PoseCam(Pos(2.128, 1.222, -0.149), Pos(-0.044, 1.103, 0.375), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.005, 0.585, -0.126)),
	HipsRot(-35, 0, -7.175),
	Head(0.004, 0.853, -0.523),
	HeadRot(324.603, 344.34, 11.618),
	EyeL(EyeContact(TargetActor.A)),
	EyeR(EyeContact(TargetActor.A)),
	FootL(WPos(-0.442, 0.855, 0.435)),
	FootR(WPos(0.692, 1.053, 0.354)),
	HandL(WSurface(WPos(-0.264, 0.439, -0.346), 0, -1), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	HandR(HPos(0.278, -1.039, -0.109), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(),
	ElbowR(),
	WristL(),
	WristR(),
	KneeL(-0.752),
	KneeR(-0.065),
	AnkleL(53.787),
	AnkleR(55),
	SpineRot(),
	Mouth(-0.337, -0.599, 0, 0, 0, -1, -1),
	Brows(1, 1, -0.44, -0.44),
	EyelidL(),
	EyelidR(),
	Cheeks(-0.053, -0.053)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Vagina", TargetActor.Null, "", 0, 0, 0, 0, false, 1, 0.3, 0.9, 0.03, false, 0.25, 0.65, 1.25, 1.251, 1.2),
	Hips(WPos(-0.001, 1.177, 0.129)),
	HipsRot(3.725, 0, 1.75),
	Head(-0.006, 0.936, 0.352),
	HeadRot(25.856, 4.533, 3.713),
	EyeL(EyeContact(TargetActor.A)),
	EyeR(EyeContact(TargetActor.A)),
	FootL(WSurface(TPos(-0.345, 0.068, 0.1), 0, -1, -0.002)),
	FootR(WSurface(TPos(0.196, -0.006, 0.032), 0, -1)),
	HandL(BoneMesh(TargetActor.A, "Bone_Thigh_R", 0.743, -0.535), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	HandR(BoneMesh(TargetActor.A, "Bone_Chest", -0.3, -0.413), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	ElbowL(),
	ElbowR(),
	WristL(53.465, 0, 68.057),
	WristR(),
	KneeL(),
	KneeR(),
	AnkleL(16.44),
	AnkleR(27.613),
	SpineRot(7.5),
	Mouth(-0.243, 0.089),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
end