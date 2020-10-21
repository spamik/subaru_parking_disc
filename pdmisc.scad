module cutout_polygon(height) {
	linear_extrude(height=height) polygon(points=[
			[cutout_w1/-2, cutout_h/-2],
			[cutout_w1/2, cutout_h/-2],
			[cutout_w2/2, cutout_h/2],
			[cutout_w2/-2, cutout_h/2]
		]);
}