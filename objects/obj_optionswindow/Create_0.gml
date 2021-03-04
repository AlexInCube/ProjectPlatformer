depth =-100

enum settings_element_type{
	slider,
	shift,
	toggle,
	input,
	title
}


window_name=find_keyword("settings")
window_width=1280
window_height=720
window_sprite=spr_basicwindow_without_close
window_x = (global.settings.video.width - window_width)/2
window_y = (global.settings.video.height - window_height)/2
create_ds_grid_settings()
ds_size = ds_grid_height(ds_options)

drawelementstart = 0//Start drawing ds_grid from position (height)
drawelementheight = min(round((GUIHEIGHT-40)/24)-2,ds_size)
//Input
inputting=false
toinput=0
input_button_half_width=sprite_get_width(spr_control_button)/2

ds_options_ui_elements = create_ui_elements_list()

with(obj_mainmenucontroller){
	ui_element_switch_lock_all(ds_menu_main,true)
}

function recreate_buttons(){
	var start_y = window_y+26, start_x = window_x+10, y_buffer = 24, ds_grid = ds_options
	var rsx = window_x + window_width//window right side x
	//Center for info
	var entriesoffset = 120
	var yy = 0; for(var i=drawelementstart;i<drawelementstart+drawelementheight;i++){
	var rsy = start_y + (yy*y_buffer)
		switch(ds_grid[# 1,i]){
			#region Slider
			case settings_element_type.slider:
				//Draw value of slider
				draw_set_halign(fa_center)
				var current_val = ds_grid[# 3,i][@ 0]
				draw_text(rsx-entriesoffset,rsy,string(current_val))
				var min_val = ds_grid[# 4,i]
				var max_val = ds_grid[# 5,i]
				var step_val = ds_grid[# 6,i]
				add_ui_element(ds_options_ui_elements, create_slider_bar(rsx-entriesoffset-48,rsy+12,depth-1,current_val/max_val,min_val,max_val,step_val,options_slider,[ds_grid,i]))
			break;
			#endregion
			#region Toggle
			case settings_element_type.toggle:
				var current_val = ds_grid[# 3,i]
				add_ui_element(ds_options_ui_elements, create_toggle_button(rsx-entriesoffset-12,rsy,spr_checkbox,depth-1,current_val,options_toggle,[ds_grid,i]))
			break;
			#endregion
		}
	yy++
	}
	add_ui_element(ds_options_ui_elements,create_fancy_button(window_x+20,window_y+window_height-60,spr_buttonmenu,depth-1,find_keyword("apply_settings"),apply_settings))
	add_ui_element(ds_options_ui_elements,create_fancy_button(window_x+(window_width/2)-(sprite_get_width(spr_buttonmenu)/2),window_y+window_height-60,spr_buttonmenu,depth-1,find_keyword("decline_settings"),declinesettings))
	add_ui_element(ds_options_ui_elements,create_fancy_button(window_x+window_width-sprite_get_width(spr_buttonmenu)-20,window_y+window_height-60,spr_buttonmenu,depth-1,find_keyword("set_to_default"),settodefault))
}


recreate_buttons()
