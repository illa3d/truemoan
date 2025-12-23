function Anim_Name(actorA, actorB, actorC, actorD, actorE, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "panam")
actorB = Human(actorB, "black male")
actorC = Human(actorC, "black male")
actorD = Human(actorD, "black male")
actorE = Human(actorE, "black male")

local point = MapPoint("map_seventh_heaven_xmas", Pos(-3.586, -0.133, 2.615), Rot(0, 0, 0), overridePos, overrideRot, function()
	Skybox("tm_arizona", 0, 0).Light("Wand-1", 0.09, 0, 1.0575).Light("Model001_Material274", 0.1, 0.3, 0.001).Light("Model001_Material371", -0.042, 1, 0.2035).Light("Model001_Material441", 0.6, 0.25, 5E-07).Light("Model001_Material630", 0, -0.09, 2E-07).Light("Model001_Material1506", 0.1, 0.5, 4).Light("Bulb_04-3", 0.6, 0, 1.6525).Light("Bulb_01-3", 0.15, 0, 1.6525).Light("Bulb_02-3", 0, 0, 1.6525).Light("Bulb_03-3", 0.3, 0, 1.6525).Light("Flame-6", 0, 0, 0.6825003).Light("Neon Blue.002", 0.6, 0, 0.3425).Light("WallsAndObjectsLight", 0, 0, 3E-06).Light("glass", 0.074, 0.8300009, 0.8935003)
	actorA.Material("Panam_Torso", 0.009000001, 0.075, 0, 0).Material("Panam_Torso_Nipples", 0.9894999, -0.2025, 0, 0).Material("Head", 0.009000001, 0.075, 0, 0).Material("Body", 0.009000001, 0.075, 0, 0)
	actorB.Material("Black Male_Torso", 0, 1.5, 0, 1).Material("Head", 0, 1.5, 0, 1).Material("Body", 0, 1.5, 0, 1)
	actorC.Material("Black Male_Torso", 0.117, 2, 1, 1).Material("Head", 0.117, 2, 1, 1).Material("Body", 0.117, 2, 1, 1)
	actorD.Material("Black Male_Torso", 0.99, 2.25, 0.2, 0.5).Material("Head", 0.99, 2.25, 0.2, 0.5).Material("Body", 0.99, 2.25, 0.2, 0.5)
	actorE.Material("Black Male_Torso", 0, 0, 0, 0.1500001).Material("Head", 0, 0, 0, 0.1500001).Material("Body", 0, 0, 0, 0.1500001)
end)
actorA.PlaceAt(Pos(-0.403, -0.169, -0.275), Rot(0, 64.327, 0), point)
actorB.PlaceAt(Pos(0.253, -0.251, 0.132), Rot(0, 227.902, 0), point)
actorC.PlaceAt(Pos(0.662, 0.152, -0.273), Rot(0, 330.654, 0), point)
actorD.PlaceAt(Pos(-0.662, 0.251, -0.523), Rot(0, 59.827, 0), point)
actorE.PlaceAt(Pos(-0.052, 0.216, 0.522), Rot(0, 143.827, 0), point)

actorA.Body("Body size", -0.08647656, "Breasts size", -1, "Ass size", -1, "Thigh size", -0.1801258, "Fluid speed", 0.09, "Fluid spread", 9.463551, "Fluid amount", 2, "Fluid force", 1, "Fluid gravity", 2)
actorB.Body("Penis size", 0.1836824, "Penis length", -0.1256609, "Ass size", -0.5, "Hips size", -0.09999999, "Thigh size", -0.1, "Calf size", -0.05, "Upper arms size", -0.05, "Forearms size", -0.05, "Muscle tone", 0.2, "Fluid speed", 1, "Fluid spread", 5.474123, "Fluid amount", -0.5, "Fluid force", 0.6013478, "Fluid gravity", 0.5562136)
actorC.Body("Penis size", 0.1218138, "Penis length", -0.2317216, "Fluid speed", 1, "Fluid spread", 6.584224, "Fluid amount", -0.5, "Fluid force", 0.4129006, "Fluid gravity", 0.2153044)
actorD.Body("Penis size", 0.2941461, "Penis length", 0.0249145, "Ass size", 0.138497, "Hips size", -0.09999999, "Thigh size", -0.1, "Calf size", -0.1675926, "Upper arms size", -0.05, "Forearms size", 0.004647404, "Muscle tone", 0.2, "Fluid speed", 1, "Fluid spread", 2.467466, "Fluid amount", -0.5, "Fluid force", 0.4631531, "Fluid gravity", 0.08269215)
actorE.Body("Penis size", -0.07480061, "Penis length", 0.06978691, "Fluid speed", 1, "Fluid spread", 5.161907, "Fluid amount", -0.5, "Fluid force", 0.337522)

actorA.Customize("Shoes", 1, "Shirt", 1, "Pants", 1, "Jacket", 1, "Gloves", 1, "Belt", 1)

PoseCam(Pos(2.939, 1.347, 2.094), Pos(0.333, 1.052, 0.58), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.001, 0.832, 0.421)),
	HipsRot(13.6, 0, 4.45),
	Head(-0.312, 0.798, 0.515),
	HeadRot(338.194, 323.943, 52.678),
	EyeL(EyeContact(TargetActor.A)),
	EyeR(EyeContact(TargetActor.A)),
	FootL(WSurface(TPos(-0.488, 0.449, 0.677), -0.004, -1, 0.002)),
	FootR(WSurface(TPos(0.464, 0.409, 0.742), -0.004, -1, 0.002)),
	HandL(HPos(0.089, 0.448, 0.286), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(19.895, 0, 0, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.147, 0.553, 0.404), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(-0.627),
	ElbowR(),
	WristL(),
	WristR(-10.45, 0, -33.098),
	KneeL(-0.266),
	KneeR(-0.104),
	AnkleL(40.081, 0, 40),
	AnkleR(8.882, 0, 0.137),
	SpineRot(-35.25),
	Mouth(-0.418, -0.426, 0, 0.384, 0.384, -0.154, -0.154, 0.017, 0.017, -0.424, -0.424),
	Brows(0.967, 0.967, -0.937, -0.937),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Vagina", TargetActor.Null, "", 0, 0, 0, 0, true, 0.2, 0.3, 0.9, 0.2, false, 0.25, 0.65, 1.25, 1.251, 1.2),
	Hips(WPos(-0.025, 0.557, 0.212)),
	HipsRot(-35, 0.375, 10.275),
	Head(0.054, 0.151, -0.987),
	HeadRot(285.322, 34.328, 334.348),
	EyeL(BoneMesh(TargetActor.A, "Bone_Thigh_L", 0.043, 0.914, 0.03)),
	EyeR(BoneMesh(TargetActor.A, "Bone_Thigh_L", 0.043, 0.914, 0.03)),
	FootL(WSurface(TPos(-0.332, 0.528, 1.059), 0.003, -1, -0.003)),
	FootR(WPos(0.444, 0.555, 0.857)),
	HandL(BoneMesh(TargetActor.A, "Bone_Thigh_R", 1.368, 0.217), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	HandR(BoneMesh(TargetActor.A, "Bone_Calf_L", 0.421, -0.293), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_L"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_L"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_L"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_L"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_L"),
	ElbowR(-0.676),
	WristL(-11.435, 0, 34.965),
	WristR(30.081, 0, -115.565),
	KneeL(-0.695),
	KneeR(-0.824),
	AnkleL(-12.328),
	AnkleR(4.651),
	SpineRot(-12.075),
	Mouth(0, 0, 0, 0.875, 0.875, -0.319, -0.319, 0.833, 0.833, 0.438, 0.438),
	Brows(-0.001, -0.001, -0.256, -0.256),
	Cheeks(-0.825, -0.825)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorC, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.Null, "", TargetActor.A, "Hand_R", 0.5, 12.659, 351.643, 0, false, 1, 0.3, 1, 0.2, true, 0.152, 1, 0.206, 1.2, 1.412),
	Hips(WPos(-0.016, 0.919, 0.1)),
	HipsRot(-15.275, -0.3, -7.475),
	Head(-0.232, 0.972, -0.022),
	HeadRot(29.813, 23.068, 23.878),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.522, 0.043, 0.284), 0.001, -1, 0.004)),
	FootR(WSurface(TPos(0.015, 0.053, 0.093), -0.002, -1, 0.004)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Head", 1.918, -0.321), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.474, -0.561), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	ElbowR(-0.412),
	WristL(),
	WristR(),
	KneeL(-0.321),
	KneeR(-0.508),
	AnkleL(-9.837),
	AnkleR(10.348),
	SpineRot(),
	Mouth(-0.323, -0.02, 0, 0.384, 0.384, 0, 0, -0.292, -0.292, -1, -1),
	Brows(1, 1),
	EyelidL(1),
	EyelidR(1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorD, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Anus", TargetActor.Null, "", 0, 0, 0, 0, true, 0.2, 0.1, 1.3, 0.5, false, 0.25, 0.65, 1.25, 1.251, 1.2),
	Hips(WPos(-0.02, 0.497, 0.482)),
	HipsRot(0, 0.075),
	Head(0.05, 0.989, 0.14),
	HeadRot(344.649, 346.74, 14.962),
	EyeL(BoneMesh(TargetActor.A, "Bone_Head", 1.063, -0.358, 0.03)),
	EyeR(BoneMesh(TargetActor.A, "Bone_Head", 1.063, -0.358, 0.03)),
	FootL(WSurface(TPos(-0.19, -0.014, 0.064), -0.003, -1, 0.003)),
	FootR(WSurface(TPos(0.114, -0.003, -0.028), -0.004, -1, 0.002)),
	HandL(BoneMesh(TargetActor.A, "Bone_Hips", -0.25, 0.715, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	HandR(BoneMesh(TargetActor.A, "Bone_Spine", 0.433, 0.549, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	WristL(-48.87, 0, 44.59),
	WristR(-12.847, 7.89, 3.266),
	KneeL(-0.204),
	KneeR(-0.226),
	AnkleL(-2.171),
	AnkleR(-12.093),
	SpineRot(),
	Mouth(-0.26, 0.013, 0, 0.384, 0.384, -1, -1, -0.035, -0.035, -1, -1),
	Brows(1, 1, -0.048, -0.048)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorE, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Mouth", TargetActor.A, "Hand_L", 0.35, 341.865, 45.758, 0, true, 0.51, 0.1, 0.939, 0.082, false, 0.431, 1, 0.001, 1, 1.807),
	Hips(WPos(0.008, 0.896, 0.087)),
	HipsRot(-20.825, 5.325, -13.175),
	Head(-0.006, 0.992, 0.124),
	HeadRot(32.216, 9.538, 15.569),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.029, -0.016, 0.05), 0.001, -1, -0.004)),
	FootR(WSurface(TPos(0.582, -0.05, 0.057), -0.003, -1, -0.003)),
	HandL(HPos(-0.283, -0.906, 0.096), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Spine", 0.291, 0.11, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Spine"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Spine"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Spine"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Spine"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Spine"),
	KneeR(-0.433),
	SpineRot(6.3),
	Mouth(-0.397, 0.051, 0, 0.384, 0.384, -0.679, -0.679, -0.117, -0.117, 0.533, 0.533),
	Brows(-1, -1, 0.036, 0.036)
)
end