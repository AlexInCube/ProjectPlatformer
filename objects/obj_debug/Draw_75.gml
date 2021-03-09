if !DEBUGMODE{exit}
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(fnt_main)
draw_text(0,40,"FPS: "+string(fps))
draw_text(0,60,"Fullscreen: "+string(global.settings.video.fullscreen))
draw_text(0,80,"Game Progress: "+string(global.progress))
draw_text(0,100,"Deaths Count: "+string(global.deaths))
draw_text(0,120,"Room Speed: "+string(room_speed))
draw_text(0,140,"Game Speed: "+string(game_get_speed(gamespeed_fps)))
draw_text(0,160,"Time: "+get_formatted_date(global.time.hours)+":"+get_formatted_date(global.time.minutes)+":"+get_formatted_date(global.time.seconds))