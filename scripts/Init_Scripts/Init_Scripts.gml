function setup_default_settings() {
global.settings = {
	audio : {
		mastervolume: 0.3,
		musicvolume: 0.3,
		soundvolume: 0.3
	},
	video : {
		fullscreen : true,
		width : display_get_width(),
		height : display_get_height(),
		v_sync : false,
		game_speed: 60,
		sprite_animation: true,
		room_transition: true
	},
	interface : {
		guisize: 1,
		language: 0,//0 - Russian, 1 - English
	},
	game : {
	},
	another : {
		use_sys_cursor : false
	},
	controls : {
		key_up : vk_space,		
		key_left :	ord("A"),
		key_right :	ord("D"),

		developer_key :	vk_f5
		},
	}
}

/// Loading a string from a buffer
function load_string_from_json (_filename) {
	if !file_exists(_filename)exit
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);

	buffer_delete(_buffer);
	return _string;
}

function load_settings(){
	// Load JSON
	var _json_settings = load_string_from_json("game_settings.json");//Get string which contain in file
	if !is_undefined(_json_settings){
		var temp_struct = json_parse(_json_settings)//Convert settings string into struct
		var sections_names_array = variable_struct_get_names(temp_struct)//Get sections names
		with(global.settings)
		{
			//Loop through sections, video, audio and etc.
			for(var i=0;i<array_length(sections_names_array);i++)
			{
				var section_struct = temp_struct[$ sections_names_array[i]]
				if !is_struct(section_struct){continue}
				var options_array = variable_struct_get_names(section_struct)
				//Loop through all options in section
				for(var j=0;j<array_length(options_array);j++)
				{
					//Setup section -> option
					//If variable exists in global.settings, setup him.
					variable_struct_set(global.settings[$ sections_names_array[i]],options_array[j],section_struct[$ options_array[j]])
				}
			}
		}
	}
}

function setup_level_playlist(){
	global.level_playlist = ds_grid_create(2,1)
	if debug_mode{
		level_add_name(rm_lvl_test,"Уровень для разработчика",0)
	}
	level_add_name(rm_lvl1,"Обучение",1)
	level_add_name(rm_lvl2,"Вступление",2)
	level_add_name(rm_lvl3,"Прыжки",3)
	level_add_name(rm_lvl4,"Е-Стена",4)
	level_add_name(rm_lvl5,"Разбивание лица",5)
	level_add_name(rm_lvl6,"Переключатель",6)
	level_add_name(rm_lvl7,"Камеры",7)
	level_add_name(rm_lvl8,"Ниагарский водопад",8)
	level_add_name(rm_lvl9,"Падение",9)
	level_add_name(rm_lvl10,"Поворотор",10)
	level_add_name(rm_lvl11,"Розовая смерть",11)
	level_add_name(rm_lvl12,"Спуск с горы",12)
	level_add_name(rm_lvl13,"Переключало",13)
	level_add_name(rm_lvl14,"Стрейф",14)
	level_add_name(rm_lvl15,"Возвышение",15)
	level_add_name(rm_lvl16,"ААААААА!!!",16)
	level_add_name(rm_lvl17,"Ямочки",17)
	level_add_name(rm_lvl18,"Уберите этот пол",18)
	ds_grid_resize(global.level_playlist,2,ds_grid_height(global.level_playlist)-1)
}