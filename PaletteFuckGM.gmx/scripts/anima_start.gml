///anima_start(animation's controller)
var anima_start_animation_controller;

anima_start_animation_controller = argument[0];

if(instance_exists(anima_start_animation_controller)){
    with(anima_start_animation_controller){
        timer = 0;
        can_animate = true;
        current_timed_event = first_timed_event_index;
    }    
    return true;
}
else{
    return false;
}
