audio_group_stop_all(ag_sounds)

save_game()
if room != rm_main_menu{
	if room != rm_end_game{
		room_goto(rm_main_menu)
	}
}