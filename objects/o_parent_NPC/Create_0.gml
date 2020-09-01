/// @description  
event_inherited();

w_spd = 1;
n_spd = 2;
r_spd = 3;
spd = w_spd;

x_frame = 1;
y_frame = 10;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

s_base = -1;
s_feet = -1;
s_legs = -1;
s_torso = -1;
s_hair = -1;
s_shadow = s_character_shadow;

moveX = 0;
moveY = 0;
can_move = true;

alarm[1] = 1;

portrait_index = 0;
voice = snd_voice_1;
name = "Anonymous";
text = ["This person has nothing to say"];
speakers = [id]; 
next_line = [0];
scripts = -1;