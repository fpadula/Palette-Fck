///add_roi_event(roi, roi event{ 0: MOUSE_ENTER | 1: MOUSE_LEAVE | 2: MOUSE_DOWN | 3: MOUSE_UP  }, object that has event, event_type, event_number)

var roi, roi_event, obj, obj_type, obj_number;
var current_event;

roi = argument[0];
roi_event = argument[1];
obj = argument[2];
obj_type = argument[3];
obj_number = argument[4];

current_event = roi.mouse_events[roi_event];

current_event[? "has_event"] = true;
current_event[? "obj"] = obj;
current_event[? "type"] = obj_type;
current_event[? "number"] = obj_number;
