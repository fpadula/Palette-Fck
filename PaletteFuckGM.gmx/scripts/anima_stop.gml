///anima_stop(animation's controller)
var anima_stop_animation_controller;

anima_stop_animation_controller = argument[0];

if(instance_exists(anima_stop_animation_controller)){
    with(anima_stop_animation_controller){
        can_animate = false;
        timer = 0;
        looped_first_time = false;
        current_timed_event = first_timed_event_index;
        event_user(4);
    }    
    return true;
}
else{
    return false;
}
