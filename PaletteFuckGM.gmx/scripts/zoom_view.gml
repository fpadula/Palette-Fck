///zoom_view(view_number, final_view_width, final_view_height, zooming_duration, easing_script [, zoom_out_obj])
var zoom_out_return;
var zoom_controller = argument[argument_count - 1];
if(argument_count == 6 && instance_exists(zoom_controller) && zoom_controller.object_index == obj_camera_zooming){
    zoom_out_return = zoom_controller;
}
else{
    zoom_out_return = instance_create(0, 0, obj_camera_zooming);
}
zoom_out_return.view_number = argument[0];
zoom_out_return.final_w = argument[1];
zoom_out_return.final_h = argument[2];
zoom_out_return.zooming_duration = argument[3]*room_speed;
zoom_out_return.easing_script = argument[4];
zoom_out_return.initial_w = view_wview[zoom_out_return.view_number];
zoom_out_return.initial_h = view_hview[zoom_out_return.view_number];
zoom_out_return.zooming = true;
zoom_out_return.zooming_time_counter = 0;

return zoom_out_return;
