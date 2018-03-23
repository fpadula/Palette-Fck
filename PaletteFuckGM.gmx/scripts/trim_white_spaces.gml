///trim_white_spaces(string, type_of_trim = {0: begin | 1: end | 2: both} [, begin index, end index])
var input_string = argument[0];
var ammount_to_delete;
var i;
var starting_trim_position;
var read_char;

if(argument_count == 4){
    var string_part_a = string_delete(input_string, argument[2], string_length(input_string) - argument[2] + 1);    
    var string_part_b = string_delete(input_string, 1, argument[3] - 1);
    input_string = string_delete(input_string, argument[3], string_length(input_string) - argument[3] + 1);
    input_string = string_delete(input_string, 1, argument[2] - 1);    
}

return_array = 0;
// 0: Trimmed string
// 1: Ammount trimmed at the beginning
// 2: Ammount trimmed at the end

if ((argument[1] == 0) || (argument[1] == 2)){
    starting_trim_position = 1;
    ammount_to_delete = 0;
    for(i = 1; i < string_length( input_string ); i++){  
        read_char = string_char_at(input_string, i);
        if(read_char != ' '){
            break;
        }
        else{
            ammount_to_delete++;
        }
    }
    return_array[1] = ammount_to_delete;
    input_string = string_delete(input_string, starting_trim_position, ammount_to_delete);    
}
if ((argument[1] == 1) || (argument[1] == 2)){
    starting_trim_position = 1;
    ammount_to_delete = 0;
    for(i = string_length( input_string ); i > 0 ; i--){  
        read_char = string_char_at(input_string, i);
        if(read_char == ' '){
            starting_trim_position = i;
            ammount_to_delete++;
        }
        else{
            break;
        }
    }
    return_array[2] = ammount_to_delete;
    input_string = string_delete(input_string, starting_trim_position, ammount_to_delete);
}

if(argument_count == 4){
    input_string = string_part_a + input_string + string_part_b;
}

return_array[0] = input_string;

return return_array;
