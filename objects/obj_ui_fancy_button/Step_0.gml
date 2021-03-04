//If mouse over
if !mouse_lock{
	if mouseover(button_x,button_y,button_x+button_width,button_y+button_height)
	{
		image_index+=0.5*DELTATIME
		if mouse_check_button_pressed(mb_left)
		{
			script_execute(button_script)
		}
	}else{
		image_index-=0.5*DELTATIME
	}
}else{
	image_index-=0.5*DELTATIME
}
image_index=clamp(image_index,0,sprite_get_number(button_sprite)-1)