var hp_x = 15;
var hp_y = 15;
var hp_width = 350;
var hp_height = 10;

if instance_exists(o_girl){
	// shrink health
	draw_hp = lerp(draw_hp, o_girl.hp, 0.1);
	draw_max_hp = o_girl.max_hp;
	
} else {
	draw_hp = lerp(draw_hp,0,0.1);
}
var hp_percent = draw_hp / draw_max_hp;
draw_rectangle_color(hp_x,hp_y, hp_x+hp_width*hp_percent, hp_y+hp_height, c_white,c_white,c_white,c_white, false);
draw_rectangle_color(hp_x,hp_y, hp_x+hp_width*hp_percent, hp_y+hp_height, c_silver,c_silver,c_silver,c_silver, true);

if not instance_exists(o_girl) exit;
var text = "Kills: " + string(o_girl.kills);
var text_width = string_width(text);
var text_height = string_height(text);
//draw_rectangle_color(8,16,8+text_width+4, 16+text_width+4, c_silver,c_silver,c_silver,c_silver, false);
draw_text(15,30,text);

var text = "Level: " + string(o_girl.level);
var text_width = string_width(text);
var text_height = string_height(text);
//draw_rectangle_color(8,16,8+text_width+4, 16+text_width+4, c_silver,c_silver,c_silver,c_silver, false);
draw_text(150,30,text);
