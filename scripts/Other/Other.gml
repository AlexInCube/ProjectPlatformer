function nothing(){
}

/// Saving a string as a buffer
function save_string_in_json (_string, _filename) {
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}

function level_add_name(rm_index,rm_name,rm_number){
	var info = {
		room_name : rm_name,
		room_number : rm_number
	}
	var playlist = global.level_playlist
	ds_grid_add(playlist,0,ds_grid_height(playlist)-1,room_get_name(rm_index))
	ds_grid_add(playlist,1,ds_grid_height(playlist)-1,info)
	ds_grid_resize(playlist,2,ds_grid_height(playlist)+1)
}

function draw_text_shadow(_x, _y, _string, _font, _shadow_size, _shadow_colour, _text_colour, _alpha) {
	draw_set_font(_font);
	draw_set_alpha(_alpha)
	draw_set_color(_shadow_colour)
	draw_text((_x + _shadow_size), (_y + _shadow_size), string(_string));
	draw_set_color(_text_colour)
	draw_text(_x, _y, string(_string));
}

function draw_nine_slice_box(sprite, x1, y1, x2, y2, sub_image) {
	var slice_width = sprite_get_width(sprite)/3;
	var slice_height = sprite_get_height(sprite)/3;

	var width = abs(x2-x1);
	var height = abs(y2-y1);

	// Top
	draw_sprite_part_ext(sprite, sub_image, 0, 0, slice_width, slice_height, x1, y1, 1, 1, c_white, 1); // Left
	draw_sprite_part_ext(sprite, sub_image, slice_width, 0, slice_width, slice_height, x1+slice_width, y1, (width-slice_width*2)/slice_width, 1, c_white, 1); // Middle
	draw_sprite_part_ext(sprite, sub_image, slice_width*2, 0, slice_width, slice_height, x2-slice_width, y1, 1, 1, c_white, 1); // Right

	// Middle
	draw_sprite_part_ext(sprite, sub_image, 0, slice_height, slice_width, slice_height, x1, y1+slice_height, 1, (height-slice_height*2)/slice_height, c_white, 1); // Left
	draw_sprite_part_ext(sprite, sub_image, slice_width, slice_height, slice_width, slice_height, x1+slice_width, y1+slice_height, (width-slice_width*2)/slice_width, (height-slice_height*2)/slice_height, c_white, 1); // Middle
	draw_sprite_part_ext(sprite, sub_image, slice_width*2, slice_height, slice_width, slice_height, x2-slice_width, y1+slice_height, 1, (height-slice_height*2)/slice_height, c_white, 1); // Right

	// Bottom
	draw_sprite_part_ext(sprite, sub_image, 0, slice_height*2, slice_width, slice_height*2, x1, y2-slice_height, 1, 1, c_white, 1); // Left
	draw_sprite_part_ext(sprite, sub_image, slice_width, slice_height*2, slice_width, slice_height, x1+slice_width, y2-slice_height, (width-slice_width*2)/slice_width, 1, c_white, 1); // Middle
	draw_sprite_part_ext(sprite, sub_image, slice_width*2, slice_height*2, slice_width, slice_height, x2-slice_width, y2-slice_height, 1, 1, c_white, 1); // Right
}

function get_formatted_date(number){
	number = string(number)
	if string_length(number) == 1{
		return string(0)+number
	}else{
		return number
	}
}

function transition_create_effect(effect){
	with instance_create_layer(0,0,"Instances",obj_transition_effect){
		self.effect = effect
		switch(self.effect){
			case transition_type.fade_in:
				fade = 0
			break
			
			case transition_type.fade_out:
				fade = 1
			break
		}
	}
}