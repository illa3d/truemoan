function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "tachy")
actorB = Human(actorB, "dante", "scarlet")

local point = MapPoint("map_bedroom", Pos(-0.043, 0.166, -2.331), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(1.710999, -3.900002).Skybox("tm_seaside_sunset", -0.4950001, 0.2178007).Light("5_-l1off_0.5_0_0", 0.65, 0, 1.5E-06).Light("5_-l2off_0.5_0_0", 0.01000013, 0.2800002, 0.106).Light("5_-l2off_0.5_0_0_0002", 0.1, 0, 1.2E-07).Light("5_-l3off_0.5_0_0", 0.03399998, 0.3849996, 0.1810002).Light("5_-l3off_0.5_0_01", 0.1, -0.05, 1.5E-07).Light("5_-l3off_0.5_0_02", 0.1, -0.05, 1.5E-07).Light("5_-l3off_0.5_0_03", 0.004000009, 1, 0.3085).Light("5_-l3off_0.5_0_04", 0.003999971, 0.9887499, 0.3985).Light("5_-l3off_0.5_0_05", 0.05049996, 0.3175003, 1.734999E-07)
	actorA.Material("Tachy_Torso", 0, 0, 0.00375, 0.1237499).Material("Tachy_Torso_Nipples", 0.012, -0.2924999, 0, 0).Material("Head", 0, 0, 0.00375, 0.1237499).Material("Body", 0, 0, 0.00375, 0.1237499)
end)
actorA.PlaceAt(Pos(-0.212, -0.55, -0.046), Rot(0, 62.051, 0), point)
actorB.PlaceAt(Pos(0.212, 0.55, 0.046), Rot(0, 249.777, 0), point)

actorA.Body("Body size", -0.07499999, "Breasts size", -0.3, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.4, "Calf size", -0.1, "Nipples size", -5, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorB.Body("Penis size", 0.0847435, "Penis length", -0.0299288, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.4, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Fluid speed", 1, "Fluid spread", 3.641611, "Fluid amount", 0.633725, "Fluid force", 0.309311)

actorA.Customize("Suit", 6, "Neckguard", 1, "HipGears", 1, "Gloves", 1)
actorB.Customize("Ring", 1, "Necklace", 1, "Heels", 2, "Dress", 3, "Corset", 3, "Bracelet", 1)

PoseCam(Pos(-1.013, 0.771, -1.007), Pos(-0.387, 0.722, -0.027), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.01, 1.197, -0.156)),
	HipsRot(-34.025, -1.65, 2.375),
	Head(-0.033, -0.002, -0.999),
	HeadRot(304.541, 134.886, 257.724),
	EyeL(WorldPos(-0.445, 1.525, -3.229)),
	EyeR(WorldPos(-0.445, 1.525, -3.229)),
	FootL(WPos(-0.082, 1.516, -0.434)),
	FootR(WPos(0.46, 1.55, -0.349)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Head", 1.57, 0.202), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	HandR(WSurface(WPos(0.036, 1.057, -0.036), -0.059, -0.994, -0.089), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(0.054),
	ElbowR(0.301),
	WristL(),
	WristR(-6.415, 0, 63.132),
	ThumbL(11.66, 21.682, 21.682, 0, 0, TargetActor.Null, "Null"),
	IndexL(41.723, 41.592, 41.592, 0, 0, TargetActor.Null, "Null"),
	MidL(85, 14.948, 14.948, 0, 0, TargetActor.Null, "Null"),
	RingL(85, 27.106, 27.106, 0, 0, TargetActor.Null, "Null"),
	PinkyL(85, 25.121, 25.121, 0, 0, TargetActor.Null, "Null"),
	KneeL(-0.656),
	KneeR(-0.281),
	AnkleL(-13.25, 0, -9.635),
	AnkleR(43.593, 0, 1.324),
	SpineRot(10.725),
	Mouth(0, 0, 0, 0, 0, -0.008, 0.042, -0.023, -0.023, -0.014, -0.014, 0.055),
	Brows(-0.203, -0.092, 0.144, 0.034),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(-0.541, -0.541)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Vagina", TargetActor.Null, "", 0, 0, 0, 0, false, 0.888, 0.097, 0.817, 0.572, false, 0.25, 0.65, 1.25, 1.811, 1.2),
	Hips(WPos(0.049, 0.45, 0.459)),
	HipsRot(-35, -3.45, 1.45),
	Head(-0.122, 0.142, 0.982),
	HeadRot(53.175, 349.633, 2.727),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.415, -0.294, 0.414), 0.284, -0.955, -0.089)),
	FootR(WSurface(TPos(0.415, -0.251, 0.243), -0.001, -0.994, 0.112)),
	HandL(BoneMesh(TargetActor.A, "Bone_Calf_R", 0.804, 0.189), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	HandR(WSurface(WPos(0.258, 0.053, 1.061), 0.099, -0.994, 0.036), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(0.464),
	ElbowR(0.087),
	WristL(48.006, 0, -62.82),
	WristR(0, 0.048),
	KneeL(-0.583),
	KneeR(-0.627),
	AnkleL(-0.103, 0, 8.156),
	AnkleR(-5.671),
	SpineRot(),
	Mouth(),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
end