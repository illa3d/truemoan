function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "lunafreya", "primrose office")
actorB = Human(actorB, "black male", "leon s kennedy")

local point = MapPoint("map_seventh_heaven_xmas", Pos(-4.803, 0.031, 4.969), Rot(0, 0, 0), overridePos, overrideRot, function()
	Skybox("tm_arizona", 0, 0).Light("Model001_Material041", 0.45, 0.8, 3.487499).Light("Model001_Material056", 0.052, 1, 0.001).Light("Model001_Material091", -0.104, 0.6887497, 0.1).Light("Model001_Material274", 0.1, 0.3, 0.001).Light("Model001_Material371", 0.0315, 1, 0.256).Light("Model001_Material441", 0.6, 0.25, 5E-07).Light("Model001_Material630", 0, -0.09, 2E-07).Light("Model001_Material1506", 0.1, 0.5, 0.001).Light("Model001_Material1575", 0.109, 0.895, 4.765).Light("Model001_Material1612", 0.01000048, 0.5574997, 10).Light("Model001_Material1707", 0.6065, -0.92875, 0.046).Light("Bulb_04-3", 0.6, 0, 0.556).Light("Bulb_01-3", 0.15, 0, 0.556).Light("Bulb_02-3", 0, 0, 0.556).Light("Bulb_03-3", 0.3, 0, 0.556).Light("Flame-6", 0.02400005, 0.1237495, 0.6899996).Light("Neon Blue.002", 0.6, 0, 0.8150001).Light("WallsAndObjectsLight", 0, 0, 3E-06).Light("glass", 0.074, 0.8300009, 0.001)
	actorA.Material("Lunafreya_Torso", 0.997, -0.255, 0.13875, -0.06000002).Material("Lunafreya_Torso_Nipples", 0.9385002, -0.5624998, 0, 0).Material("Body", 0.997, -0.255, 0.13875, -0.06000002).Material("Head", 0.997, -0.255, 0.13875, -0.06000002).Material("HairLoose", 0.024, -0.9374998, 0, 0).Material("HairTied1", 0.8664997, -0.6599994, 0, 0).Material("Lingerie", 0.7315001, 0.0674997, -0.5087482, -1).Material("OfficeLady_Shirt", 0.1800001, -0.9525008, 0, 0)
	actorB.Material("ShirtsPart", 0, 0, -0.465, -0.0075)
end)
actorA.PlaceAt(Pos(-0.192, 0.116, 0.181), Rot(0, 122.819, 0), point)
actorB.PlaceAt(Pos(0.193, -0.116, -0.181), Rot(0, 307.621, 0), point)

actorA.Body("Body size", -0.07896727, "Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorB.Body("Penis size", -0.1508328, "Penis length", -0.06856787, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Nipples size", 0.3180024, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 1, "Fluid spread", 1.420524, "Fluid amount", -0.5, "Fluid force", 0.1055639)

actorA.Customize("Panties", 1, "Garter", 1, "Watch", 2, "Vest", 6, "Tie", 2, "Skirt", 1, "Heels", 2, "Hair", 1)
actorB.Customize("Watches", 1, "BeltBag", 2, "Boots", 1, "CottnBelt", 2, "Pants", 1, "Jacket", 3, "Gloves", 1, "Belt", 1)

PoseCam(Pos(1.869, 1.007, 0.926), Pos(-0.013, 1.161, 0.198), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 0.872, 0.093)),
	HipsRot(-35, 0, 1.525),
	Head(-0.003, 0.99, -0.142),
	HeadRot(342.391, 358.783, 358.507),
	EyeL(WorldPos(-4.059, 1.78, 4.627)),
	EyeR(WorldPos(-4.059, 1.78, 4.627)),
	FootL(WSurface(TPos(-0.579, 0.469, 0.114), 0.414, -0.791, -0.45)),
	FootR(WSurface(TPos(0.395, 0.573, -0.162), -0.615, -0.608, -0.502)),
	HandL(WSurface(WPos(-0.355, 0.866, -0.101), 0.222, -0.354, -0.909), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	HandR(WSurface(WPos(0.07, 0.832, -0.218), -0.805, 0.493, -0.33), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(0.43),
	ElbowR(),
	WristL(),
	WristR(),
	KneeL(-0.203),
	KneeR(-0.676),
	AnkleL(-1.447, 0, 39.897),
	AnkleR(34.532, 0, 38.809),
	SpineRot(),
	Mouth(),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Penis(TargetActor.A, "Vagina", TargetActor.Null, "", 0, 0, 0, 0, true, 0.5, 0.3, 0.9, 0.313, false, 0.25, 0.65, 1.25, 1.851, 1.2),
	Hips(WPos(-0.001, 1.025, 0.165)),
	HipsRot(-0.4, 0, 3.625),
	Head(0, 0.984, -0.177),
	HeadRot(356.027, 2.473, 350.472),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.43, 0.187, 0.247), 0, -1, 0.004)),
	FootR(WSurface(TPos(0.247, 0.299, -0.076), 0.072, -0.001, 0.997)),
	HandL(BoneMesh(TargetActor.A, "Bone_Spine", 0.557, 0.489), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Spine"),
	HandR(BoneMesh(TargetActor.A, "Bone_Chest", 0.007, -0.402), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Chest"),
	ElbowL(),
	ElbowR(),
	WristL(),
	WristR(),
	KneeL(),
	KneeR(0.236),
	AnkleL(2.564),
	AnkleR(6.722),
	SpineRot(),
	Mouth(),
	Brows(),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
end