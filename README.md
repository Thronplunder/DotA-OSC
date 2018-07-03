# DotaOSC 0.01
##Description
This is the scripts Folder of a DotA custom map, that changes nothing about the game itself, but catches several events, turns some data into a json object, appends it to a http requests 
and sends it to a local running Node.js http Server, that then processes it further into OSC messages. 
The OSC messages will be sent to Supercollider, that then finally turns it into sound. The corresponding files for Supercollider and Node.js can be found in another repository.

##Usage
- Create a custom DotA 2 map via the workshop tools
- replace the content of the scripts folder in (your steam folder)/steamapps/common/dota 2 beta/game/dota_addons/(your addon name)


##Libraries used
David Heiko Kolf's dkjson: [Link](http://dkolf.de/src/dkjson-lua.fsl/home)  
bmddota's Barebone Starter Mod Kit: [Link](https://github.com/bmddota/barebones)

##Documentation
... sort of
###Event
The Events sent and the data, that comes with them.   
####One time events
*Dota2PlayersLoaded*   
Is sent once, when all players are loaded into the game.   
Sent information:  
- status: a bool, that is alway true and only there, because i have to send at least one thing 
- xSize: the size of the map on the x-axis
- ySize: the size of the map on the y-axis


*Dota2PlayerSpawned*  
Is sent everytime a player's hero spawns for the first time in the game. usually, when the picking phase ends.  
Sent information:  
- playerID: the ID of the player, that got his hero spawned
- playerTeam:  the ID of the team the player belongs to
- networth: the players networth, usually 625


####Regular events	
Events, that usually happen several times during the game. 

*Dota2HeroSpawned*  
Triggers everytime a hero spawns ingame. also including the first spawn, which triggers Dota2PlayerLoaded.
Sent information: 
- playerID: the ID of the player that owns this hero

*Dota2NPCSpawned*  
Triggers every time a NPC spawns ingame, except for heroes.
Sent information:  
- entIndex: the index of the unit, that spawned  

*Dota2ItemPickup*  
Triggers every time an item is picked up.  
Sent information:  
- playerID: the ID of the player that picks up the item
- itemCost: the price of the item purchased
- currentGold: the amount of gold the player is holding after purchasing the item

*Dota2ItemPurchased*  
Triggers every time an item is bought.  
Sent information: 
- playerID: the ID of the player, that bought an item
- price: the price of the item purchased
- currentGold: the amount of gold the player hold after the purchase

*Dota2Networth*  
Triggers every time an item is picked up, an item is bought, an hero or a NPC dies.  
Sent information: 
- playerID: the ID of the player, that gets his networth updated
- networth: the new networth of the player

*Dota2AbilityUsed*  
Triggers every time an hero uses an ability.  
Sent information:
- playerID: the ID of the player, that used the ability
- abilityName: the name of the used ability

*Dota2LevelUp*  
Triggers every time a hero levels up.  
Sent information: 
- playerID: the id of the player, that levels up
- entLevel: the level of the hero after the level up

*Dota2LastHit*  
Triggers every time a hero gets a last hit.  
Sent information: 
- playerID: the ID of the player that got the last hit
- heroKill: a bool that determines, if a hero was killed
- killedEndID: the index of the unit, that was killed

*Dota2TreeCut*  
Triggers every time a tree is destroyed.  
Sent information:  
- xCoord: the x ccordinate of the cut tree
- yCoord: the y coordinate of the tree cut

*Dota2HeroKilled*  
Triggered every time a hero is killed.  
Sent information: 
- playerID: the Id of the player that got killed

*Dota2XP*  
Triggers every time someone gained XP.  
Sent information: 
- playerID: the ID of the player that gained XP
- xp: the amount of xp the player gained in total

*Dota2Position*  
Triggers every 5 seconds and updates the position of all the heroes ingame.  
Sent information:
- playerID: the ID of the player owning this hero
- x: the x-coordinate of the hero
- y: the y-coordinate of the hero 
