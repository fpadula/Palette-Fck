///rotate_over_time(obj, angle in degrees, is_by, time in seconds [,easing_script])
var ret;
ret = instance_create(x, y, obj_rotate_over_time);
ret.obj = argument[0];
if(argument[2]){
    ret.final_angle = ret.obj.image_angle + argument[1];
}
else{
    ret.final_angle = argument[1];
}
ret.time = argument[3] * room_speed;
ret.initial_angle = ret.obj.image_angle;

if(argument_count == 5){
    ret.easing_script = argument[4];
}
else{
    ret.easing_script = ease_linear;
}
ret.can_rotate = true;
return ret;
