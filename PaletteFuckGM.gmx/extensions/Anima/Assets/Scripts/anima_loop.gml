///anima_loop(animation's controller, enable loop)
var anima_loop_animation_controller, enable_loop;

anima_loop_animation_controller = argument[0];
enable_loop = argument[1];

if(instance_exists(anima_loop_animation_controller)){
    with(anima_loop_animation_controller){
        loop = other.enable_loop;
    }    
    return true;
}
else{
    return false;
}
