var lvl_info_txt = get_formatted_date(lvl_info.room_number)+"  "+lvl_info.room_name
var block_width = max(150,string_width(lvl_info_txt)+10)
var block_height = 60
var block_xx = (GUIWIDTH/2)-block_width/2
var block_yy = 20

draw_set_halign(fa_left)
draw_set_valign(fa_top)
//Draw shadow from block
draw_set_color(c_black)
draw_rectangle(block_xx+2,block_yy+2,block_xx+block_width+2,block_yy+block_height+2,false)
//Draw block
draw_set_color(c_green)
draw_rectangle(block_xx,block_yy,block_xx+block_width,block_yy+block_height,false)
//Draw hp sign
var hp_xx = block_xx+(block_width/2)-69//69 = full hp/2 + hp sign/2
var hp_yy = block_yy+block_height-20
var hp_space = 5
draw_sprite(spr_hp_sign,0,hp_xx,hp_yy)
//Draw player hp
for(var i = 0; i < 25; i++){
	var sub_img = 0
	if player_hp < i*4 sub_img = 1
	draw_sprite(spr_hp,sub_img,hp_xx+17+(hp_space*i),hp_yy)
}
draw_set_color(c_white)
//Draw lvl number and lvl name
draw_text_shadow(block_xx+5,block_yy,lvl_info_txt,fnt_main,2,c_black,c_white,1)