/// @description Insert description here
// You can write your code in this editor

randomise();
counter = 0;
timer = 10 * 30;
//layer_sequence_play(info_sheet_sequence);

mask_sprite_index = sprite_DragonEgg_test_mask;

dragon = new Dragon();

info_sheet_sequence = layer_sequence_create("UI", x+50, y, sequence_OpenDragonInfo);

sprite_shader_shade_color = shader_get_uniform(dragonSprite, "shade_color");

mask_background_index = shader_get_sampler_index(dragonBackgroundMask, "background");
mask_shader_uvs = shader_get_uniform(dragonBackgroundMask, "uvs");
mask_shader_recip_size = shader_get_uniform(dragonBackgroundMask, "recip_size");
mask_shader_shade_color = shader_get_uniform(dragonBackgroundMask, "shade_color");

background_pattern_sprite = sprite_Empty32;
background_pattern_texture = sprite_get_texture(background_pattern_sprite, -1);
background_pattern_width = sprite_get_width(background_pattern_sprite);
background_pattern_height = sprite_get_height(background_pattern_sprite);
background_pattern_uvs = sprite_get_uvs(background_pattern_sprite, -1);

function updateSprites() {
	
	
	//Decide which background pattern to use and update related values
	if (dragon.pattern == DragonPattern.None) {
		background_pattern_sprite = sprite_Empty32;
	}
	else if (dragon.pattern == DragonPattern.Test) {
		background_pattern_sprite = sprite_DragonPatternTest;
	}
		
	background_pattern_texture = sprite_get_texture(background_pattern_sprite, -1);
	background_pattern_width = sprite_get_width(background_pattern_sprite);
	background_pattern_height = sprite_get_height(background_pattern_sprite);
	background_pattern_uvs = sprite_get_uvs(background_pattern_sprite, -1);
	
	//Decide the sprites to use based on dragon age
	if (dragon.stage == DragonStage.Egg) {
		
		sprite_index = sprite_DragonEgg_test;
		extra_sprite_index = sprite_DragonEgg_test_extra;
		mask_sprite_index = sprite_DragonEgg_test_mask;
	} 
	else if (dragon.stage == DragonStage.Hatchling) {
		
		sprite_index = sprite_DragonHatchling_test
		extra_sprite_index = sprite_DragonHatchling_test_extra;
		mask_sprite_index = sprite_DragonHatchling_test_mask;
	}
}

function createInfoScroll() {

	info_sheet_sequence_instance = layer_sequence_get_instance(info_sheet_sequence);
	var scroll_inst = instance_create_layer(x, y, "UI", object_DragonInfoScroll);
	scroll_inst.dragon = dragon;
	sequence_instance_override_object(info_sheet_sequence_instance, object_DragonInfoScroll, scroll_inst);
	
}

updateSprites();