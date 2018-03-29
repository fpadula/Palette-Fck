///create_surface_container(x, y, width, height, surface_view_width, surface_view_height)
var objx, objy, width, height, surface_view_width, surface_view_height;
var ret_obj;
objx = argument[0];
objy = argument[1];
width = argument[2];
height = argument[3];
surface_view_width = argument[4];
surface_view_height = argument[5];

ret_obj = instance_create(objx, objy, obj_surface_container);
ret_obj.width = width;
ret_obj.height = height;
ret_obj.surface_view_width = surface_view_width;
ret_obj.surface_view_height = surface_view_height;
ret_obj.can_draw = true;
return ret_obj;
