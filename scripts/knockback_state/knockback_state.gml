///@arg knockback_sprite
///@arg next_state
///@arg knockback_friction
///@arg x_scale

var knockback_sprite = argument0;
var next_state = argument1;
var knockback_friction = argument2;
var x_scale = argument3;


set_state_sprite(knockback_sprite,0,0);
move_and_collide(knockback_speed,0);
image_xscale = -sign(knockback_speed) * x_scale;
		
var knockback_friction = 0.6;
knockback_speed = approach(knockback_speed,0,knockback_friction);
if knockback_speed == 0
{
	state = next_state;
}