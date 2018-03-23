///anima_destroy_after_use(animation's controller, destroy after animation end)

var animations_controller, destroy_after_use;

animations_controller = argument[0];
destroy_after_use = argument[1];
if(instance_exists(animations_controller)){
    animations_controller.destroy_after_use = destroy_after_use;
    return true;
}
else{
    return false;
}
