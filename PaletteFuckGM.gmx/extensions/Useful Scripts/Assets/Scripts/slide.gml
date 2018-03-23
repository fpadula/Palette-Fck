///slide(obj, dx, dy, time, is_by, pers, slide_obj [, easing_script])
if(!instance_exists(argument[6]))
    slider = instance_create(-1000, -1000, ctrl_slider);
if(argument_count == 8)
    slider.easing_script = argument[7];
else{
    slider.easing_script = ease_linear;
}
slider.pers = argument[5];
slider.obj = argument[0];
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
        dest_x = obj.x + dx;
        dest_y = obj.y + dy;    
    }else{
        dest_x = dx;
        dest_y = dy;        
    }
    initial_x = obj.x;
    initial_y = obj.y;    
    can_slide = true;
}
return slider.id;
