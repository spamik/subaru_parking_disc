include <parameters.scad>
include <roundedcube.scad>
include <pdmisc.scad>

module pdbase() {
	color("blue") union() {
		difference() {
			//cube(size=[box_size, box_size, box_bottom_d], center=true);
			roundedBox(size=[box_size, box_size, box_bottom_d], radius=round_radius, sidesonly=true, $fn=100);
			translate([0, 0, box_base_d]) cube(size=[box_size-2*box_wall, box_size-2*box_wall, box_bottom_d], center=true);
			translate([0, box_size/2-cutout_h/2+0.01, box_bottom_d/-2-1]) cutout_polygon(box_bottom_d+2);
		}

		translate([0, 0, box_bottom_d/-2]) {
			// wheel washer
			hx = box_base_d+0.6;
			cylinder(d=inner_dia+10, h=hx, $fn=100);
			// wheel rod
			hx2 = hx + wheel_sign_d + wheel_over_d;
			cylinder(d=inner_dia-wheel_inner_tolerance, h=hx2, $fn=100);
			// wheel lock
			hx3 = hx2 + box_top_hole - d_tolerance;
			cylinder(d=inner_dia/2-tolerance, h=hx3, $fn=100);
		}

		// corner locks (base + cylinder lock)
		for(i=[-1:2:1]) {
			for(j=[-1:2:1]) {
				translate([i*(box_size/-2+lock_square/2+box_wall-0.01), j*(box_size/-2+lock_square/2+box_wall-0.01), 0]) {
					cube(size=[lock_square, lock_square, box_bottom_d], center=true);
					translate([0, 0, box_bottom_d/-2]) cylinder(d=lock_cylinder-tolerance, h=box_bottom_d+box_top_hole - d_tolerance, $fn=100);
				}
			}
		}
	}
}


