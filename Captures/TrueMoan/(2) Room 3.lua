function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "tachy")
actorB = Human(actorB, "dante", "scarlet")

local point = MapPoint("map_bedroom", Pos(-0.244, 0.234, -2.341), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(1.710999, -3.900002).Skybox("tm_seaside_sunset", -0.4950001, 0.2178007).Light("5_-l1off_0.5_0_0", 0.65, 0, 1.5E-06).Light("5_-l2off_0.5_0_0", 0.01000013, 0.2800002, 0.106).Light("5_-l2off_0.5_0_0_0002", 0.1, 0, 1.2E-07).Light("5_-l3off_0.5_0_0", 0.03399998, 0.3849996, 0.1810002).Light("5_-l3off_0.5_0_01", 0.1, -0.05, 1.5E-07).Light("5_-l3off_0.5_0_02", 0.1, -0.05, 1.5E-07).Light("5_-l3off_0.5_0_03", 0.004000009, 1, 0.3085).Light("5_-l3off_0.5_0_04", 0.003999971, 0.9887499, 0.3985).Light("5_-l3off_0.5_0_05", 0.05049996, 0.3175003, 1.734999E-07)
	actorA.Material("Tachy_Torso", 0, 0, 0.00375, 0.1237499).Material("Tachy_Torso_Nipples", 0.012, -0.2924999, 0, 0).Material("Head", 0, 0, 0.00375, 0.1237499).Material("Body", 0, 0, 0.00375, 0.1237499)
end)
actorA.PlaceAt(Pos(0.095, -0.618, 0.034), Rot(0, 62.051, 0), point)
actorB.PlaceAt(Pos(-0.096, 0.618, -0.033), Rot(0, 243.027, 0), point)

actorA.Body("Body size", -0.07499999, "Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.4, "Calf size", -0.1, "Nipples size", -5, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorB.Body("Penis size", -0.1296439, "Penis length", 0.1794729, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.4, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Fluid speed", 0.02613957, "Fluid spread", 2.976262, "Fluid amount", -0.5, "Fluid force", 0.1037914)

actorA.Customize("Suit", 6, "Neckguard", 1, "HipGears", 1, "Gloves", 1)
actorB.Customize("Ring", 1, "Necklace", 1, "Heels", 2, "Dress", 3, "Corset", 3, "Bracelet", 1)

PoseCam(Pos(1.044, 0.99, 0.477), Pos(-0.601, 0.584, -0.22), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.008, 1.118, -0.198)),
	HipsRot(-35, -1.65, -5.275),
	Head(-0.022, -0.026, -0.999),
	HeadRot(285.646, 4.399, 14.223),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WPos(-0.015, 1.442, -0.132)),
	FootR(WPos(0.056, 1.414, -0.281)),
	HandL(WSurface(WPos(-0.082, 1.124, -0.808), -0.174, -0.979, 0.104), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Hand_L", 0.141, -0.949), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(0.29),
	ElbowR(0.131),
	WristL(),
	WristR(-6.415, 0, 63.132),
	KneeL(-0.798),
	KneeR(-0.618),
	AnkleL(6.832),
	AnkleR(14.718),
	SpineRot(7.2),
	Mouth(-0.353, -0.078, 0, 0.097, 0.097, -0.542, -0.573, 0.239, 0.239, 0.289, 0.289, 0.207),
	Brows(1, 1, 0.075, 0.216),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Mouth", TargetActor.Null, "", 0, 0, 0, 0, true, 0.698, 0.431, 1.108, 0.288, false, 0.25, 0.65, 1.25, 1.206, 1.2),
	Hips(WPos(-0.037, 0.201, 0.405)),
	HipsRot(-35, 0, 1.45),
	Head(0.06, 0.067, 0.996),
	HeadRot(46.542, 340.489, 354.688),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.383, -0.252, 0.323), 0.259, -0.952, -0.161)),
	FootR(WSurface(TPos(0.145, -0.214, 0.252), 0.008, -1, -0.016)),
	HandL(WSurface(WPos(-0.112, -0.138, 0.691), 0.301, -0.943, -0.138), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	HandR(WSurface(WPos(0.273, -0.085, 0.685), 0.066, -0.992, -0.109), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(),
	ElbowR(-0.97),
	WristL(-27.171, 0, -36.479),
	WristR(0, 0.048),
	KneeL(-0.583),
	KneeR(-0.627),
	AnkleL(0.018, 0, 8.156),
	AnkleR(-5.57),
	SpineRot(),
	Mouth(),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
end