// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function doKeyboardMovement(_speed) {
	inputVector = getInputVector();
	moveVec = inputVector.normal();
	moveVec = moveVec.mult(_speed);
	moveVec = moveVec.vRound();
	moveWithCollision(moveVec);
}