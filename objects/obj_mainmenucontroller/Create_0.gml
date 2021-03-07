//Switching main menu/pause menu UI state
enum menu_state{
	level_select,
	settings,
}

menustate = menu_state.level_select
gameversion_word = find_keyword("game_version")

ds_menu_main = create_ui_elements_list(
	create_fancy_button((GUIWIDTH/2)-293,300,spr_buttonmenu,depth-1,find_keyword("settings"),open_settings),
	create_fancy_button((GUIWIDTH/2)+200,300,spr_buttonmenu,depth-1,find_keyword("exit"),game_end),
)

global.init_room = rm_lvl1

lvl_spr = spr_button_lvl_select
lvl_spr_size = sprite_get_width(lvl_spr)
cell_space = 10
ds_map = global.level_names