/// @description 
draw_sprite_part(s_crops, 0, growthStage*frameWidth, cropType*frameHeight, frameWidth, frameHeight, xx, yy);

//Draw Sparkle when fully grown
if(sparkle >= 0){
	draw_sprite(s_sparkle, sparkle, x+2, y-10);
	sparkle += .1;
	if(sparkle >= sprite_get_number(s_sparkle)) {
		sparkle = -1;
		alarm[1] = random_range(4,5)*room_speed;
	}
}