///fade_screen(color to fade, time, initial_alpha, final_alpha, easing_script, is_draw_gui, view_to_fade [, objs_to_draw_over_fade] [, fade_controller])
var fade;
var reusing_fade_ctrler;
if( (argument_count == 8) && !is_array(argument[7]) ){
    fade = argument[7];
    reusing_fade_ctrler = true;
} 
else if (argument_count == 9){
    fade = argument[8];
    reusing_fade_ctrler = true;
}
else{
    fade = instance_create(0,0,obj_screen_fader);
    reusing_fade_ctrler = false;
}

if(reusing_fade_ctrler){
    with(fade){
        event_perform(ev_create, 0);
    }
}

fade.initial_alpha = argument[2];
fade.final_alpha = argument[3];

fade.fade_alpha = fade.initial_alpha;
fade.color_to_fade = argument[0];
fade.fade_duration = argument[1] * room_speed;
fade.easing_script = argument[4];
fade.is_draw_gui = argument[5];
fade.view_to_fade = argument[6];
if( ( (argument_count == 8) && is_array(argument[7]) ) || (argument_count == 9)){
    fade.objs_to_draw_over_fade = argument[7];
    fade.object_collection_size = array_length_1d(fade.objs_to_draw_over_fade);
}
else{
    fade.objs_to_draw_over_fade = noone;
}
fade.can_fade = true;
return fade;
