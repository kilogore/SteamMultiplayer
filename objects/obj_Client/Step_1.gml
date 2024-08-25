/// @description Listening for Activity as Client

// Receiving Packets
while (steam_net_packet_receive()) {
	
	var sender = steam_net_packet_get_sender_id();
	steam_net_packet_get_data(in_buffer);
	buffer_seek(in_buffer, buffer_seek_start, 0);
	var packet_type = buffer_read(in_buffer, buffer_u8);
	
	switch(packet_type) {
		case NET.SYNC_PLAYERS:
			var player_list = buffer_read(in_buffer, buffer_string);
			player_list = json_parse(player_list);
			
			sync_players(player_list);
		break;
		
		case NET.SPAWN_OTHER:
			var _layer = layer_get_id("Instances");
			var xx = buffer_read(in_buffer, buffer_u16);
			var yy = buffer_read(in_buffer, buffer_u16);
			var _steamID = buffer_read(in_buffer, buffer_u64);
			var _num = array_length(playerList);
			var inst = instance_create_layer(xx,yy,_layer, obj_Player, {
				steamID		:	_steamID,
				steamName	:	steam_get_user_persona_name(_steamID),
				character	:	inst,
				lobbyMemberID : _num,
			});
		break;
		
		case NET.SPAWN_SELF:
			for (var i = 0; i < array_length(playerList); ++i) {
			    if playerList[i].steamID == steamID then lobbyMemberID = playerList[i].lobbyMemberID;
			}
		
			var _layer = layer_get_id("Instances");
			var xx = buffer_read(in_buffer, buffer_u16);
			var yy = buffer_read(in_buffer, buffer_u16);
			var _steamID = buffer_read(in_buffer, buffer_u64);
			var inst = instance_create_layer(xx,yy,_layer, obj_Player, {
				steamID		:	steamID,
				steamName	:	steamName,
				lobbyMemberID : lobbyMemberID,
			});
			playerList[0].character = inst;
			character = inst;
		break;
		default:
			db($"Client: Unknown Packet Received");
		break;
	}
	
}
