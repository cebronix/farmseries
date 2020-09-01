/// @description 

if(keyboard_check_pressed(ord("I"))) {
	show_inventory = !show_inventory;
}

if(!show_inventory) exit;

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (cell_size + x_buffer)*scale;
var cell_ybuff = (cell_size + y_buffer)*scale;

var i_mousex = mousex - slots_x;
var i_mousey = mousey - slots_y;

var nx = i_mousex div cell_xbuff;
var ny = i_mousey div cell_ybuff;

var mouse_in_inventory = true;
if(nx >= 0 and nx < inv_slots_width and ny >= 0 and ny < inv_slots_height and i_mousey > 0 and i_mousex > 0) {
//if(i_mousex >= 0 and i_mousex < (cell_xbuff*inv_slots_width) and i_mousey >= 0 and i_mousey < (cell_ybuff*inv_slots_height)) {
	var sx = i_mousex - (nx*cell_xbuff);
	var sy = i_mousey - (ny*cell_xbuff);
	
	if((sx < cell_size*scale) and (sy < cell_size*scale)) {
		m_slotx = nx;
		m_sloty = ny;
	}
} else {
	mouse_in_inventory = false;
}

//Set selected slot to mouse position

selected_slot = min(inv_slots - 1, m_slotx + (m_sloty*inv_slots_width));

// Pickup item

var inv_grid = ds_inventory;
var ss_item = inv_grid[# 0, selected_slot];
var create_notification = false;

if(pickup_slot != -1) {
	if(mouse_check_button_pressed(mb_left)) {
		if(!mouse_in_inventory) {
			create_notification = true;
			//Drop item into gameworld
			var pitem = inv_grid[# 0, pickup_slot];
			var in = pitem;
			inv_grid[# 1, pickup_slot] -= 1;
			
			// Destroy item in inventory if it was the last one
			if(inv_grid[# 1, pickup_slot] == 0) {
				inv_grid[# 0, pickup_slot] = item.none;
				pickup_slot = -1;
			}
				
			// Create the item
			var inst = instance_create_layer(o_player.x, o_player.y, "Instances", o_item);
			with(inst) {
				item_num = pitem;
				x_frame = item_num mod (s_width/cell_size);
				y_frame = item_num div (s_width/cell_size);
			}
			
		} else if(ss_item == item.none) {
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];

			inv_grid[# 0, pickup_slot] = item.none;
			inv_grid[# 1, pickup_slot] = 0;
			
			pickup_slot = -1;	
			
		} else if (ss_item == inv_grid[# 0, pickup_slot]) {
				if(selected_slot != pickup_slot) {
					inv_grid[# 1, selected_slot] += inv_grid[# 1, pickup_slot];
					inv_grid[# 0, pickup_slot] = item.none;
					inv_grid[# 1, pickup_slot] = 0;
				}
			
			pickup_slot = -1;
			
		} else {
			var ss_item_num = inv_grid[# 1, selected_slot];
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];

			inv_grid[# 0, pickup_slot] = ss_item;
			inv_grid[# 1, pickup_slot] = ss_item_num;
			
			//pickup_slot = -1;
		}
	}
} else if(ss_item != item.none) {
		// Drop item into Game world
			if(mouse_check_button_pressed(mb_middle)) {
				create_notification = true;
					var in = inv_grid[# 0, selected_slot];
				inv_grid[# 1, selected_slot] -= 1;
				// Destroy item in inventory if it was the last one
				if(inv_grid[# 1, selected_slot] == 0) {
					inv_grid[# 0, selected_slot] = item.none;
				}
				
				// Create the item
				var inst = instance_create_layer(o_player.x, o_player.y, "Instances", o_item);
				with(inst) {
					item_num = ss_item;
					x_frame = item_num mod (s_width/cell_size);
					y_frame = item_num div (s_width/cell_size);
				}
				
			}
		
		// Drop pickup item into new slot
		if(mouse_check_button_pressed(mb_right)) {
			pickup_slot = selected_slot;
		}
	}
	
	//Create notification
	if(create_notification) {
		if(!instance_exists(o_notification)) {
			instance_create_layer(0,0, "Instances", o_notification);
		}

		with(o_notification) {
			if(!ds_exists(ds_notifications, ds_type_grid)) {
				ds_notifications = ds_grid_create(2,1);
				var not_grid = ds_notifications;
				not_grid[# 0, 0] = -1;
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
						not_grid[# 0, yy] -= 1;
						in_grid = true;
						break;
					} 
					yy++;
				}
						
				if(!in_grid) {
					ds_grid_resize(not_grid, 2, grid_height+1);
					not_grid[# 0, grid_height] = -1;
					not_grid[# 1, grid_height] = inventory.ds_items_info[# 0, in];
				}
			}
		}
	}
				