///anima_scale_to(target object, final x scale, final y scale, duration in secs, loop, start animation on stop [, easing script])

/********************************************************
*                                                       *
*               Argument's explanation                  *
*                                                       *
*   - target object: The object to be slide             *
*                                                       *
*   - final x scale: The object's final x scale         *
*                                                       *
*   - final y scale: The object's final y scale         *
*                                                       *
*   - duration in secs: The duration in seconds of the  *
*        animation.                                     *
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

var target_obj, final_x, final_y, duration, loop, destroy_after_use, easing_script, start_on_stop;
var anima_slide_to_ret;

target_obj = argument[0];
final_x = argument[1];
final_y = argument[2];
duration = argument[3] * room_speed;
loop = argument[4];
destroy_after_use = !loop;
start_on_stop = argument[5];
if(argument_count == 7){
    easing_script = argument[6];   
}
else{
    easing_script = anima_ease_linear;
}

anima_slide_to_ret = instance_create(0, 0, obj_anima_scale);

anima_slide_to_ret.target_obj = target_obj;
anima_slide_to_ret.no_of_values = 2;
anima_slide_to_ret.final_value[0] = final_x;
anima_slide_to_ret.final_value[1] = final_y;
anima_slide_to_ret.easing = easing_script;
anima_slide_to_ret.duration = duration;
anima_slide_to_ret.loop = loop;
anima_slide_to_ret.destroy_after_use = destroy_after_use;
anima_slide_to_ret.is_by = false;

if(!start_on_stop){
    anima_slide_to_ret.can_animate = true;
}

return anima_slide_to_ret;
