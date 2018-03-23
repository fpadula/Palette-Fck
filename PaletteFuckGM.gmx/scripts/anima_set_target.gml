///anima_set_target(animation's controller, target)

var animations_controller, target;

animations_controller = argument[0];
target = argument[1];
if(instance_exists(animations_controller)){
    animations_controller.target_obj = target;
    return true;
}
else{
    return false;
}
