audio_play_sound(snd_win,0,false)
var lvl_info = global.level_names[? room_get_name(room)]
var true_progress = global.progress
true_progress++
if lvl_info.room_number == true_progress{
	global.progress++
	save_game()
}

if room == rm_lvl18{
	show_message("Поздравляю, ты прошёл игру\n"+"За всё время ты умер: "+string(global.deaths))
}
room_goto(new_room)
