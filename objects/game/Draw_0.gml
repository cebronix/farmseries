/// @description 

if(!debug) {
	exit;
}

with(o_collision) {
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);
}

with(o_player) {
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);
}

var xx = 0;
var cs = crops.cellSize;

draw_set_alpha(0.25);

var r = roomWidth div cs;
repeat(r) {
	draw_line_color(xx, 0, xx, roomHeight, c_white, c_white);
	xx += cs;
}

var yy = 0;

var r = roomHeight div cs;
repeat(r) {
	draw_line_color(0, yy, roomWidth, yy, c_white, c_white);
	yy += cs;
}

draw_set_alpha(1);