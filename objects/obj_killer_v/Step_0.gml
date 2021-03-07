// Inherit the parent event
event_inherited();
phy_position_y += spd
if place_meeting(phy_position_x,phy_position_y+spd,obj_wall){
	spd = -spd
	//phy_position_y = phy_position_yprevious
}