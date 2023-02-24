x += random_range(-screenshake, screenshake);
y += random_range(-screenshake, screenshake);

if not instance_exists(o_girl) exit;

var target_x = o_girl.x + random_range(-screenshake, screenshake);
var target_y = o_girl.y -110+ random_range(-screenshake, screenshake);

x = lerp(x,target_x,0.3);
// y = lerp(y,o_girl.y - 110,0.2);
// y = o_girl.y-110;
y = lerp(y,target_y,0.3);
camera_set_view_pos(view_camera[0], x - width/2, y - height/2);