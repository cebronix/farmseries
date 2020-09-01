/// @description 

//Draw box
draw_sprite(box, 0, box_x, box_y);


//Draw portrait back
draw_sprite(frame, 0, port_x, port_y);

//Draw Portrait
draw_sprite(portrait, portrait_index, port_x, port_y);

//Draw portrait frame
draw_sprite(frame, 1, port_x, port_y);

//Draw namebox
draw_sprite(namebox, 0, namebox_x, namebox_y);



//--Text
draw_set_font(font);
//Draw Name
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_color(name_text_x, name_text_y, name, c_black, c_black, c_black, c_black, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
c = c_black;

if(!choice_dialogue) {
	//Draw Text
	if(!pause and counter < str_len) {
		counter++;
		if(counter mod 4 == 0) {
			audio_play_sound(voice, 10, false);
		}
	
		switch(string_char_at(text_wrapped, counter)) {
			case ",": pause = true; alarm[1] = 15; break;
			case ".": 
			case "?":
			case "!": pause = true; alarm[1] = 25; break;
		}
	}
	var substr = string_copy(text_wrapped, 1, counter);

	draw_text_ext_color(text_x, text_y, substr, text_height, text_max_width, c, c, c, c, 1);
} else {
	var i = 0;
	y_add = 0;
	repeat(text_array_len) {
		if(choice == i) {
			c = c_white;
			draw_text_color(box_x+text_max_width, text_y+y_add, "<", c, c, c, c, 1);
		} else {
			c = c_black;
		}
		draw_text_ext_color(text_x, text_y+y_add, text_array[i], text_height, text_max_width-10, c, c, c, c, 1);
		y_add += string_height_ext(text_array[i], text_height, text_max_width);
		i++;
	}
	
}

