/// @description 

depth = -1;
scale = 1;

show_inventory = false;

inv_slots = 17;
inv_slots_width = 8;
inv_slots_height = 3;

selected_slot = 0;
pickup_slot = -1;
m_slotx = 0;
m_sloty = 0;

x_buffer = 2;
y_buffer = 4;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

cell_size = 32;

inv_UI_width = 288;
inv_UI_height = 192;

s_inv_UI = s_inventory_UI;
s_inv_items = s_inventory_items;

s_inv_items_columns = sprite_get_width(s_inv_items)/cell_size;
s_inv_items_rows = sprite_get_height(s_inv_items)/cell_size;

inv_UI_x = (gui_width * 0.5) - (inv_UI_width * 0.5 * scale);
inv_UI_y = (gui_height * 0.5) - (inv_UI_height * 0.5 * scale);

info_x = inv_UI_x + (9 * scale);
info_y = inv_UI_y + (9 * scale);

slots_x = info_x;
slots_y = inv_UI_y + (40 * scale);

desc_x = info_x;
desc_y = inv_UI_y + (156 * scale);

// Player Info
ds_player_info = ds_grid_create(2, 4);
ds_player_info[# 0, 0] = "Gold";
ds_player_info[# 0, 1] = "Silver";
ds_player_info[# 0, 2] = "Copper";
ds_player_info[# 0, 3] = "Name";

ds_player_info[# 1, 0] = irandom_range(0, 99);
ds_player_info[# 1, 1] = irandom_range(0, 99);
ds_player_info[# 1, 2] = irandom_range(0, 99);
ds_player_info[# 1, 3] = "Player";

// inventory
ds_inventory = ds_grid_create(2, inv_slots);

// Items
enum item {
	none = 0,
	tomato = 1,
	potato = 2,
	carrot = 3,
	artichoke = 4,
	chilli = 5,
	gourd = 6,
	corn = 7,
	wood = 8,
	stone = 9,
	bucket = 10,
	chair = 11,
	picture = 12,
	axe = 13,
	potion = 14,
	starfish = 15,
	mushroom = 16,
	height = 17,
}

ds_items_info = ds_grid_create(2, item.height);

//----Item Names
var z = 0, i = 0;
ds_items_info[# z, i++] = "Nothing";
ds_items_info[# z, i++] = "Tomato";
ds_items_info[# z, i++] = "Potato";
ds_items_info[# z, i++] = "Carrot";
ds_items_info[# z, i++] = "Artichoke";
ds_items_info[# z, i++] = "Chilli";
ds_items_info[# z, i++] = "Gourd";
ds_items_info[# z, i++] = "Corn";
ds_items_info[# z, i++] = "Wood";
ds_items_info[# z, i++] = "Stone";
ds_items_info[# z, i++] = "Bucket";
ds_items_info[# z, i++] = "Chair";
ds_items_info[# z, i++] = "Picture";
ds_items_info[# z, i++] = "Axe";
ds_items_info[# z, i++] = "Potion";
ds_items_info[# z, i++] = "Starfish";
ds_items_info[# z, i++] = "Mushroom";

//----Item Descriptions
var z = 1, i = 0;
ds_items_info[# z, i++] = "Empty.";
ds_items_info[# z, i++] = "It's a tomato";
ds_items_info[# z, i++] = "You say potato, ";
ds_items_info[# z, i++] = "Carrot Top sux";
ds_items_info[# z, i++] = "Artichoke's are gross";
ds_items_info[# z, i++] = "Chilli doesn't need beans";
ds_items_info[# z, i++] = "Gourd? What the f is a gourd";
ds_items_info[# z, i++] = "Corn, sweet, whole kernal";
ds_items_info[# z, i++] = "Strong and sturdy wood";
ds_items_info[# z, i++] = "Stone is hard";
ds_items_info[# z, i++] = "Bucket List";
ds_items_info[# z, i++] = "Chair, Songs from the Big";
ds_items_info[# z, i++] = "Picture for the wall";
ds_items_info[# z, i++] = "Super-sharp Axe";
ds_items_info[# z, i++] = "Healing Potion";
ds_items_info[# z, i++] = "5-Starfish";
ds_items_info[# z, i++] = "Mushrooms are even more gross";

var yy = 0;
repeat(inv_slots) {
	ds_inventory[# 0, yy] = irandom_range(1, item.height - 1);
	ds_inventory[# 1, yy] = irandom_range(1, 10);
	yy += 1;
}