///@description change_camera_mode
///@arg	mode
///@arg following/target_x
///@arg target_y/camera_speed
function change_camera_mode(){
	with(obj_camera){
		mode = argument[0]
		
		switch(mode){
			case camera_mode.move_to_target:
				target_x = argument[1]
				target_y = argument[2]
			break
			
			case camera_mode.follow_object:
				following = argument[1]
			break
			case camera_mode.move_to_follow_object:
				following = argument[1]
				camera_speed = argument[2]
			break
		}
	}
}

function rotate_foward(cur_angle,target_angle,speed){
	cur_angle = cur_angle mod 360; // Ограничиваем направление - от -360 до 360 (не включительно).
	if cur_angle <0 cur_angle += 360; // Если направление меньше 360 - преобразовываем значение в положительное
	if abs(angle_difference(cur_angle,target_angle))<speed{
		return target_angle
	}
	var calc_angle = cur_angle + (sign(sin(degtorad(target_angle-cur_angle)))*speed);
	return calc_angle
}

function cycle(value, min, max) {
	var result, delta;
	delta = (max - min);
	// % is remainder-of-division operator here.
	// limit input to (-delta .. +delta):
	result = (value - min) % delta;
	// wrap negative results around the limit:
	if (result < 0) result += delta;
	// return adjusted input:
	return min + result;
}

function rotate_toward(cur_angle,target_angle,speed){
var diff;
// 180 is to be replaced by "pi" for radians
diff = cycle(target_angle - cur_angle, -180, 180);
// clamp rotations by speed:
if (diff < -speed) return cur_angle - speed;
if (diff > speed) return cur_angle + speed;
// if difference within speed, rotation's done:
return target_angle;
}