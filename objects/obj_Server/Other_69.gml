/// @description Server Listener

switch (async_load[?"event_type"]) {
	case "lobby_chat_update":
		var fromID = async_load[?"user_id"]; // Steam ID
		var fromName = steam_get_user_persona_name_sync(fromID); // Steam Player Name
		
		if (async_load[?"change_flags"] and steam_lobby_member_change_entered) {
			db($"Player Joined: {fromName}");
			var slot = array_length(playerList); // Non-programmer counting.
			array_push(playerList, {
				steamID: fromID,
				steamName: fromName,
				character : undefined,
				startPos: grab_spawn_point(slot),
				lobbyMemberID : slot,
			});
			
			// Update the existing players of new information!
			send_player_sync(fromID);
			send_player_spawn(fromID, slot);
		}
		
	break;
}
