// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function moveTowardObject(_obj, _speed){
	
	vecToObject = new Vector2(_obj.x - x, _obj.y - y);
	moveVector = vecToObject.normal();
	moveVector = moveVector.mult(_speed);

	moveWithCollision(moveVector);
}