///make_colour_hex(hex_value)
var _color_from_hex_first_char = 1;
if(string_length(argument[0]) != 6 && string_length(argument[0]) != 7){
    return noone;
}

if(string_length(argument[0]) == 7){
    _color_from_hex_first_char++;
}

var _color_from_hex_first_char_hex_r = string_copy(argument[0], _color_from_hex_first_char, 2);
var _color_from_hex_first_char_hex_g = string_copy(argument[0], _color_from_hex_first_char + 2, 2);
var _color_from_hex_first_char_hex_b = string_copy(argument[0], _color_from_hex_first_char + 4, 2);

var _color_from_hex_first_char_dec_r = convert_digit_hex_dec(string_char_at(_color_from_hex_first_char_hex_r, 1)) * 16 + convert_digit_hex_dec(string_char_at(_color_from_hex_first_char_hex_r, 2));
var _color_from_hex_first_char_dec_g = convert_digit_hex_dec(string_char_at(_color_from_hex_first_char_hex_g, 1)) * 16 + convert_digit_hex_dec(string_char_at(_color_from_hex_first_char_hex_g, 2));
var _color_from_hex_first_char_dec_b = convert_digit_hex_dec(string_char_at(_color_from_hex_first_char_hex_b, 1)) * 16 + convert_digit_hex_dec(string_char_at(_color_from_hex_first_char_hex_b, 2));

//show_debug_message("R: " + string(_color_from_hex_first_char_dec_r) + ", G: " + string(_color_from_hex_first_char_dec_g) + ", B: " + string(_color_from_hex_first_char_dec_b));

return make_colour_rgb(_color_from_hex_first_char_dec_r, _color_from_hex_first_char_dec_g, _color_from_hex_first_char_dec_b);
