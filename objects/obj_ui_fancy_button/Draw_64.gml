var colordiff = 50*ceil(image_index)
var c = make_color_rgb(255-colordiff,255-colordiff,255-colordiff)
draw_set_color(c)

draw_sprite(button_sprite,image_index,button_x,button_y)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_small)
if string_width(button_txt) < button_width - 10
{
	draw_text(button_x+button_width/2,button_y+button_height/2,button_txt)
}else{
	draw_text_ext(button_x+button_width/2,button_y+button_height/2-5,button_txt,16,button_width-5)
}
