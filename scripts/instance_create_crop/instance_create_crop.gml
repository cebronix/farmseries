function instance_create_crop() {
	///@description instance_create_crop
	///@arg x
	///@arg y
	///@arg crop_type
	
	var cs = crops.cellSize;
	var gx = argument0 div cs;
	var gy = argument1 div cs;
	var i_grid = crops.ds_crops_instances;
	var cell = i_grid[# gx, gy];
	
	if(cell == 0) {
		var xx = gx*cs;
		var yy = gy*cs;
	
		//Check for Soil
		var lay_id = layer_get_id("t_soil");
		var map_id = layer_tilemap_get_id(lay_id);
		var data = tilemap_get_at_pixel(map_id, argument0, argument1);
	
		if(data = 0) {
			show_debug_message("there is no soil here.");
			return false;
		} else {
			show_debug_message("there is soil here.");
		}

		//Create the Instance
		var inst = instance_create_layer(xx+(cs/2), yy+(cs/2), "Instances", o_crop);
		i_grid[# gx, gy] = inst;

		//Give the crop its characteristics
		with(inst) {
			cropType = argument2;
			growthStageDuration = crops.ds_crops_types[# 0, cropType];
		}

		return inst;
	} else {
		show_debug_message("There is already something planted here.");
		return false;
	}
}