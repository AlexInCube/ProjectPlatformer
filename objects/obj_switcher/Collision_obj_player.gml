//audio_play_sound(snd_switch,1,false)

with(obj_gate){
	switch(image_index){
		case 0:
			phy_active = false
			image_index = 1
		break
		
		case 1:
			phy_active = true
			image_index = 0
		break
	}
}

with(obj_killer_switchable){
	switch(image_index){
		case 0:
			phy_active = false
			image_index = 1
		break
		
		case 1:
			phy_active = true
			image_index = 0
		break
	}
}