function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "triss", "elizabethyoung")
actorB = Human(actorB, "generic male", "dante")

local point = MapPoint("map_feudaljapan", Pos(0.557, 0.832, 7.743), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(1, -21.6).Skybox("tm_beach", -0.6323999, -0.5519261).Light("M_Lantern_02a", 0.05, 0, 1.5E-07).Light("M_Lantern_01a_SwayOnly", 0.02999996, 0.6025001, 10).Light("M_Lantern_04a_SwayOnly_Proc", 0.05, 0, 1.5E-07).Light("M_Lantern_03a", 0.05, 0, 1.5E-07).Light("M_Lantern_03a_copy", 0.05, 0, 1.5E-07)
	actorA.Material("Student_Top", 0.5220001, -0.7424998, 0, 0)
end)
actorA.PlaceAt(Pos(0.15, -0.141, -0.022), Rot(0, 105.551, 0), point)
actorB.PlaceAt(Pos(-0.15, 0.141, 0.021), Rot(0, 92.353, 0), point)

actorA.Body("Breasts size", -0.4, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Nipples size", -3.6, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorB.Body("Body size", 0.04959488, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)

actorA.Customize("Top", 1, "Skirt", 1, "Scarf", 1, "Boots", 1)
actorB.Customize("Shirt", 1, "Pants", 1, "Gloves", 2, "Headwrap", 1)

PoseCam(Pos(1.762, 0.719, -1.303), Pos(0.485, 0.571, -0.131), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.024, 0.637, 0.036)),
	HipsRot(-21.575, 0, -6.95),
	Head(-0.04, 0.41, 0.911),
	HeadRot(11.103, 12.831, 23.288),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.529, 0.251, 0.403), -0.089, -0.992, 0.094)),
	FootR(WSurface(TPos(0.285, -0.067, 0.208), -0.758, -0.11, -0.643)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Calf_L", 0.098, 0.5), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_L"),
	HandR(WSurface(WPos(-0.039, 0.287, 0.245), 0, -1), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(-0.489),
	ElbowR(0.607),
	WristL(),
	WristR(-49.032, 0, 44.474),
	RingR(85, 32.566, 32.566, 0, 0, TargetActor.Null, "Null"),
	PinkyR(85, 38.164, 38.164, 0, 0, TargetActor.Null, "Null"),
	KneeL(-0.468),
	KneeR(-0.406),
	AnkleL(38.939),
	AnkleR(-5.043),
	SpineRot(-11.25),
	Mouth(-0.091, 0.232, 0, 0.517, 0.517, -0.17, -0.17, -0.279, -0.279, -0.991, -0.991),
	Brows(1, 1, -0.198, -0.198),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(0.154, 0.154)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Vagina", TargetActor.Null, "", 0, 0, 0, 0, true, 0, 0.3, 0.9, 0.309, false, 0.25, 0.65, 1.25, 1.251, 1.2),
	Hips(WPos(-0.006, 0.195, 0.045)),
	HipsRot(-35, 1.125, 1.45),
	Head(0.088, 0.995, -0.051),
	HeadRot(355.852, 359.582, 356.344),
	EyeL(WorldPos(0.919, 1.386, 7.799)),
	EyeR(WorldPos(0.919, 1.386, 7.799)),
	FootL(WSurface(TPos(-0.317, -0.433, 0.764), -0.629, -0.615, 0.476)),
	FootR(WPos(0.387, -0.536, 0.473)),
	HandL(BoneMesh(TargetActor.A, "Bone_Thigh_L", 0.258, 0.212), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	HandR(BoneMesh(TargetActor.A, "Bone_Chest", -0.605, 0.311), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	ElbowL(0.159),
	ElbowR(0.161),
	WristL(11.374, 0, -53.469),
	WristR(),
	KneeL(-0.497),
	KneeR(-0.667),
	AnkleL(13.853),
	AnkleR(27.613),
	SpineRot(),
	Mouth(-0.257, -0.445, 0, 0.133, 0.133, -0.301, -0.301, 0.27, 0.27, 0.217, 0.217),
	Brows(0, 0, -0.037, -0.037),
	EyelidL(-0.082),
	EyelidR(-0.082),
	Cheeks()
)
end