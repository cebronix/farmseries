
if(!can_move) exit;
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

//------APPLY MOVEMENT
x += moveX;
y += moveY;