function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "tachy")
actorB = Human(actorB, "dante", "scarlet")

local point = MapPoint("map_bedroom", Pos(-0.083, 0.185, -2.315), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(1.710999, -3.900002).Skybox("tm_seaside_sunset", -0.4950001, 0.2178007).Light("5_-l1off_0.5_0_0", 0.65, 0, 1.5E-06).Light("5_-l2off_0.5_0_0", 0.01000013, 0.2800002, 0.106).Light("5_-l2off_0.5_0_0_0002", 0.1, 0, 1.2E-07).Light("5_-l3off_0.5_0_0", 0.03399998, 0.3849996, 0.1810002).Light("5_-l3off_0.5_0_01", 0.1, -0.05, 1.5E-07).Light("5_-l3off_0.5_0_02", 0.1, -0.05, 1.5E-07).Light("5_-l3off_0.5_0_03", 0.004000009, 1, 0.3085).Light("5_-l3off_0.5_0_04", 0.003999971, 0.9887499, 0.3985).Light("5_-l3off_0.5_0_05", 0.05049996, 0.3175003, 1.734999E-07)
	actorA.Material("Tachy_Torso", 0, 0, 0.00375, 0.1237499).Material("Tachy_Torso_Nipples", 0.012, -0.2924999, 0, 0).Material("Head", 0, 0, 0.00375, 0.1237499).Material("Body", 0, 0, 0.00375, 0.1237499)
end)
actorA.PlaceAt(Pos(-0.192, -0.569, -0.055), Rot(0, 62.051, 0), point)
actorB.PlaceAt(Pos(0.192, 0.568, 0.054), Rot(0, 249.777, 0), point)

actorA.Body("Body size", -0.07499999, "Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.4, "Calf size", -0.1, "Nipples size", -5, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorB.Body("Penis size", 0.0847435, "Penis length", -0.0299288, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.4, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Fluid speed", 0.1329772, "Fluid spread", 0.7845242, "Fluid amount", -0.2922009, "Fluid force", 0.1037914)

actorA.Customize("Suit", 6, "Neckguard", 1, "HipGears", 1, "Gloves", 1)
actorB.Customize("Ring", 1, "Necklace", 1, "Heels", 2, "Dress", 3, "Corset", 3, "Bracelet", 1)

PoseCam(Pos(-0.843, 2.104, 1.051), Pos(-0.603, 1.385, 0.293), point, 1, Rot(59.222, 246.236, 0.001))

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.015, 1.132, -0.134)),
	HipsRot(-33.8, -1.65, 0.425),
	Head(-0.04, 0.078, -0.996),
	HeadRot(285.646, 4.399, 14.223),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WPos(-0.098, 1.678, -0.12)),
	FootR(WPos(0.118, 1.721, -0.118)),
	HandL(WSurface(WPos(-0.172, 1.148, -0.752), -0.098, -0.994, 0.044), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.375, -0.073), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	ElbowL(0.29),
	ElbowR(0.131),
	WristL(),
	WristR(34.074, 0, -79.056),
	KneeL(-0.668),
	KneeR(-0.668),
	AnkleL(18.474),
	AnkleR(6.378),
	SpineRot(),
	Mouth(-0.353, -0.078, 0, 0.097, 0.097, -0.542, -0.573, 0.239, 0.239, 0.289, 0.289, 0.207),
	Brows(1, 1, 0.075, 0.216),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Anus", TargetActor.Null, "", 0, 0, 0, 0, true, 0.86, 0.162, 0.95, 0.14, false, 0.25, 0.65, 1.25, 2.634, 1.2),
	Hips(WPos(0.004, 0.167, 0.195)),
	HipsRot(-35, 0, 1.45),
	Head(-0.004, 0.983, 0.183),
	HeadRot(356.908, 359.26, 3.669),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WPos(-0.243, -0.081, -0.191)),
	FootR(WPos(0.184, -0.027, -0.221)),
	HandL(BoneMesh(TargetActor.A, "Bone_Calf_R", 0.714, -0.021, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	HandR(BoneMesh(TargetActor.A, "Bone_Calf_L", 0.869, 0.372, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_L"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_L"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_L"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_L"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_L"),
	ElbowL(),
	ElbowR(-0.97),
	WristL(-27.171, 0, -36.479),
	WristR(0, 0.048),
	KneeL(-0.583),
	KneeR(-0.666),
	AnkleL(0, 0, 8.156),
	AnkleR(25.409),
	SpineRot(),
	Mouth(),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
end