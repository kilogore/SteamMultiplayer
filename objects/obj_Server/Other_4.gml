/// @description Insert description here
// You can write your code in this editor

var playerLayer = layer_get_id("Instances");

for (var i = 0; i < array_length(playerList); ++i) {
   var pos = grab_spawn_point(i);
   var inst = instance_create_layer(pos.x, pos.y, playerLayer, obj_Player, {
	  steamID		: playerList[i].steamID, 
	  steamName		: playerList[i].steamName, 
	  lobbyMemberID : playerList[i],
   });
   playerList[i].character = inst;
   playerList[i].startPos = pos;
   if (playerList[i].steamID = steamID) {
		character = inst;   
   }
}
