draw_self();

if state == "death" exit;

if alarm[0] > 0 {
	var height = sprite_height-25;
	draw_rectangle_color(x-16,y-height,x-16+(hp/max_hp)*24,y-(height-2), c_blue,c_blue,c_blue,c_blue,false);
	draw_sprite(s_enemy_healthbar,0,x-16,y-height);
}