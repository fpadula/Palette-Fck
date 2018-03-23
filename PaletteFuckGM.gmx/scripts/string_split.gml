///string_split(string_to_split, separator)
var string_to_split, separator;
var char_read, start_pos, end_pos, str_length, string_part_no;
var ret;

ret = 0;
string_to_split = argument[0];
separator = argument[1];
string_part_no = 0;

str_length = string_length(string_to_split);

start_pos = 1;

for(var i = 1; i <= str_length; i++){
    char_read = string_char_at(string_to_split, i);
    if ( (char_read == separator) || (i == str_length) ){    
        //if ((i > 1)){
            if(char_read == separator)
                end_pos = i - 1;
            else
                end_pos = i;
            ret[string_part_no] = string_copy(string_to_split, start_pos, end_pos - start_pos + 1);
            string_part_no++;
        //}
        start_pos = i + 1;
    }
}

return ret;
