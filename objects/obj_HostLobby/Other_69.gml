/// @description Listening for Lobby Creation

switch (async_load[?"event_type"]) {
	case "lobby_created":
	
		var lobbyID = steam_lobby_get_lobby_id();
		db($"Lobby is created! SteamID: {lobbyID }");
		steam_lobby_join_id(lobbyID);
		
	break;
	
	case "lobby_joined":
		if steam_lobby_is_owner() { // If WE are the steam lobby owner
			steam_lobby_set_data("isGameMakerTest", "true");
			steam_lobby_set_data("Creator", steam_get_persona_name() );
			//steam_lobby_set_data("map","rm_game");
		}
		
		room_goto(rm_GameRoom);
	break;
}