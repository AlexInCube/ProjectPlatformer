if mouse_check_button_pressed(mb_left){
	var button_x = slider_x+slider_bar_width*value
	var button_y = slider_y
	if mouseover(button_x-slider_button_width/2,button_y-slider_button_height/2,button_x+slider_button_width/2,button_y+slider_button_height/2){
		obj_ui_slider_bar.selected = false
		selected = true
	}
}

if mouse_check_button_released(mb_left){
	selected = false
}

if selected{
	value = clamp((device_mouse_x_to_gui(0)-slider_x) / slider_bar_width,0,1) 
	script_execute(slider_script)
}
