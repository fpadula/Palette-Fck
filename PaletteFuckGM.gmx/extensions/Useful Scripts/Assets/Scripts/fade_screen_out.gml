///fade_screen_out(color to fade,time[, alpha])
/*fade = instance_create(0,0,obj_fade_out);
fade.alpha = 0;
fade.color_to_fade = argument[0];
fade.velocity = 1 /(room_speed * real(argument[1]));
if(argument_count == 3){
    fade.t_alpha = argument[2];
}
else{
    fade.t_alpha = 1;
}
fade.can_fade = true;*/
if(argument_count == 3){
    fade = fade_screen(argument[0], argument[1], 0, argument[2], ease_linear, false, 0);
}
else{
    fade = fade_screen(argument[0], argument[1], 0, 1, ease_linear, false, 0);
}
return fade;
