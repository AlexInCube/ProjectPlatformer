if( !audio_is_playing(music_array[current_playing % total_music])){
    audio_play_sound(music_array[++current_playing % total_music], 100, false);
}

if current_playing >= array_length(music_array){
	current_playing = 0
}