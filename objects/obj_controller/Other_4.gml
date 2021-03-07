if room == rm_game_init{
	alarm[0]=1
	exit
}
if room == rm_main_menu{
	instance_destroy()
	exit
}

if !instance_exists(obj_camera){
	instance_create_layer(0,0,"Instances",obj_camera)
}
setup_vars()