if player_hp <= 0{
	instance_destroy(obj_player)
}

if keyboard_check_pressed(vk_escape){
	instance_destroy()
}