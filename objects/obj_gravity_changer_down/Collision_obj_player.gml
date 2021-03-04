switch(sprite_index){
	case spr_gravity_changer_right:
		physics_world_gravity(GRAV_POWER,0)
		obj_camera.target_angle = 270
		if GRAV_STATE != grav.right {
			audio_play_sound(snd_grav_change,0,false)
			//other.phy_speed_x = 0
			//other.phy_speed_y = 0
		}
		GRAV_STATE = grav.right
	break
	
	case spr_gravity_changer_down:
		physics_world_gravity(0,GRAV_POWER)
		obj_camera.target_angle = 0
		if GRAV_STATE != grav.down{
			audio_play_sound(snd_grav_change,0,false)
			//other.phy_speed_x = 0
			//other.phy_speed_y = 0
		}
		GRAV_STATE = grav.down
	break

	case spr_gravity_changer_left:
		physics_world_gravity(-GRAV_POWER,0)
		obj_camera.target_angle = 90
		if GRAV_STATE != grav.left{
			audio_play_sound(snd_grav_change,0,false)
			//other.phy_speed_x = 0
			//other.phy_speed_y = 0
		}
		GRAV_STATE = grav.left
	break
	
	case spr_gravity_changer_up:
		physics_world_gravity(0,-GRAV_POWER)
		obj_camera.target_angle = 180
		if GRAV_STATE != grav.up{ 
			audio_play_sound(snd_grav_change,0,false)
			//other.phy_speed_x = 0
			//other.phy_speed_y = 0
		}
		GRAV_STATE = grav.up
	break
}
