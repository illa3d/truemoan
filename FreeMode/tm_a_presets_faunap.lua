-- FreemodeHG version 0.3 - faunap_edit_0.2
--version 0.2M

--Body Presets
function DoubleV() return Preset(
	HandL(HPos(-0.3, 0.206, 0.393), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	HandR(HPos(0.309, 0.249, 0.346), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	ElbowL(-1),
	ElbowR(-1),
	ThumbL(24.961, 67.355, 67.355, -10.793, 0, TargetActor.Null, "Null"),
	IndexL(8.463, 0, 0, 20, 0, TargetActor.Null, "Null"),
	MidL(2.678, 0, 0, -6.078, 0, TargetActor.Null, "Null"),
	RingL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	ThumbR(19.829, 51.111, 51.111, -20, 0, TargetActor.Null, "Null"),
	IndexR(7.768, 0, 0, 20, 0, TargetActor.Null, "Null"),
	MidR(3.299, 0, 0, -7.679, 0, TargetActor.Null, "Null"),
	RingR(85, 95, 95, -20, 0, TargetActor.Null, "Null"),
	PinkyR(85, 95, 95, 19.571, 0, TargetActor.Null, "Null")
) end

function JackO() return Preset( --Preset by M3RK
	Hips(WPos(0, 0.356, 0.364)),
	HipsRot(15.55, 0, -4.025),
	Head(-0.001, -0.387, 0.922),
	HeadRot(321.733, 356.414, 5.961),
	FootL(WSurface(TPos(-1.031, -0.076, 0.24), 0.012, -1, 0.017)),
	FootR(WSurface(TPos(0.936, -0.072, 0.06), -0.064, -0.998, 0.008)),
	HandL(WSurface(WPos(-0.08, -0.067, 1.002), 0.003, -1, 0.015), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	HandR(WSurface(WPos(-0.038, -0.066, 0.865), 0.023, -1, -0.015), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.World, "Null"),
	ElbowL(-0.181),
	ElbowR(0.502),
	KneeL(-0.294),
	KneeR(-0.251)
) end

function HandsInfront1() return Preset(
	HandL(HPos(0.2, -0.63, 0.6), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(14.977, 89.644, 89.644, 20, 0, TargetActor.Null, "Null"),
	IndexL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(-0.2, -0.63, 0.6), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(14.977, 89.644, 89.644, 20, 0, TargetActor.Null, "Null"),
	IndexR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	ElbowL(),
	ElbowR(),
	WristL(-62.313, 0, 35.937),
	WristR(-49.048, 0, 17.218)
) end

function HandsInfront2() return Preset(
	HandL(HPos(0.2, -0.63, 0.45), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(14.977, 89.644, 89.644, 20, 0, TargetActor.Null, "Null"),
	IndexL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	HandR(HPos(-0.2, -0.63, 0.45), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(14.977, 89.644, 89.644, 20, 0, TargetActor.Null, "Null"),
	IndexR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	ElbowL(),
	ElbowR(),
	WristL(-62.313, 0, 35.937),
	WristR(-49.048, 0, 17.218)
) end

-- accidentally made a flashing animation? wut. explore later
--
-- function HandsInfront1() return Preset(
-- 	HandL(HPos(-0.1, 0.921, 0.709), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
-- 	ThumbL(14.977, 95, 95, -14.32, 0, TargetActor.Null, "Null"),
-- 	IndexL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
-- 	MidL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
-- 	RingL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
-- 	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
-- 	ElbowL(),
-- 	WristL(-49.048, 0, 17.218),
-- 	HandR(HPos(0.1, 0.921, 0.709), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
-- 	ThumbR(14.977, 95, 95, -14.32, 0, TargetActor.Null, "Null"),
-- 	IndexR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
-- 	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
-- 	RingR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
-- 	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
-- 	ElbowR(),
-- 	WristR(-49.048, 0, 17.218)
-- ) end

function HandsBehind1() return Preset(
	ElbowL(0.26),
	ElbowR(0.26),
	HandL(BoneMesh(TargetActor.Main, "Bone_Hips", 0.3, 0.87, 0.03), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.3, -0.87, 0.03), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	WristL(68.619, 0, -76.201),
	WristR(62.219, 0, -52.779),
	ThumbL(6.232, 69.101, 69.101, 10.208, 0, TargetActor.Null, "Null"),
	ThumbR(6.232, 69.101, 69.101, 10.208, 0, TargetActor.Null, "Null"),
	IndexL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	IndexR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null")
) end

function HandsBehind2() return Preset(
	ElbowL(0.26),
	ElbowR(0.26),
	HandL(BoneMesh(TargetActor.Main, "Bone_Hips", 0.6, 0.9, 0.03), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.5, -0.87, 0.03), Wrist(HPoint(0, 0.3, 0.7, -90), 0, 0)),
	WristL(-25, 0, -65),
	WristR(-25, 0, -70),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	MidR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	RingR(20, 20, 20, 0, 0, TargetActor.Null, "Null"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Null, "Null")
) end

function HandsBehind3() return Preset(
	HandL(HPos(0.349, -0.747, -0.516), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	HandR(HPos(-0.394, -0.808, -0.45), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(6.232, 69.101, 69.101, 10.208, 0, TargetActor.Null, "Null"),
	ThumbR(6.232, 69.101, 69.101, 10.208, 0, TargetActor.Null, "Null"),
	IndexL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	IndexR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	ElbowL(0.2),
	ElbowR(0.26),
	WristL(-20.36, 0, -21.125),
	WristR(10.872, 0, -22.867)
) end

-- function HandsBehind4() return Preset(

-- ) end

function HandsHeels() return Preset(
	HandL(BoneMesh(TargetActor.Main, "Bone_Foot_L", -0.43, 0.907, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_L"),
	HandR(BoneMesh(TargetActor.Main, "Bone_Foot_R", -0.45, -0.868, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Foot_R")
) end

--Face Presets
function OpenWide() return Preset(
	Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 0.8, 0, -0.12),
	--Mouth(-1, 0.196, 0, 0.504, 0.504, 0, 0, 1, 1, 0.451, 0.451, 0, 0, 0.66, 0, 0.44),
	Brows(1, 1, 0.072, 0.072),
	EyelidL(),
	EyelidR(),
	Cheeks(-1, -1)
) end

function TongueOut() return Preset(
	Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 1, 0, -1),
	--Mouth(-1, 0.196, 0, 0.504, 0.504, 0, 0, 1, 1, 0.451, 0.451, 0, 0, 0.66, 0, 0.44),
	Brows(1, 1, 0.072, 0.072),
	EyelidL(),
	EyelidR(),
	Cheeks(-1, -1)
) end

function TongueOut2() return Preset(
	Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 1.5, 0, -1.5),
	--Mouth(-1, 0.196, 0, 0.504, 0.504, 0, 0, 1, 1, 0.451, 0.451, 0, 0, 0.66, 0, 0.44),
	Brows(1, 1, 0.072, 0.072),
	EyelidL(),
	EyelidR(),
	Cheeks(-1, -1)
) end

function TongueOut3() return Preset(
	Mouth(-1, 0, 0, 0.504, 0.504, -1, -1, 0.675, 0.675, 0.999, 0.999, 0, 0, 2, 0, -1.5),
	--Mouth(-1, 0.196, 0, 0.504, 0.504, 0, 0, 1, 1, 0.451, 0.451, 0, 0, 0.66, 0, 0.44),
	Brows(1, 1, 0.072, 0.072),
	EyelidL(),
	EyelidR(),
	Cheeks(-1, -1)
) end

function GritTeeth() return Preset(
	Mouth(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0)
) end

function Pog() return Preset(
	Mouth(0, 0, 0, -0.211, -0.211, 0.302, 0.302, -0.356, -0.356, -1, -1, 0, 2, 0, 0, 0)
) end

function Kiss1() return Preset(
	Mouth(0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, -1.2, 1.2, 0, 0, 0)
) end

function Kiss2() return Preset(
	Mouth(0, 0, 0, -0.211, -0.211, 0.302, 0.302, -0.356, -0.356, -1, -1, -1, 1)
) end

function Kiss3() return Preset( --kiss
	Mouth(0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, -1.2, 1.2, 0, 0, 0)
) end
function Kiss4() return Preset(
	Mouth(0, 0, 0, -0.211, -0.211, 0.302, 0.302, -0.356, -0.356, -1, -1, -1, 2)
) end

function Pursedlips() return Preset(
	Mouth(0, 0, 0, 0, 0, 0.678, 0.678, 0.238, 0.238, 1, 1, 1)
) end

function Pursedsmile() return Preset(
	Mouth(0, 0, 0, 0, 0, -0.35, -0.35, 1, 1, 1, 1, 1.2)
) end

function Lipbite() return Preset(
	Mouth(-0.12, -0.112, 0, 1, 0.314, -0.061, 1, 0.833, 0.833, 0.5, 0.5, 1.2),
	Brows(1.2, 1.2, -0.745, -0.745),
	EyelidL(0.184),
	EyelidR(0.184),
	Cheeks(-1, -1)
) end

--Animation Loops
-- function Humping1() return Preset(
-- 	HipsRot(-40, 0, 0)
-- ) end
-- function Humping2() return Preset(
-- 	HipsRot(0, 0, 0)
-- ) end
--
-- function HumpingS1() return Preset(
-- 	HipsRot(-1.8, 0, 0)
-- ) end
-- function HumpingS2() return Preset(
-- 	HipsRot(-1.8, 0, 0)
-- ) end

-- function Bounce1() return Preset(
-- 	--Hips(-0.001, 0.350, 0.05)
-- 	Hips(-0.001, 1.0, 0.01)
-- ) end
-- function Bounce2() return Preset(
-- 	--Hips(-0.001, 0.381, 0.172)
-- 	Hips(0, 0.951, 0.01)
-- ) end

-- function HipMov1() return Preset(
-- 	--HipsRot(-80, 10, -10)
-- 	HipsRot(0, 0, 0)
-- ) end
-- function HipMov2() return Preset(
-- 	--HipsRot(-70 -10, -10)
-- 	HipsRot(20, 15, -15)
-- ) end

-- function Licking1() return Preset(
-- 	Mouth(-0.68, 0.377, 0, 0.504, 0.504, -0.062, -0.062, 0.664, 0.664, 0.57, 0.57, 0, 0, 0.9, 0, 0.45)
-- ) end
-- function Licking2() return Preset(
-- 	Mouth(-0.737, 0.377, 0, 0.504, 0.504, -0.062, -0.062, 0.664, 0.664, 0.57, 0.57, 0, 0, 0.97, 0, -0.10)
-- ) end

function Footjob_1Ra() return Preset(
FootR(WPos(-0.002, 0.297, 0.42))
) end

function Footjob_1Rb() return Preset(
FootR(WPos(-0.006, 0.256, 0.26))
) end

function Gropebreast_La() return Preset(
	HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.882, 0.678, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	ElbowL(-0.15)
) end

function Gropebreast_Lb() return Preset(
	HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.823, 0.423, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	ElbowL(-0.15)
) end

function Gropebreast_Lc() return Preset(
	HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.834, -0.124, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	ElbowL(-0.15)
) end

function Gropebreast_Ld() return Preset(
	HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.797, 0.258, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	ElbowL(-0.15)
) end

function Gropebreast_Le() return Preset(
	HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.809, 0.081, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	ElbowL(-0.15)
) end

function Gropebreast_Lf() return Preset(
	HandL(BoneMesh(TargetActor.Main, "Bone_Breast_L", 0.98, -0.102, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	ElbowL(-0.15)
) end

function Gropebreast_2La() return Preset(
	HandL(BoneMesh(TargetActor.Main, "Bone_Chest", -0.20, -0.265, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	ElbowL(-1)
) end

function Gropebreast_2Lb() return Preset(
	HandL(BoneMesh(TargetActor.Main, "Bone_Chest", -0.19, -0.186, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	ElbowL(-1)
) end

function GropebreastBoth1a() return Preset(
HandL(BoneMesh(TargetActor.Main, "Bone_Chest", -0.19, -0.186, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
ElbowL(-1),
HandR(BoneMesh(TargetActor.Main, "Bone_Chest", -0.19, 0.186, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
ElbowR(-1)
) end

function GropebreastBoth1b() return Preset(
	HandL(BoneMesh(TargetActor.Main, "Bone_Chest", -0.19, -0.186, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_L"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	ElbowL(-1),
	HandR(BoneMesh(TargetActor.Main, "Bone_Chest", -0.20, 0.265, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	ElbowR(-1)
) end

function Gropebreast_2Ra() return Preset(
	HandR(BoneMesh(TargetActor.Main, "Bone_Chest", -0.19, 0.186, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	ElbowR(-1)
) end

function Gropebreast_2Rb() return Preset(
	HandR(BoneMesh(TargetActor.Main, "Bone_Chest", -0.20, 0.265, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Chest"),
	ElbowR(-1)
) end


function Gropebreast_Ra() return Preset(
	HandR(BoneMesh(TargetActor.Main, "Bone_Breast_R", 0.882, 0.678, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	ElbowR(-0.15)
) end

function Gropebreast_Rb() return Preset(
	HandR(BoneMesh(TargetActor.Main, "Bone_Breast_R", 0.823, 0.423, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	ElbowR(-0.15)
) end

function Gropebreast_Rc() return Preset(
	HandR(BoneMesh(TargetActor.Main, "Bone_Breast_R", 0.834, -0.124, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	ElbowR(-0.15)
) end

function Gropebreast_Rd() return Preset(
	HandR(BoneMesh(TargetActor.Main, "Bone_Breast_R", 0.797, 0.258, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	ElbowR(-0.15)
) end

function Gropebreast_Re() return Preset(
	HandR(BoneMesh(TargetActor.Main, "Bone_Breast_R", 0.809, 0.081, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	ElbowR(-0.15)
) end

function Gropebreast_Rf() return Preset(
	HandR(BoneMesh(TargetActor.Main, "Bone_Breast_R", 0.98, -0.102, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Breast_R"),
	ElbowR(-0.15)
) end

function Bjgesture_Ra() return Preset(
	HandR(HPos(-0.231, 0.23, 0.536), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	WristR(-67.945, 0, 5.025),
	ThumbR(29.379, 25.081, 25.081, 7.61, 0, TargetActor.Null, "Null"),
	IndexR(39.592, 57.582, 57.582, 0, 0, TargetActor.Null, "Null"),
	MidR(26.641, 39.147, 39.147, 0, 0, TargetActor.Null, "Null"),
	RingR(11.97, 37.14, 37.14, 0, 0, TargetActor.Null, "Null"),
	PinkyR(-23.703, 36.128, 36.128, 0, 0, TargetActor.Null, "Null")
) end

function Bjgesture_Rb() return Preset(
	HandR(HPos(-0.228, 0.27, 0.37), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(44.204, 32.505, 32.505, 20, 0, TargetActor.Null, "Null"),
	IndexR(53.587, 44.094, 44.094, -1.607, 0, TargetActor.Null, "Null"),
	MidR(46.074, 58.696, 58.696, 0, 0, TargetActor.Null, "Null"),
	RingR(38.248, 51.718, 51.718, 0, 0, TargetActor.Null, "Null"),
	PinkyR(27.866, 57.938, 57.938, 0, 0, TargetActor.Null, "Null"),
	WristR(-61.945, 0, -31.859)
) end

function FingeringMRl1() return Preset(
	ThumbL(6.43, 95, 95, -20, 0, TargetActor.Null, "Null"),
	IndexL(-35, 0, 0, -8.486, 0, TargetActor.Null, "Null"),
	PinkyL(-34.744, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidL(9.834, 36.161, 36.161, -5.928, 0, TargetActor.Null, "Null"),
	RingL(15.206, 27.438, 27.438, -0.33, 0, TargetActor.Null, "Null")
) end

function FingeringMRl2() return Preset(
	ThumbL(6.43, 95, 95, -20, 0, TargetActor.Null, "Null"),
	IndexL(-35, 0, 0, -8.486, 0, TargetActor.Null, "Null"),
	PinkyL(-34.744, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidL(56.145, 24.567, 24.567, -5.928, 0, TargetActor.Null, "Null"),
	RingL(37.106, 40.274, 40.274, -0.33, 0, TargetActor.Null, "Null")
) end

function FingeringMRl3() return Preset(
	ThumbL(6.43, 95, 95, -20, 0, TargetActor.Null, "Null"),
	IndexL(-35, 0, 0, -8.486, 0, TargetActor.Null, "Null"),
	PinkyL(-34.744, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidL(34.929, 83.764, 83.764, -20, 0, TargetActor.Null, "Null"),
	RingL(32.593, 88.095, 88.095, 6.577, 0, TargetActor.Null, "Null")
) end

function FingeringMRl4() return Preset(
	ThumbL(6.43, 95, 95, -20, 0, TargetActor.Null, "Null"),
	IndexL(-35, 0, 0, -8.486, 0, TargetActor.Null, "Null"),
	PinkyL(-34.744, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidL(61.766, 95, 95, -20, 0, TargetActor.Null, "Null"),
	RingL(60.857, 88.742, 88.742, 6.577, 0, TargetActor.Null, "Null")
) end

function FingeringMRr1() return Preset(
	ThumbR(6.43, 95, 95, -20, 0, TargetActor.Null, "Null"),
	IndexR(-35, 0, 0, -8.486, 0, TargetActor.Null, "Null"),
	PinkyR(-34.744, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(9.834, 36.161, 36.161, -5.928, 0, TargetActor.Null, "Null"),
	RingR(15.206, 27.438, 27.438, -0.33, 0, TargetActor.Null, "Null")
) end

function FingeringMRr2() return Preset(
	ThumbR(6.43, 95, 95, -20, 0, TargetActor.Null, "Null"),
	IndexR(-35, 0, 0, -8.486, 0, TargetActor.Null, "Null"),
	PinkyR(-34.744, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(56.145, 24.567, 24.567, -5.928, 0, TargetActor.Null, "Null"),
	RingR(37.106, 40.274, 40.274, -0.33, 0, TargetActor.Null, "Null")
) end

function FingeringMRr3() return Preset(
	ThumbR(6.43, 95, 95, -20, 0, TargetActor.Null, "Null"),
	IndexR(-35, 0, 0, -8.486, 0, TargetActor.Null, "Null"),
	PinkyR(-34.744, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(34.929, 83.764, 83.764, -20, 0, TargetActor.Null, "Null"),
	RingR(32.593, 88.095, 88.095, 6.577, 0, TargetActor.Null, "Null")
) end

function FingeringMRr4() return Preset(
	ThumbR(6.43, 95, 95, -20, 0, TargetActor.Null, "Null"),
	IndexR(-35, 0, 0, -8.486, 0, TargetActor.Null, "Null"),
	PinkyR(-34.744, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(61.766, 95, 95, -20, 0, TargetActor.Null, "Null"),
	RingR(60.857, 88.742, 88.742, 6.577, 0, TargetActor.Null, "Null")
) end

function TouchHerself_Ra() return Preset(
	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.746, -0.129, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips")
) end

function TouchHerself_Rb() return Preset(
	HandR(BoneMesh(TargetActor.Main, "Bone_Hips", 0.899, -0.061, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	IndexR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	MidR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	RingR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	PinkyR(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips")
) end

function TouchHerself_La() return Preset(
	HandL(BoneMesh(TargetActor.Main, "Bone_Hips", 0.746, 0.129, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips")
) end

function TouchHerself_Lb() return Preset(
	HandL(BoneMesh(TargetActor.Main, "Bone_Hips", 0.899, 0.061, 0.03), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	IndexL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	MidL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	RingL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips"),
	PinkyL(20, 20, 20, 0, 0, TargetActor.Main, "Bone_Hips")
) end

function FingeringIMl1() return Preset(
-- 	ThumbL(38.629, 95, 95, 0, 0, TargetActor.Null, "Null"),
	IndexL(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidL(-0.255, 0, 0, 6.945, 0, TargetActor.Null, "Null")
-- 	,RingL(85, 85.415, 85.415, 0, 0, TargetActor.Null, "Null"),
-- 	PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null")
) end

function FingeringIMl2() return Preset(
	--ThumbL(38.629, 95, 95, 0, 0, TargetActor.Null, "Null"),
	IndexL(-14.203, 46.625, 46.625, 0, 0, TargetActor.Null, "Null"),
	MidL(-13.603, 39.302, 39.302, 6.945, 0, TargetActor.Null, "Null")
	--,RingL(85, 85.415, 85.415, 0, 0, TargetActor.Null, "Null"),
	--PinkyL(85, 95, 95, 0, 0, TargetActor.Null, "Null")
) end

function FingeringIMr1() return Preset(
	--ThumbR(38.629, 95, 95, 0, 0, TargetActor.Null, "Null"),
	IndexR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(-0.255, 0, 0, 6.945, 0, TargetActor.Null, "Null")
	--,RingR(85, 85.415, 85.415, 0, 0, TargetActor.Null, "Null"),
	--PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null")
) end

function FingeringIMr2() return Preset(
	--ThumbR(38.629, 95, 95, 0, 0, TargetActor.Null, "Null"),
	IndexR(-14.203, 46.625, 46.625, 0, 0, TargetActor.Null, "Null"),
	MidR(-13.603, 39.302, 39.302, 6.945, 0, TargetActor.Null, "Null")
	--,RingR(85, 85.415, 85.415, 0, 0, TargetActor.Null, "Null"),
	--PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null")
) end

function Beckon_Ra() return Preset(
	ThumbR(51.491, 52.955, 52.955, 0, 0, TargetActor.Null, "Null"),
	IndexR(20.668, 41.352, 41.352, 0, 0, TargetActor.Null, "Null"),
	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingR(85, 81.625, 81.625, 0, 0, TargetActor.Null, "Null"),
	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null")
) end

function Beckon_Rb() return Preset(
	ThumbR(51.491, 52.955, 52.955, 0, 0, TargetActor.Null, "Null"),
	IndexR(-8.691, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(85, 95, 95, 0, 0, TargetActor.Null, "Null"),
	RingR(85, 81.625, 81.625, 0, 0, TargetActor.Null, "Null"),
	PinkyR(85, 95, 95, 0, 0, TargetActor.Null, "Null")
) end

function Slap_Ra() return Preset(
	HandR(HPos(0.804, 0.071, 0.177), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	IndexR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	RingR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	PinkyR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	ElbowR(0.222),
	WristR(-11.997, 0, 18.248)
) end

function Slap_Rb() return Preset(
	HandR(HPos(-0.007, -0.855, 0.746), Wrist(HPoint(0, -0.3, 0.7, 90), 0, 35)),
	ThumbR(-35, 55.782, 55.782, -20, 0, TargetActor.Null, "Null"),
	IndexR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	MidR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	RingR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	PinkyR(0, 0, 0, 0, 0, TargetActor.Null, "Null"),
	ElbowR(0.26),
	WristR(4.315, 0, 53.94)
) end

function HipSway_A() return Preset(
	Hips(WPos(0.078, 0.854, 0.427)),
	Head(-0.199, 0.152, 0.968)
) end

function HipSway_B() return Preset(
	Hips(WPos(-0.021, 0.853, 0.421)),
	Head(0.063, 0.155, 0.986)
) end

-- function Shake1() return Preset(
-- 	SpineRot(15)
-- ) end
--
-- function Shake2() return Preset(
-- 	SpineRot(-15)
-- ) end

-- function ShakeS1() return Preset(
-- 	SpineRot(8)
-- ) end
--
-- function ShakeS2() return Preset(
-- 	SpineRot(-8)
-- ) end
--
-- function Twerk1() return Preset(
-- 	HipsRot(45, 0, 0)
-- ) end
-- function Twerk2() return Preset(
-- 	HipsRot(10, 0, 0)
-- ) end

--------------------------------------------------------------
-----------------------------MISC-----------------------------

-- function ColorizeMenuText(text)
--     return "<color=#890000><i>" .. text .. "</i></color>"
-- end

-- function CreateMenuItem(text, action)
--     return {
--         text = "<color=#890000><i>" .. text .. "</i></color>",
--         action = action
--     }
-- end

-- function AddColorToMenus(menuText, color)
--     -- Pattern to match menu items in the format + "exampletext"
--     local pattern = '%+%s"(.-)"'
--     -- Replace matched text with the colored version
--     local coloredMenu = menuText:gsub(pattern, function(text)
--         return '+ "<color=' .. color .. '>' .. text .. '</color>"'
--     end)
--     return coloredMenu
-- end


local success, result = pcall(function()
    return Preset(Cheeks(table.unpack(cheeksParams)))
end)
if not success then
    print("Error creating preset:", result)
else
    human.Pose(result)
end

-- Initialize a table to store all 2 Cheeks parameters
local cheeksParams = {0, 0}

-- reset specific cheek parameter
function ResetCheeksParam(index)
    if index >= 1 and index <= #cheeksParams then
        cheeksParams[index] = 0
        print("ResetCheeksParam: Resetting parameter " .. index)
        local success, result = pcall(function()
            return cheeks(table.unpack(cheeksParams))
        end)
        if success then
            human.Pose(result)
        else
            print("Error in ResetCheeksParam: " .. result)
        end
    else
        print("Invalid parameter index: " .. index)
    end
end

-- reset all cheek parameters
function ResetALLcheeksParam(human)
    for i = 1, #cheeksParams do
        cheeksParams[i] = 0
    end
    print("ResetALLcheeksParam: Resetting all parameters")  -- cheeks(0, 0)
    local success, result = pcall(function()
        return cheeks(table.unpack(cheeksParams))
    end)
    if success then
        human.Pose(result)
    else
        print("Error in ResetALLcheeksParam: " .. result)
    end
end

-- Adjust Cheek increments
function AdjustCheeksParam(index, increment)
    if index >= 1 and index <= #cheeksParams then
        cheeksParams[index] = cheeksParams[index] + increment
        return (Cheeks(table.unpack(cheeksParams)))
    end
end

-- Adjusts the first cheeks parameter by +0.25
function Cheekspar1_A()
    return AdjustCheeksParam(1, FACE_PARAM_INCREMENT)
end

-- Adjusts the second cheeks parameter by +0.25
function Cheekspar2_A()
  return AdjustCheeksParam(2, FACE_PARAM_INCREMENT)
end

-- Adjusts the first cheeks parameter by -0.25
function Cheekspar1_B()
    return AdjustCheeksParam(1, -FACE_PARAM_INCREMENT)
end

-- Adjusts the second cheeks parameter by -0.25
function Cheekspar2_B()
  return AdjustCheeksParam(2, -FACE_PARAM_INCREMENT)
end

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------

local success, result = pcall(function()
    return Preset(Brows(table.unpack(browsParams)))
end)
if not success then
    print("Error creating preset:", result)
else
    human.Pose(result)
end

-- Initialize a table to store all 4 brow parameters
local browsParams = {0, 0, 0, 0}

-- reset specific brow parameter
function ResetBrowsParam(index)
    if index >= 1 and index <= #browsParams then
        browsParams[index] = 0
        print("ResetBrowsParam: Resetting parameter " .. index)
        local success, result = pcall(function()
            return brows(table.unpack(browsParams))
        end)
        if success then
            human.Pose(result)
        else
            print("Error in ResetBrowsParam: " .. result)
        end
    else
        print("Invalid parameter index: " .. index)
    end
end

-- reset all brows parameters
function ResetALLbrowsParam(human)
    for i = 1, #browsParams do
        browsParams[i] = 0
    end
    print("ResetALLbrowsParam: Resetting all parameters")  -- brows(0, 0, 0, 0)
    local success, result = pcall(function()
        return brows(table.unpack(browsParams))
    end)
    if success then
        human.Pose(result)
    else
        print("Error in ResetALLbrowsParam: " .. result)
    end
end

-- Adjust brow increments
function AdjustBrowsParam(index, increment)
    if index >= 1 and index <= #browsParams then
        browsParams[index] = browsParams[index] + increment
        return (Brows(table.unpack(browsParams)))
    end
end

-- Adjusts the first brows parameter by +0.25
function Browspar1_A()
    return AdjustBrowsParam(1, FACE_PARAM_INCREMENT)
end

-- Adjusts the second brows parameter by +0.25
function Browspar2_A()
  return AdjustBrowsParam(2, FACE_PARAM_INCREMENT)
end

-- Adjusts the third brows parameter by +0.25
function Browspar3_A()
    return AdjustBrowsParam(3, FACE_PARAM_INCREMENT)
end

-- Adjusts the fourth brows parameter by +0.25
function Browspar4_A()
  return AdjustBrowsParam(4, FACE_PARAM_INCREMENT)
end

-- Adjusts the first brows parameter by +0.25
function Browspar1_B()
    return AdjustBrowsParam(1, -FACE_PARAM_INCREMENT)
end

-- Adjusts the second brows parameter by +0.25
function Browspar2_B()
  return AdjustBrowsParam(2, -FACE_PARAM_INCREMENT)
end

-- Adjusts the third brows parameter by +0.25
function Browspar3_B()
    return AdjustBrowsParam(3, -FACE_PARAM_INCREMENT)
end

-- Adjusts the fourth brows parameter by +0.25
function Browspar4_B()
  return AdjustBrowsParam(4, -FACE_PARAM_INCREMENT)
end

-----------
-----------


local success, result = pcall(function()
    return Preset(Mouth(table.unpack(mouthParams)))
end)
if not success then
    print("Error creating preset:", result)
else
    human.Pose(result)
end

-- Initialize a table to store all 16 mouth parameters
local mouthParams = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

FACE_PARAM_INCREMENT = 0.25
mouthParams[1] = mouthParams[1] + FACE_PARAM_INCREMENT

-- reset specific mouth parameter
function ResetMouthParam(index)
    if index >= 1 and index <= #mouthParams then
        mouthParams[index] = 0
        print("ResetMouthParam: Resetting parameter " .. index)
        local success, result = pcall(function()
            return Mouth(table.unpack(mouthParams))
        end)
        if success then
            human.Pose(result)
        else
            print("Error in ResetMouthParam: " .. result)
        end
    else
        print("Invalid parameter index: " .. index)
    end
end

-- reset all mouth parameters
function ResetALLMouthParam(human)
    for i = 1, #mouthParams do
        mouthParams[i] = 0
    end
    print("ResetALLMouthParam: Resetting all parameters")
    local success, result = pcall(function()
        return Mouth(table.unpack(mouthParams))
    end)
    if success then
        human.Pose(result)
    else
        print("Error in ResetALLMouthParam: " .. result)
    end
end

function AdjustMouthParam(index, increment)
    if index >= 1 and index <= #mouthParams then
        mouthParams[index] = mouthParams[index] + increment
        return (Mouth(table.unpack(mouthParams)))
    end
end

-- Adjusts the first mouth parameter by +0.25
function Mouthpar1_A()
    return AdjustMouthParam(1, FACE_PARAM_INCREMENT)
end

-- Adjusts the second mouth parameter by +0.25
function Mouthpar2_A()
  return AdjustMouthParam(2, FACE_PARAM_INCREMENT)
end

-- Adjusts the third mouth parameter by +0.25
function Mouthpar3_A()
  return AdjustMouthParam(3, FACE_PARAM_INCREMENT)
end

-- Adjusts the fourth mouth parameter by +0.25
function Mouthpar4_A()
  return AdjustMouthParam(4, FACE_PARAM_INCREMENT)
end

-- Adjusts the fifth mouth parameter by +0.25
function Mouthpar5_A()
  return AdjustMouthParam(5, FACE_PARAM_INCREMENT)
end

-- Adjusts the sixth mouth parameter by +0.25
function Mouthpar6_A()
  return AdjustMouthParam(6, FACE_PARAM_INCREMENT)
end

-- Adjusts the seventh mouth parameter by +0.25
function Mouthpar7_A()
  return AdjustMouthParam(7, FACE_PARAM_INCREMENT)
end

-- Adjusts the eighth mouth parameter by +0.25
function Mouthpar8_A()
  return AdjustMouthParam(8, FACE_PARAM_INCREMENT)
end

-- Adjusts the ninth mouth parameter by +0.25
function Mouthpar9_A()
  return AdjustMouthParam(9, FACE_PARAM_INCREMENT)
end

-- Adjusts the tenth mouth parameter by +0.25
function Mouthpar10_A()
    return AdjustMouthParam(10, FACE_PARAM_INCREMENT)
end

-- Adjusts the eleventh mouth parameter by +0.25
function Mouthpar11_A()
    return AdjustMouthParam(11, FACE_PARAM_INCREMENT)
end

-- Adjusts the twelfth mouth parameter by +0.25
function Mouthpar12_A()
    return AdjustMouthParam(12, FACE_PARAM_INCREMENT)
end

-- Adjusts the thirteenth mouth parameter by +0.25
function Mouthpar13_A()
    return AdjustMouthParam(13, FACE_PARAM_INCREMENT)
end

-- Adjusts the fourteenth mouth parameter by +0.25
function Mouthpar14_A()
    return AdjustMouthParam(14, FACE_PARAM_INCREMENT)
end

-- Adjusts the fifteenth mouth parameter by +0.25
function Mouthpar15_A()
    return AdjustMouthParam(15, FACE_PARAM_INCREMENT)
end

-- Adjusts the sixteenth mouth parameter by +0.25
function Mouthpar16_A()
    return AdjustMouthParam(16, FACE_PARAM_INCREMENT)
end

--
--
--

-- Adjusts the first mouth parameter by -0.25
function Mouthpar1_B()
    return AdjustMouthParam(1, -FACE_PARAM_INCREMENT)
end

-- Adjusts the second mouth parameter by -0.25
function Mouthpar2_B()
  return AdjustMouthParam(2, -FACE_PARAM_INCREMENT)
end

-- Adjusts the third mouth parameter by -0.25
function Mouthpar3_B()
  return AdjustMouthParam(3, -FACE_PARAM_INCREMENT)
end

-- Adjusts the fourth mouth parameter by -0.25
function Mouthpar4_B()
  return AdjustMouthParam(4, -FACE_PARAM_INCREMENT)
end

-- Adjusts the fifth mouth parameter by -0.25
function Mouthpar5_B()
  return AdjustMouthParam(5, -FACE_PARAM_INCREMENT)
end

-- Adjusts the sixth mouth parameter by -0.25
function Mouthpar6_B()
  return AdjustMouthParam(6, -FACE_PARAM_INCREMENT)
end

-- Adjusts the seventh mouth parameter by -0.25
function Mouthpar7_B()
  return AdjustMouthParam(7, -FACE_PARAM_INCREMENT)
end

-- Adjusts the eighth mouth parameter by -0.25
function Mouthpar8_B()
  return AdjustMouthParam(8, -FACE_PARAM_INCREMENT)
end

-- Adjusts the ninth mouth parameter by -0.25
function Mouthpar9_B()
  return AdjustMouthParam(9, -FACE_PARAM_INCREMENT)
end

-- Adjusts the tenth mouth parameter by -0.25
function Mouthpar10_B()
    return AdjustMouthParam(10, -FACE_PARAM_INCREMENT)
end

-- Adjusts the eleventh mouth parameter by -0.25
function Mouthpar11_B()
    return AdjustMouthParam(11, -FACE_PARAM_INCREMENT)
end

-- Adjusts the twelfth mouth parameter by -0.25
function Mouthpar12_B()
    return AdjustMouthParam(12, -FACE_PARAM_INCREMENT)
end

-- Adjusts the thirteenth mouth parameter by -0.25
function Mouthpar13_B()
    return AdjustMouthParam(13, -FACE_PARAM_INCREMENT)
end

-- Adjusts the fourteenth mouth parameter by -0.25
function Mouthpar14_B()
    return AdjustMouthParam(14, -FACE_PARAM_INCREMENT)
end

-- Adjusts the fifteenth mouth parameter by -0.25
function Mouthpar15_B()
    return AdjustMouthParam(15, -FACE_PARAM_INCREMENT)
end

-- Adjusts the sixteenth mouth parameter by -0.25
function Mouthpar16_B()
    return AdjustMouthParam(16, -FACE_PARAM_INCREMENT)
end


--Lists
facepresets = {GritTeeth, Pog, Pursedlips, Pursedsmile, Lipbite}
facestr = {"Grit Teeth", "Pogged", "Pursed Lips", "Pursed Smile", "Lipbite"}
bodypresets = {DoubleV, JackO, HandsInfront1, HandsInfront2, HandsBehind1, HandsBehind2, HandsBehind3, HandsHeels}
bodystr = {"Double Vs", "Jack-O Pose", "Infront", "Infront - 2", "Behind", "Behind - 2", "Behind - 3", "Hands on Heels"}
kisspresets = {OpenWide, TongueOut, TongueOut2, TongueOut3, Kiss1, Kiss2, Kiss3, Kiss4}
kissstr = {"Open Wide", "Tongue Out", "Tongue Out - 2", "Tongue Out - 3", "Kiss - 1", "Kiss - 2", "Kiss - 3", "Kiss - 4"}