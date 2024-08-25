//@self obj_Server // Self-reference!
function send_player_sync(_steamID) {
	var buffer = buffer_create(1, buffer_grow, 1);
	buffer_write(buffer, buffer_u8, NET.SYNC_PLAYERS);
	buffer_write(buffer, buffer_string, shrink_player_list() );
	steam_net_packet_send(_steamID, buffer);
	buffer_delete(buffer);
}

//@self obj_Server // Self-reference!
function send_player_spawn(_steamID, _slot) {
	var pos = grab_spawn_point(_slot);
	var buffer = buffer_create(5, buffer_fixed, 1); // 1+2(x,y)
	buffer_write(buffer, buffer_u8, NET.SPAWN_SELF);
	buffer_write(buffer, buffer_u16, pos.x);
	buffer_write(buffer, buffer_u16, pos.y);
	steam_net_packet_send(_steamID, buffer);
	buffer_delete(buffer);
	
	server_player_spawn_at_position(_steamID, pos);
	send_other_player_spawn(_steamID, pos);
}

function shrink_player_list() {
	var shrinkList = playerList;
	for (var i = 0; i < array_length(shrinkList); ++i) {
	    shrinkList[i].character = undefined;				// Remove Character Object information, because otherwise this will send waaaaay too much information.
	}
	return json_stringify(shrinkList);
}
	
function server_player_spawn_at_position(_steamID, _pos) {
	var _layer = layer_get_id("Instances");
	
	for (var i = 0; i < array_length(playerList); ++i) {
		if playerList[i].steamID == _steamID {
			var inst = instance_create_layer(_pos.x,_pos.y, _layer, obj_Player, {
				steamID			: _steamID,	
				steamName		: playerList[i].steamName,	
				lobbyMemberID	: i,
			});
			playerList[i].character = inst;
		}
	}
}

function send_other_player_spawn(_steamID, _pos) {
	var buffer = buffer_create(13, buffer_fixed, 1); // 1(someone else)+2(x,y)+8(steamID)
	buffer_write(buffer, buffer_u8, NET.SPAWN_OTHER); 
	buffer_write(buffer, buffer_u16,_pos.x); 
	buffer_write(buffer, buffer_u16,_pos.y); 
	buffer_write(buffer, buffer_u64,_steamID); 
	steam_net_packet_send(_steamID, buffer);
	for (var i = 1; i < array_length(playerList); ++i) {
	    if playerList[i].steamID != steamID {
			steam_net_packet_send(playerList[i].steamID,buffer);	
		}
	}
	buffer_delete(buffer);
}