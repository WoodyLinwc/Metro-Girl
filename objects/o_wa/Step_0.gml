switch (state) {
	case "chase":
	if not instance_exists(o_girl) break;
		if place_meeting(x,y,o_girl) and attacked = false and o_girl.state != "roll"{
			create_hitbox(x,y,self,sprite_index, knockback, 1, damage, image_xscale);
			attacked = true;
		}
		if attacked == true{
			vspeed = -1;
		}
		
		break;
		
	case "death":
		repeat(3){
			instance_create_layer(x+random_range(-4,4),y-16+random_range(-4,4), "effects", o_zipper);
		}
		
		instance_destroy();
		break;
}