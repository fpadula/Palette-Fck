///max_value(array)
var max_value_lenght = array_length_1d(argument[0]);
var max_value_i;
var max_value_input = argument[0];
var max_value_return = 0;
for(max_value_i = 1; max_value_i < max_value_lenght; max_value_i++){
    if(max_value_input[max_value_return] < max_value_input[max_value_i]){
        max_value_return = max_value_i;
    }
}
return max_value_return;
