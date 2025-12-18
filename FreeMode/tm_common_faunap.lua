-- FreemodeHG version 0.3 - faunap_edit_0.2
-- https://discord.com/channels/620113492208517120/1312401584910631054/1355724274224205984

function StandUp1() return Preset(
	Hips(WPos(0, 1.078, -0.011)),
	HipsRot(),
	Head(-0.001, 0.992, -0.122),
	HeadRot(356.908, 359.26, 3.669),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.295, -0.002, 0.007), 0, -1)),
	FootR(WSurface(TPos(0.314, -0.002, 0.021), 0, -1)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Hips", 0.6, 0.9, 0.03), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.5, -0.87, 0.03), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(0.26),
	ElbowR(0.26),
	WristL(-25, 0, -65),
	WristR(-25, 0, -70),
	KneeL(),
	KneeR(),
	SpineRot()
) end

function KneelDown1() return Preset(
	Hips(WPos(-0.001, 0.409, 0.12)),
	HipsRot(1.25, 0, 0.475),
	Head(0.003, 0.99, -0.141),
	HeadRot(345.786, 344.709, 337.23),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.115, -0.005, -0.09), 0, -1)),
	FootR(WSurface(TPos(0.115, -0.005, -0.09), 0, -1)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Thigh_L", 0.191, -0.2, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_L"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Thigh_R", 0.178, 0.286, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Thigh_R"),
	ElbowL(),
	ElbowR(0.313),
	WristL(),
	WristR(),
	KneeL(-0.068),
	KneeR(-0.099),
	SpineRot(),
	Mouth(0, 0, 0, -0.211, -0.211, 0.302, 0.302, -0.356, -0.356, -1, -1, -1, 1),
	Brows(1, 1, 0.072, 0.072),
	EyelidL(),
	EyelidR(),
	Cheeks(-1, -1)
) end

function KneelDown2() return Preset(
	Hips(WPos(-0.001, 0.357, 0.111)),
	HipsRot(1.25, 0, 0.475),
	Head(0.003, 0.994, -0.107),
	HeadRot(313.516, 355.466, 1.341),
	FootL(WSurface(TPos(-0.115, -0.005, -0.09), 0, -1)),
	FootR(WSurface(TPos(0.115, -0.005, -0.09), 0, -1)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Foot_L", -0.505, 0.952, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Foot_R", -0.41, 0.996, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_R"),
	ElbowL(-1),
	ElbowR(),
	WristL(),
	WristR(),
	KneeL(-0.362),
	KneeR(-0.405),
	SpineRot(),
	Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 0.8, 0, -0.12),
	Brows(1, 1, 0.072, 0.072),
	EyelidL(),
	EyelidR(),
	Cheeks(-1, -1)
) end

function KneelDown3() return Preset(
	Hips(WPos(-0.001, 0.409, 0.12)),
	HipsRot(1.25, 0, 0.475),
	Head(0.002, 0.995, -0.1),
	HeadRot(337.781, 357.102, 0.584),
	FootL(WSurface(TPos(-0.115, -0.005, -0.09), 0, -1)),
	FootR(WSurface(TPos(0.115, -0.005, -0.09), 0, -1)),
	HandL(HPos(0.202, -0.729, 0.557), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	HandR(HPos(-0.228, -0.716, 0.551), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(),
	ElbowR(),
	WristL(-70, 0, 35),
	WristR(-70, 0, 35),
	KneeL(0.1),
	KneeR(0.1),
	SpineRot()
) end

function KneelDown4() return Preset(
	Hips(WPos(-0.001, 0.357, 0.111)),
	HipsRot(1.25, 0, 0.475),
	Head(0.003, 0.994, -0.107),
	HeadRot(339.189, 351.202, 6.756),
	FootL(WSurface(TPos(-0.115, -0.005, -0.09), 0, -1)),
	FootR(WSurface(TPos(0.115, -0.005, -0.09), 0, -1)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Foot_L", -0.505, 0.952, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Head", 0.127, 0.004, 0.03), Wrist(HPoint(0, 0, 0.3, 0, 0, 0, "Bone_Index3_L"), 70)),
	ThumbR(30, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	RingR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	PinkyR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	ElbowR(-0.193),
	WristR(22.28, 0, 67.466),
	KneeL(-0.4),
	KneeR(-0.4),
	SpineRot(),
	Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 2, 0, -1.5),
	Brows(1, 1, 0.072, 0.072),
	EyelidL(),
	EyelidR(),
	Cheeks(-1, -1)
) end

-- function KneelDown5() return Preset(

-- ) end

function SitDown1() return Preset(
	Hips(WPos(0.004, 0.137, -0.028)),
	HipsRot(21.05, 0, -3.65),
	Head(-0.006, 0.968, -0.25),
	HeadRot(355.852, 359.582, 356.344),
	FootL(WSurface(TPos(-0.099, 0.002, 1.153), 0.003, -1, 0.004)),
	FootR(WSurface(TPos(0.049, 0.001, 0.863), 0.003, -1, 0.004)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Head", 0.949, -0.862, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Head", 1.009, 0.92, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Head"),
	ElbowL(0.159),
	ElbowR(0.161),
	WristL(),
	WristR(),
	ThumbL(41.888, 0, 0, -2.933, 0, TargetActor.Null, "Null"),
	ThumbR(23.806, 0, 0, -20, 0, TargetActor.Null, "Null"),
	KneeL(1),
	KneeR(0.663),
	SpineRot()
) end


function SitDown2() return Preset(
	Hips(WPos(0.004, 0.164, -0.033)),
	HipsRot(21.05, 0, -3.65),
	Head(-0.006, 0.981, -0.194),
	HeadRot(359.888, 353.428, 351.967),
	FootL(WSurface(TPos(-0.561, -0.011, 0.733), 0.022, -1, -0.01)),
	FootR(WSurface(TPos(0.153, 0.005, 0.695), 0.022, -1, -0.01)),
	HandL(HPos(-0.163, 0.117, 0.766), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(-0.046, 0.16, 0.7), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ElbowL(0.159),
	ElbowR(0.161),
	WristL(-29.501, 0, -64.495),
	WristR(-32.087, 0, -35.858),
	KneeL(1),
	KneeR(0.663),
	SpineRot(),
	Mouth(-0.501, -0.11, 0, 0.384, 0.384, -0.238, -0.238, 0.117, 0.117, -0.813, -0.813),
	Brows(1.5, 1.5, 1.5, 1.5),
	EyelidL(-0.35),
	EyelidR(-0.35),
	Cheeks(-0.98, -0.98)
) end

function LayDownBack1() return Preset(
	Hips(WPos(0, 0.054, 0.002)),
	HipsRot(),
	Head(0, -0.001, -1),
	HeadRot(273.152, 154.97, 200.383),
	FootL(WSurface(TPos(-0.063, -0.002, 1.405), 0, -1, 0)),
	FootR(WSurface(TPos(0.123, -0.002, 1.531), 0, -1, 0)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Chest", 0.439, -0.243, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(13.083, 34.731, 34.731, -20, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Chest", 0.459, 0.242, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 24.329, 24.329, -20, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	ElbowL(-0.649),
	ElbowR(-0.604),
	WristL(),
	WristR(14.452, 0, -53.187),
	KneeL(),
	KneeR(),
	SpineRot()
) end

function LayDownSideR() return Preset(
	Hips(WPos(0.016, 0.131, 0.044)),
	HipsRot(-4.45, 85.875, 23.725),
	Head(0.016, 0.1, 0.995),
	HeadRot(348.594, 116.937, 14.724),
	FootL(WPos(0.142, 0.066, -0.996)),
	FootR(WPos(-0.118, 0.089, -0.636)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Head", 1.322, -0.699, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(-2.078, 95, 95, 0, 0, TargetActor.Null, "Null"),
	IndexL(-35, 55.832, 55.832, 0, 0, TargetActor.Null, "Null"),
	MidL(-14.144, 41.581, 41.581, 0, 0, TargetActor.Null, "Null"),
	RingL(-21.42, 66.818, 66.818, 0, 0, TargetActor.Null, "Null"),
	PinkyL(-35, 76.617, 76.617, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.912, -0.462, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	ElbowL(0.649),
	ElbowR(-1),
	WristL(71.308, 0, 112.063),
	WristR(),
	KneeL(0.073),
	KneeR(0.582),
	SpineRot(90)
) end

function LayDownSideL() return Preset(
	Hips(WPos(0.017, 0.13, 0.061)),
	HipsRot(-1.45, -85.875, -18.65),
	Head(0.012, 0.064, 0.998),
	HeadRot(6, 270, 343.5),
	FootL(WPos(0.162, 0.1, -0.676)),
	FootR(WPos(-0.109, 0.057, -1.015)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Chest", 0.37, -0.184, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Head", 1.449, 0.293, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(-2.078, 95, 95, 0, 0, TargetActor.Null, "Null"),
	IndexR(-35, 55.832, 55.832, 0, 0, TargetActor.Null, "Null"),
	MidR(-14.144, 41.581, 41.581, 0, 0, TargetActor.Null, "Null"),
	RingR(-21.42, 66.818, 66.818, 0, 0, TargetActor.Null, "Null"),
	PinkyR(-35, 76.617, 76.617, 0, 0, TargetActor.Null, "Null"),
	ElbowL(-1),
	ElbowR(0.873),
	WristL(),
	WristR(-70, 0, 15.718),
	KneeL(0.876),
	KneeR(0.37),
	SpineRot(-90)
) end

function LaydownStomach1() return Preset(
	Hips(WPos(0, 0.129, 0.107)),
	HipsRot(25.35, 0, -5.775),
	Head(0.004, 0.38, 0.925),
	HeadRot(356.044, 8.207, 6.792),
	FootL(WSurface(TPos(-0.129, 0.091, -1.549), 0.003, -1, -0.003)),
	FootR(WSurface(TPos(-0.062, 0.091, -1.312), 0.003, -1, -0.003)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Head", 0.24, -0.196, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	HandR(WSurface(WPos(0.099, 0.041, 0.633), 0.024, -1, 0.001), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(-0.17),
	ElbowR(0.137),
	WristL(),
	WristR(),
	ThumbL(37.522, 0, 0, -20, 0, TargetActor.Null, "Null"),
	IndexL(19.459, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidL(31.67, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingL(37.202, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyL(35.31, 95, 95, 0, 0, TargetActor.Null, "Null"),
	KneeL(),
	KneeR(),
	SpineRot()
) end

function All41() return Preset(
	Hips(WPos(0.001, 0.436, -0.148)),
	HipsRot(35, 0, -0.65),
	Head(-0.006, 0.199, 0.98),
	HeadRot(15.932, 1, 11.496),
	EyeL(CameraPos()),
	EyeR(CameraPos()),
	FootL(WSurface(TPos(-0.199, 0.083, -0.702), 0, -1)),
	FootR(WSurface(TPos(0.026, 0.081, -0.718), 0, -1)),
	HandL(WSurface(WPos(-0.103, 0.072, 0.36), 0, -1), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	HandR(WSurface(WPos(0.152, 0.072, 0.336), 0, -1), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(),
	ElbowR(),
	WristL(),
	WristR(),
	KneeL(),
	KneeR(),
	SpineRot()
) end

function All42() return Preset(
	Hips(WPos(0.001, 0.436, -0.148)),
	HipsRot(35, 0, -0.65),
	Head(-0.006, 0.199, 0.98),
	HeadRot(30.923, 331.6, 331.464),
	FootL(WSurface(TPos(-0.623, -0.018, -0.336), 0.024, -1, 0.002)),
	FootR(WSurface(TPos(0.646, 0.013, -0.348), 0.024, -1, 0.002)),
	HandL(WSurface(WPos(-0.103, 0.072, 0.36), 0, -1), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Head", 0.534, -0.009, 0.03), Wrist(HPoint(0, 0, 0.3, 0, 0, 0, "Bone_Index3_L"), 70)),
	ThumbR(30, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	RingR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	PinkyR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	ElbowL(),
	ElbowR(-0.12),
	WristL(),
	WristR(-54.175, 6.846, 22.653),
	KneeL(1),
	KneeR(1),
	SpineRot(),
	Mouth(0, 0, 0, -0.211, -0.211, 0.302, 0.302, -0.356, -0.356, -1, -1, -1, 1),
	Brows(-0.187, -0.187, 0.072, 0.072),
	EyelidL(),
	EyelidR(),
	Cheeks(-1, -1)
) end

function BendOver1() return Preset(
	Hips(WPos(0.003, 0.866, -0.137)),
	HipsRot(28.325, 0, -1.625),
	Head(-0.019, 0.323, 0.946),
	HeadRot(356.908, 359.26, 3.669),
	FootL(WSurface(TPos(-0.527, -0.003, -0.127), 0.003, -1, 0.004)),
	FootR(WSurface(TPos(0.558, -0.001, -0.16), 0.003, -1, 0.004)),
	HandL(BoneMesh(TargetActor.Main, "Bone_Chest", 0.433, -0.244, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Chest", 0.443, 0.257, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	ElbowL(-0.462),
	ElbowR(-0.488),
	WristL(),
	WristR(),
	KneeL(0.464),
	KneeR(0.298),
	SpineRot()
) end

function BJGesture() return Preset(
	Head(0.003, 0.99, -0.141),
	HeadRot(339.125, 0.561, 358.715),
	HandR(HPos(-0.202, 0.283, 0.53), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(29.379, 25.081, 25.081, 7.61, 0, TargetActor.Null, "Null"),
	IndexR(39.592, 57.582, 57.582, 0, 0, TargetActor.Null, "Null"),
	MidR(26.641, 39.147, 39.147, 0, 0, TargetActor.Null, "Null"),
	RingR(11.97, 37.14, 37.14, 0, 0, TargetActor.Null, "Null"),
	PinkyR(-23.703, 36.128, 36.128, 0, 0, TargetActor.Null, "Null"),
	Mouth(-1, 0.093, 0, 0.504, 0.504, -0.062, -0.062, 0.664, 0.664, 1, 1, 0, 0, 0.9, 0, 0.45),
	ElbowR(-0.149),
	WristR(-49.596, 0, -3.297),
	SpineRot()
	-- Head(0.003, 0.99, -0.141),
	-- HeadRot(339.125, 0.561, 358.715),
	-- HandR(HPos(-0.305, 0.301, 0.415), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	-- ThumbR(29.379, 25.081, 25.081, 7.61, 0, TargetActor.Null, "Null"),
	-- IndexR(39.592, 57.582, 57.582, 0, 0, TargetActor.Null, "Null"),
	-- MidR(26.641, 39.147, 39.147, 0, 0, TargetActor.Null, "Null"),
	-- RingR(11.97, 37.14, 37.14, 0, 0, TargetActor.Null, "Null"),
	-- PinkyR(-23.703, 36.128, 36.128, 0, 0, TargetActor.Null, "Null"),
	-- Mouth(-1, 0.093, 0, 0.504, 0.504, -0.062, -0.062, 0.664, 0.664, 0.999, 0.999, 0, 0, 0.9, 0, 0.45),
	-- ElbowR(-0.149),
	-- WristR(-57.67, 0, -41.878),
	-- SpineRot()
) end

function PeaceR() return Preset(
	HandR(HPos(0.281, 0.127, 0.335), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ElbowR(-0.79),
	WristR(-9.789, 0, -2.241),
	ThumbR(18.468, 58.721, 58.721, 0, 0, TargetActor.Null, "Null"),
	IndexR(9.437, 0, 0, 15.502, 0, TargetActor.Null, "Null"),
	MidR(6.788, 0, 0, -7.787, 0, TargetActor.Null, "Null"),
	RingR(85, 84.597, 84.597, -3.139, 0, TargetActor.Null, "Null"),
	PinkyR(85, 69.908, 69.908, -20, 0, TargetActor.Null, "Null")
) end

function PeaceL() return Preset(
	HandL(HPos(-0.281, 0.127, 0.335), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ElbowL(-0.79),
	WristL(-9.789, 0, -2.241),
	ThumbL(18.468, 58.721, 58.721, 0, 0, TargetActor.Null, "Null"),
	IndexL(9.437, 0, 0, 15.502, 0, TargetActor.Null, "Null"),
	MidL(6.788, 0, 0, -7.787, 0, TargetActor.Null, "Null"),
	RingL(85, 84.597, 84.597, -3.139, 0, TargetActor.Null, "Null"),
	PinkyL(85, 69.908, 69.908, -20, 0, TargetActor.Null, "Null")
) end

function Shush() return Preset(
	HandR(BoneMesh(TargetActor.Main, "Bone_Head", 0.534, -0.009, 0.03), Wrist(HPoint(0, 0, 0.3, 0, 0, 0, "Bone_Index3_L"), 70)),
	ThumbR(30, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	RingR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	PinkyR(80, 80, 80, 0, 0, TargetActor.Null, "Null"),
	ElbowR(-0.12),
	WristR(-54.175, 6.846, 22.653)
) end

function HandsClosed() return Preset(
	ThumbL(14.977, 89.644, 89.644, 20, 0, TargetActor.Null, "Null"),
	ThumbR(14.977, 89.644, 89.644, 20, 0, TargetActor.Null, "Null"),
	IndexL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	IndexR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null")
) end

function HandsOpen() return Preset(
	ThumbR(),
	ThumbL(),
	IndexL(),
	MidL(),
	RingL(),
	PinkyL(),
	IndexR(),
	MidR(),
	RingR(),
	PinkyR()
) end

function HandsOpen2() return Preset(
ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest")
) end

function GrabHead() return Preset(
	HandL(BoneMesh(TargetActor.A, "Bone_Head", 1.638, 0.618, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(33.553, 14.859, 14.859, 0, 0, TargetActor.Null, "Null"),
	IndexL(52.444, 19.081, 19.081, 0, 0, TargetActor.Null, "Null"),
	MidL(51.016, 15.795, 15.795, 0, 0, TargetActor.Null, "Null"),
	RingL(53.027, 0, 0, 0, 0, TargetActor.Null, "Null"),
	PinkyL(48.639, 0, 0, 0, 0, TargetActor.Null, "Null"),
	HandR(BoneMesh(TargetActor.A, "Bone_Head", 1.638, -0.618, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(33.553, 14.859, 14.859, 0, 0, TargetActor.Null, "Null"),
	IndexR(52.444, 19.081, 19.081, 0, 0, TargetActor.Null, "Null"),
	MidR(51.016, 15.795, 15.795, 0, 0, TargetActor.Null, "Null"),
	RingR(53.027, 0, 0, 0, 0, TargetActor.Null, "Null"),
	PinkyR(48.639, 0, 0, 0, 0, TargetActor.Null, "Null")
) end

function Beckon() return Preset(
	HandR(HPos(-0.206, 0.194, 0.657), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	ElbowR(-0.79),
	WristR(16.705, 6.846, 87.288),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20.668, 41.352, 41.352, 0, 0, TargetActor.Null, "Null"),
	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingR(85, 81.625, 81.625, 0, 0, TargetActor.Null, "Null"),
	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null")
) end

-- function TouchHerself1R() return Preset(
-- 	HandR(HPos(-0.206, 0.194, 0.657), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
-- 	ElbowR(-0.79),
-- 	WristR(16.705, 6.846, 87.288),
-- 	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
-- 	IndexR(20.668, 41.352, 41.352, 0, 0, TargetActor.Null, "Null"),
-- 	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
-- 	RingR(85, 81.625, 81.625, 0, 0, TargetActor.Null, "Null"),
-- 	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null")
-- ) end

-- function TouchHerself1L() return Preset(
-- 	HandR(HPos(-0.206, -0.194, 0.657), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
-- 	ElbowR(-0.79),
-- 	WristR(16.705, 6.846, 87.288),
-- 	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
-- 	IndexR(20.668, 41.352, 41.352, 0, 0, TargetActor.Null, "Null"),
-- 	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
-- 	RingR(85, 81.625, 81.625, 0, 0, TargetActor.Null, "Null"),
-- 	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null")
-- ) end


function FaceAhegao1() return Preset(
	EyeL(346.076, 28.61, 0),
	EyeR(347.849, 328.86, 0),
	Mouth(-1, 0.196, 0, 0.504, 0.504, 0, 0, 1, 1, 0.451, 0.451, 0, 0, 2, 0, -2),
	Brows(1, 1, 0.072, 0.072),
	Cheeks(-1, -1)
) end

function FaceAhegao2() return Preset(
	EyeL(346.076, 28.61, 0),
	EyeR(347.849, 328.86, 0),
	Mouth(-0.025, -1, 0, 1, -1, -1, 1, 0.833, 0.833, 0.5, 0.5, 1.2),
	Brows(1.2, 1.2, -0.745, -0.745),
	EyelidL(0.184),
	EyelidR(0.184),
	Cheeks(-1, -1)
) end


function LookCam() return Preset(
	EyeL(CameraPos()),
	EyeR(CameraPos())
) end

function FaceCam() return Preset(
	HeadLookAt(CameraPos())
) end

function LookActorA() return Preset(
	EyeL(EyeContact(TargetActor.A)),
	EyeR(EyeContact(TargetActor.A))
) end

-- function LookActorB() return Preset(
-- 	EyeL(EyeContact(TargetActor.B)),
-- 	EyeR(EyeContact(TargetActor.B))
-- ) end

-- function LookActorC() return Preset(
-- 	EyeL(EyeContact(TargetActor.C)),
-- 	EyeR(EyeContact(TargetActor.C))
-- ) end

function FaceActorA() return
    HeadLookAt(BoneMesh(TargetActor.A, "Bone_Head", 0, 0, 0.03), 1, 120)
end
function FaceActorB() return
	HeadLookAt(BoneMesh(TargetActor.A, "Bone_Head", 5, 0.5, 0), 1, 120)
end

function FaceActorC() return
	HeadLookAt(BoneMesh(TargetActor.A, "Bone_Head", -5, 1, 3), 1, 120)
end

