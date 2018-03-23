///hsl_to_rgb(h,s,l)
var c, h, s, l, _h, X, m;
var rgb;

rgb[3] = 0;

h = argument[0];
s = argument[1];
l = argument[2];

c = (1 - abs(2*l - 1)) * s;

_h = h/60;
X = c * (1 - abs((_h mod 2) - 1));
m = l - c/2;

if(_h >= 0 && _h < 1){
    rgb[0] = c;
    rgb[1] = X;
    rgb[2] = 0;
}
else if(_h >= 1 && _h < 2){
    rgb[0] = X;
    rgb[1] = c;
    rgb[2] = 0;
}
else if(_h >= 2 && _h < 3){
    rgb[0] = 0;
    rgb[1] = c;
    rgb[2] = X;
}
else if(_h >= 3 && _h < 4){
    rgb[0] = 0;
    rgb[1] = X;
    rgb[2] = c;
}
else if(_h >= 4 && _h < 5){
    rgb[0] = X;
    rgb[1] = 0;
    rgb[2] = c;
}
else if(_h >= 5 && _h < 6){
    rgb[0] = c;
    rgb[1] = 0;
    rgb[2] = X;
}

rgb[0] = round((rgb[0] + m) * 255);
rgb[1] = round((rgb[1] + m) * 255);
rgb[2] = round((rgb[2] + m) * 255);

return rgb;
