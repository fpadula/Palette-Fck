///anima_fade_by(target object, alpha displacement, duration in secs, loop, start animation on stop [, easing script])

/************************************************************
*                                                           *
*               Argument's explanation                      *
*                                                           *
*   - target object: The object to be slide                 *
*                                                           *
*   - final alpha: Object's alpha after the animation ends  *
*                                                           *
*   - duration in secs: The duration in seconds of the      *
*        slide.                                             *
*                                                           *
*   - loop: If set to true, the animation will loop.        *
*                                                           *
*   - start animation on stop: If set to true the           *
*       animation must be manually started.                 *
*                                                           *
*   - easing script (optional): The easing script used      *
*       to perform the slide.                               *
*       (Default: anima_ease_linear)                        *
*                                                           *
*************************************************************/

var target_obj, alpha_displacement, duration, loop, destroy_after_use, easing_script, start_on_stop;
var anima_slide_to_ret;

target_obj = argument[0];
alpha_displacement = argument[1];
duration = argument[2] * room_speed;
loop = argument[3];
destroy_after_use = !loop;
start_on_stop = argument[4];
if(argument_count == 6){
    easing_script = argument[5];   
}
else{
    easing_script = anima_ease_linear;
}

anima_slide_to_ret = instance_create(0, 0, obj_anima_fade);

anima_slide_to_ret.target_obj = target_obj;
anima_slide_to_ret.no_of_values = 1;
anima_slide_to_ret.value_difference[0] = alpha_displacement;
anima_slide_to_ret.easing = easing_script;
anima_slide_to_ret.duration = duration;
anima_slide_to_ret.loop = loop;
anima_slide_to_ret.destroy_after_use = destroy_after_use;
anima_slide_to_ret.is_by = true;

if(!start_on_stop){
    anima_slide_to_ret.can_animate = true;
}

return anima_slide_to_ret;
