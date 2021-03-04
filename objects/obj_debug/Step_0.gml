actual_delta = delta_time/1000000//Delta in seconds
global.delta_multiplier = actual_delta/target_delta//delta_multiplier*speed

if keyboard_check_pressed(global.settings.controls.developer_key){
	DEBUGMODE = !DEBUGMODE
	var visibility = DEBUGMODE
	show_debug_overlay(DEBUGMODE)
	/*
	if !DEBUGMODE{
		instance_destroy(obj_console)
	}else{
		instance_create_layer(0,0,"Instances",obj_console)
	}
	*/
}