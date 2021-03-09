obj_player.visible = 0
obj_player.phy_active = false

if global.settings.video.room_transition{
alarm[0] = 120
transition_create_effect(transition_type.fade_in)
//Left Bottom
var lb = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_player_slice)
with(lb){
	phy_rotation = 90
	phy_speed_x = -4
	phy_speed_y = 4
}

//Left Up
var lu = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_player_slice)
with(lu){
	phy_rotation = 180
	phy_speed_x = -4
	phy_speed_y = -4
}
//Right Up
var ru = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_player_slice)
with(ru){
	phy_rotation = 270
	phy_speed_x = 4
	phy_speed_y = -4
}
//Right Bottom
var rb = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_player_slice)
with(rb){
	phy_rotation = 360
	phy_speed_x = 4
	phy_speed_y = 4
}
}else{
	alarm[0]=1
}