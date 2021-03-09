enum grav{
	down,
	up,
	right,
	left,
}

#macro GRAV_STATE obj_controller.gravitation
#macro GRAV_POWER obj_controller.gravitation_power
#macro PLAYER_HP obj_controller.player_hp

previous_room = -1
//If room_restart, then setup default values.
function setup_vars(){
	gravitation = grav.down
	gravitation_power = 300
	player_max_hp = 100
	player_hp = player_max_hp
	
	for(var i = 0; i<ds_grid_height(global.level_playlist); i++){
		if global.level_playlist[# 0,i] == room_get_name(room){
			lvl_info = global.level_playlist[# 1,i]
			break
		}
	}
	
	physics_world_gravity(0,GRAV_POWER)
	//physics_world_update_speed()
}