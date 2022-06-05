/// @description Insert description here


//mask_sprite_index = sprite_WhiteBox32;



//START RENDER BASE SPRITE
shader_set(dragonSprite);
shader_set_uniform_f(sprite_shader_shade_color, dragon.color.r, dragon.color.g, dragon.color.b, dragon.color.a);

draw_sprite(sprite_index, image_index, x, y);
//END RENDER BASE SPRITE

shader_reset();

//START RENDER EXTRA SPRITE
draw_sprite(extra_sprite_index, image_index, x, y);
//END RENDER EXTRA SPRITE


//START RENDER BG MASK SPRITE
shader_set(dragonBackgroundMask);

texture_set_stage(mask_background_index, background_pattern_texture );
shader_set_uniform_f(
						mask_shader_uvs, 
						background_pattern_uvs[0], 
						background_pattern_uvs[1], 
						(background_pattern_uvs[2]-background_pattern_uvs[0]), 
						(background_pattern_uvs[3]-background_pattern_uvs[1])
					);
shader_set_uniform_f(mask_shader_recip_size, 1/background_pattern_width, 1/background_pattern_height);
shader_set_uniform_f(mask_shader_shade_color, dragon.color.r, dragon.color.g, dragon.color.b, dragon.color.a);
draw_sprite(mask_sprite_index, image_index, x, y);
//ENDNDER BG MASK SPRITE

shader_reset();