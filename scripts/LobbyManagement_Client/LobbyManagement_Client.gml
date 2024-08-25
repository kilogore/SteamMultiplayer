// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LobbyManagement_Client(){

}

//#self obj_Client
function sync_players(_new_list) {
	var steamIDs = [];
	for (var i = 0; i < array_length(playerList); ++i) {
	    array_push(steamIDs, playerList[i].steamID);
	}
	
	for (var i = 0; i < array_length(_new_list); ++i) {
		var _newSteamID = _new_list[i].steamID;
	    if !array_contains(steamIDs, _newSteamID) {
			var inst = client_player_spawn_at_pos(_new_list[i]);
			_new_list[i].character = inst;
			array_push(playerList, _new_list[i] );
		} else {
			// a player is attempting to join when they already exist in-game. Server should attempt to sync up!	
			
			for (var j = 0; j < array_length(playerList); ++j) { // Find the player in the player list that has the same ID as the joinee
			    if (playerList[j].steamID == _newSteamID) {
					// Sync Variables
					playerList[j].startPos		= _new_list[i].startPos;
					playerList[j].lobbyMemberID = _new_list[i].lobbyMemberID;
					if playerList[j].character == undefined and playerList[j].steamID != _newSteamID { // If there is not a character spawned, and we are not a new steam id.
						var inst = client_player_spawn_at_pos(playerList[j]);
						playerList[j].character = inst;
					}
				}
			}
			
		}
	}
}

function client_player_spawn_at_pos(player_info)  {
	var _layer = layer_get_id("Instances");
	var _steamID	= player_info.steamID;
	var _steamName	= player_info.steamName;
	var _lobby		= player_info.lobbyMemberID;
	var _pos		= player_info.startPosl
	var inst = instance_create_layer(_pos.x,_pos.y,_layer, obj_Player, {
		steamID		:	_steamID,
		steamName	:	_steamName,
		lobbyMemberID :	_lobby,
		
	});
	return inst;
}
