
module generate_cogwheel(dia, depth, num_teeth, inner_dia){
	r = dia/2;
	depth = depth;
	num_teeth = num_teeth;
	tooth_l = 0.9*r;
	tooth_w_scale = 6/num_teeth;
	tooth_w = tooth_l * tooth_w_scale;
	inner_dia = inner_dia;

	module 2teeth(pos,angle) {
		translate(pos){
			rotate(a = angle) {
				polygon(points=[[-tooth_l,-tooth_w/2],[tooth_l,-tooth_w/2],[tooth_l+tooth_l/4,-tooth_w/4],[tooth_l+tooth_l/4,tooth_w/4],[tooth_l,tooth_w/2],[-tooth_l,tooth_w/2],[-tooth_l-tooth_l/4,tooth_w/4],[-tooth_l-tooth_l/4,-tooth_w/4]]);
			}
		}
	}

	module cogwheel() {
		$fs = 0.5;
		linear_extrude(depth) {
		{
			
			difference() {
				union(){
					circle(r);
					for(i = [0:floor(num_teeth/2)-1]) {
						2teeth([0,0,0],(360*i/num_teeth));
					}
				}
				circle(inner_dia/2);
			}
		}
		}
	}

	cogwheel();
}


