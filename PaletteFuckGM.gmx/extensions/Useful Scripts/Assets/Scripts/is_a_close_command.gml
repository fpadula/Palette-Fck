///is_a_close_command(string)
var command_string = argument[0];
if(string_char_at(command_string, 1) == '/'){
    return true;
}
else{
    return false;
}
