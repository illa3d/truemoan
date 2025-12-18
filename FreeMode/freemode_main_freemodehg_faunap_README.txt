Discord - https://discord.com/channels/620113492208517120/1312401584910631054/1355724274224205984

 think i'll just post it here actually, its just a modified HG script after all and it contains all of their work, so thanks to them!. 
It features:

A revamped menu for readability and easy access
A facelab where you can customize facial expression in increments that go beyond the limits
A dozen or so premade facial expressions
23 full body poses
65 animations (including @HeartGrenade 's) 
     including Licking, BJ randomizers, Footjob anim, Female masturbation and 20 or so hip animations!
Plenty of these animations feature randomized values to make them feel more organic and less static!
Remove pussy wetness or increase pussy wetness thanks to @CallMeDrJones6911
A speed lab the can control the speed of anims in realtime (to some extent)
A structure to incorporate 3, 4 or 6 pose animations and controlling them in realtime using the speedlab menu!
Camera Headtracking
Actor Headtracking (This ones still buggy and i've only gotten it to work between the first 2 actors)
A quick access menu for commonly used poses ( and hands closed / open )
A structure to summon your favourite characters (in your favourite outfits!)

Some features are a work in progress!!~~ (WIP)

Know issues~
the face reset buttons require an increment to update the face
mouth reset button crashes the menu despite being identical to the others, but functionality remains intact

Disclaimer i know nothing about coding until now, so thanks to HeartGrenade, Sfin, Snapsnap, CallMeDrJones and others as i've pulled plenty of code and info from their scripts~

alright ill just post it already! 

Enjoy! 

--- Changelog.txt

***Some options are still a work in progress (WIP) and may not function as intended***
	"Face Actor" in particular has weird behaviours.

-Poses
        Sit
            down
            scared
        Laydown
            back
            side R
            side L
            stomach
        Stand up
            straight
            bend over
        Kneel
            1
            2
            3
            4
            all4
            all4 2
        Arms
            infront
                2
            behind
                2
                3
            on heels
            hands
                peace
                    L
                    R
                Shush R
                open
                    2
                closed
                grab head
        Face
            grit teeth
            Ahegao!
                2
            tongueout
                2
                3
            kiss
                2
                3
                4
            pursed lips
            pursed smile
            lipbite

quick access menu ~ for common use

Face / Look options
    camera
        look
        face
    actor
        face (*)
        look


Animations
        Licking
            vertical
                2
            horizontal
                2
            rotate
                2
        Breast shake
            wide random
            narrow random
        Hands --sometimes stalls out if using both hands
            grope breast
                2
            masturbate
            middle 2 - deeper
            bj gesture
            beckon
        Legs
            footjob standing
            leg sway --stalls out if you use both
        Hips - twist
        Hips - sway
            10-24
            5-10
        Head
            nod
                subtle
                jam
            shake
                subtle
                random
        BJ variety
            up
            down
            forward
                random
            random
        Humping
            random
        Soft
            random

~maybe more i forgot to add~

QoL / misc
    Hid options that were gender/penis specific.
    Increase pussy wetness option(thanks to CallMeDrJones6911 script).
    Increased auto cumming options.
    Most buttons return you to the menu now added various Back/Done buttons instead.
    More stop animation triggers.
    Options for looping between 3, 4, or 6 poses using: CustomLoops3, CustomLoops4, CustomLoopsV4, CustomLoopsV6, CustomLoops6.
    Randomness to animations making them feel more organic/less static.
    Shortened names to improve readability.
 
Of note:
        Animations that use either both arms or both legs can sometimes stall out. 
            havent figure out the cause as success/failure states have been inconsistent

        Rregarding animation alignment: right click waist     = adjust animation height
                                        right click hips/head = retain animation height


(*) - **WARNING** "face actor" bugs tf out. (face a, face b, face c)

    Sometimes it just doesnt want to work..
    it also can behave strangely if you SAVE a scene while its active
    so yeah..  maybe dont do that.

```
function FaceActorA(actor) return Preset(
    HeadLookAt(BoneMesh(TargetActor.A, "Bone_Head", 0, 0, 0.03))
) end
```
Pulled various code/info from heartgrenade, snapsnap, sfin, CallMeDrJones6911 & probably other indirectly~
So thanks for that!~

end




