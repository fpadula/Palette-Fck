///anima_clone(base animation's controller)
var base_animation;
var ret;

base_animation = argument[0];

if(base_animation.object_index == obj_anima_scale){
    if(base_animation.is_by){
        ret = anima_scale_by(base_animation.target_obj, base_animation.value_difference[0], base_animation.value_difference[1], base_animation.duration/room_speed, base_animation.loop, ! base_animation.can_animate , base_animation.easing);
    }
    else{
        ret = anima_scale_to(base_animation.target_obj, base_animation.final_value[0], base_animation.final_value[1], base_animation.duration/room_speed, base_animation.loop, ! base_animation.can_animate , base_animation.easing);
    }
}
else if(base_animation.object_index == obj_anima_slide){
    if(base_animation.is_by){
        ret = anima_slide_by(base_animation.target_obj, base_animation.value_difference[0], base_animation.value_difference[1], base_animation.duration/room_speed, base_animation.loop, ! base_animation.can_animate , base_animation.easing);
    }
    else{
        ret = anima_slide_to(base_animation.target_obj, base_animation.final_value[0], base_animation.final_value[1], base_animation.duration/room_speed, base_animation.loop, ! base_animation.can_animate , base_animation.easing);
    }
}
else if(base_animation.object_index == obj_anima_rotate){
    if(!instance_exists(base_animation.pivot_object)){
        if(base_animation.is_by){
            ret = anima_rotate_by(base_animation.target_obj, base_animation.value_difference[1], base_animation.duration/room_speed, base_animation.loop, ! base_animation.can_animate, base_animation.rotation_point_x, base_animation.rotation_point_y, base_animation.pivot_coords_are_absolute, base_animation.easing);
        }
        else{
            ret = anima_rotate_to(base_animation.target_obj, radtodeg(base_animation.final_value[0]), base_animation.duration/room_speed, base_animation.loop, ! base_animation.can_animate, base_animation.rotation_point_x, base_animation.rotation_point_y, base_animation.pivot_coords_are_absolute, base_animation.easing);
        }
    }
    else{
        if(base_animation.is_by){
            ret = anima_rotate_by(base_animation.target_obj, base_animation.value_difference[1], base_animation.duration/room_speed, base_animation.loop, ! base_animation.can_animate, base_animation.pivot_object, base_animation.easing);
        }
        else{
            ret = anima_rotate_to(base_animation.target_obj, radtodeg(base_animation.final_value[0]), base_animation.duration/room_speed, base_animation.loop, ! base_animation.can_animate, base_animation.pivot_object, base_animation.easing);
        }
    }
    ret.has_point_of_rotation = base_animation.has_point_of_rotation;
}
else if(base_animation.object_index == obj_anima_fade){
    if(base_animation.is_by){
        ret = anima_fade_by(base_animation.target_obj, base_animation.value_difference[0], base_animation.duration/room_speed,  base_animation.loop, ! base_animation.can_animate , base_animation.easing);
    }
    else{
        ret = anima_fade_to(base_animation.target_obj, base_animation.final_value[0], base_animation.duration/room_speed,  base_animation.loop, ! base_animation.can_animate , base_animation.easing);
    }
}

return ret;
