# qb-pawn
Player Owned Pawnshop


```First ever Resource I created from Scrath.```

Have you ever wanted more RP in your server? When players rob houses, jewelery stores etc. And they just want to make some money at the Pawnshop? But there is no user interactions, and it kind of takes roleplay away. Well this script I have been thinking about and used some knowledge from other scripts working the same more or less.

This is basically just a better pawnshop script for your city. 
This shop have been configured so that this script can just work with the regular `qb-pawnshop` script. 
All shops have `qb-target` set up.
Store system is handled with `qb-menu`.
All can be easilly be customised

All you need to do is the following for it to make sense:

Add the following under qb-core/shared/jobs:
	```['pawnshop'] = {
		label = 'Pawner', 
		defaultDuty = false, offDutyPay = false,
		grades = {
		['0'] = {name = 'Recruit', payment = 50},
		['1'] = {name = 'Novice', payment = 75},
		['2'] = {name = 'Experienced', payment = 100},
		['3'] = {name = 'Advanced', payment = 125},
		['4'] = {name = 'Manager/Owner', isboss = true, payment = 150},
	},```

Then make sure you add the following job to your Database:

```pawnshop``` ![image](https://github.com/LamaarK/qb-pawn/assets/65554339/4b77173a-8475-4b09-96e7-7f4280faf421)

When that is done and you feel you want to make use of qb-pawnshop by having employees sell and melt themself and not players, replace the coords to the following:
qb-pawshop/config

``Config.PawnLocation = {
    [1] = {
            coords = vector3(168.1, -1311.13, 29.34),
            length = 1.5,
            width = 1.8,
            heading = 207.0,
            debugPoly = false,
            minZ = 28.0,
            maxZ = 31.0,
            distance = 2.0
        },
    }``

ALSO!!!! VERY IMPORTANT : YOU WILL NEED THIS MLO FOR THE SCRIPT TO ACTUALLY WORK! I COULD NOT FIND OTHER MLO's SO USED THIS FREE ONE INSTEAD. IF YOU HAVE FOUND A BETTER MLO, PLEASE LET ME KNOW!!
[https://youtu.be/lVxnapN72K4](https://youtu.be/D5QSZAVBFG0)https://youtu.be/D5QSZAVBFG0
https://drive.google.com/file/d/1eZs2_fVmbyJRw9Lvx3XNPFpWjA0SiAMW/view

**I DONT KNOW WHO TO GIVE CREDIT TO, BUT BIG THANKS TO**
qb-core and community

**DEPENDENCIES**
QB CORE https://github.com/qbcore-framework/qb-core
QB TARGET https://github.com/qbcore-framework/qb-target
QB PAWNSHOP https://github.com/qbcore-framework/qb-pawnshop
QB MENU https://github.com/qbcore-framework/qb-menu
POLYZONE https://github.com/mkafrin/PolyZone
SMILES AND HAPPY FACES https://www.youtube.com/shorts/B65HNxMQZRk?feature=share

Discord me: https://discord.gg/gB8s5fDe38 - For support if you need, I dont know much, but its good to grow a community and share amazing stuff



