///create_roi(x, y, width, height)
var ret = instance_create(argument[0], argument[1], obj_roi);

ret.image_xscale = argument[2]/ret.sprite_width;
ret.image_yscale = argument[3]/ret.sprite_height;

return ret;
