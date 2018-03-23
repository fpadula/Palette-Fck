///spin(obj, degrees/sec)
var ret;
ret = instance_create(x,y,obj_spin);
ret.obj_to_spin = argument[0];
ret.r_speed = argument[1];
ret.can_spin = true;
return ret;
