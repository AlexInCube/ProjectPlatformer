if !DEBUGMODE{exit}
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(fnt_main)
draw_text(0,40,"FPS: "+string(fps))
draw_text(0,60,"Fullscreen: "+string(global.settings.video.fullscreen))
draw_text(0,80,"Game Progress: "+string(global.progress))
draw_text(0,100,"Deaths Count: "+string(global.deaths))
