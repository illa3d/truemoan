function Anim_Name(actorA, fadeTime, overridePos, overrideRot)
actorA = Human(actorA, "panam")

local point = MapPoint("map_island", Pos(-0.271, 8.53, -0.166), Rot(0, 0, 0), overridePos, overrideRot, function()
	Sun(7.862496, 105.9).Skybox("nightsky", 5, -0.303075)
end)
actorA.PlaceAt(Pos(0, 0, 0), Rot(0, 92.052, 0), point)

actorA.Body("Fluid speed", 0.09)

PoseCam(Pos(3.417, 2.025, -2.007), Pos(0.059, 0.936, -0.125), point)

NewClip().Layer(MotionLayer.PlayerPose).Fade(fadeTime).Actors(actorA).WrapMode(MotionWrap.Loop).Data(
	Hips(0, 1),
	HipsRot(20.3, 0, 3.775),
	Head(-0.001, 0.987, -0.159),
	HeadRot(356.908, 359.26, 3.669),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.11, -0.006, 0.027), 0, -1)),
	FootR(WSurface(TPos(0.196, -0.006, 0.032), 0, -1)),
	HandL(HPos(-0.186, -1.083, -0.114), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(0.278, -1.039, -0.109), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(),
	ElbowR(),
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