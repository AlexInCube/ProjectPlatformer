/// @description Player Movement


// Move right
if keyboard_check(control_right)
{
   switch(GRAV_STATE){
		case grav.up: 
			physics_apply_force(x, y, -x_force, 0); 
		break
		
		case grav.down: 
			physics_apply_force(x, y, x_force, 0); 
		break
		
		case grav.left: 
			physics_apply_force(x, y, 0, +x_force);
		break
		
		case grav.right: 
			physics_apply_force(x, y, 0, -x_force);
		break
	}
}

// Move left
if keyboard_check(control_left)
{
	switch(GRAV_STATE){
		case grav.up: 
			physics_apply_force(x, y, +x_force, 0); 
		break
		
		case grav.down: 
			physics_apply_force(x, y, -x_force, 0); 
		break
		
		case grav.left: 
			physics_apply_force(x, y, 0, -x_force);
		break
		
		case grav.right: 
			physics_apply_force(x, y, 0, +x_force);
		break
	}
}

#region Movers
switch(GRAV_STATE){
	case grav.up: 
		if place_meeting(x,y,obj_mover_up){
			phy_position_y -= mover_speed
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}else if place_meeting(x,y-3,obj_mover_up){
			phy_position_y = phy_position_yprevious
		}else if place_meeting(x,y+3,obj_mover_up){
			phy_speed_y = 0 
			phy_position_y = phy_position_yprevious
		}
		
		if place_meeting(x,y,obj_mover_down){
			phy_position_y += mover_speed
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}else if place_meeting(x,y-3,obj_mover_down){
			phy_speed_y = 0 
		}
		
		if place_meeting(x,y,obj_mover_right){
			phy_position_x += mover_speed
			phy_speed_x = 0
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}
		
		if place_meeting(x,y,obj_mover_left){
			phy_position_x -= mover_speed
			phy_speed_x = 0
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}
	break
		
	case grav.down: 
		if place_meeting(x,y,obj_mover_up){
			phy_position_y -= mover_speed
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}else if place_meeting(x,y+3,obj_mover_up){
			phy_speed_y = 0 
			phy_position_y = phy_position_yprevious
		}
		
		if place_meeting(x,y,obj_mover_down){
			phy_position_y += mover_speed
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}
		
		if place_meeting(x,y,obj_mover_right){
			phy_position_x += mover_speed
			phy_speed_x = 0
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}
		
		if place_meeting(x,y,obj_mover_left){
			phy_position_x -= mover_speed
			phy_speed_x = 0
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}
	break
		
	case grav.left: 
		if place_meeting(x,y,obj_mover_up){
			phy_position_y -= mover_speed
			phy_speed_x = 0 
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}
		
		if place_meeting(x,y,obj_mover_down){
			phy_position_y += mover_speed
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}
		
		if place_meeting(x,y,obj_mover_right){
			phy_position_x += mover_speed
			phy_speed_x = 0
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}
		
		if place_meeting(x+3,y,obj_mover_left){
			phy_position_x -= mover_speed
			phy_speed_x = 0
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}
	break
		
	case grav.right: 
		if place_meeting(x,y,obj_mover_up){
			phy_position_y -= mover_speed
			phy_speed_x = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}else if place_meeting(x,y+3,obj_mover_up) or place_meeting(x,y-3,obj_mover_up){
			phy_speed_x = 0 
			phy_position_x = phy_position_xprevious
		}
		
		if place_meeting(x,y,obj_mover_down){
			phy_position_y += mover_speed
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}
		
		if place_meeting(x,y,obj_mover_right){
			phy_position_x += mover_speed
			phy_speed_x = 0
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}
		
		if place_meeting(x,y,obj_mover_left){
			phy_position_x -= mover_speed
			phy_speed_x = 0
			phy_speed_y = 0 
			phy_position_x = round(phy_position_x)
			phy_position_y = round(phy_position_y)
		}
	break
}
#endregion


//JUMP
if keyboard_check_pressed(control_jump)
{
	var range_to_wall = 4
	switch(GRAV_STATE){
		case grav.up: 
			if place_meeting(x, y - range_to_wall, obj_jumpable)
			{
				physics_apply_impulse(x, y, 0, +y_force);
			}
		break
		
		case grav.down: 
			if place_meeting(x,y + range_to_wall, obj_jumpable)
			{
				physics_apply_impulse(x, y, 0, -y_force);
			}
		break
		
		case grav.left: 
			if place_meeting(x - range_to_wall, y, obj_jumpable)
			{
				physics_apply_impulse(x, y, +y_force, 0);
			}
		break
		
		case grav.right: 
			if place_meeting(x + range_to_wall, y, obj_jumpable)
			{
				physics_apply_impulse(x, y, -y_force, 0);
			}
		break
	}
}

//Limit speed
switch(GRAV_STATE){
		case grav.up: 
			phy_speed_x = clamp(phy_speed_x, -max_x_speed, max_x_speed);
		break
		
		case grav.down: 
			phy_speed_x = clamp(phy_speed_x, -max_x_speed, max_x_speed);
		break
		
		case grav.left: 
			phy_speed_y = clamp(phy_speed_y, -max_x_speed, max_x_speed);
		break
		
		case grav.right: 
			phy_speed_y = clamp(phy_speed_y, -max_x_speed, max_x_speed);
		break
}

//Need for pain_area
x = phy_position_x
y = phy_position_y
//Need for breaking_wall
if phy_speed >= 20{
	image_index = 1
}else{
	image_index = 0
}

