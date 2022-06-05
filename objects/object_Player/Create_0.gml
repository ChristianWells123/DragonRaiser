/// @description Insert description here
// You can write your code in this editor
WALK_SPEED = 4;

dragon1 = new Dragon("Dragon 1");
dragon2 = new Dragon("Dragon 2");
stats3 = dragon1.breedStats(dragon2);
dragon3 = new Dragon("Dragon 3", stats3.Power, stats3.Speed, stats3.Flying, stats3.Breath);

show_debug_message(dragon1);
show_debug_message(dragon2);
show_debug_message(dragon3);