/// @description Load locale data
function localization_load() {
	global.localization_map	= ds_map_create();

		// open the locale file for reading
		var lang_name = "custom_lang"
		switch(global.settings.interface.language){
			case -1: break
			case 0: lang_name = "russian" break
			case 1: lang_name = "english" break
		}
		//var locale_file	= file_text_open_read(lang_name+"\\"+".txt" );
		var locale_folder = "localization\\"
		var language_folder = lang_name+"\\"
		
		var fname, file, files = 0
		for (fname = file_find_first(locale_folder+language_folder + "\*", 0); fname != ""; fname = file_find_next()) {
		    // don't include current/parent directory "matches":
		    //if (fname == ".") continue
		    //if (fname == "..") continue
		    // push file into array
		    file[files] = locale_folder+language_folder+fname
			show_debug_message(LOGGER_LOCALIZATION_MANAGER + "Found locale file: "+file[files])
		    files += 1
		}
		file_find_close()
		// process found files:
		var i = 0
		repeat (files) {
			show_debug_message(LOGGER_LOCALIZATION_MANAGER + "Loading words from: "+file[i])
		    fname = file_text_open_read(file[i])
		    i += 1

			// build the JSON text
			var json_str	= "";
			var j = 0;
			while ( !file_text_eof(fname) )
			{
				json_str += file_text_read_string(fname);
				file_text_readln(fname);
				j++;
			}
			file_text_close(fname);
			// convert the JSON to a usable ds_map
			var locale_map = json_decode(json_str);
			if !ds_exists(locale_map,ds_type_map){
				show_debug_message(LOGGER_LOCALIZATION_MANAGER + "////////////////////ERROR WHILE LOADING: "+file[i-1])
				continue
			}
			var _map_size = ds_map_size(global.localization_map)
			var map_position = ds_map_find_first(locale_map)
			for(var o=0;o<ds_map_size(locale_map);o++){ 
				ds_map_replace(global.localization_map,map_position,locale_map[? map_position])
				map_position = ds_map_find_next(locale_map,map_position)
				_map_size = ds_map_size(global.localization_map)
			}
			ds_map_destroy(locale_map)
		}


		show_debug_message(LOGGER_LOCALIZATION_MANAGER + "Loaded localization_map from " + string(ds_map_size(global.localization_map)) + " lines of text." );
}

///@function find_keyword(key)
///@param key
function find_keyword(key) {

	// return the locale string for a given key
	if !is_string(key){string(key)}
	if ( ds_map_exists( global.localization_map, key ) )
	{
		return ds_map_find_value( global.localization_map, key );
	} else {
		return key;
	}
}