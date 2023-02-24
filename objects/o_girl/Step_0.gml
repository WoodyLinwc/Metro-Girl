/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case "move":
		#region Move state
		if input.right
		{
			move_and_collide(run_speed,0);
			image_xscale = 1.75;
			sprite_index = s_girl_run;
			image_speed = 0.4;
		}

		if input.left
		{
			move_and_collide(-run_speed,0);
			image_xscale = -1.75;
			sprite_index = s_girl_run;
			image_speed = 0.4;
		}

		if not input.right and not input.left
		{
			sprite_index = s_girl_idle;
			image_speed = 0.35;
		}
	
		if input.roll
		{
			state = "roll";
		}
	
		if input.attack
		{
			state = "attack1";
		}
		#endregion
		break;
		
	case "roll":
		#region Roll state
		set_state_sprite(s_girl_roll,0.7,0);
	
		if image_xscale == 1.75
		{
			move_and_collide(roll_speed,0);
		}
	
		if image_xscale == -1.75
		{
			move_and_collide(-roll_speed,0);
		}
		
		if animation_end()
		{
			state = "move";
		}
	
		#endregion
		break;
	
	case "attack1":
		#region Attack one state
		set_state_sprite(s_girl_attack_one,0.7,0);
		
		if animation_hit_frame(1)
		{
			create_hitbox(x,y,self,s_girl_attack_one_damage,2.1,4,5,image_xscale);
		}
		
		if input.attack and animation_hit_frame_range(1, 4)
		{
			state = "attack2";
		}
		
		if animation_end()
		{
			state = "move";
		}
		#endregion
		break;
		
	case "attack2":
		#region Attack two state
		set_state_sprite(s_girl_attack_two,0.7,0);
		
		if animation_hit_frame(2)
		{
			create_hitbox(x,y,self,s_girl_attack_two_damage,2.5,4,5,image_xscale);
		}
		
		if input.attack and animation_hit_frame_range(2, 4)
		{
			state = "attack3";
		}
		
		if animation_end()
		{
			state = "move";
		}
		#endregion
		break;
			
	case "attack3":
		#region Attack three state
		set_state_sprite(s_girl_attack_three,0.5,0);
		
		if animation_hit_frame(3)
		{
			create_hitbox(x,y,self,s_girl_attack_three_damage,5.5,4,8,image_xscale);
		}
		
		if animation_end()
		{
			state = "move";
		}
		#endregion
		break;
	
	case "knockback":
		#region knockback state
		
		knockback_state(s_girl_hitstun,"move",0.6,1.72);
		
		#endregion
		break;
		
	case "death":
		#region death state
		
		#endregion
		break;
	
	default:
		show_debug_message("State "+state+" does not exits");
		state = "move";
		break;
		
}


