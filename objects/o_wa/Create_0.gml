event_inherited();
state = "chase";
hp = 1;
max_hp = hp;

image_speed = 0.5;
hspeed = random_range(2, 3);
if instance_exists(o_girl){
	hspeed *= sign(o_girl.x - x);
}
image_xscale = sign(hspeed)*1.25;
damage = 3;
attacked = false;
experience = 2;

knockback = 4;