///rgb_to_hsl(r,g,b)
var r, g, b, c_max, c_min, delta;
var hsl;

hsl[3] = 0;

r = argument[0]/255;
g = argument[1]/255;
b = argument[2]/255;

c_max = max(r,g,b);
c_min = min(r,g,b);

delta = c_max - c_min;

if(delta == 0){
    hsl[0] = 0;    
}
else if(c_max == r){
    hsl[0] = 60*(((g - b)/delta) mod 6);    
}
else if(c_max == g){
    hsl[0] = 60*(((b - r)/delta) + 2);
}
else if(c_max == b){
    hsl[0] = 60*(((r - g)/delta) + 4);
}

hsl[2] = (c_max + c_min)/2;

if(delta == 0){
    hsl[1] = 0;
}
else{
    hsl[1] = delta/(1 - abs(2*hsl[2] -1));
}

hsl[0] = round(hsl[0]);
if (hsl[0] < 0){
    hsl[0] = hsl[0] + 360;
}

return hsl;
