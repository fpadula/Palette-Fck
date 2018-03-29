///slide_view_port(view_no, dx, dy, time, is_by, pers, slide_obj [, easing_script])
if(!instance_exists(argument[6]))
    slider = instance_create(-1000, -1000, obj_viewport_slider);
if(argument_count == 8)
    slider.easing_script = argument[7];
else{
    slider.easing_script = ease_linear;
}
slider.pers = argument[5];
slider.view_no = argument[0];
slider.dx = argument[1];
slider.dy = argument[2];
slider.time = argument[3]*room_speed;
slider.is_by = argument[4];
with(slider){
    ///slide(obj, dx, dy, time, is_by, pers)
    var h_distance, v_distance;
    dest_x = 0;
    dest_y = 0;
    
    if(is_by){
        dest_x = view_xport[view_no] + dx;
        dest_y = view_yport[view_no] + dy;    
    }else{
        dest_x = dx;
        dest_y = dy;        
    }
    initial_x = view_xport[view_no];
    initial_y = view_yport[view_no];    
    can_slide = true;
}
return slider.id;
