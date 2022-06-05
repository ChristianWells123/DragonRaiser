//doKeyboardMovement(4);

counter++;

if counter >= timer {
	dragon.stage = DragonStage.Hatchling;	
	updateSprites();
}

if dragon.stage == DragonStage.Hatchling {
	if distance_to_object(object_Player) <= 128 && distance_to_object(object_Player) >= 16 {
		moveTowardObject(object_Player, 2);
	}
}