///anima_rotate_to(target object, final angle, duration in secs, loop, start animation on stop [[, pivot x, pivot y, pivot cords are absolute]|[, pivot object]] [, easing script])

/********************************************************
*                                                       *
*               Argument's explanation                  *
*                                                       *
*   - target object: The object to be slide             *
*                                                       *
*   - final x: The object's x position after the slide  *
*                                                       *
*   - final y: The object's y position after the slide  *
*                                                       *
*   - duration in secs: The duration in seconds of the  *
*        slide.                                         *
*                                                       *
*   - loop: If set to true, the animation will loop.    *
*                                                       *
*   - start animation on stop: If set to true the       *
*       animation must be manually started.             *
*                                                       *
*   - easing script (optional): The easing script used  *
*       to perform the slide.                           *
*       (Default: anima_ease_linear)                    *
*                                                       *
*********************************************************/
var target_obj, final_angle, duration, loop, destroy_after_use, rotation_point_x, rotation_point_y, easing_script, start_on_stop, has_point_of_rotation, pivot_coords_are_absolute, pivot_object;
var anima_slide_to_ret;

target_obj = argument[0];
final_angle = argument[1];
duration = argument[2] * room_speed;
loop = argument[3];
destroy_after_use = !loop;
start_on_stop = argument[4];
pivot_object = noone;
if(argument_count == 5){
    has_point_of_rotation = false;
    easing_script = anima_ease_linear;   
    rotation_point_x = target_obj.x;
    rotation_point_y = target_obj.y;
    pivot_coords_are_absolute = false;
    //show_debug_message("1");
}
else if(argument_count == 6){
    if(instance_exists(argument[5])){
        has_point_of_rotation = true;
        easing_script = anima_ease_linear;   
        pivot_object = argument[5];   
        //show_debug_message("2.1");
    }
    else{
        has_point_of_rotation = false;
        easing_script = argument[5];   
        //show_debug_message("2.2");        
    }
    rotation_point_x = noone;
    rotation_point_y = noone;
    pivot_coords_are_absolute = false;    
}
else if(argument_count == 7){
    has_point_of_rotation = true;
    pivot_object = argument[5];   
    easing_script = argument[6];   
    rotation_point_x = noone;
    rotation_point_y = noone;
    pivot_coords_are_absolute = false;
    //show_debug_message("3");
}
else if(argument_count == 8){
    has_point_of_rotation = true;
    easing_script = anima_ease_linear;   
    rotation_point_x = argument[5];
    rotation_point_y = argument[6];
    pivot_coords_are_absolute = argument[7];
    //show_debug_message("4");
}
else if(argument_count == 9){
    has_point_of_rotation = true;
    easing_script = argument[8];   
    rotation_point_x = argument[5];
    rotation_point_y = argument[6];
    pivot_coords_are_absolute = argument[7];
    //show_debug_message("5");
}

anima_slide_to_ret = instance_create(0, 0, obj_anima_rotate);

anima_slide_to_ret.target_obj = target_obj;
anima_slide_to_ret.no_of_values = 2;
anima_slide_to_ret.final_value[0] = degtorad(final_angle);
//anima_slide_to_ret.final_value[1] = final_angle - 180;
//anima_slide_to_ret.value_difference[1] = final_angle - 180;
anima_slide_to_ret.easing = easing_script;
anima_slide_to_ret.duration = duration;
anima_slide_to_ret.loop = loop;
anima_slide_to_ret.destroy_after_use = destroy_after_use;
anima_slide_to_ret.is_by = false;
anima_slide_to_ret.has_point_of_rotation = has_point_of_rotation;
anima_slide_to_ret.rotation_point_x = rotation_point_x;
anima_slide_to_ret.rotation_point_y = rotation_point_y;
anima_slide_to_ret.pivot_coords_are_absolute = pivot_coords_are_absolute;
anima_slide_to_ret.pivot_coords_are_absolute = pivot_coords_are_absolute;
anima_slide_to_ret.pivot_object = pivot_object;

if(!start_on_stop){
    anima_slide_to_ret.can_animate = true;
}

return anima_slide_to_ret;
