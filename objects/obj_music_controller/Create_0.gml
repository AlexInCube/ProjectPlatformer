if instance_number(obj_music_controller)>1{
	instance_destroy()
}

current_playing = 0
music_array = [
	Music1,
	Music2,
	Music3,
	Music4
]
total_music = array_length(music_array)