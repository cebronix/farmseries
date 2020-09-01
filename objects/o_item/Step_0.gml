if(drop_move) {
	x = lerp(x, goal_x, 0.1);
	y = lerp(y, goal_y, 0.1);
	if(abs(x - goal_x) < 1 and abs(y - goal_y) < 1) {
		drop_move = false;
	}
} else {
	
	if(!keyboard_check(ord("O"))) exit;
	var px = o_player.x;
	var py = o_player.y;
	var r = 32;
	if(point_in_rectangle(px, py, x-r, y-r, x+r, y+r)) {
			
		// Are we on top of the player?
		r = 2;
		if(!point_in_rectangle(px, py, x-r, y-r, x+r, y+r)) {
			// Move towards the player for pickup
			x = lerp(x, px, 0.1);
			y = lerp(y, py, 0.1);
		} else {  // Pickup item
			var in = item_num;
				
			with(inventory) {
				var ds_inv = ds_inventory;
				var picked_up = false;
					
				// Check if item already exists in inventory
				var yy = 0;
				repeat(inv_slots) {
					if(ds_inv[# 0, yy] == in) {
						ds_inv[# 1, yy] += 1;
						picked_up = true;
						break;
					} else {
							yy += 1;
					}
				}
				// Otherwise, add item to an empty slot if there is one
				if(!picked_up) {
					yy = 0;
					repeat(inv_slots) {
						if(ds_inv[# 0, yy] == item.none) {
							ds_inv[# 0, yy] = in;
							ds_inv[# 1,yy] += 1;
							picked_up = true;
							break;
						} else {
								yy += 1;
						}
					}
				}
			}
			// Destroy item if picked up
			if(picked_up) {
				if(!instance_exists(o_notification)) {
					instance_create_layer(0,0, "Instances", o_notification);
				}
				
				var in = item_num;
				with(o_notification) {
					if(!ds_exists(ds_notifications, ds_type_grid)) {
						ds_notifications = ds_grid_create(2,1);
						var not_grid = ds_notifications;
						not_grid[# 0, 0] = 1;
						not_grid[# 1, 0] = inventory.ds_items_info[# 0, in];
					}	else {
						event_perform(ev_other, ev_user1);
						
						var not_grid = ds_notifications;
						var grid_height = ds_grid_height(not_grid);
						var name = inventory.ds_items_info[# 0, in];
						var in_grid = false;
						
						var yy = 0;
						repeat(grid_height) {
							if(name == not_grid[# 1, yy]) {
								not_grid[# 0, yy] += 1;
								in_grid = true;
								break;
							} 
							yy++;
						}
						
						if(!in_grid) {
							ds_grid_resize(not_grid, 2, grid_height+1);
							not_grid[# 0, grid_height] = 1;
							not_grid[# 1, grid_height] = inventory.ds_items_info[# 0, in];
						}
					}
				}
				
				instance_destroy();
			}
		}
	}
}