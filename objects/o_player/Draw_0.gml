/// @description 
var anim_length = 9;
var frame_size = 64;
var anim_spd = 12;

switch(facing) {
	case dir.left:
		y_frame = 9;
		break;
	case dir.right:
		y_frame = 11;
		break;
	case dir.up:
		y_frame = 8;
		break;
	case dir.down:
		y_frame = 10;
		break;
	case -1:
		x_frame = 0;
		break;
}

var xx = x - x_offset;
var yy = y - y_offset;

//------INCREMENT FRAME FOR ANIMATION
if(x_frame < anim_length - 1) {
	x_frame += anim_spd/60;
} else {
	x_frame = 1;
}


//------DRAW CHARACTER SHADOW
if(s_shadow != -1) {
	draw_sprite(s_shadow, 0, x, y);
}

//------DRAW CHARACTER BASE
if(s_base != -1) {
	draw_sprite_part(s_base, 0, floor(x_frame)*frame_size, floor(y_frame)*frame_size, frame_size, frame_size, xx, yy);
}

//------DRAW CHARACTER FEET
if(s_feet != -1) {
	draw_sprite_part(s_feet, 0, floor(x_frame)*frame_size, floor(y_frame)*frame_size, frame_size, frame_size, xx, yy);
}

//------DRAW CHARACTER LEGS
if(s_legs != -1) {
	draw_sprite_part(s_legs, 0, floor(x_frame)*frame_size, floor(y_frame)*frame_size, frame_size, frame_size, xx, yy);
}

//------DRAW CHARACTER TORSO
if(s_torso != -1) {
	draw_sprite_part(s_torso, 0, floor(x_frame)*frame_size, floor(y_frame)*frame_size, frame_size, frame_size, xx, yy);
}

//------DRAW CHARACTER HAIR
if(s_hair != -1) {
	draw_sprite_part(s_hair, 0, floor(x_frame)*frame_size, floor(y_frame)*frame_size, frame_size, frame_size, xx, yy);
}