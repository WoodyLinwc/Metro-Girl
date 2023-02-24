var enemy_count = instance_number(o_enemy_parent);

if instance_exists(o_girl) and enemy_count < o_girl.kills/4 {
	if enemy_count > 5{
		exit;
	}
	
	var enemy = choose(o_mp3, o_mp4,o_wa, o_wa);
	//var enemy = choose(o_boss);
	
	if o_girl.kills > 15 and !instance_exists(o_boss)
	{
		enemy = choose(o_mp3,o_mp4,o_wa,o_wa,o_boss);
	}
	//var enemy = choose(o_mp3);
	var new_x = random_range(220, room_width - 220);
	
	while point_distance(new_x, 0, o_girl, 0) < 200 {
		new_x = random_range(220, room_width - 220);
	}
	
	instance_create_layer(new_x, o_girl.y, "Instances", enemy);
}