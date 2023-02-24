

if creator == noone or creator == other or ds_list_find_index(hit_objects, other) != -1
{
	exit;
}

other.hp -= damage;
repeat(8){
	instance_create_layer(other.x,other.y-20,"effects", o_hit_effect);
}

if instance_exists(o_girl)
{
	
	
	if creator.object_index == o_girl and other.hp <= 0 and other.state != "death"{
		o_girl.kills += 1;
	}
	// when the character die
	if other.object_index == o_girl{
		
		// if we hit player
		add_screen_shake(6,12);
		if other.hp <= 0
		{
			//instance_create_layer(x+random_range(-4,4),y-16+random_range(-4,4), "effects", o_girl_sleep);
			//death_state(s_girl_sleep);
			var number = sprite_get_number(s_girl_z);
			for (var i = 0; i<number*2; i++)
			{
				//var bx = other.x + random_range(-8, 8);
				//var by = other.y + random_range(-24,8);
				//var z = instance_create_layer(x,y, "Instances", o_girl_z);
				//var z = instance_create_layer(x+random_range(-4,4),y-16+random_range(-4,4), "effects", o_girl_z);
				var z = instance_create_layer(x,y, "effects", o_girl_z);
				//z.direction = 90 - (image_xscale * random_range(30,60));
				//z.speed = random_range(0.001,0.002);

			
				//z.image_angle = random(360);
				//z.gravity = 0.1;
				//direction = random_range(180,360);
				//z.direction = random(90);
				z.image_index = i;

			}
			ini_open("save.ini")
			ini_write_real("Scores", "Kills", other.kills);
			var highscore = ini_read_real("Scores", "highscore",0);
				if other.kills > highscore
				{
					ini_write_real("Scores", "highscore", other.kills)
				}
				ini_close();
		
		}
	}
	else 
	{
		
		// we hit an enemy
		//other.state = "death";
		other.alarm[0] = 120;
		add_screen_shake(3,8);
	}
}

ds_list_add(hit_objects, other);
// show_debug_message(other.hp);

//other.state = "knockback";
if other.state != "death" and other.object_index != o_boss
{
	other.state = "knockback";
}
other.knockback_speed = knockback * image_xscale;
// other.image_xscale = -image_xscale;
	
