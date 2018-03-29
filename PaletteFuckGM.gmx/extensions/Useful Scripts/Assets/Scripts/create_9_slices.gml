///create_9_slices(x, y, width, height, sprite_1 [, sprite_2, sprite_3, sprite_4, sprite_5, sprite_6, sprite_7, sprite_8, sprite_9] [, animate just one time])
var objx, objy, width, height, sprite_1, sprite_2, sprite_3, sprite_4, sprite_5, sprite_6, sprite_7, sprite_8, sprite_9, animate_just_one_time;
var ret_obj, single_sprite_mode;
objx = argument[0];
objy = argument[1];
width = argument[2];
height = argument[3];
sprite_1 = argument[4];

if ((argument_count == 14) || (argument_count == 6)){
    animate_just_one_time = argument[13];
}
else if ((argument_count == 13) || (argument_count == 5)){
    animate_just_one_time = false;
}

if ((argument_count == 13) || (argument_count == 14)){
    sprite_2 = argument[5];
    sprite_3 = argument[6];
    sprite_4 = argument[7];
    sprite_5 = argument[8];
    sprite_6 = argument[9];
    sprite_7 = argument[10];
    sprite_8 = argument[11];
    sprite_9 = argument[12];
    single_sprite_mode = false;
}
else{
    single_sprite_mode = true;
}

ret_obj = instance_create(objx, objy, obj_9_slices);
ret_obj.single_sprite_mode = single_sprite_mode;
ret_obj.nine_slice_part_00 = sprite_1;
if(!single_sprite_mode){
    ret_obj.nine_slice_part_01 = sprite_2;
    ret_obj.nine_slice_part_02 = sprite_3;
    ret_obj.nine_slice_part_10 = sprite_4;
    ret_obj.nine_slice_part_11 = sprite_5;
    ret_obj.nine_slice_part_12 = sprite_6;
    ret_obj.nine_slice_part_20 = sprite_7;
    ret_obj.nine_slice_part_21 = sprite_8;
    ret_obj.nine_slice_part_22 = sprite_9;
}

with(ret_obj){
    if(!single_sprite_mode){
        vertical_strech_scale_factor = (height - (sprite_get_height(nine_slice_part_00) + sprite_get_height(nine_slice_part_20)))/sprite_get_height(nine_slice_part_10);

        horizontal_strech_scale_factor = (width - (sprite_get_width(nine_slice_part_00) + sprite_get_width(nine_slice_part_02)))/sprite_get_width(nine_slice_part_01);

        slice_2_x0 = sprite_get_width(nine_slice_part_00);
        slice_3_x0 = slice_2_x0 + sprite_get_width(nine_slice_part_01)*horizontal_strech_scale_factor;
        slice_4_y0 = sprite_get_height(nine_slice_part_00);
        slice_7_y0 = slice_4_y0 + sprite_get_height(nine_slice_part_10)*vertical_strech_scale_factor;    
    }
    else{                
        single_part_width = sprite_get_width(nine_slice_part_00) / 3;
        single_part_height = sprite_get_height(nine_slice_part_00) / 3;

        vertical_strech_scale_factor = (height - (2 * single_part_height))/single_part_height;

        horizontal_strech_scale_factor = (width - (2 * single_part_width))/single_part_width;        
        slice_2_x0 = single_part_width;
        slice_3_x0 = slice_2_x0 + single_part_width*horizontal_strech_scale_factor;
        slice_4_y0 = single_part_height;
        slice_7_y0 = slice_4_y0 + single_part_height*vertical_strech_scale_factor;            
    }
}
ret_obj.sprite_index = sprite_1;
ret_obj.image_xscale = width/ret_obj.sprite_width;
ret_obj.image_yscale = height/ret_obj.sprite_height;
ret_obj.animate_just_one_time = animate_just_one_time;
ret_obj.can_draw = true;
return ret_obj;
