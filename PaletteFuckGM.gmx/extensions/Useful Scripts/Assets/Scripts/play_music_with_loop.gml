///play_music_with_loop(initial_fade_in_time[ms], intro_sound, loop_sound [,pitch])
var ret = instance_create(0, 0, obj_play_music_with_loop);
ret.fade_in_time = argument[0];
ret.intro = argument[1];
ret.loop = argument[2];
if(argument_count == 4){
    ret.pitch = argument[3];
}
else{
    ret.pitch = 1;
}
with(ret){
    event_perform(ev_other, ev_user0);
}
return ret;
