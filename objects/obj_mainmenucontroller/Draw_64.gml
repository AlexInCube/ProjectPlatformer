draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_text_shadow(12,GUIHEIGHT-20,gameversion_word+string(GM_version),fnt_main,2,c_black,c_gray,1)
if menustate = menu_state.level_select{
	var lvl_spr = spr_button_lvl_select
	var lvl_spr_size = sprite_get_width(lvl_spr)
	var cell_space = 10
	var ds_map = global.level_names
	for(var i = 0; i < ds_map_size(ds_map); i++){
		var xx = (GUIWIDTH/2)-((ds_map_size(ds_map)*lvl_spr_size+cell_space)/2)+(i*lvl_spr_size+cell_space)
		var yy = 100
		draw_sprite(lvl_spr,0,xx,yy)
		draw_set_font(fnt_main)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_text(xx+21,yy+21,i+1)
		var m = mouseover(xx,yy,xx+lvl_spr_size,yy+lvl_spr_size)
		if m{
			if mouse_check_button_pressed(mb_left){
				game_start(asset_get_index("rm_lvl"+string(i+1)))
			}
		}
	}
}