if !DEBUGMODE{exit}
with(obj_player){
	draw_text(x,y-30,"PSX: "+string(phy_speed_x))
	draw_text(x,y-46,"PSY: "+string(phy_speed_y))
}