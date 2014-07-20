openbeam_w=15;
hole_extra_size=0.50;

module rounded_xy_cube(size, r, center=false) {
  offset = center ? 0 : r;

  translate([offset, offset, 0]) {
    minkowski() {
      cube(size - [r*2, r*2, 0], center);
      cylinder(r=r, h=0.00001);
    }
  }
}

module openbeam_screw_hole(screw_shaft=3, screw_head=5.5,
                           screw_height=6, screw_head_height=3) {
  translate([0, 0, -screw_height])
    cylinder(r=(screw_shaft+hole_extra_size)/2, h=screw_height);
  cylinder(r=(screw_head+hole_extra_size)/2, h=screw_head_height);
}
