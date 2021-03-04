enum grav{
	down,
	up,
	right,
	left,
}

#macro GRAV_STATE obj_controller.gravitation
#macro GRAV_POWER obj_controller.gravitation_power
#macro PLAYER_HP obj_controller.player_hp



function setup_vars(){
	gravitation = grav.down
	gravitation_power = 300
	player_max_hp = 100
	player_hp = player_max_hp
	
	lvl_info = global.level_names[? room_get_name(room)]
	
	physics_world_gravity(0,GRAV_POWER)
}