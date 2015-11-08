# DotA-OSC 0.01
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