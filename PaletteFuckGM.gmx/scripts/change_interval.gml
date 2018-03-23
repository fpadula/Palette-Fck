///change_interval(value, src_max, src_min, dest_max, dest_min [, script])
var script;
//var value, src_max, src_min, dest_max, dest_min;
if(argument_count == 6){
    script = argument[5];
}
else{
    script = ease_linear;
}
/*
value = argument[0];
src_max = argument[1];
src_min = argument[2];
dest_max = argument[3];
dest_min = argument[4];

//return script_execute(script, (value - src_min)/(src_max - src_min), dest_min, dest_max - dest_min, 1);
*/
return script_execute(script, (argument[0] - argument[2])/(argument[1] - argument[2]), argument[4], argument[3] - argument[4], 1);
