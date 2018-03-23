///convert_digit_hex_dec(hex_digit)
var convert_digit_hex_dec_input = string_lower( argument[0] );

if(convert_digit_hex_dec_input == "a"){
    return 10
}else if(convert_digit_hex_dec_input == "b"){
    return 11
}else if(convert_digit_hex_dec_input == "c"){
    return 12
}else if(convert_digit_hex_dec_input == "d"){
    return 13
}else if(convert_digit_hex_dec_input == "e"){
    return 14
}else if(convert_digit_hex_dec_input == "f"){
    return 15
}else{
    return real(convert_digit_hex_dec_input);
}
