function Anim_Name(actorA, actorB, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "Succubus")
actorB = Human(actorB, "Succubus")

local point = MapPoint("Map_Bedroom", Pos(2.001, 0, -1.385), Rot(0, 0, 0), overridePos, overrideRot)
actorA.PlaceAt(Pos(0.273, 0, 0.004), Rot(0, 267.25, 0), point)
actorB.PlaceAt(Pos(-0.273, 0, -0.003), Rot(0, 92.051, 0), point)

actorA.Body("Penis size", 1.192093E-07)
actorB.Body("Penis size", 0)

actorB.Customize("Clothes", 1, "Penis", 1)

PoseCam(Pos(-0.681, 1.884, -1.287), Pos(0.073, 0.829, -0.064), MapPoint("Map_Bedroom", Pos(2.001, 0, -1.385), Rot(0, 0, 0), overridePos, overrideRot))

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA, actorB).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 0.339, 0.22)),
	HipsRot(18.95, 0, -0.65),
	Head(0, 0.984, -0.179),
	HeadRot(339.125, 0.561, 358.715),
	EyeL(BoneMesh(TargetActor.A, "Bone_Spine", 0.206, -0.115, 0.03)),
	EyeR(BoneMesh(TargetActor.A, "Bone_Spine", 0.206, -0.115, 0.03)),
	FootL(WSurface(TPos(-0.125, -0.064, -0.096), 0, -1)),
	FootR(WSurface(TPos(0.124, -0.064, -0.102), 0, -1)),
	HandL(BoneMesh(TargetActor.A, "Bone_Thigh_R", 0.599, -0.106, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	IndexL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	MidL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	RingL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_R"),
	HandR(BoneMesh(TargetActor.A, "Bone_Thigh_L", 0.726, -0.021, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	IndexR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	MidR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	RingR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.A, "Bone_Thigh_L"),
	Brows(0.312, 0.312, 0.31, 0.31),
	Cheeks(0.767, 0.767),
	ElbowL(0.26),
	ElbowR(-0.149),
	KneeL(-0.099),
	KneeR(-0.195),
	Mouth(0, 0.197, 0, 0.384, 0.384, 0, 0, 0.833, 0.833, 0.438, 0.438)
)
NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorB, actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(WPos(0, 0.964, -0.003)),
	HipsRot(1.75),
	Head(0, 0.998, -0.065),
	HeadRot(30.28, 1.281, 10.755),
	FootL(WSurface(TPos(-0.326, -0.067, -0.052), 0, -1)),
	FootR(WSurface(TPos(0.289, -0.067, 0.046), 0, -1)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Thigh_L", 0.221, 0.138, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.293, -0.544, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	KneeL(-0.43),
	KneeR(-0.178)
)
end
