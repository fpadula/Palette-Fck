///create_primitive_rect_sides( x, y, width, height, source_alpha, dest_alpha, src_color, dest_color)  
//                              0  1      2       3             4           5          6           7

draw_primitive_begin(pr_trianglelist);
draw_vertex_colour(argument[0], argument[1], argument[6], argument[4]);
draw_vertex_colour(argument[0] + argument[2], argument[1],argument[7], argument[5]);
draw_vertex_colour(argument[0] + argument[2], argument[1] + argument[3] ,argument[7], argument[5]);
draw_primitive_end();    

draw_primitive_begin(pr_trianglelist);
draw_vertex_colour(argument[0], argument[1], argument[6], argument[4]);
draw_vertex_colour(argument[0] + argument[2], argument[1] + argument[3],argument[7], argument[5]);
draw_vertex_colour(argument[0], argument[1] + argument[3] ,argument[6], argument[4]);
draw_primitive_end();  

