///@arg intensity
///@arg duration

var intensity = argument0;
var duration = argument1;

if not instance_exists(o_camera) exit;

with(o_camera){
	screenshake = intensity;
	alarm[0] = duration;
}