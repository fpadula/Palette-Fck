///fade_screen_in(color to fade,time[, alpha])
/*
fade = instance_create(0,0,obj_fade_in);
fade.alpha = 1;
fade.color_to_fade = argument[0];
fade.velocity = 1 /(room_speed * real(argument[1]));
if(argument_count == 3){
    fade.t_alpha = argument[2];
}
else{
    fade.t_alpha = 0;
}
fade.can_fade = true;
*/
if(argument_count == 3){
    fade = fade_screen(argument[0], argument[1], argument[2], 0, ease_linear, false, 0);
}
else{
    fade = fade_screen(argument[0], argument[1], 1, 0, ease_linear, false, 0);
}
return fade;
