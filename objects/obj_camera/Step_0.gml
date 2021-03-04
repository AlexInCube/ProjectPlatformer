//Get camera x and y
cx = camera_get_view_x(camera)
cy = camera_get_view_y(camera)

var cam_angle = camera_get_view_angle(camera)

switch(GRAV_STATE){
	case grav.down: //0 degree
		cam_angle = rotate_toward(cam_angle,0,camera_rotation_speed*DELTATIME)//+
	break
	
	case grav.up: //180 degree
		cam_angle = rotate_toward(cam_angle,180,camera_rotation_speed*DELTATIME)//-
	break
	
	case grav.left: //90 degree
		cam_angle = rotate_toward(cam_angle,90,camera_rotation_speed*DELTATIME)//+
	break
	
	case grav.right: //270 degree
		cam_angle = rotate_toward(cam_angle,270,camera_rotation_speed*DELTATIME)//-
	break
}

camera_set_view_angle(camera,cam_angle)

switch(mode){
	case camera_mode.follow_object: 
		if(!instance_exists(following)) break
		cx = following.x - (view_w/2)
		cy = following.y - (view_h/2)
	break
	
	case camera_mode.follow_mouse_peek: 
	if(!instance_exists(following)) break
		cx = lerp(following.x, mouse_x, 0.3)-(view_w/2)
		cy = lerp(following.y, mouse_y, 0.3)-(view_h/2)
	break
	
	case camera_mode.move_to_follow_object: 
		if(!instance_exists(following)) break
		cx = lerp(cx, following.x - (view_w/2), camera_speed*DELTATIME)
		cy = lerp(cy, following.y - (view_h/2), camera_speed*DELTATIME)
		
		if point_distance(cx,cy,following.x - (view_w/2),following.y - (view_h/2)) < 1{
			mode = camera_mode.move_to_follow_object
		}
	break
	
	case camera_mode.move_to_target: 
		cx = lerp(cx, target_x - (view_w/2), camera_speed*DELTATIME)
		cy = lerp(cy, target_y - (view_h/2), camera_speed*DELTATIME)
	break
}

camera_set_view_pos(camera,cx,cy)