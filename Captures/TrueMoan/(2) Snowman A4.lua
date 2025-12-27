function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "lunafreya", "primrose office")
actorB = Human(actorB, "black male", "leon s kennedy")

local point = MapPoint("map_seventh_heaven_xmas", Pos(-4.633, -0.007, 4.971), Rot(0, 0, 0), overridePos, overrideRot, function()
	Skybox("tm_arizona", 0, 0).Light("Model001_Material041", 0.45, 0.8, 3.487499).Light("Model001_Material056", 0.052, 1, 0.001).Light("Model001_Material091", -0.104, 0.6887497, 0.1).Light("Model001_Material274", 0.1, 0.3, 0.001).Light("Model001_Material371", 0.0315, 1, 0.256).Light("Model001_Material441", 0.6, 0.25, 5E-07).Light("Model001_Material630", 0, -0.09, 2E-07).Light("Model001_Material1506", 0.1, 0.5, 0.001).Light("Model001_Material1575", 0.109, 0.895, 4.765).Light("Model001_Material1612", 0.01000048, 0.5574997, 10).Light("Model001_Material1707", 0.6065, -0.92875, 0.046).Light("Bulb_04-3", 0.6, 0, 0.556).Light("Bulb_01-3", 0.15, 0, 0.556).Light("Bulb_02-3", 0, 0, 0.556).Light("Bulb_03-3", 0.3, 0, 0.556).Light("Flame-6", 0.02400005, 0.1237495, 0.6899996).Light("Neon Blue.002", 0.6, 0, 0.8150001).Light("WallsAndObjectsLight", 0, 0, 3E-06).Light("glass", 0.074, 0.8300009, 0.001)
	actorA.Material("Lunafreya_Torso", 0.997, -0.255, 0.13875, -0.06000002).Material("Lunafreya_Torso_Nipples", 0.9385002, -0.5624998, 0, 0).Material("Body", 0.997, -0.255, 0.13875, -0.06000002).Material("Head", 0.997, -0.255, 0.13875, -0.06000002).Material("HairLoose", 0.024, -0.9374998, 0, 0).Material("HairTied1", 0.8664997, -0.6599994, 0, 0).Material("Lingerie", 0.7315001, 0.0674997, -0.5087482, -1).Material("OfficeLady_Shirt", 0.1800001, -0.9525008, 0, 0)
	actorB.Material("ShirtsPart", 0, 0, -0.465, -0.0075)
end)
actorA.PlaceAt(Pos(-0.287, -0.09, 0.143), Rot(0, 122.594, 0), point)
actorB.PlaceAt(Pos(0.286, 0.09, -0.144), Rot(0, 326.672, 0), point)

actorA.Body("Body size", -0.07896727, "Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorB.Body("Penis size", -0.1508328, "Penis length", -0.06856787, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Nipples size", 0.3180024, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 1, "Fluid spread", 1.420524, "Fluid amount", -0.5, "Fluid force", 0.1055639)

actorA.Customize("Panties", 1, "Garter", 1, "Watch", 2, "Vest", 6, "Tie", 2, "Skirt", 1, "Heels", 2)
actorB.Customize("Watches", 1, "BeltBag", 2, "Boots", 1, "CottnBelt", 2, "Pants", 1, "Jacket", 3, "Gloves", 1, "Belt", 1)

PoseCam(Pos(1.756, 0.97, 0.512), Pos(-0.314, 0.906, 0.007), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.018, 1.073, 0.111)),
	HipsRot(-2.8, 0, 1.15),
	Head(-0.033, 0.103, 0.994),
	HeadRot(358.059, 333.477, 355.361),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.461, 0.57, 0.273), 0, -1, -0.002)),
	FootR(WSurface(TPos(0.644, 0.689, -0.042), 0, -1, -0.002)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Hips", 0.601, 0.596), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	HandR(BoneMesh(TargetActor.A, "Bone_Hips", 0.306, 0.4), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	ElbowL(),
	ElbowR(0.286),
	WristL(),
	WristR(),
	KneeL(),
	KneeR(-0.437),
	AnkleL(17.175, 0, 40),
	AnkleR(12.338, 0, 38.809),
	SpineRot(-38.85),
	Mouth(),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Mouth", TargetActor.Null, "", 0.418, 358.94, 17.38, 0, true, 0.398, 0.1, 1.104, 0.142, false, 0.25, 0.65, 1.25, 1.2, 1.2),
	Hips(WPos(-0.003, 1.022, -0.167)),
	HipsRot(-35, -0.45, -6.5),
	Head(0.006, 0.944, 0.33),
	HeadRot(356.908, 359.26, 3.669),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.349, 0.04, 0.214), -0.001, -1, 0.004)),
	FootR(WSurface(TPos(0.285, 0.039, 0.108), -0.001, -1, 0.004)),
	HandL(BoneMesh(TargetActor.A, "Bone_Chest", 0.377, 0.584), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	HandR(BoneMesh(TargetActor.A, "Bone_Head", 1.811, -0.616), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Head"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Head"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Head"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Head"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Head"),
	ElbowL(),
	ElbowR(),
	WristL(),
	WristR(),
	KneeL(),
	KneeR(-0.435),
	AnkleL(21.885),
	AnkleR(-35.898),
	SpineRot(),
	Mouth(),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
end