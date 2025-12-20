-- FreemodeHG version 0.3 - faunap_edit_0.2
-- https://discord.com/channels/620113492208517120/1312401584910631054/1355724274224205984

-- Also dependancies in following files:
-- tm_a_presets_faunap.lua
-- tm_menu_facelab_faunap.lua

-- Variables
activeloops = {}
CL_SMult = 1 --Speed multiplier
--CL_Imult = 0.5 --Intensity multiplier
HG_UIvis = true

function CustomLoops(human, loop1, loop2, id)
	if activeloops[human.Name..id] == loop2 then
		activeloops[human.Name..id] = loop1
		human.Pose(loop1())
	else
		activeloops[human.Name..id] = loop2
		human.Pose(loop2())
	end
end

function CustomLoops3(human, loop1, loop2, loop3, id)
	local key = human.Name..id
	if activeloops[key] == loop1 then
		activeloops[key] = loop2
		human.Pose(loop2())
	elseif
		activeloops[key] == loop2 then
		activeloops[key] = loop3
		human.Pose(loop3())
	else
		activeloops[key] = loop1
		human.Pose(loop1())
	end
end

function CustomLoops4(human, loop1, loop2, loop3, loop4, id)
	local key = human.Name..id
	if activeloops[key] == loop1 then
		activeloops[key] = loop2
		human.Pose(loop2())
	elseif
		activeloops[key] == loop2 then
		activeloops[key] = loop3
		human.Pose(loop3())
	elseif
		activeloops[key] == loop3 then
		activeloops[key] = loop4
		human.Pose(loop4())
	else
		activeloops[key] = loop1
		human.Pose(loop1())
	end
end

function CustomLoops6(human, loop1, loop2, loop3, loop4, loop5, loop6, id)
	local key = human.Name..id
	if activeloops[key] == loop1 then
		activeloops[key] = loop2
		human.Pose(loop2())
	elseif
		activeloops[key] == loop2 then
		activeloops[key] = loop3
		human.Pose(loop3())
	elseif
		activeloops[key] == loop3 then
		activeloops[key] = loop4
		human.Pose(loop4())
	elseif
		activeloops[key] == loop4 then
		activeloops[key] = loop5
		human.Pose(loop5())
	elseif
		activeloops[key] == loop5 then
		activeloops[key] = loop6
		human.Pose(loop6())
	else
		activeloops[key] = loop1
		human.Pose(loop1())
	end
end

SpeedIncrement_A = 0.1
EaseIncrement_A = 0.2
CLV2_A = 2 + EaseIncrement_A
CLV2_B = 2 + EaseIncrement_A

function CustomLoopsV2(actor, id, duration, effect1, effect2)
	if activeloops[actor.Name..id] == 2 then
		activeloops[actor.Name..id] = 1
		actor.AddInvoluntaryAnim(id, duration, (duration/CLV2_A), duration/CLV2_A, effect1)
	else
		activeloops[actor.Name..id] = 2
		actor.AddInvoluntaryAnim(id, duration, (duration/CLV2_B), duration/CLV2_B,  effect2)
	end
end

function CustomLoopsV3(actor, id, duration, effect1, effect2, effect3,)
	local key = actor.Name..id
	if activeloops[key] == 1 then
		activeloops[key] = 2
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect2)
	elseif activeloops[key] == 2 then
		activeloops[key] = 3
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect3)
	else
		activeloops[key] = 1
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect1)
	end
end

function CustomLoopsV4(actor, id, duration, effect1, effect2, effect3, effect4)
	local key = actor.Name..id
	if activeloops[key] == 1 then
		activeloops[key] = 2
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect2)
	elseif activeloops[key] == 2 then
		activeloops[key] = 3
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect3)
	elseif activeloops[key] == 3 then
		activeloops[key] = 4
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect4)
	else
		activeloops[key] = 1
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect1)
	end
end

function CustomLoopsV6(actor, id, duration, effect1, effect2, effect3, effect4)
	local key = actor.Name..id
	if activeloops[key] == 1 then
		activeloops[key] = 2
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect2)
	elseif activeloops[key] == 2 then
		activeloops[key] = 3
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect3)
	elseif activeloops[key] == 3 then
		activeloops[key] = 4
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect4)
	elseif activeloops[key] == 4 then
		activeloops[key] = 5
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect5)
	elseif activeloops[key] == 5 then
		activeloops[key] = 6
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect6)
	else
		activeloops[key] = 1
		actor.AddInvoluntaryAnim(id, duration, (duration/EaseIncrement_A), duration/EaseIncrement_B, effect1)
	end
end

local ThisAnim = {}	
function CustomAnimationV2(actor, anim1, anim2, duration, effect1, effect2)								
	if ThisAnim[anim1] == anim2 then
		ThisAnim[anim1] = anim1
		actor.AddInvoluntaryAnim(anim1, duration, (duration / 2), (duration / 2), effect1)				
	else																
		ThisAnim[anim1] = anim2																			
		actor.AddInvoluntaryAnim(anim2, duration, (duration / 2), (duration / 2), effect2)
	end
end
