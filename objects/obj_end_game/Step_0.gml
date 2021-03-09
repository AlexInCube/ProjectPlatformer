timer++

if timer >= 300{
	if keyboard_check_pressed(vk_anykey){
		room_goto(rm_main_menu)
	}
}