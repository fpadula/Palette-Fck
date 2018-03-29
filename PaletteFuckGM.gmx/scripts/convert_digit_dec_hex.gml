///convert_digit_dec_hex(dec_digit)
var convert_digit_dec_hex_input =  argument[0];

if(convert_digit_dec_hex_input == 10){
    return "A";
}else if(convert_digit_dec_hex_input == 11){
    return "B";
}else if(convert_digit_dec_hex_input == 12){
    return "C";
}else if(convert_digit_dec_hex_input == 13){
    return "D";
}else if(convert_digit_dec_hex_input == 14){
    return "E";
}else if(convert_digit_dec_hex_input == 15){
    return "F";
}else{
    return string(convert_digit_dec_hex_input);
}
