///anima_fill_view(view number, fill color, alpha, is persistent [, is draw gui])
var view_no, color, alpha, is_draw_gui, is_persistent;
var ret;
view_no = argument[0];
color = argument[1];
alpha = argument[2];
is_persistent = argument[3];
is_draw_gui = (argument_count == 5) && argument[4];

ret = instance_create(0, 0, obj_anima_fill_view);
ret.view_no = view_no;
ret.color = color;
ret.is_draw_gui = is_draw_gui;
ret.image_alpha = alpha;
ret.persistent = is_persistent;
ret.can_draw = true;
if(alpha == 0){
    ret.visible = false;
}

return ret;
