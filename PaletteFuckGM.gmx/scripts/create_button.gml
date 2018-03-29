///create_button(left corner x, left corner y, width, height, has border, border width, border color, inner color, text, text font,text color, depth, obj that has the event, event type to perform when clicked, event number to perform when clicked)
button = instance_create(argument0, argument1, obj_procedural_button);
button.width                        = argument2;
button.height                       = argument3;
button.has_border                   = argument4;
button.border_width                 = argument5;
button.border_color                 = argument6;
button.inner_color                  = argument7;
button.text                         = argument8;
button.text_font                    = argument9;
button.text_color                   = argument10;
button.depth                        = argument11;
button.event_performer_obj          = argument12;
button.event_type_to_be_performed   = argument13;
button.event_number_to_be_performed = argument14;
with(button){
    event_perform(ev_other, ev_user0);
}
return button.id;
