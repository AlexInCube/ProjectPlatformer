function create_ui_elements_list(){
	var ds_list_id = ds_list_create()
	var i=0;repeat(argument_count){
		ds_list_add(ds_list_id,argument[i])
		i++
	}
	return ds_list_id
}

function add_ui_element(ds_list_id,element){
	ds_list_add(ds_list_id,element)
}

function destroy_ui_element(ds_list_id,element){
	instance_destroy(ds_list_id[| element])
	ds_list_delete(ds_list_id,element)
}

function destroy_ui_elements_list(ds_list_id){
	var i=0;repeat(ds_list_size(ds_list_id)){
		instance_destroy(ds_list_id[| i])
		i++
	}
	ds_list_destroy(ds_list_id)
}

function clear_ui_elements_list(ds_list_id){
	var i=0;repeat(ds_list_size(ds_list_id)){
		instance_destroy(ds_list_id[| i])
		i++
	}
	ds_list_clear(ds_list_id)
}

function ui_element_switch_lock(element_id,lock_state){
	element_id.mouse_lock = lock_state
}

function ui_element_switch_lock_all(ds_list_id,lock_state){
	var i=0;repeat(ds_list_size(ds_list_id)){
		ds_list_id[| i].mouse_lock = lock_state
		i++
	}
}

function create_fancy_button(xx,yy,_sprite,_depth,text,script){
	var _button = instance_create_depth(0,0,_depth,obj_ui_fancy_button)
	with (_button){
		button_x = xx
		button_y = yy
		button_txt = text
		button_sprite = _sprite
		button_script = script
		event_user(0)
	}
	return _button
}

function create_toggle_button(xx,yy,_sprite,_depth,toggle_state,button_scr,_var){
	var _button = instance_create_depth(0,0,_depth,obj_ui_toggle_button)
	with (_button){
		button_x = xx
		button_y = yy
		image_index = toggle_state
		button_sprite = _sprite
		button_var = _var
		button_script = button_scr
		event_user(0)
	}
	return _button
}

function create_slider_bar(xx,yy,_depth,cur_value,min_val,max_val,_step_val,slider_scr,slider_arg){
	var _button = instance_create_depth(0,0,_depth,obj_ui_slider_bar)
	with (_button){
		slider_x = xx
		slider_y = yy
		slider_script = slider_scr
		value = cur_value
		step_value = _step_val
		min_value = min_val
		max_value = max_val
		slider_var = slider_arg
	}
	return _button
}

///@description mouseover(xx,yy,xx2,yy2)
///@function mouseover
///@param xx
///@param yy
///@param xx2
///@param yy2
/*
	Used in many GUI function for buttons
*/
function mouseover(xx, yy, xx2, yy2) {
	return point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),xx,yy,xx2,yy2)
}