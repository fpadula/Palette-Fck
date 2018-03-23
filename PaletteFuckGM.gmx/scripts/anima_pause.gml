///anima_pause(animation's controller)
var anima_pause_animation_controller;

anima_pause_animation_controller = argument[0];

if(instance_exists(anima_pause_animation_controller)){
    with(anima_pause_animation_controller){
        paused = true;
    }    
    return true;
}
else{
    return false;
}
