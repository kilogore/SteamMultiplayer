/// @description Setup lobby_list

lobby_list = []

image_xscale = xScale;
image_yscale = yScale;

lobbyList[0] = instance_create_depth(x,bbox_top+40,-20,obj_LobbyItem);

steam_lobby_list_add_string_filter("isGameMakerTest", "true", steam_lobby_list_filter_eq);
steam_lobby_list_request(); // Steam request for lobbies!

resetLobbyList = function() {
	for (var i = 0; i < array_length(lobbyList); ++i) {
		db($"Deleting: {lobbyList[i]} ");
		instance_destroy(lobbyList[i]);
	}	
	lobbyList = [];
	
}