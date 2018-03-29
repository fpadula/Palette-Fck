///grow_over_time(obj_to_grow, axis, final_scale, time [,easing_script])
grower = instance_create(-1000, -1000, obj_grow_over_time);
grower.axis = argument[1];
grower.obj_to_grow = argument[0];
grower.final_scale = argument[2];
grower.time = argument[3]*room_speed;
if(argument_count == 5){
    grower.easing_script = argument[4];
}
else{
    grower.easing_script = ease_linear;
}
with(grower){
    if(axis == "x"){
        deltaScale = final_scale - obj_to_grow.image_xscale;
        original_scale = obj_to_grow.image_xscale;
    }
    else if(axis == "y"){
        deltaScale = final_scale - obj_to_grow.image_yscale;
        original_scale = obj_to_grow.image_yscale;
    }
    else if(axis == "xy"){
        deltaScale_y = final_scale - obj_to_grow.image_yscale;
        deltaScale_x = final_scale - obj_to_grow.image_xscale;
        original_scale_x = obj_to_grow.image_xscale;
        original_scale_y = obj_to_grow.image_yscale;    
    }
    can_perform_grow = true;
}
return grower;
