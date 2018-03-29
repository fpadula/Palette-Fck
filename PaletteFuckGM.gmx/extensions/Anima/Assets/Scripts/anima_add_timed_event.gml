///anima_add_timed_event(animation's controller, time to start, is time absolute, object [, event type, event number])

/************************************************************
*                                                           *
*               Argument's explanation                      *
*                                                           *
*   - animation's controller: The animation's controller    *
*        that will trigger the event                        *
*                                                           *
*   - object: The object that has the event to be           *
*       performed. If this object is an obj_anima_animation,*
*       the default event to be performed is the start event*
*       for this object's animation.                        *
*                                                           *
*   - event type (optional): The object event's type to be  *
*       performed.                                          *
*                                                           *
*   - event number (optional): The object event's number to *
*       be performed.                                       *
*                                                           *
*************************************************************/

var animations_controller, time, object, is_time_absolute, e_type, e_number, trigger_for_event_to_be_added;
var node_time_trigger, node_next_index, node_event_obj, node_event_tp, node_event_no; 
var i, prev_i, new_node_index;

animations_controller = argument[0];
time = argument[1];
is_time_absolute = argument[2];
object = argument[3];
if(argument_count > 4){
    e_type = argument[4];
    e_number = argument[5];
}
else{
    e_type = ev_other;
    e_number = ev_user1;
}

if(instance_exists(animations_controller)){
    if(is_time_absolute){
        trigger_for_event_to_be_added = time * room_speed;
    }
    else{
        trigger_for_event_to_be_added = animations_controller.duration * time;
    }    
    
    if(animations_controller.first_timed_event_index == -1){
        new_node_index = 0;    
    }
    else{
        new_node_index = array_height_2d(animations_controller.timed_event);
    }   
    
    i = animations_controller.first_timed_event_index;
    prev_i = i;
    while ((i != -1) && ( trigger_for_event_to_be_added > animations_controller.timed_event[i, 0] )) {
        prev_i = i;
        i = animations_controller.timed_event[i, 1];
        //show_debug_message("Prev i: " + string(prev_i) + ", i: " + string(i) + ", new node index: " + string(new_node_index));
    }     
    animations_controller.timed_event[new_node_index, 0] = trigger_for_event_to_be_added;
    if(prev_i != i){
        animations_controller.timed_event[new_node_index, 1] = animations_controller.timed_event[prev_i, 1];    
        animations_controller.timed_event[prev_i, 1] = new_node_index;
    }
    else{
        animations_controller.timed_event[new_node_index, 1] = i;
        animations_controller.first_timed_event_index = new_node_index;
    }
    animations_controller.timed_event[new_node_index, 2] = object;
    animations_controller.timed_event[new_node_index, 3] = e_type;
    animations_controller.timed_event[new_node_index, 4] = e_number;
    animations_controller.current_timed_event = animations_controller.first_timed_event_index;
        
//    show_debug_message("Event added. T = " + string(animations_controller.timed_event[new_node_index, 0]) + ", Index of next element = " + string(animations_controller.timed_event[new_node_index, 1]) + ", First timed event index = " + string(animations_controller.first_timed_event_index));
    
    return true;
}
else{
    return false;
}
