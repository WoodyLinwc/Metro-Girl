///@arg sprite
var death_sprite = argument0;

set_state_sprite(death_sprite, 0.25, 0);
friction = true;

if image_index >= image_number -1{
	image_index = image_number -1;
	image_speed = 0;
	if image_alpha > 0{
		image_alpha -= 0.1;
	}
	else{
		instance_destroy();
	}
}

move_and_collide(knockback_speed,0);
var knockback_friction = 0.6;
knockback_speed = approach(knockback_speed,0,knockback_friction);