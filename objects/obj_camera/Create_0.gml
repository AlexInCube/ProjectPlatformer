enum camera_mode{
	follow_object,
	follow_mouse_peek,
	move_to_target,
	move_to_follow_object,
}

#macro DEFAULT_CAMERA_MODE change_camera_mode(camera_mode.follow_object,obj_player)
#macro MOVE_TO_PLAYER_CAMERA_MODE change_camera_mode(camera_mode.move_to_follow_object,obj_player,0.1)

#macro camera view_camera[0]

//Camera mode
mode = camera_mode.follow_object
target_angle = 0
//Move to follow object
default_camera_speed = 1
camera_speed = default_camera_speed//Camera speed (speed range must be 0.00 to 1.00)
camera_rotation_speed = 9
following=obj_player
//Move to target
target_x = 0
target_y = 0

event_user(0)