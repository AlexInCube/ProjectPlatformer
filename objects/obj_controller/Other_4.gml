//This need for setup obj_controller, before any lvl started. (controller is persistant) 
if room == rm_game_init{
	alarm[0]=1
	exit
}
//Destroy controller is this rooms
if room == rm_main_menu or room == rm_end_game{
	audio_group_stop_all(ag_sounds)
	instance_destroy()
	exit
}else{
	save_game()
}
//Need for FADE_IN or FADE_OUT effects
if previous_room != room{
	if global.settings.video.room_transition{
		transition_create_effect(transition_type.fade_out)
	}
	
	previous_room = room
}


//Create camera
if !instance_exists(obj_camera){
	instance_create_layer(0,0,"Instances",obj_camera)
}
//If room_restart, then setup default values.
setup_vars()