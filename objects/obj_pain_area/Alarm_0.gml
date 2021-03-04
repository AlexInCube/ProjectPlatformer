if collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, true) != noone
{
    PLAYER_HP -= 1*DELTATIME
	alarm[0] = 1
}else{
	alarm[0] = -1
}