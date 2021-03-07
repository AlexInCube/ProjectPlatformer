function save_game(){
	var save_data = {
		game_progress: global.progress,
		death_count: global.deaths
	}
	var save_string = json_stringify(save_data)

	//Save Main Data
	var file_path = "playerdata.txt"
	var file = file_text_open_write(file_path)
	file_text_write_string(file,save_string)
	file_text_close(file)
	show_debug_message("Main data saved: "+file_path)
}

function load_game() {
	var file_path = "playerdata.txt"
	if file_exists(file_path){
		var file = file_text_open_read(file_path)
		var save_string = file_text_read_string(file)
		file_text_close(file)
		var save_data = json_parse(save_string)
	
		global.progress = save_data.game_progress
		global.deaths = save_data.death_count
	}
}