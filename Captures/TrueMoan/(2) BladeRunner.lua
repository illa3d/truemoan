function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "dante")
actorB = Human(actorB, "ciri")

local point = MapPoint("map_hotspringsbath", Pos(-0.51, -0.75, -2.98), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(0.001, 3.75).Skybox("nightsky", -0.9549, -0.01147501).Light("lights_base_02", -0.145, 0.1787501, 7.6375)
	actorA.Material("Hair", 0.006, -0.9974997, 0, 0)
	actorB.Material("Ciri_Torso", 0.021, 0.2925, 0, 0).Material("Face", 0.021, 0.2925, 0, 0).Material("Hair", 0.6060004, 2.512501, -0.1787499, 0.1175001).Material("Eyes", 0.01649989, -0.4625001, 0.7375001, -1)
end)
actorA.PlaceAt(Pos(-0.176, 0.752, 1.297), Rot(0, 173.725, 0), point)
actorB.PlaceAt(Pos(0.175, -0.752, -1.296), Rot(0, 6.703, 0), point)

actorA.Body("Body size", -0.6760998, "Fluid speed", 0.09)
actorB.Body("Body size", 2.34, "Breasts size", -0.5, "Ass size", -1, "Fluid speed", 0.09)

actorB.Customize("Belt", 1, "Boots", 1, "Medallion", 1, "Pants", 2, "Gloves", 1, "Top", 3)

PoseCam(Pos(3.236, 1.497, 1.263), Pos(-0.232, 1.477, 0.583), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.001, 0.349, -0.008)),
	HipsRot(20.375, -0.675, 0.7),
	Head(-0.006, 0.996, -0.091),
	HeadRot(331.318, 356.808, 0.068),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.091, -0.007, 0.079), 0, -1)),
	FootR(WSurface(TPos(0.247, 0, 0.042), 0, -1)),
	HandL(HPos(-0.088, -1.139, 0.098), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.278, -1.039, -0.109), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(0.334),
	ElbowR(),
	WristL(),
	WristR(),
	KneeL(),
	KneeR(),
	AnkleL(-6.991, 0, 35.731),
	AnkleR(-6.944),
	SpineRot(),
	Mouth(),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.004, 1.638, -0.524)),
	HipsRot(-34.775, 0, 24.25),
	Head(-0.015, 0.462, 0.887),
	HeadRot(27.487, 4.543, 10.283),
	EyeL(WorldPos(0.159, 1.359, -2.085)),
	EyeR(WorldPos(0.159, 1.359, -2.085)),
	FootL(WPos(-0.461, -0.258, 0.426)),
	FootR(WPos(0.433, 0.421, 1.481)),
	HandL(HPos(-0.006, 0.569, 0.634), Wrist(HPoint(0, 0, 0.3, 0, 0, 0, "Bone_Index3_L"), 70)),
	ThumbL(19.142, 23.34, 23.34, 0, 0, TargetActor.Null, "Null"),
	IndexL(-0.04, 0, 0, -20, 0, TargetActor.Null, "Null"),
	MidL(74.297, 40.703, 40.703, 0, 0, TargetActor.Null, "Null"),
	RingL(63.976, 36.984, 36.984, 20, 0, TargetActor.Null, "Null"),
	PinkyL(51.982, 47.02, 47.02, 9.456, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Calf_R", -0.8, -0.002), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Calf_R"),
	ElbowL(-0.225),
	ElbowR(-0.214),
	WristL(90, 25, -90),
	WristR(40.676, -1.819, 14.216),
	KneeL(0.172),
	KneeR(),
	AnkleL(0, 0, -10),
	SpineRot(21.6),
	Mouth(-0.059, 0.22, 0, 0.346, 0.799, -0.088, -0.14, 0.517, -0.097, -0.987, -0.995),
	Brows(0.306, 0.228, 1, 1),
	EyelidL(-0.11),
	EyelidR(-0.11),
	Cheeks(-0.363, -0.363)
)
end