function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "lunafreya", "primrose office")
actorB = Human(actorB, "black male", "leon s kennedy")

local point = MapPoint("map_seventh_heaven_xmas", Pos(-5.174, 0.003, 3.658), Rot(0, 0, 0), overridePos, overrideRot, function()
	Skybox("tm_arizona", 0, 0).Light("Model001_Material041", 0.45, 0.8, 3.487499).Light("Model001_Material056", 0.052, 1, 0.001).Light("Model001_Material091", -0.104, 0.6887497, 0.1).Light("Model001_Material274", 0.1, 0.3, 0.001).Light("Model001_Material371", 0.0315, 1, 0.256).Light("Model001_Material441", 0.6, 0.25, 5E-07).Light("Model001_Material630", 0, -0.09, 2E-07).Light("Model001_Material1506", 0.1, 0.5, 0.001).Light("Model001_Material1575", 0.109, 0.895, 4.765).Light("Model001_Material1612", 0.01000048, 0.5574997, 10).Light("Model001_Material1707", 0.6065, -0.92875, 0.046).Light("Bulb_04-3", 0.6, 0, 0.556).Light("Bulb_01-3", 0.15, 0, 0.556).Light("Bulb_02-3", 0, 0, 0.556).Light("Bulb_03-3", 0.3, 0, 0.556).Light("Flame-6", 0.02400005, 0.1237495, 0.6899996).Light("Neon Blue.002", 0.6, 0, 0.8150001).Light("WallsAndObjectsLight", 0, 0, 3E-06).Light("glass", 0.074, 0.8300009, 0.001)
	actorA.Material("Lunafreya_Torso", 0.0075, -0.2924998, 0, 0).Material("Lunafreya_Torso_Nipples", 0.0045, -0.3899999, 0, 0).Material("Body", 0.0075, -0.2924998, 0, 0).Material("Head", 0.0075, -0.2924998, 0, 0).Material("HairLoose", 0.9744999, -1.175001, 0, 0).Material("HairTied1", 0.8664997, -0.6599994, 0, 0).Material("Lingerie", 0.7315001, 0.0674997, -0.5087482, -1).Material("OfficeLady_Shirt", 0.1800001, -0.9525008, 0, 0)
	actorB.Material("ShirtsPart", 0, 0, -0.465, -0.0075)
end)
actorA.PlaceAt(Pos(-0.046, 0.03, -0.479), Rot(0, 15.42, 0), point)
actorB.PlaceAt(Pos(0.046, -0.03, 0.478), Rot(0, 188.897, 0), point)

actorA.Body("Body size", -0.07896727, "Breasts size", -0.8, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 0.09)
actorB.Body("Penis size", 0.03239369, "Penis length", 0.04984331, "Ass size", -1, "Hips size", -0.2, "Thigh size", -0.2, "Calf size", -0.1, "Nipples size", 0.3180024, "Upper arms size", -0.09999999, "Forearms size", -0.1, "Muscle tone", 0.3, "Fluid speed", 1, "Fluid spread", 1.420524, "Fluid amount", -0.5, "Fluid force", 0.1055639)

actorA.Customize("Panties", 1, "Garter", 1, "Watch", 2, "Vest", 6, "Tie", 2, "Skirt", 1, "Heels", 2, "Hair", 1)
actorB.Customize("Watches", 1, "BeltBag", 2, "Boots", 1, "CottnBelt", 2, "Pants", 1, "Jacket", 3, "Gloves", 1, "Belt", 1)

PoseCam(Pos(-1.112, 0.237, 0.297), Pos(0.122, 0.49, -0.362), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.003, 0.256, 0.05)),
	HipsRot(-35, -16.425, -25),
	Head(0.307, 0.947, -0.095),
	HeadRot(342.896, 311.16, 5.815),
	EyeL(BoneMesh(TargetActor.A, "Bone_Head", 0.966, 0.01)),
	EyeR(BoneMesh(TargetActor.A, "Bone_Head", 0.966, 0.01)),
	FootL(WSurface(TPos(-0.447, 0.057, -0.049), -0.004, -1, 0.001)),
	FootR(WPos(-0.289, 0.11, 0.268)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Chest", -0.277, -0.176), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	HandR(WSurface(WPos(0.257, 0.041, 0.063), -0.004, -1, 0.001), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(-1),
	ElbowR(0.252),
	WristL(),
	WristR(),
	KneeL(-0.856),
	KneeR(-0.496),
	AnkleL(15.715, 0, -6.341),
	AnkleR(12.208, 0, -10),
	SpineRot(),
	Mouth(-0.699, 0.258, 0, 0.001, 0, 0, 0, 0.334, 0.059, -0.982, 0.691),
	Brows(0.036),
	EyelidL(),
	EyelidR(),
	Cheeks(1, 1)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0.001, 0.36, 0.158)),
	HipsRot(-29.75, 0, -3.375),
	Head(0.013, 0.569, 0.822),
	HeadRot(8.304, 5.513, 325.566),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WPos(0.234, 0.04, 0.374)),
	FootR(WPos(-0.197, 0.039, 0.299)),
	HandL(BoneMesh(TargetActor.A, "Bone_Calf_R", -0.687, 0.517), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Calf_R"),
	HandR(BoneMesh(TargetActor.A, "Bone_Hips", 0.996, -0.281), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Hips"),
	ElbowL(-1),
	ElbowR(-1),
	WristL(),
	WristR(-15.258, 43.782, 34.622),
	MidR(85, 0, 0, 0, 0, TargetActor.Null, "Null"),
	RingR(85, 0, 0, 0, 0, TargetActor.Null, "Null"),
	PinkyR(14.822, 28.262, 28.262, -20, 0, TargetActor.Null, "Null"),
	KneeL(-0.408),
	KneeR(-0.498),
	AnkleL(2.564),
	AnkleR(6.722),
	SpineRot(31.65),
	Mouth(),
	Brows(-0.967, -0.967),
	EyelidL(),
	EyelidR(),
	Cheeks()
)
end