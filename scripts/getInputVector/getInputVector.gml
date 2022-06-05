// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



//Read input from the arrow keys and/or gamepad and create a vector determining the direction of input,
//e.g. [1,1] is down+right.
function getInputVector() {
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_up = keyboard_check(vk_up);
	key_down = keyboard_check(vk_down);  
	
	haxis = gamepad_axis_value(0, gp_axislh);
	vaxis = gamepad_axis_value(0, gp_axislv);

	var move_x = (key_right - key_left) + haxis;
	var move_y = (key_down - key_up) + vaxis;

	return new Vector2(move_x, move_y);
}