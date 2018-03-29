///create_slider(x, y, width, height, max_value, min_value, default_value,[, panel, label, call_back_obj, call_back_type, call_back_numb])
//               0  1      2       3          4          5              6        7      8              9              10              11
if(argument_count == 12){
    slider = instance_create(argument[0] + argument[7].x, argument[1] + argument[7].y, obj_slider_bar);
    slider.panel = argument[7];
    slider.depth = argument[7].depth - 1;  
    slider.label = argument[8];  
}
else{
    slider = instance_create(argument[0], argument[1], obj_slider_bar);
    slider.panel = noone;
    slider.label = noone;
}
slider.slider_ctrl = instance_create(slider.x, slider.y, obj_slider);
slider.slider_ctrl.depth = slider.depth - 1;
slider.width = argument[2];
slider.image_xscale = slider.width/slider.sprite_width;
slider.height = argument[3];
slider.max_value = argument[4];
slider.min_value = argument[5];
slider.slider_ctrl.father = slider;
slider.slider_ctrl.can_follow = true;
slider.slider_ctrl.callbackobj = argument[9];
slider.slider_ctrl.callbacktype = argument[10];
slider.slider_ctrl.callbacknumb = argument[11];
slider.value = argument[6];
if(instance_exists(slider.label)){
    slider.label.label_text = string(slider.value);
}
slider.slider_ctrl.initial_x = change_interval(argument[6], argument[4], argument[5], slider.x + slider.sprite_width, slider.x);
return slider;
