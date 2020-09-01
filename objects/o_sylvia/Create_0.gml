/// @description 
event_inherited();

s_base = s_base_male_2;
s_feet = s_feet_male_3;
s_legs = s_legs_male_pants_metal;
s_torso = s_torso_male_plate_gold;
s_hair = s_hair_male_mohawk_green;

portrait_index = 6;
voice = snd_voice_2;
name = "Sylvia";
text = [
	"Hey, what's your name?",
	[
		"I'm the player. I'm kind of a big deal. Let's add some more text to properly test this.",
		"Hey, I'm Sylvia too."
	],
	"You're kind of an ass.",
	"Wow, what a coincidence."
];
speakers = [id, o_player, o_player, id, id];
next_line = [0, [2,3], -1, -1];
scripts = [
	[change_variable, id, "s_torso", s_torso_female_tunic_maroon],
	[
		[change_variable, id, "s_torso", s_torso_male_longsleeve_teal],
		[change_variable, id, "s_torso", s_torso_female_pirate_white],
	],
	-1,
	-1,
	-1,
];