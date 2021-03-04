//If mouse over
if !mouse_lock{
	if mouseover(button_x,button_y,button_x+button_width,button_y+button_height)
	{
		if mouse_check_button_pressed(mb_left)
		{
			script_execute(button_script)
			image_index = !image_index
		}
	}
}