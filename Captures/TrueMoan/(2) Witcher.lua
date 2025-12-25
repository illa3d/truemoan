function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "scarlet")
actorB = Human(actorB, "geralt", "ashley")

local point = MapPoint("map_hotspringsbath", Pos(-2.03, -0.451, 0.387), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(0.001, 2.25).Skybox("nightsky", -0.2775, 0.000225).Light("lights_base_02", 0.05, 0.1, 4.177501)
end)
actorA.PlaceAt(Pos(-0.296, 0.373, 0.269), Rot(0, 66.476, 0), point)
actorB.PlaceAt(Pos(0.297, -0.373, -0.268), Rot(0, 43.452, 0), point)

actorA.Body("Breasts size", -0.8, "Waist size", -0.4631595, "Hips size", -0.4578444, "Thigh size", -0.0643158, "Fluid speed", 0.09)
actorB.Body("Penis size", -0.25, "Penis length", -0.4, "Ass size", 10, "Waist size", 0.9, "Hips size", 3.5, "Thigh size", 0.6999999, "Calf size", 1.35, "Nipples size", 0.5, "Upper arms size", 1.1, "Forearms size", 1.1, "Neck size", 1.3, "Muscle tone", -0.3, "Fluid speed", 0.09)

actorA.Customize("Heels", 1, "Dress", 1, "Corset", 1)
actorB.Customize("Knit", 1, "Scarf", 1, "Skirt", 3, "Jacket", 1)

PoseCam(Pos(2.1, 1.655, 2.811), Pos(-0.295, 1.219, 0.399), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.002, 1.04, -0.084)),
	HipsRot(-1.3, -2.475, 0.775),
	Head(-0.025, 0.358, 0.933),
	HeadLookAt(CameraPos()),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.04, 0, 0.103), 0, -1, 0)),
	FootR(WSurface(TPos(0.105, 0, 0.039), 0, -1, 0)),
	HandL(HPos(-0.804, -0.21, 0.666), Wrist(HPoint(0, 0, 0.3, 0, 0, 0, "Bone_Index3_L"), 70)),
	ThumbL(30, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	RingL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	PinkyL(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Thigh_R", 0.767, -0.115), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	ElbowL(),
	ElbowR(),
	WristL(-69.822, 14.461, 87.583),
	WristR(),
	KneeL(0.212),
	KneeR(0.538),
	SpineRot(),
	Mouth(-0.893, 0.343, 0, 0.602, 0.602, -0.458, -0.458, 0.747, 0.747, 0.728, 0.728),
	Brows(1, 1, -1, -1),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(0.181, 0.181)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.062, 1.189, -0.11)),
	HipsRot(34.475, 3.075, 6.7),
	Head(-0.329, 0.881, 0.34),
	HeadRot(348.202, 326.114, 22.225),
	EyeL(BoneMesh(TargetActor.A, "Bone_Chest", 0.734, -0.203)),
	EyeR(BoneMesh(TargetActor.A, "Bone_Chest", 0.734, -0.203)),
	FootL(WPos(-0.24, 0.414, -0.013)),
	FootR(WSurface(TPos(0.13, 0.358, 0.156), 0, -1, 0)),
	HandL(WSurface(WPos(-0.546, 0.783, 0.127), 0, -1, 0), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	HandR(HPos(0.638, 0.029, 0.396), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(37.78, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(28.253, 11.318, 11.318, 0, 0, TargetActor.Null, "Null"),
	PinkyR(50.038, 8.985, 8.985, 6.071, 0, TargetActor.Null, "Null"),
	ElbowL(),
	ElbowR(),
	WristL(-70, 0, -47.233),
	WristR(-58.749, 85.666, 111.712),
	KneeL(),
	KneeR(0.253),
	AnkleR(50.488),
	SpineRot(10.125),
	Mouth(-0.351, 1, 0, 1, 0.081, -0.923, -0.923, 1, 0.099, 1, 0.761),
	Brows(-0.032, 1, 1, -1),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(-0.166, -0.166)
)
end