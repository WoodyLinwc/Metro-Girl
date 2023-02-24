var camera_id = view_camera[0];
var view_width = camera_get_view_width(camera_id);
var view_height = camera_get_view_height(camera_id);
display_set_gui_size(view_width,view_height);

if not instance_exists(o_girl) exit;
draw_hp = o_girl.hp;
draw_max_hp = o_girl.max_hp;
draw_set_font(f_one);

audio_play_sound(a_BGM,5,true);
