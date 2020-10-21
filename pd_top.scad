include <parameters.scad>
include <roundedcube.scad>
include <pdmisc.scad>
include <2Dshapes.scad>

module pdtop() {
	difference() {
        union() {
            difference() {
                    color("blue") roundedBox(size=[box_size, box_size, box_top_d], radius=round_radius, sidesonly=true, $fn=100);
                    translate([0, box_size/2-cutout_h/2+0.01, box_bottom_d/-2-1]) cutout_polygon(box_bottom_d+2);

                    for(i=[-1:2:1]) {
                        for(j=[-1:2:1]) {
                            translate([i*(box_size/-2+lock_square/2+box_wall-0.01), j*(box_size/-2+lock_square/2+box_wall-0.01), 0]) {
                                translate([0, 0, box_top_d/-2-1]) cylinder(d=lock_cylinder, h=1+box_top_hole, $fn=100);
                            }
                    }

                    

                    // disc window
                    translate([0, 0, box_bottom_d/-2-1]) linear_extrude(height=box_bottom_d+2) donutSlice(18, 47, 270-45, 270+45, $fn=100);

                }
            }

            color("white") translate([0, -18+4, box_top_d/-2]) point_arrow(signs_d);
            color("white") translate([0, box_size/2-30, (signs_d-box_top_d)/2]) parking_logo();
            color("white") translate([0, 7, box_top_d/-2]) scale([0.4, 0.4, 1]) linear_extrude(height=signs_d) import("subaru_logo.svg", center=true);
        }
        translate([0, 0, box_top_d/-2-1]) cylinder(d=inner_dia/2, h=1+box_top_hole, $fn=100);
    }
}

module point_arrow(height) {
	linear_extrude(height=height) polygon(points=[
			[pointarrow_w/-2, pointarrow_h/2],
			[pointarrow_w/2, pointarrow_h/2],
			[0, pointarrow_h/-2]
		]);
}

module parking_logo() {
	union() {
		difference() {
			roundedBox(size=[parking_logo_size, parking_logo_size, signs_d], radius=parking_logo_radius, sidesonly=true, $fn=100);
			translate([0, 0, 1]) roundedBox(size=[parking_logo_size-2*parking_logo_thick, parking_logo_size-2*parking_logo_thick, signs_d], radius=parking_logo_radius, sidesonly=true, $fn=100);

		}
		translate([0, 0, signs_d/-2]) linear_extrude(height=signs_d) text("P", halign="center", valign="center", size=parking_logo_fontsize);
	}
}