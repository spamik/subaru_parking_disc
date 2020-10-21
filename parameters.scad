// global
tolerance = 0.8;
d_tolerance = 0.4;

// wheel parameters
wheel_inner_tolerance = 0.2;
wheel_dia = 100;
inner_dia = 30;
wheel_base_d = 2.8;
wheel_sign_d = 3.8;
line_w = 1.6;
line_small_h = 4;
line_large_h = 6;
//font_type = "Liberation Mono:style=Bold";
font_type = "Ubuntu:style=Bold";


hours_text = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
hours_alternate_text = ["13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"];

// box parameters
box_wall = 2.8;
box_size = wheel_dia + 2*box_wall + 8 + (wheel_dia/2)*(6/12)/2;
box_base_d = 2;
wheel_washer_d = 0.6;
wheel_over_d = 0.6;
box_top_d = 3.6;
box_top_hole = 2.6;
box_bottom_d = wheel_sign_d + box_base_d + wheel_washer_d + wheel_over_d;
echo (box_bottom_d);
round_radius = 6;
lock_square = 13;
lock_cylinder = 10;
cutout_w1 = 40;
cutout_w2 = 60;
cutout_h = 15;

// details
pointarrow_w = 5;
pointarrow_h = 8;
signs_d = box_top_d+1;
parking_logo_size = 20;
parking_logo_radius = 3;
parking_logo_thick = 1.6;
parking_logo_fontsize = 13;
