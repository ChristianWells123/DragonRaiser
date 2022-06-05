// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//move the object X units right and Y units down, while checking for collision.
function moveWithCollision(_vec2) {
	if (place_meeting(x + _vec2.x, y, object_Wall)) {
		while (_vec2.x > 0 && !(place_meeting(x + 1, y, object_Wall))) {
			x++;
		}
		while (_vec2.x < 0 && !(place_meeting(x - 1, y, object_Wall))) {
			x--;
		}
	}
	else {
		x += _vec2.x;
	}

	if (place_meeting(x, y + _vec2.y, object_Wall)) {
		while (_vec2.y > 0 && !(place_meeting(x, y + 1, object_Wall))) {
			y++;
		}
		while (_vec2.y < 0 && !(place_meeting(x, y - 1, object_Wall))) {
			y--;
		}	
	}
	else {
		y += _vec2.y;
	}
}