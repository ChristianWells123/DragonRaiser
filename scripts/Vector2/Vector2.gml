// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Vector2(_x, _y) constructor {
    x = _x;
    y = _y;

    static add = function(_vec2) {
		return new Vector2(x + _vec2.x, y + _vec2.y);
    }
	
	static magnitude = function() {
		return sqrt(sqr(x) + sqr(y));
	}
	
	static normal = function() {
		len = magnitude();
		if (len == 0) return new Vector2(0,0);
		return new Vector2(x / len, y / len);
	}
	
	static mult = function(_scalar) {
		return new Vector2(x * _scalar, y * _scalar);
	}
	
	static vRound = function() {
		return new Vector2(round(x), round(y));
	}
	
	static toString = function() {
		return "[" + string(x) + ", " + string(y) + "]";	
	}
}