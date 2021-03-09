if player_hp <= 0{
	instance_destroy(obj_player)
}

if keyboard_check_pressed(vk_escape){
	instance_destroy()
}

global.time.microseconds += 1*DELTATIME

if global.time.microseconds >= 60{
	global.time.seconds++
	global.time.microseconds = 0
}

if global.time.seconds >= 60{
	global.time.minutes++
	global.time.seconds = 0
}

if global.time.minutes >= 60{
	global.time.hours++
	global.time.minutes = 0
}