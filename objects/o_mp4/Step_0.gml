
switch (state)
{
	case "chase":
		#region chase state
		set_state_sprite(s_mp3_walk,0.6,0);
		if not instance_exists(o_girl) break;
		
		if sign(o_girl.x - x) == 1 
		{
			image_xscale = 2.125;
			image_yscale = 1.875;
		}
		
		if sign(o_girl.x - x) == -1
		{
			image_xscale = -2.125;
			image_yscale = 1.875;
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
		else
		{
			move_and_collide(direction_facing * chase_speed,0);
		}
		#endregion
		break;
		
	case "attack":
		#region attack state
		
		set_state_sprite(s_mp3_attack, 0.5, 0);
		
		if animation_hit_frame(6)
		{
			create_hitbox(x,y,self,s_mp3_attack_damage,4,4,10,image_xscale);
		}
		
		if animation_end()
		{
			state = "chase";
		}
		
		#endregion
		break;
	
	case "knockback":
		#region knockback state
		
		knockback_state(s_mp3_hitstun,"chase",0.6,2.4);
		
		#endregion
		break;
	
	case "death":
		repeat(3){
			instance_create_layer(x+random_range(-4,4),y-16+random_range(-4,4), "effects", o_music_note);
		}
		
		instance_destroy();
		break;
		
	default:
		show_debug_message("State "+state+" does not exits");
		state = "chase";
		break;
}