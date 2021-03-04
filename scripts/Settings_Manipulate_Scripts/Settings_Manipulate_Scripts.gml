function declinesettings() {
	with(obj_optionswindow){
		instance_destroy()
	}
}

function save_settings(){
	var _struct = json_stringify(global.settings)
	save_string_in_json(_struct,"game_settings.json")
}

function apply_settings() {
	with(obj_optionswindow){
		options_execute_scripts()
		save_settings()
		instance_destroy()
	}
}
	
function settodefault() {
	with(obj_optionswindow){
		setup_default_settings()//Setup default struct

		options_execute_scripts()
	
		open_settings()//Destroy settings window
		open_settings()//Open Settings Window
	}
}

function options_execute_scripts(){
	with obj_optionswindow
	{//Apply all settings
		var ds_grid = ds_options
		var ds_height = ds_grid_height(ds_grid)
		for(var i=0;i<ds_height-1;i++)
		{
			switch(ds_grid[# 1,i])//Get element type
			{
				//ds_grid[# 2,i] is script, ds_grid[# 3,i] value in options.
				case settings_element_type.toggle:
					script_execute(ds_grid[# 2,i],ds_grid[# 3,i])
				break;
				case settings_element_type.shift:
					script_execute_ext(ds_grid[# 2,i],[ds_grid[# 3,i],ds_grid[# 4,i]])
				break;
				case settings_element_type.slider:
					script_execute(ds_grid[# 2,i],ds_grid[# 3,i])
				break;
			}
		}
	}
}

function options_toggle(){
	button_var[0][# 3,button_var[1]] = !button_var[0][# 3,button_var[1]]
}

function options_slider(){
	//slider_var[0][# 3,slider_var[1]][@ 0] = max_value*value
	var normalized = clamp((device_mouse_x_to_gui(0)-slider_x) / slider_bar_width,0,1) 
	// realValue is the value in a continuous space - without the "grid" of steps
	var realValue = lerp(min_value,max_value,normalized)
	// count the number of steps in realValue and round it
	var numSteps = round(realValue/step_value)
	// get the actual value in terms of steps
	slider_var[0][# 3,slider_var[1]][@ 0]  = numSteps*step_value
	slider_var[0][# 3,slider_var[1]][@ 0] = clamp(slider_var[0][# 3,slider_var[1]][@ 0],min_value,max_value)
}