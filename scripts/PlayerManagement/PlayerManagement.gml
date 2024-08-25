// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerManagement(){

}


function grab_spawn_point(_player) {
	
	var spawnPoint = instance_find(obj_SpawnPoint, _player);
	if spawnPoint == noone return{x:0,y:0}
	return {x:spawnPoint.x,y:spawnPoint.y}
	
}