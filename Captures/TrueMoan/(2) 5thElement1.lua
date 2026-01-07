function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "leon s kennedy", "dante")
actorB = Human(actorB, "jill valentine", "panam")

local point = MapPoint("map_quietscell", Pos(7.974, 0.019, 5.757), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(1.485999, -140.5501).Skybox("tm_arizona", 0.4274999, -0.3489749).Light("room_lights02_df.002", 0, 0, 10).Light("room_lights_01", -0.3559996, 0.7562499, 9.579998).Light("room_lights_02", -0.3559996, 0.7562499, 9.579998).Light("room_lights_03", -0.3559996, 0.7562499, 9.579998)
	actorA.Material("Hair", 0.01350037, 0.2100001, 0, 0).Material("Coat", 0.1260002, -0.345, 0, 0).Material("CoatParts", 0.1200002, -0.4200001, 0, 0).Material("Shirt", 0.02399965, 2.339999, 0, 0)
	actorB.Material("Jill_Torso", 0, 0, 0.015, -0.02250008).Material("Jill_Face", 0, 0, 0.015, -0.02250008).Material("Jill_Hair", 0.01600114, 2.369998, 0, 0).Material("Belt", 0.02100001, 2.437499, 0, 0).Material("Jacket", 0.03900001, 1.7925, 0, 0).Material("Pants", 0.04900037, 2.8125, 0, 0)
end)
actorA.PlaceAt(Pos(0.072, 0.023, -0.158), Rot(0, 315.125, 0), point)
actorB.PlaceAt(Pos(-0.072, -0.024, 0.158), Rot(0, 274.327, 0), point)

actorA.Body("Body size", -0.05000001, "Fluid speed", 0.09)
actorB.Body("Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.09999999, "Muscle tone", 0.3, "Fluid speed", 0.09)

actorB.Customize("Shirt", 1, "Gloves", 1)

PoseCam(Pos(-2.159, 1.414, 0.024), Pos(-0.184, 1.229, 0.064), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(0, 1),
	HipsRot(19.1, 2.775, 4.75),
	Head(-0.001, 0.987, -0.159),
	HeadRot(345.531, 327.503, 359.028),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.11, -0.006, 0.027), 0, -1)),
	FootR(WSurface(TPos(0.196, -0.006, 0.032), 0, -1)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Hips", -0.217, 0.522, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	HandR(BoneMesh(TargetActor.A, "Bone_Hips", 0.529, -0.809, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	ElbowL(),
	ElbowR(),
	WristL(-45.379, 0, -83.202),
	WristR(),
	KneeL(),
	KneeR(),
	SpineRot(-18.525),
	Mouth(-0.271, 0.225, 0, -0.215, -0.215, -0.076, -0.076, 0.777, 0.554, 0.968, 1),
	Brows(0.731, 0.731),
	EyelidL(-0.12),
	EyelidR(-0.12),
	Cheeks(-0.452, -0.452)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(0, 1),
	HipsRot(17.75, -0.3, 17.5),
	Head(-0.001, 0.987, -0.159),
	HeadRot(0.193, 350.413, 7.84),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.11, -0.006, 0.027), 0, -1)),
	FootR(WSurface(TPos(0.196, -0.006, 0.032), 0, -1)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Thigh_L", 0.183, 0.24, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	HandR(HPos(0.353, 0.205, 0.387), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(15.898, 0, 0, 0, 0, TargetActor.Null, "Null"),
	IndexR(5.13, 0, 0, 4.598, 0, TargetActor.Null, "Null"),
	MidR(5.834, 0, 0, 0, 0, TargetActor.Null, "Null"),
	RingR(0.23, 0, 0, -3.099, 0, TargetActor.Null, "Null"),
	PinkyR(-9.556, 8.52, 8.52, -10.753, 0, TargetActor.Null, "Null"),
	ElbowL(),
	ElbowR(),
	WristL(),
	WristR(6.467, 0, -20.477),
	KneeL(),
	KneeR(),
	SpineRot(-10.875),
	Mouth(-0.243, 0.273, 0, 0.295, 0.295, -0.065, -0.065, 1, 0.375, 1, 0.947),
	Brows(0.64, 0.64, 0.375, 0.375),
	EyelidL(-0.034),
	EyelidR(-0.034),
	Cheeks(1, 1)
)
end