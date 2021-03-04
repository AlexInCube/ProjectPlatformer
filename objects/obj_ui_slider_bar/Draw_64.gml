draw_sprite(slider_bar_sprite,0,slider_x,slider_y)
draw_sprite(slider_button_sprite,0,slider_x+slider_bar_width*value,slider_y)
/*
draw_text_shadow(slider_x+slider_bar_width*value,slider_y,string(max_value)+"/"+string(min_value)+"/"+string(value),fnt_small,1,c_black,c_gray,1)
/*
var button_x = slider_x+slider_bar_width*value
var button_y = slider_y
draw_rectangle(button_x-slider_button_width/2,button_y-slider_button_height/2,button_x+slider_button_width/2,button_y+slider_button_height/2,false)