audio_play_sound(snd_win,0,false)

var i = 0
for(i = 0; i<ds_grid_height(global.level_playlist); i++){
	if global.level_playlist[# 0,i] == room_get_name(room){
		var lvl_info = global.level_playlist[# 1,i]
		break
	}
}

var true_progress = global.progress
true_progress++
if lvl_info.room_number == true_progress{
	global.progress++
	save_game()
}

//If room final in playlist
if room == asset_get_index(global.level_playlist[# 0,ds_grid_height(global.level_playlist)-1]){
	room_goto(rm_end_game)
	exit
}

//i++ need made earlier than trying asset_get_index, or we going to the same room
i++
var next_lvl = global.level_playlist[# 0,i]
room_goto(asset_get_index(next_lvl))