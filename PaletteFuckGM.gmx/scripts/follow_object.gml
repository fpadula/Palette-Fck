///follow_object(target, camera_weight, target_weight[, offset_x, offset_y])
//target: Object to follow
//camera_smooth_factor: Factor of camera smoothness. A value of 20 is a standard value
camera_follow = instance_create(0,0,obj_camera_follow)
camera_follow.target = argument[0];
camera_follow.view_weight = argument[1];
if(argument_count == 5){
    camera_follow.offset_x = argument[3];
    camera_follow.offset_y = argument[4];
}
else{
    camera_follow.offset_x = 0;
    camera_follow.offset_y = 0;
}
camera_follow.target_weight = argument[2];
//camera_follow.target_weight = 1;
camera_follow.camera_lock = true;
return camera_follow;
