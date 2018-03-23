///create_panel(x, y, width, height, z_index, panel_color)
panel = instance_create(argument[0], argument[1], obj_panel);
panel.width = argument[2];
panel.height = argument[3];
panel.depth = argument[4];
panel.color = argument[5];
panel.top_shadow_size = 0;
panel.bot_shadow_size = 6;
panel.left_shadow_size = 0;
panel.right_shadow_size = 2;
panel.shadow_intensity = 1;

panel.variables_set = true;
return panel;
