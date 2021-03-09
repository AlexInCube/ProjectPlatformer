draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_text_shadow(12,GUIHEIGHT-20,gameversion_word+string(GM_version),fnt_main,1,c_black,c_gray,1)


if menustate = menu_state.level_select{
	var xx = (GUIWIDTH/2) - (((lvl_spr_size+cell_space)*10)/2)
	var yy = 100
	var pos = 0
	for(var i = 0; i < ds_grid_height(ds_grid); i++){

		if (pos mod 10) == 0
		    {
			   pos=0
			   yy+=lvl_spr_size+cell_space
			   xx=(GUIWIDTH/2) - (((lvl_spr_size+cell_space)*10)/2)+pos*(lvl_spr_size+cell_space)
			}
			else
			{
				xx=(GUIWIDTH/2) - (((lvl_spr_size+cell_space)*10)/2)+pos*(lvl_spr_size+cell_space)
		
			}
			pos+=1 
		
		if i <= global.progress{
			draw_sprite(lvl_spr,0,xx,yy)
			draw_set_font(fnt_main)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_text(xx+21,yy+21,i+1)
			var m = mouseover(xx,yy,xx+lvl_spr_size,yy+lvl_spr_size)
			if m{
				if mouse_check_button_pressed(mb_left){
					game_start(asset_get_index(ds_grid[# 0,i]))
				}
			}
		}else{
			draw_sprite(lvl_spr,1,xx,yy)
		}
	}
}