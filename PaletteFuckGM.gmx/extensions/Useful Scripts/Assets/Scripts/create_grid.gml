///create_grid(obj_to_populate, rows, cols, frame[, padding_left, padding_right, padding_top, padding_bottom])
/****************************************************
*                                                   *
*   Variable setup                                  *
*                                                   *
*****************************************************/
var rows                = argument[1];
var cols                = argument[2];
var obj_to_create       = argument[0];
var frame               = argument[3];

var padding_left;
var padding_right;
var padding_top;
var padding_bottom;

if(argument_count > 4){
    padding_left        = argument[4];
    padding_right       = argument[5];
    padding_top         = argument[6];
    padding_bottom      = argument[7];
}
else{
    padding_left        = 0;
    padding_right       = 0;
    padding_top         = 0;
    padding_bottom      = 0;
}

var ret;
/****************************************************/

/****************************************************
*                                                   *
*   Cards instantiation and placement               *
*                                                   *
*****************************************************/
var available_hspace, available_vspace;
var card_hmargin, card_vmargin;
var card_width, card_height;
var card_xscale, card_yscale;

available_hspace    = floor(frame.sprite_width  - (padding_left + padding_right));
available_vspace    = floor(frame.sprite_height - (padding_top + padding_bottom));
card_width          = sprite_get_width(object_get_sprite(obj_to_create));
card_height         = sprite_get_height(object_get_sprite(obj_to_create));
card_hmargin        = floor((available_hspace - cols * card_width) / (cols + 1));
card_vmargin        = floor((available_vspace - rows * card_height) / (rows + 1));

//show_debug_message("Old Card width: " + string(card_width) + ", card height: " + string(card_height) + ", card hmargin: " + string(card_hmargin) + ", card vmargin: " + string(card_vmargin) + ", available hspace: " + string(available_hspace) + ", available vspace: " + string(available_vspace));
if( (card_hmargin < 0) || ( (cols * (card_width + card_hmargin) + card_hmargin) > available_hspace) ){
    var scaled_width;
    
    scaled_width    = available_hspace*(1/cols - 1/(cols + 1))/( 1 - (cols/(cols+1)) );
    card_xscale     = scaled_width / card_width;
    card_width      = scaled_width;
    card_hmargin    = abs((available_hspace - cols * card_width) / (cols + 1));
}
else{
    card_xscale     = 1;
}

if ( (card_vmargin < 0) || ( (rows * (card_height + card_vmargin) + card_vmargin) > available_vspace )){
    var scaled_height;
    
    scaled_height   = available_vspace*(1/rows - 1/(rows + 1))/( 1 - (rows/(rows+1)) );
    card_yscale     = scaled_height / card_height;
    card_height     = scaled_height;
    card_vmargin    = abs((available_vspace - rows * card_height) / (rows + 1));
}
else{
    card_yscale     = 1;
}

//show_debug_message("New Card width: " + string(card_width) + ", card height: " + string(card_height) + ", card hmargin: " + string(card_hmargin) + ", card vmargin: " + string(card_vmargin) + ", available hspace: " + string(available_hspace) + ", available vspace: " + string(available_vspace));
ret[rows, cols] = 0;
for(var i = 0; i < rows; i++){
    for(var j = 0; j < cols; j++){
        ret[i, j]                 = instance_create(frame.x + padding_left + card_hmargin  + ((card_hmargin + card_width) * j),
                                                        frame.y + padding_top  +  card_vmargin  + ((card_vmargin + card_height) * i), obj_to_create);
        ret[i, j].image_xscale    = card_xscale;
        ret[i, j].image_yscale    = card_yscale;
    }
}
return ret;
/****************************************************/
