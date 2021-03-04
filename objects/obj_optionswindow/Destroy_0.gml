// Inherit the parent event
ds_grid_destroy(ds_options)
destroy_ui_elements_list(ds_options_ui_elements)

with(obj_mainmenucontroller){
	menustate = menu_state.level_select
	ui_element_switch_lock_all(ds_menu_main,false)
}