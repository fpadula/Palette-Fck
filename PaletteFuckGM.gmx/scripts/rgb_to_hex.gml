///rgb_to_hex(r, g, b)
var r, g, b, ret;  

r = argument[0];
g = argument[1];
b = argument[2];
ret = "";

ret = convert_digit_dec_hex( floor(r/16)) + convert_digit_dec_hex(r%16);
ret = ret + convert_digit_dec_hex( floor(g/16)) + convert_digit_dec_hex(g%16);
ret = ret + convert_digit_dec_hex( floor(b/16)) + convert_digit_dec_hex(b%16);

return ret;
