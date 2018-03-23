///screen_shake(max_shake_distance[pixels], shake_time [seconds])
screen_shake_sc = instance_create(x, y, obj_screen_shake);
screen_shake_sc.max_shake_distance = argument[0];
screen_shake_sc.shake_time = argument[1] * room_speed;
screen_shake_sc.shake_dec_factor = screen_shake_sc.max_shake_distance / screen_shake_sc.shake_time;
screen_shake_sc.can_shake = true;
screen_shake_sc.initial_x = view_xview;
screen_shake_sc.initial_y = view_yview;  
return screen_shake_sc;
