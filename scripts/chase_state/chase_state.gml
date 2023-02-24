if not instance_exists(o_girl) exit;
		
		if sign(o_girl.x - x) == 1 
		{
			image_xscale = 1.7;
			image_yscale = 1.5;
		}
		
		if sign(o_girl.x - x) == -1
		{
			image_xscale = -1.7;
			image_yscale = 1.5;
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