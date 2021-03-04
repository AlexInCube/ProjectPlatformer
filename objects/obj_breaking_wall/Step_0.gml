if obj_player.phy_speed > 19{
	phy_active = false
	if collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, true) != noone
	{
	    instance_destroy()
	}
}else{
	phy_active = true
}