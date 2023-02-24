switch(state)
{
	case "chase":
		set_state_sprite(s_clock_walk, 0.2, 0);
		if not instance_exists(o_girl) break;
		
		if sign(o_girl.x - x) == 1 
		{
			image_xscale = 2.38;
			image_yscale = 2.1;
		}
		
		if sign(o_girl.x - x) == -1
		{
			image_xscale = -2.38;
			image_yscale = 2.1;
		}
		
		if image_xscale == 0
		{
			image_xscale = 1;
		}
		
		var direction_facing = image_xscale;
		var distance_to_player = point_distance(x,y,o_girl.x,o_girl.y);
		
		if distance_to_player <= attack_range 
		{
			state = "attack";
		}
		if distance_to_player > attack_range 
		{
			move_and_collide(direction_facing * chase_speed,0);
		}
		move_and_collide(knockback_speed,0);
		var knockback_friction = 0.8;
		knockback_speed = approach(knockback_speed,0,knockback_friction);
		break;
		
		case "stall":
			set_state_sprite(sprite32,0.5,0);
			if alarm[1] <= 0
			{
				state = "chase";
			}
			move_and_collide(knockback_speed,0);
			var knockback_friction = 0.8;
			knockback_speed = approach(knockback_speed,0,knockback_friction);
			break;
		
		case "attack":
			
			set_state_sprite(s_clock_attack,0.5,0);
			
			if animation_hit_frame(7) or animation_hit_frame(8)
			{
				create_hitbox(x,y,self,s_clock_attack_damage,8,4,20,image_xscale);
				add_screen_shake(10,8);
			}
			if animation_end()
			{
				state = "stall";
				alarm[1] = 30;
			}
			move_and_collide(knockback_speed,0);
			var knockback_friction = 0.8;
			knockback_speed = approach(knockback_speed,0,knockback_friction);
			break;
			
		case "death":
			repeat(2){
			instance_create_layer(x+random_range(-4,4),y-16+random_range(-4,4), "effects", o_gear);
		}
			repeat(1){
			instance_create_layer(x+random_range(-4,4),y-16+random_range(-4,4), "effects", o_hour_hand);
		}
		
		instance_destroy();
		
		
		
}