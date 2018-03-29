///anima_resume(animation's controller)
var anima_resume_animation_controller;

anima_resume_animation_controller = argument[0];

if(instance_exists(anima_resume_animation_controller)){
    with(anima_resume_animation_controller){
        paused = false;
    }    
    return true;
}
else{
    return false;
}
