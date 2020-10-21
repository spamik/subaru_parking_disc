include <parameters.scad>
include <cogwheel.scad>


module pdwheel() {
	color("white") generate_cogwheel(wheel_dia, wheel_base_d, 12, inner_dia);
	color("black") for (i=[0:11]) {
		// hourly loop
		rotate(a=[0, 0, i*(360/12)]) translate([0, wheel_dia/3-2, 0]) rotate(a=[0, 0, 180]) linear_extrude(height=wheel_sign_d) 
			text(hours_text[i], size=9, halign="center", valign="center", font=font_type);
		rotate(a=[0, 0, i*(360/12)]) translate([0, wheel_dia/3+8, 0]) rotate(a=[0, 0, 180]) linear_extrude(height=wheel_sign_d) 
			text(hours_alternate_text[i], size=5, halign="center", valign="center", font=font_type);

		rotate(a=[0, 0, i*(360/(12))]) translate([line_w/-2, wheel_dia/3-15, 0]) cube(size=[line_w, line_large_h, wheel_sign_d]);
	}
	color("black") for (i=[0:(12*2)-1]) {
		//half-hour loop
		rotate(a=[0, 0, i*(360/(12*2))]) translate([line_w/-2, wheel_dia/3-15, 0]) cube(size=[line_w, line_small_h, wheel_sign_d]);
	}
}

