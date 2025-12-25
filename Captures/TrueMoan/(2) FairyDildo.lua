function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "eva")
actorB = Human(actorB, "shadowheart")

local point = MapPoint("ff7_tifa's apartment", Pos(0.656, 0.686, -1.056), Rot(0, 0, 0), overridePos, overrideRot, function()
	Skybox("tm_arizona", 0, 0).Light("Submesh_35_Apartment_01_7thSlum", 0.1, 0.3, 3.5E-06).Light("LampA", 0.05, 0.35, 2.640001).Light("Submesh_139_SmallTable_01_7thSlum", 0.05, 0.3, 1.5E-06)
end)
actorA.PlaceAt(Pos(0.381, -0.212, -0.052), Rot(0, 269.125, 0), point)
actorB.PlaceAt(Pos(-0.382, 0.213, 0.052), Rot(0, 17.276, 0), point)

actorA.Body("Penis size", 2.384186E-07, "Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.09999999, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Fluid speed", 0.09)
actorB.Body("Penis size", 8, "Body size", -0.9, "Fluid speed", 0.09)

actorA.Customize("Bra", 1, "Bikini", 1, "Gloves", 1, "Boots", 1, "Belt", 2)
actorB.Customize("Pants", 1, "EvilCirclet", 1, "Boots", 1, "Armor", 4, "Accessories", 1, "Penis", 1)

PoseCam(Pos(-0.925, 0.507, 1.982), Pos(0.207, -0.038, -0.205), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(-0.012, 0.153, -0.058)),
	HipsRot(-3.35, 45.825, -15.25),
	Head(0.05, 0.798, -0.6),
	HeadRot(2.19, 22.549, 341.148),
	EyeL(BoneMesh(TargetActor.A, "Bone_Thigh_L", 0.065, -0.168)),
	EyeR(BoneMesh(TargetActor.A, "Bone_Thigh_L", 0.065, -0.168)),
	FootL(WSurface(TPos(-0.574, -0.61, 0.34), 0.024, -1, 0.001)),
	FootR(WPos(0.493, -0.171, 0.335)),
	HandL(HPos(0.133, -0.42, 0.688), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(15.922, 0, 0, 0, 0, TargetActor.Null, "Null"),
	IndexL(30.723, 22.933, 22.933, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(35.007, 27.729, 27.729, 0, 0, TargetActor.Null, "Null"),
	PinkyL(47.231, 45.418, 45.418, 0, 0, TargetActor.Null, "Null"),
	HandR(WSurface(WPos(0.356, -0.052, -0.49), -0.455, -0.89, 0.034), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(0.159),
	ElbowR(0.161),
	WristL(-29.501, 0, -64.495),
	WristR(-32.087, -67.642, -35.858),
	KneeL(0.514),
	KneeR(0.021),
	AnkleL(-2.491, 0, 38.233),
	AnkleR(-23.198),
	SpineRot(),
	Mouth(-0.641, -0.243, 0, 0.374, 0.374, -0.043, -0.043, -0.509, -0.509, -0.612, -0.612),
	Brows(1, 1, 1, 1),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(-1, -1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(0, 1),
	HipsRot(20.3, 0, 3.775),
	Head(-0.001, 0.987, -0.159),
	HeadRot(353.263, 40.324, 353.806),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.11, -0.006, 0.027), 0, -1)),
	FootR(WSurface(TPos(0.196, -0.006, 0.032), 0, -1)),
	HandL(HPos(-0.619, 0.588, -0.065), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(15.922, 0, 0, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.187, 0.918, 0.222), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(),
	ElbowR(0.343),
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
end