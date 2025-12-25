function Anim_Name(actorA, actorB, actorC, actorD, actorE, actorF, actorG, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "goth tachy", "maddie")
actorB = Human(actorB, "tachy", "android 18")
actorC = Human(actorC, "goth tachy")
actorD = Human(actorD, "black male")
actorE = Human(actorE, "goth tachy")
actorF = Human(actorF, "tachy")
actorG = Human(actorG, "tachy")

local point = MapPoint("map_bedroom", Pos(3.912, -0.102, -1.51), Rot(0, 0, 0), overridePos, overrideRot, function()
	Skybox("tm_arizona", 0, 0).Light("5_-l1off_0.5_0_0", 0.65, 0, 1.5E-06).Light("5_-l2off_0.5_0_0_0002", 0.1, 0, 1.2E-07).Light("5_-l3off_0.5_0_02", 0.1, -0.05, 1.5E-07)
	actorA.Material("Tachy_Torso_Nipples", 0.9894999, -0.4725, 0, 0)
	actorB.Material("Tachy_Torso_Nipples", 0.9864999, -0.2625, 0, 0)
end)
actorA.PlaceAt(Pos(-0.348, 0.024, -0.357), Rot(0, 319, 0), point)
actorB.PlaceAt(Pos(-0.765, 0.05, -0.498), Rot(0, 1.377, 0), point)
actorC.PlaceAt(Pos(0.496, 0.048, 0.126), Rot(0, 331.787, 0), point)
actorD.PlaceAt(Pos(-0.375, -0.062, 0.498), Rot(0, 166.487, 0), point)
actorE.PlaceAt(Pos(1.296, 0.048, 0.027), Rot(0, 269.087, 0), point)
actorF.PlaceAt(Pos(0.276, 0.061, -0.388), Rot(0, 321.212, 0), point)
actorG.PlaceAt(Pos(-1.296, 0.048, -0.477), Rot(0, 5.612, 0), point)

actorA.Body("Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorB.Body("Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorC.Body("Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorD.Body("Penis size", 0.2791886, "Penis length", 0.1333553, "Body size", 1.025, "Fluid speed", 0.09)
actorE.Body("Breasts size", -0.5, "Ass size", -0.5, "Hips size", -0.1, "Thigh size", -0.09999999, "Calf size", -0.05, "Upper arms size", -0.05000001, "Forearms size", -0.05000001, "Muscle tone", 0.2, "Fluid speed", 0.09)
actorF.Body("Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorG.Body("Fluid speed", 0.09)

actorA.Customize("EarsPiercings", 1, "Sleeves", 1, "Top", 3, "Socks", 2, "Choker", 1, "Bot", 2, "Boots", 1)
actorB.Customize("Short", 2, "Shirt", 2, "Boots", 1, "Jacket", 1, "BunnyTie", 2)
actorC.Customize("Suit", 6, "Neckguard", 1, "HipGears", 1, "Gloves", 1)
actorE.Customize("Suit", 6, "Neckguard", 1, "HipGears", 1, "Gloves", 1)
actorF.Customize("Suit", 6, "Neckguard", 1, "HipGears", 1, "Gloves", 1)
actorG.Customize("Suit", 6, "Neckguard", 1, "HipGears", 1, "Gloves", 1)

PoseCam(Pos(-1.066, 1.938, 2.392), Pos(-0.138, 1.241, -0.299), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorD).WrapMode(MotionWrap.Loop).Data(
	Hips(0, 1),
	HipsRot(20.3, 0, 3.775),
	Head(-0.001, 0.987, -0.159),
	HeadRot(3.567, 351.017, 2.254),
	EyeL(EyeContact(TargetActor.A)),
	EyeR(EyeContact(TargetActor.A)),
	FootL(WSurface(TPos(-0.11, -0.006, 0.027), 0, -1)),
	FootR(WSurface(TPos(0.196, -0.006, 0.032), 0, -1)),
	HandL(HPos(-0.186, -1.083, -0.114), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Thigh_R", 0.202, -0.572), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	ElbowL(),
	ElbowR(),
	WristL(),
	WristR(),
	KneeL(),
	KneeR(),
	SpineRot(),
	Mouth(),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(0, 1),
	HipsRot(20.3, 0, 3.775),
	Head(-0.001, 0.987, -0.159),
	HeadRot(351.605, 358.385, 2.459),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.11, -0.006, 0.027), 0, -1)),
	FootR(WSurface(TPos(0.196, -0.006, 0.032), 0, -1)),
	HandL(HPos(-0.186, -1.083, -0.114), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
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
	ElbowL(),
	ElbowR(),
	WristL(),
	WristR(),
	KneeL(),
	KneeR(),
	SpineRot(),
	Mouth(),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorC).WrapMode(MotionWrap.Loop).Data(
	Hips(0, 0.903, 0.042),
	HipsRot(3.4, 0, -5.3),
	Head(0, 0.998, -0.07),
	HeadRot(335.954, 352.801, 2.616),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.106, -0.002, 0.081), -0.004, -1, 0.002)),
	FootR(WSurface(TPos(0.114, -0.003, -0.028), -0.004, -1, 0.002)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Hips", 0.668, 0.349), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", -0.218, -0.395), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	Mouth(0, 0, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorD).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.03, 0.802, -0.652)),
	HipsRot(13.975, 0, 6.5),
	Head(0.01, 0.456, -0.89),
	HeadRot(37.251, 220.553, 224.03),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.643, 0.46, -0.504), 0, -1)),
	FootR(WPos(1.165, 0.383, -0.643)),
	HandL(HPos(-0.283, -0.906, 0.096), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.336, -1.042, -0.015), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	KneeR(-1),
	Mouth(0, 0, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorE).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 0.957, 0.015)),
	HipsRot(3.4, 0, -5.3),
	Head(-0.001, 0.882, 0.471),
	HeadRot(350.763, 30.197, 356.766),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.106, -0.002, 0.081), -0.004, -1, 0.002)),
	FootR(WSurface(TPos(0.114, -0.003, -0.028), -0.004, -1, 0.002)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Thigh_L", 0.298, -0.024), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.584, -0.595), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	Mouth(0, 0, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorF).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.003, 1.008, 0.048)),
	HipsRot(3.4, 0, -5.3),
	Head(-0.26, 0.963, -0.066),
	HeadRot(353.019, 342.658, 5.141),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.106, -0.002, 0.081), -0.004, -1, 0.002)),
	FootR(WSurface(TPos(0.114, -0.003, -0.028), -0.004, -1, 0.002)),
	HandL(HPos(-0.283, -0.906, 0.096), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.336, -1.042, -0.015), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	Mouth(0, 0, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorG, actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.062, 0.994, 0.083)),
	HipsRot(3.4, 0, -5.3),
	Head(0.134, 0.977, -0.164),
	HeadRot(7.156, 3.434, 48.068),
	EyeL(EyeContact(TargetActor.A)),
	EyeR(EyeContact(TargetActor.A)),
	FootL(WSurface(TPos(-0.106, -0.002, 0.081), -0.004, -1, 0.002)),
	FootR(WSurface(TPos(0.114, -0.003, -0.028), -0.004, -1, 0.002)),
	HandL(HPos(-0.283, -0.906, 0.096), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.336, -1.042, -0.015), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(-0.136),
	SpineRot(21.45),
	Mouth(0, 0, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438)
)
end