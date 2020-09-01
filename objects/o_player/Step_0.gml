//------UPDATE INPUT
input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_up = keyboard_check(vk_up);
input_down = keyboard_check(vk_down);
input_walk = keyboard_check(vk_control);
input_run = keyboard_check(vk_shift);
input_interact = keyboard_check_pressed(ord("E"));

//------ALTER SPEED
if(input_walk or input_run) {
	spd = abs((input_walk*w_spd) - (input_run*r_spd));
} else {
	spd = n_spd;
}

//------RESET MOVE VARIABLES
moveX = 0;
moveY = 0;

//------INTENDED MOVEMENT

moveX = (input_right - input_left) * spd;
if(moveX == 0) {
	moveY = (input_down - input_up) * spd;
}

//------GET DIRECTION PLAYER IS FACING
if(moveX != 0) {
	switch(sign(moveX)) {
		case 1:
			facing = dir.right;
			break;
		case -1:
			facing = dir.left;
			break;
	}
} else if(moveY != 0) {
	switch(sign(moveY)) {
		case 1:
			facing = dir.down;
			break;
		case -1:
			facing = dir.up;
			break;
	}
} else {
	facing = -1;
}

//------COLLISION CHECKS

//HORIZONTAL
if(moveX != 0) {
	var collisionH = instance_place(x+moveX, y, o_collision);
	if(collisionH != noone and collisionH.collidable) {
		repeat(abs(moveX)) {
			if(!place_meeting(x+sign(moveX), y, o_collision)) {
				x += sign(moveX);
			} else {
				break;
			}
		}
		moveX = 0;
	}
}

//VERTICAL
if(moveY != 0) {
	var collisionV = instance_place(x,  y + moveY, o_collision);
	if(collisionV != noone and collisionV.collidable) {
		repeat(abs(moveY)) {
			if(!place_meeting(x, y+sign(moveY), o_collision)) {
				y += sign(moveY);
			} else {
				break;
			}
		}
		moveY = 0;
	}
}

//OBJECTS
var inst = instance_place(x,y,o_transition);
if(inst != noone and facing == inst.playerFacingBefore) {
	with(game) {
		if(!doTransition) {
			spawnRoom = inst.targetRoom;
			spawnX = inst.targetX;
			spawnY = inst.targetY;
			spawnPlayerFacing = inst.playerFacingAfter;
			doTransition = true;
		}
	}
}

//TEXTBOX
if(input_interact) {
	if(active_textbox == noone) {
		var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, o_parent_NPC, false, false);
	
		if(inst != noone) {
			with(inst) {
				var tbox = create_textbox(text, speakers, next_line, scripts);
				can_move = false;
				moveX = 0;
				moveY = 0;
			}
			active_textbox = tbox;
		}
	} else {
		if(!instance_exists(active_textbox)) {
			active_textbox = noone;
		}
	}
}

//------APPLY MOVEMENT
x += moveX;
y += moveY;