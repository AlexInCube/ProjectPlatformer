audio_master_gain(global.settings.audio.mastervolume)
audio_group_set_gain(ag_music,global.settings.audio.musicvolume,0)
audio_group_set_gain(ag_sounds,global.settings.audio.soundvolume,0)

if !audio_is_playing(Music1) and !audio_is_playing(Music2) and !audio_is_playing(Music3) and !audio_is_playing(Music4){
	audio_play_sound(choose(Music1,Music2,Music3,Music4),2,false)
}

change_window_mode(global.settings.video.fullscreen)

alarm[0]=1


//change_cursor_type(global.settings.another.use_sys_cursor)
