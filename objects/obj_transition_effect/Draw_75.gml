if effect == transition_type.fade_in{
	draw_set_color(c_black)
	draw_set_alpha(fade)
	draw_rectangle(0,0,GUIWIDTH,GUIHEIGHT,false)
	draw_set_alpha(1)
	fade += 0.01
}

if effect == transition_type.fade_out{
	draw_set_color(c_black)
	draw_set_alpha(fade)
	draw_rectangle(0,0,GUIWIDTH,GUIHEIGHT,false)
	draw_set_alpha(1)
	fade -= 0.10
	if fade < 0 instance_destroy()
}