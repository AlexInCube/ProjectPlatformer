//Switching main menu/pause menu UI state
enum menu_state{
	level_select,
	settings,
}

menustate = menu_state.level_select
gameversion_word = find_keyword("game_version")

var button_x = 50
ds_menu_main = create_ui_elements_list(
	create_fancy_button(button_x,229,spr_buttonmenu,depth-1,find_keyword("settings"),open_settings),
	create_fancy_button(button_x,315,spr_buttonmenu,depth-1,find_keyword("exit"),game_end),
)

global.init_room = rm_lvl1
/*
for(var i = 0; i < ds_map_size(global.level_names); i++){
	add_ui_element(ds_menu_main,create_fancy_button())
}