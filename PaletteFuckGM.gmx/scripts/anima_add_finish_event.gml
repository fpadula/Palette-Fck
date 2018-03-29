///anima_add_finish_event(animation's controller, object [, event type, event number])

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

var ctrl, obj, ev_type, ev_no;

ctrl = argument[0];
obj = argument[1];

if(argument_count > 2){
    ev_type = argument[2];
    ev_no = argument[3];
}
else{
    ev_type = ev_other;
    ev_no = ev_user1;
}

if(instance_exists(ctrl)){
    return anima_add_timed_event(ctrl, 1, false, obj, ev_type, ev_no);
}
else{
    return false;
}
