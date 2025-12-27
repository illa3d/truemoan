function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "triss", "elizabethyoung")
actorB = Human(actorB, "generic male", "dante")

local point = MapPoint("map_feudaljapan", Pos(0.716, 0.029, 3.663), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(0.001, -21.6).Skybox("tm_beach", -0.6323999, -0.5519261).Light("M_Lantern_02a", 0.05, 0, 1.5E-07).Light("M_Lantern_01a_SwayOnly", 0.02999996, 0.6025001, 10).Light("M_Lantern_04a_SwayOnly_Proc", 0.05, 0, 1.5E-07).Light("M_Lantern_03a", 0.05, 0, 1.5E-07).Light("M_Lantern_03a_copy", 0.05, 0, 1.5E-07)
	actorA.Material("Student_Top", 0.5220001, -0.7424998, 0, 0)
end)
actorA.PlaceAt(Pos(0.227, -0.072, 0.006), Rot(0, 100.001, 0), point)
actorB.PlaceAt(Pos(-0.227, 0.071, -0.007), Rot(0, 78.777, 0), point)

actorA.Body("Breasts size", -0.4, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Nipples size", -3.6, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorB.Body("Body size", 0.04959488, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)

actorA.Customize("Top", 1, "Scarf", 1)
actorB.Customize("Gloves", 2, "Headwrap", 1)

PoseCam(Pos(1.48, 1.581, -0.707), Pos(0.169, 1.468, -0.099), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.013, 1.185, -0.105)),
	HipsRot(),
	Head(0.031, 0.997, 0.076),
	HeadRot(2.171, 351.538, 358.236),
	EyeL(WorldPos(1.873, 1.704, 3.569)),
	EyeR(WorldPos(1.873, 1.704, 3.569)),
	FootL(WSurface(TPos(-0.207, 0.347, -0.106), 0, -1, -0.001)),
	FootR(WSurface(TPos(0.038, 0.133, -0.046), 0, -1, -0.001)),
	HandL(HPos(-1.094, -0.126, 0.067), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	PinkyL(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(1.098, -0.129, 0.301), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	IndexR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	PinkyR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	ElbowL(0.658),
	ElbowR(0.695),
	WristL(-18.207, 0.897, -7.731),
	WristR(-3.398, 10.484, 0.437),
	ThumbL(16.472, 0, 0, 0, 0, TargetActor.Null, "Null"),
	IndexL(8.129, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidL(13.614, 9.957, 9.957, 0, 0, TargetActor.Null, "Null"),
	RingL(15.558, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(2.212, 16.297, 16.297, 0, 0, TargetActor.Null, "Null"),
	RingR(16.14, 4.351, 4.351, 0, 0, TargetActor.Null, "Null"),
	KneeL(),
	KneeR(),
	SpineRot(-0.825),
	Mouth(-0.452, 0.184, 0, 0.509, 0.509, -0.347, -0.347, 1, 1, 0.498, 0.498),
	Brows(0.979, 0.979, 0.339, 0.339),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.003, 1.056, 0.009)),
	HipsRot(20.3, 0, 3.775),
	Head(0.359, 0.907, 0.22),
	HeadRot(8.827, 340.308, 333.014),
	EyeL(BoneMesh(TargetActor.A, "Bone_Head", 0.806, 0.3)),
	EyeR(BoneMesh(TargetActor.A, "Bone_Head", 0.806, 0.3)),
	FootL(WSurface(TPos(-0.11, -0.006, 0.027), 0, -1)),
	FootR(WSurface(TPos(0.196, -0.006, 0.032), 0, -1)),
	HandL(BoneMesh(TargetActor.A, "Bone_Chest", -0.617, -0.509), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	HandR(BoneMesh(TargetActor.A, "Bone_Spine", 0.375, 0.308), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	ElbowL(),
	ElbowR(),
	WristL(),
	WristR(41.571, 3.098, 22.704),
	KneeL(),
	KneeR(),
	SpineRot(6.6),
	Mouth(-0.029, -0.065, 0, 0.497, 0.497, 0, 0, 0.416, 0.416, -0.011, -0.011),
	Brows(),
	EyelidL(0.126),
	EyelidR(0.126),
	Cheeks(-0.554, -0.554)
)
end