///create_primitive_rect(x, y, width, height, shadow_size, shadow_intensity, shadow_color)

/*

    _____________________
   | 1 |      2      | 3 |
   |                     |
   |                     |
   | 8 |             | 4 |
   |                     |
   |                     |
   |_7_|______6______|_5_|  

// 1
create_primitive_rect_corners(x, y, -left_shadow_size, top_shadow_size, shadow_intensity, 0, c_black, c_black);

// 2
create_primitive_rect_top_bot(x, y, width, - top_shadow_size, shadow_intensity, 0, c_black, c_black);  

// 3
create_primitive_rect_corners(x + width, y, right_shadow_size, top_shadow_size, shadow_intensity, 0, c_black, c_black);            

// 4
create_primitive_rect_sides(x + width, y, right_shadow_size, height, shadow_intensity, 0, c_black, c_black);         

// 5
create_primitive_rect_corners(x + width, y + height, right_shadow_size, -bot_shadow_size, shadow_intensity, 0, c_black, c_black);
      
// 6
create_primitive_rect_top_bot(x, y + height, width, bot_shadow_size, shadow_intensity, 0, c_black, c_black);  

// 7
create_primitive_rect_corners(x, y + height, -left_shadow_size, -bot_shadow_size, shadow_intensity, 0, c_black, c_black);

// 8
create_primitive_rect_sides(x, y, - left_shadow_size, height, shadow_intensity, 0, c_black, c_black);  

*/

// 1
create_primitive_rect_corners(argument[0], argument[1], -argument[4], argument[4], argument[5], 0, argument[6], argument[6]);

// 2
create_primitive_rect_top_bot(argument[0], argument[1], argument[2], - argument[4], argument[5], 0, argument[6], argument[6]);  

// 3
create_primitive_rect_corners(argument[0] + argument[2], argument[1], argument[4], argument[4], argument[5], 0, argument[6], argument[6]);            

// 4
create_primitive_rect_sides(argument[0] + argument[2], argument[1], argument[4], argument[3], argument[5], 0, argument[6], argument[6]);         

// 5
create_primitive_rect_corners(argument[0] + argument[2], argument[1] + argument[3], argument[4], -argument[4], argument[5], 0, argument[6], argument[6]);
      
// 6
create_primitive_rect_top_bot(argument[0], argument[1] + argument[3], argument[2], argument[4], argument[5], 0, argument[6], argument[6]);  

// 7
create_primitive_rect_corners(argument[0], argument[1] + argument[3], -argument[4], -argument[4], argument[5], 0, argument[6], argument[6]);

// 8
create_primitive_rect_sides(argument[0], argument[1], - argument[4], argument[3], argument[5], 0, argument[6], argument[6]);       
