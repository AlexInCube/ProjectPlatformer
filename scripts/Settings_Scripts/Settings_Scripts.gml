///@function return_normal_control_word(input_value);
function return_normal_control_word(input_value){
var str1 = input_value;
var str2 = "";
if (str1 >= 48 && str1 <= 90) {
    str2 = string_lettersdigits(chr(str1));
}
else {
    switch (str1) {
        case vk_enter: str2 = "Enter"; break;
        case vk_left: str2 = "Left"; break;
        case vk_right: str2 = "Right"; break;
        case vk_up: str2 = "Up"; break;
        case vk_down: str2 = "Down"; break;
        case vk_escape: str2 = "Escape"; break;
        case vk_space: str2 = "Space"; break;
        case vk_shift: str2 = "Shift"; break;
        case vk_control: str2 = "Control"; break;
        case vk_alt: str2 = "Alt"; break;
        case vk_backspace: str2 = "Backspace"; break;
        case vk_tab: str2 = "Tab"; break;
        case vk_home: str2 = "Home"; break;
        case vk_end: str2 = "End"; break;
        case vk_delete: str2 = "Delete"; break;
        case vk_insert: str2 = "Insert"; break;
        case vk_pageup: str2 = "Page Up"; break;
        case vk_pagedown: str2 = "Page Down"; break;
        case vk_pause: str2 = "Pause"; break;
        case vk_printscreen: str2 = "Printscreen"; break;
        case vk_f1: str2 = "F1"; break;
        case vk_f2: str2 = "F2"; break;
        case vk_f3: str2 = "F3"; break;
        case vk_f4: str2 = "F4"; break;
        case vk_f5: str2 = "F5"; break;
        case vk_f6: str2 = "F6"; break;
        case vk_f7: str2 = "F7"; break;
        case vk_f8: str2 = "F8"; break;
        case vk_f9: str2 = "F9"; break;
        case vk_f10: str2 = "F10"; break;
        case vk_f11: str2 = "F11"; break;
        case vk_f12: str2 = "F12"; break;
        case vk_numpad0: str2 = "Numpad 0"; break;
        case vk_numpad1: str2 = "Numpad 1"; break;
        case vk_numpad2: str2 = "Numpad 2"; break;
        case vk_numpad3: str2 = "Numpad 3"; break;
        case vk_numpad4: str2 = "Numpad 4"; break;
        case vk_numpad5: str2 = "Numpad 5"; break;
        case vk_numpad6: str2 = "Numpad 6"; break;
        case vk_numpad7: str2 = "Numpad 7"; break;
        case vk_numpad8: str2 = "Numpad 8"; break;
        case vk_numpad9: str2 = "Numpad 9"; break;
        case vk_multiply: str2 = "Numpad *"; break;
        case vk_divide: str2 = "Numpad /"; break;
        case vk_add: str2 = "Numpad +"; break;
        case vk_subtract: str2 = "Numpad -"; break;
        case vk_decimal: str2 = "Numpad ."; break;
		/*
        case gp_face1: str2 = "A Button"; break;
        case gp_face2: str2 = "B Button"; break;
        case gp_face3: str2 = "X Button"; break;
        case gp_face4: str2 = "Y Button"; break;
		case gp_shoulderr: str2 = "Right Shoulder Button"; break;
        case gp_shoulderl: str2 = "Left Shoulder Button"; break;
        case gp_shoulderrb: str2 = "Right Shoulder Trigger"; break;
        case gp_shoulderlb: str2 = "Left Shoulder Trigger"; break;
        case gp_padu: str2 = "D-Pad Up"; break;
        case gp_padd: str2 = "D-Pad Down"; break;
        case gp_padl: str2 = "D-Pad Left"; break;
        case gp_padr: str2 = "D-Pad Right"; break;
        case gp_stickl: str2 = "Left Stick Pressed"; break;
        case gp_stickr: str2 = "Right Stick Pressed"; break;
        case gp_select: str2 = "Select"; break;
        case gp_start: str2 = "Start"; break;
		*/
		default: str2 = str1;
    }
}

	if DEBUGMODE{
		return string(str2)+" + "+string(str1);
	}else{
		return string(str2);
	}
}
	
function change_volume(option_array) {
	var type = option_array[@ 1][@ 1]
	var volume = option_array[@ 0]
	switch(type){
		case "mastervolume": audio_master_gain(volume);global.settings.audio.mastervolume=volume; break;
		case "musicvolume": audio_group_set_gain(ag_music,volume,0);global.settings.audio.musicvolume=volume; break;
		case "soundvolume": audio_group_set_gain(ag_sounds,volume,0);global.settings.audio.soundvolume=volume; break;
	}
}

function change_v_sync_mode(boolean) {
	global.settings.video.v_sync=boolean
	display_reset(0,global.settings.video.v_sync)
}

function change_gui_size(width,height,guisize) {
	var display_height=height,display_width=width
	var ideal_width=width;
	var ideal_height=height;

	var aspect_ratio=display_width/display_height;

	ideal_width=round(ideal_height*aspect_ratio);
	ideal_height=round(ideal_width / aspect_ratio);

	//Perfect Pixel Scaling
	if(display_width mod ideal_width != 0)
	{
	  var d = round(display_width/ideal_width);
	  ideal_width=(display_width/d)/guisize;
	}
	if(display_height mod ideal_height != 0)
	{
	  var d = round(display_height/ideal_height);
	  ideal_height=(display_height/d)/guisize;
	}
	/*
	//Check for odd numbers
	if(ideal_width & 1)
	  ideal_width++;
	if(ideal_height & 1)
	  ideal_height++;
	*/

	display_set_gui_size(ideal_width,ideal_height);

	GUIWIDTH=display_get_gui_width()
	GUIHEIGHT=display_get_gui_height()
}
	
	
function change_resolution(width,height,ui_size){
	window_set_size(width,height)
	change_gui_size(width,height,ui_size)
	surface_resize(application_surface,width,height);
	alarm[0]=2
}

function change_game_speed(option_array) {
	var value = option_array[@ 0]
	global.settings.video.game_speed=value
	game_set_speed(global.settings.video.game_speed,gamespeed_fps) 
}

function change_resolution_settings(current_val,shift_array) {
	var need_res = shift_array[current_val]
	var str_w = ""
	var str_h = ""
	var mode = 0
	for(var i=1;i<string_width(need_res);i++){
		var char = string_char_at(need_res,i)
		
		if char == "x"{
			mode = 1
			continue
		}
		switch(mode){
			case 0: str_w = string_insert(char,str_w,string_width(str_w)-1) break
			case 1: str_h = string_insert(char,str_h,string_width(str_h)-1) break
		}
	}
	global.settings.video.width=real(str_w)
	global.settings.video.height=real(str_h)
	window_set_size(global.settings.video.width,global.settings.video.height)
	change_gui_size(global.settings.video.width,global.settings.video.height,global.settings.interface.guisize)
	surface_resize(application_surface,global.settings.video.width,global.settings.video.height);
	alarm[0]=1

	GUIWIDTH=display_get_gui_width()
	GUIHEIGHT=display_get_gui_height()
}
	
function change_window_mode(boolean) {
	global.settings.video.fullscreen=boolean
	window_set_fullscreen(global.settings.video.fullscreen)
	
	window_set_size(global.settings.video.width,global.settings.video.height)
	change_gui_size(global.settings.video.width,global.settings.video.height,global.settings.interface.guisize)
	surface_resize(application_surface,global.settings.video.width,global.settings.video.height);
}
	
function change_language(current_val,shift_array) {
	global.settings.interface.language=current_val
}