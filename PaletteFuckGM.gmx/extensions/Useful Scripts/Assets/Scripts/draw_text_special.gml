///draw_text_special(string, text alignment inside wrapper box, wrapper box top left x, wrapper box top left y, wrapper box width, wrapper box height , text base font, text color, lines vertical spacing [, is debug mode on] [, callback object when ready, type of event, event number]])
enum text_align{
    left,
    center,
    right,
    justify
}
/******************************************************
*               Arguments explanation
*
*   - string: The string to be drawn.
*
*   - text alignment inside wrapper box: 
*       0 for left align.     
*       1 for center align.
*       2 for right align.
*       3 to justify text.
*
*   - wrapper box top left x: The x position of the text's
*       wrapper box.
*
*   - wrapper box top left y: The y position of the text's
*       wrapper box.
*
*   - wrapper box width: The wrapper box's width.
*
*   - wrapper box height: The wrapper box's height. Set
*       this to -1 for auto height.
*
*   - text base font: The base font for this text. To
*       create italic, bold and small fonts, use the
*       following codes:
*
*           - Italic: to create italic text, duplicate your
*           base font and add an "i" to its end. For example,
*           if your base font name is "fnt_test", to create a
*           italic version of this font you need to duplicate
*           this font and rename it to "fnt_testi"
*
*           - Bold: to create bold text, duplicate your
*           base font and add an "b" to its end. For example,
*           if your base font name is "fnt_test", to create a
*           bold version of this font you need to duplicate
*           this font and rename it to "fnt_testb"
*
*           - Superscript or underscript : to create superscript
*           or underscript text, duplicate your base font and
*           add an "s" to its end. For example, if your base
*           font name is "fnt_test", to create a superscript or
*           underscript version of this font you need to duplicate
*           this font and rename it to "fnt_tests"
*
*           - Combination of fonts: to create a combination
*           of font styles, you need to duplicate your base
*           font and add the style modifiers in ascending
*           order. For example, if you wanted to create a
*           bold and italic font, you should duplicate the
*           base font and rename it to "fnt_testbi"
*
*   - text color: The text's color.
*
*   - lines vertical spacing: The vertical spacing between
*       lines. Set this to -1 for auto spacing.
*   - is debug mode on (optional): Sets the debug mode on
*       or off. This turns on lines indicating letter's
*       bouding boxes and the wrapper box.
******************************************************/
var input_string = string_copy(argument[0], 1, string_length(argument[0]));
var line_breaks, inline_imgs, inline_imgs_no;
var open_command_character, close_command_character, escape_character;
var i, j, k;
var read_command, read_character, full_command, full_command_length;
var error_msg;
var command_stack = ds_list_create();
var head, head_pos;
var opening_cmd;
var string_a, string_b, interval_a, interval_b;
var text_string_interval_a, text_string_interval_b;
var last_command_index;
var insert_empty_char;

var ret_obj;
var is_debug;

if ((argument_count == 10) || (argument_count == 13)){
    is_debug = argument[9];        
}
else{
    is_debug = false;
}
/******************************************************************
*
*   Defining reserved characters
*
*****************************************************************/
open_command_character = '<';
close_command_character = '>';
escape_character = '~';

empty_commands = ds_list_create(); //AKA elements that need no closing tag.
ds_list_add(empty_commands, "br");
ds_list_add(empty_commands, "img");
/****************************************************************/

interpreted_strings[0, 0] = 0;
n_of_interpreted_strings = 0;

text_string = 0;

text_string_interval_a = 1;
read_character = '';
line_breaks = ds_list_create();
last_command_index = -1;
inline_imgs_no = 0;
insert_empty_char = false;
/******************************************************************
*
*   Parsing input string
*
*****************************************************************/
for(i = 1; i <= string_length(input_string); i++){    
    read_character = string_char_at(input_string, i);
    if(read_character == escape_character){
        input_string = string_delete(input_string, i, 1);        
    }
    else if(read_character == open_command_character){

        /******************************************************************
        *
        *   Reading the command between "<" and ">"
        *
        *****************************************************************/
        read_command = "";
        j = i + 1;
        while( string_char_at(input_string, j) != close_command_character){
            read_command += string_char_at(input_string, j);
            j++;
            if(j > string_length(input_string)){
                error_msg = "SYNTAX ERROR: COMMAND OPPENED AT POS " + string(i) + " HAS NEVER BEEN CLOSED";
                show_debug_message(error_msg);
                return error_msg;
            }
        }
        /****************************************************************/

        /******************************************************************
        *
        *   Separating command from arguments
        *
        *****************************************************************/
        full_command_length = string_length(read_command);
        full_command = string_split(read_command, " ");
        read_command = full_command[0];  
        /****************************************************************/

        if(ds_list_find_index(empty_commands, read_command) == -1){ //The command read need a closing command.
            /******************************************************************
            *
            *   Building text_strings
            *
            *****************************************************************/
            if(i != last_command_index){                
                interpreted_strings[n_of_interpreted_strings, 0] = i-1;                
                interpreted_strings[n_of_interpreted_strings, 1] = ds_list_create();
                for(k = 0; k < ds_list_size(command_stack); k++){            
                    ds_list_add(interpreted_strings[n_of_interpreted_strings, 1], ds_list_find_value(command_stack, k));            
                }
                ds_list_sort(interpreted_strings[n_of_interpreted_strings, 1], true);                        
                n_of_interpreted_strings++;
                last_command_index = i;
            }
            /****************************************************************/
            
            /******************************************************************
            *
            *   Processing command that was read
            *
            *****************************************************************/
            if(!is_a_close_command(read_command)){            
                ds_list_add(command_stack, read_command);                
            }
            else{
                head = ds_list_find_value(command_stack, ds_list_size(command_stack) - 1);                
                opening_cmd = get_opening_command(read_command);
                if (head == opening_cmd){
                    ds_list_delete(command_stack, ds_list_size(command_stack)-1);                    
                }
                else{
                    error_msg = "SYNTAX ERROR: EXPECTED " + head + " , FOUND " + opening_cmd + " AT CHAR INDEX " + string(i);
                    show_debug_message(error_msg);
                    return error_msg;
                }
            }
            /****************************************************************/
        }
        else{ //The command read does not need a closing command.
            if(read_command == "br"){
                ds_list_add(line_breaks, i);
            }
            else if(read_command == "img"){
                var out;
                inline_imgs[inline_imgs_no, 0] = asset_get_index(full_command[1]);
                inline_imgs[inline_imgs_no, 1] = noone;
                inline_imgs[inline_imgs_no, 2] = i;
                if(array_length_1d(full_command) == 5 || array_length_1d(full_command) == 6){
                    if(full_command[2] == "custom"){
                        inline_imgs[inline_imgs_no, 5] = sprite_get_xoffset(inline_imgs[inline_imgs_no, 0]) + real(full_command[3]);
                        inline_imgs[inline_imgs_no, 6] = sprite_get_yoffset(inline_imgs[inline_imgs_no, 0]) + real(full_command[4]);
                    }
                    else{
                        show_debug_message("Error at command img at position " + string(i) + ".");
                    }
                }
                else if(array_length_1d(full_command) > 2){
                    if(full_command[2] == "bottom"){
                        inline_imgs[inline_imgs_no, 5] =  sprite_get_xoffset(inline_imgs[inline_imgs_no, 0]);
                        inline_imgs[inline_imgs_no, 6] =  sprite_get_yoffset(inline_imgs[inline_imgs_no, 0]) - sprite_get_height(inline_imgs[inline_imgs_no, 0]);
                    }
                    else if(full_command[2] == "middle"){
                        inline_imgs[inline_imgs_no, 5] =  sprite_get_xoffset(inline_imgs[inline_imgs_no, 0]);
                        inline_imgs[inline_imgs_no, 6] =  sprite_get_yoffset(inline_imgs[inline_imgs_no, 0]) - sprite_get_height(inline_imgs[inline_imgs_no, 0])/2;
                    }  
                    else if(full_command[2] == "top"){
                        inline_imgs[inline_imgs_no, 5] =  sprite_get_xoffset(inline_imgs[inline_imgs_no, 0]);
                        inline_imgs[inline_imgs_no, 6] =  sprite_get_yoffset(inline_imgs[inline_imgs_no, 0]);
                    }                      
                }
                else{
                    inline_imgs[inline_imgs_no, 5] =  sprite_get_xoffset(inline_imgs[inline_imgs_no, 0]);
                    inline_imgs[inline_imgs_no, 6] =  sprite_get_yoffset(inline_imgs[inline_imgs_no, 0]) - sprite_get_height(inline_imgs[inline_imgs_no, 0]);       
                }
                if(array_length_1d(full_command) == 4){
                    inline_imgs[inline_imgs_no, 7] = full_command[3];
                }
                else if(array_length_1d(full_command) == 6){
                    inline_imgs[inline_imgs_no, 7] = full_command[5];
                }
                else{
                    inline_imgs[inline_imgs_no, 7] = 0;
                }
                inline_imgs[inline_imgs_no, 3] = sprite_get_width(inline_imgs[inline_imgs_no, 0]);
                inline_imgs[inline_imgs_no, 4] = sprite_get_height(inline_imgs[inline_imgs_no, 0]);
                inline_imgs_no++;
                insert_empty_char = true;
            }
        }
        input_string = string_delete(input_string, i, full_command_length + 2);
        if(insert_empty_char){
            input_string = string_insert("i", input_string, i);
            insert_empty_char = false;
        }
        i--;
    }
}
/****************************************************************/

/******************************************************************
*
*   Building last text string
*
*****************************************************************/
if(i != last_command_index){    
    interpreted_strings[n_of_interpreted_strings, 0] = i-1;
    interpreted_strings[n_of_interpreted_strings, 1] = ds_list_create();
    for(k = 0; k < ds_list_size(command_stack); k++){            
        ds_list_add(interpreted_strings[n_of_interpreted_strings, 1], ds_list_find_value(command_stack, k));            
    }
    ds_list_sort(interpreted_strings[n_of_interpreted_strings, 1], true);                        
    n_of_interpreted_strings++;
}
/****************************************************************/


/******************************************************************
*
*   Text output of what has been interpreted if debug mode is on
*
*****************************************************************/
var outputstr;
if(is_debug){
    for(k = 0; k < n_of_interpreted_strings; k++){
        outputstr = "";
        outputstr = "Modifiers end at pos: " + string(interpreted_strings[k, 0]) + ". Modifiers: ";
        for (j = 0; j < ds_list_size(interpreted_strings[k, 1]); j++) {
            outputstr+= "[" + ds_list_find_value(interpreted_strings[k, 1], j) + "],";
        }
        show_debug_message(outputstr);
    }
}
/****************************************************************/

/******************************************************************
*
*   Building the draw text object
*
*****************************************************************/

ret_obj = instance_create(0, 0, obj_special_text_drawer);

for(j = 0; j < n_of_interpreted_strings; j++){    
    ret_obj.text_string[j, 0] = interpreted_strings[j, 0];    
    for (k = 0; k < ds_list_size(interpreted_strings[j, 1]); k++) {
        ret_obj.text_string[j, k+1] = ds_list_find_value(interpreted_strings[j, 1], k);        
    }    
}

if(inline_imgs_no != 0){
    ret_obj.inline_imgs = inline_imgs;
    if(is_debug){
        show_debug_message("Input string '" + input_string + "'.")
        for(i = 0; i < array_height_2d(inline_imgs); i++){
            out = "";
            out += "Image (" + string(i) + "): ";
            show_debug_message(out);
            out = "     sprite name: '" + sprite_get_name(inline_imgs[i, 0]) + "',";
            show_debug_message(out);
            out = "     string pos to insert image: '" + string(inline_imgs[i, 2]) + "',";
            show_debug_message(out);
            out = "     image width: '" + string(inline_imgs[i, 3]) + "',";
            show_debug_message(out);
            out = "     image height: '" + string(inline_imgs[i, 4]) + "',";
            show_debug_message(out);
            out = "     image x offset: '" + string(inline_imgs[i, 5]) + "',";
            show_debug_message(out);
            out = "     image y offset: '" + string(inline_imgs[i, 6]) + "',";
            show_debug_message(out);
            out = "     image animation speed: '" + string(inline_imgs[i, 7]) + "',";
            show_debug_message(out);
        }
    }
}

ret_obj.type_of_text_align = argument[1];
ret_obj.x = argument[2];
ret_obj.y = argument[3];
ret_obj.width = argument[4];
ret_obj.height = argument[5];
ret_obj.text_font = argument[6];
ret_obj.base_text_font_name = font_get_name(ret_obj.text_font);
ret_obj.text_color = argument[7];
ret_obj.line_spacing = argument[8];
ret_obj.debug = is_debug;      

for(j = 0; j < ds_list_size(line_breaks); j++){  
    ret_obj.line_breaks[j] = ds_list_find_value(line_breaks, j);    
} 

if(is_debug){
    show_debug_message("Line breaks:");
    for(j = 0; j < array_length_1d(ret_obj.line_breaks); j++){
        show_debug_message(string(j) + ":" + string(ret_obj.line_breaks[j]));
    }
}

if (argument_count == 13){    
    ret_obj.callback_obj = argument[10];
    ret_obj.callback_type = argument[11];
    ret_obj.callback_no = argument[12];        
}
else if(argument_count == 12){
    ret_obj.callback_obj = argument[9];
    ret_obj.callback_type = argument[10];
    ret_obj.callback_no = argument[11];        
}
else{
    ret_obj.callback_obj = noone;
    ret_obj.callback_type = noone;
    ret_obj.callback_no = noone;        
}

ret_obj.input_string = input_string;
ret_obj.ammount_of_strings = array_height_2d(ret_obj.text_string);
ret_obj.can_draw = true;
/****************************************************************/

/******************************************************************
*
*   Freeing alocated objects
*
*****************************************************************/
for(j = 0; j < n_of_interpreted_strings; j++){    
    ds_list_destroy(interpreted_strings[j, 1]);    
}
ds_list_destroy(command_stack);
ds_list_destroy(empty_commands);
ds_list_destroy(line_breaks);
/****************************************************************/

return ret_obj;
