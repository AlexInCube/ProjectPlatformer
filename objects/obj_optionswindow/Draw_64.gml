draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)
draw_set_font(fnt_small)

var start_y = window_y+26, start_x = window_x+10, y_buffer = 24, ds_grid = ds_options

//Draw background
draw_nine_slice_box(window_sprite,window_x,window_y,window_x+window_width,window_y+window_height,0)
//Draw window_name
draw_text(window_x+7,window_y,window_name)

var rsx = window_x + window_width//window right side x
//Center for info
var entriesoffset = 120

/*
draw_sprite(spr_sliderbackground1,0,rsx-30,start_y)
draw_sprite(spr_slider,0,rsx-30,start_y+((236/(ds_grid_height(ds_grid)-10))*drawelementstart))
*/

draw_set_valign(fa_top)
//Draw entries
var yy = 0; for(var i=drawelementstart;i<drawelementstart+drawelementheight;i++){
	var rsy = start_y + (yy*y_buffer)
		switch(ds_grid[# 1,i]){
			#region Title
			case settings_element_type.title: 
				var text = ds_grid[# 0,i]
				var c = c_black
				draw_set_halign(fa_left)
				draw_text_color(start_x,rsy,text,c,c,c,c,1)
				draw_line_color(start_x-2,rsy+22,rsx-35,rsy+22,c,c)
			break;
			#endregion
			#region Shift
			case settings_element_type.shift: 
				var text = ds_grid[# 0,i]
				var c = c_white
				draw_set_halign(fa_left)
				draw_set_valign(fa_top)
				draw_text_color(start_x,rsy,text,c,c,c,c,1)
				
				var current_val = ds_grid[# 3,i]
				var current_array = ds_grid[# 4,i]
				c = c_white
				draw_set_halign(fa_center)
				
				draw_text_color(rsx-entriesoffset,rsy,current_array[current_val],c,c,c,c,1)
				
				var frameleft=0
				var frameright=0
				if mouseover(rsx-entriesoffset-84,rsy,rsx-entriesoffset-60,rsy+24){
					frameleft=1
					if mouse_check_button_pressed(mb_left){
						ds_grid[# 3,i] -=1
						ds_grid[# 3,i] = clamp(ds_grid[# 3,i],0,array_length(current_array)-1)
					}
				}else frameleft=0
				
				if mouseover(rsx-entriesoffset+64,rsy,rsx-entriesoffset+84,rsy+24){
					frameright=1
					if mouse_check_button_pressed(mb_left){
						ds_grid[# 3,i] +=1
						ds_grid[# 3,i] = clamp(ds_grid[# 3,i],0,array_length(current_array)-1)
					}
				}else frameright=0
				
				draw_sprite(spr_shift,frameleft,rsx-entriesoffset-84,rsy)
				draw_sprite_ext(spr_shift,frameright,rsx-entriesoffset+84,rsy,-1,1,0,c_white,1)
				
			break;
			#endregion
			#region Slider
			case settings_element_type.slider:
				var text = ds_grid[# 0,i]
				draw_set_color(c_white)
				draw_set_halign(fa_left)
				//Draw option name
				draw_text(window_x+10,rsy,text)
				draw_set_color(c_white)
				//Draw value of slider
				draw_set_halign(fa_center)
				draw_text(rsx-200,rsy,string(ds_grid[# 3,i][@ 0]))
			break;
			#endregion
			#region Toggle
			case settings_element_type.toggle:
				var text = ds_grid[# 0,i]
				c = c_white
				draw_set_halign(fa_left)
				draw_text_color(window_x+10,rsy,text,c,c,c,c,1)
			break;
			#endregion
			#region Input
			case settings_element_type.input:
				var text = ds_grid[# 0,i]
				c = c_white
				draw_set_halign(fa_left)
				draw_text_color(window_x+10,rsy,text,c,c,c,c,1)
				var keymode = 0//0 - Default, 1 - Mouse adove key, 2 - INPUT MODE.
				var current_val = ds_grid[# 3,i]
				c = c_white
				
				draw_set_halign(fa_center)
				
				if mouseover(rsx-entriesoffset-input_button_half_width,rsy,rsx-entriesoffset+input_button_half_width,rsy+22){
					keymode=1
					if mouse_check_button_pressed(mb_left){
						if !inputting{
							inputting = true
							toinput = ds_grid[# 0,i]
						}
					}
				}else{keymode=0}
				
				if toinput == ds_grid[# 0,i]{
					keymode = 2
					if keyboard_check_pressed(vk_anykey){
						if inputting==true{
							var names_array = variable_struct_get_names(global.settings.controls)//Get sections names
							var kk = keyboard_lastkey
							for(var c = 0;c<array_length(names_array);c++){
								if global.settings[$ "controls"][$ names_array[@ c]] == kk{
									kk = ds_grid[# 3, i]
									keyboard_lastkey =-1

									break
								}
							}
							ds_grid[# 3, i] = kk
							global.settings[$ "controls"][$ ds_grid[# 2,i]] = kk
							inputting=false
							toinput = 0
						}
					}
				}
				
				
				
				draw_sprite(spr_control_button,keymode,rsx-entriesoffset-input_button_half_width,rsy)
				draw_set_valign(fa_top)
				draw_text_color(rsx-entriesoffset,rsy-2,return_normal_control_word(current_val),c,c,c,c,1)
			break;
			#endregion
	}
	yy++
}

