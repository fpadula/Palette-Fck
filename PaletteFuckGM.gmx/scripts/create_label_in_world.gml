///create_label_in_world(text, x, y, font, color [, time_alive] [,halign,valign, sep, max_width])

ret = noone;
valign = noone;   
halign = noone;     
if (argument_count == 5){
    label_text = argument[0];
    label_x = argument[1];
    label_y = argument[2];
    label_font = argument[3];
    label_color = argument[4];    
    time = -1;
}
else if(argument_count == 6){
    label_text = argument[0];
    label_x = argument[1];
    label_y = argument[2];
    label_font = argument[3];
    label_color = argument[4];        
    time = argument[5];   
}

else if(argument_count == 7){
    label_text = argument[0];
    label_x = argument[1];
    label_y = argument[2];
    label_font = argument[3];
    label_color = argument[4];        
    halign = argument[5];     
    valign = argument[6];   
    time = -1;    
}

else if(argument_count == 8){
    label_text = argument[0];
    label_x = argument[1];
    label_y = argument[2];
    label_font = argument[3];
    label_color = argument[4];        
    time = argument[5];   
    halign = argument[6];        
    valign = argument[7];    
}


ret = instance_create(label_x, label_y, obj_label_in_world);
with(ret){
    label_text = other.label_text;
    label_x = other.label_x;
    label_y = other.label_y;
    label_font = other.label_font;
    time = other.time;   
    label_color = other.label_color;
    valign = other.valign;   
    halign = other.halign;     
    event_perform(ev_other, ev_user0);
}

return ret;
