///create_camera(view_port_no, x, y, camera_x_offset, camera_y_offset, absolute_offsets, start_awake)
var create_camera_return = instance_create(argument[1], argument[2], obj_camera);

create_camera_return.camera_x_offset = argument[3];
create_camera_return.camera_y_offset = argument[4];
create_camera_return.absolute_offsets = argument[5];
create_camera_return.enabled = argument[6];
return create_camera_return;
