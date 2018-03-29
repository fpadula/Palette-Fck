/// fade_object_to(object_to_fade, target_opacity, time_in_secs, delete_after_use [, easing_function] [, object_that_has_callback, event_type, event_number])
// Fades the Object to a certain Opacity %, Over an amount of time in seconds.

var refobj = argument[0];
var t_opacity = clamp(argument[1], 0, 1);
var time = argument[2];


var fade_persistent = !argument[3];
var has_callback = false;
var object_that_has_callback, obj_event_type, obj_event_number;
if (argument_count == 7){
    has_callback = true;
    object_that_has_callback = argument[4];
    obj_event_type = argument[5];
    obj_event_number = argument[6];
}

if (argument_count == 8){    
    has_callback = true;
    object_that_has_callback = argument[5];
    obj_event_type = argument[6];
    obj_event_number = argument[7];    
}

var fade_controller;

fade_controller = instance_create(x,y, obj_fading_helper);

if (argument_count == 8 || argument_count == 5){
    fade_controller.easing_script = argument[4];
}
else{
    fade_controller.easing_script = ease_linear;
}
    
if(refobj.image_alpha != t_opacity){
    fade_controller.ref = refobj;
    fade_controller.fnlOpc = t_opacity;
    fade_controller.time = time*room_speed;
    fade_controller.has_callback = has_callback;
    fade_controller.fade_persistent = fade_persistent;
    if(has_callback){
        fade_controller.object_that_has_callback = object_that_has_callback;
        fade_controller.obj_event_type = obj_event_type;
        fade_controller.obj_event_number = obj_event_number;   
    }   
    fade_controller.initial_opa = refobj.image_alpha;
    fade_controller.can_fade = true;
}

return fade_controller;
