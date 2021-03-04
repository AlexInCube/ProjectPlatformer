///@decription create_menu_page
///@arg ["Name1",type1,entries1...]
///@arg ["Name2",type2,entries2...]
function create_menu_page() {
	var arg, i = 0
	repeat(argument_count){
		arg[i] = argument[i]
		i++
	}

	var ds_grid_id = ds_grid_create(7, argument_count)
	i = 0; repeat(argument_count){
		var array = arg[i]
		var array_len = array_length(array)
	
		var xx = 0; repeat(array_len){
			ds_grid_id[# xx,i] = array[xx]
			xx++
		}
	
		i++
	}

	return ds_grid_id
}

function game_start(lvl){
	global.init_room = lvl
	room_goto(rm_game_init)

}

function open_settings() {
	obj_mainmenucontroller.menustate = menu_state.settings
	if !instance_exists(obj_optionswindow){
		instance_create_depth(0,0,0,obj_optionswindow)
	}else{
		instance_destroy(obj_optionswindow)
	}
}