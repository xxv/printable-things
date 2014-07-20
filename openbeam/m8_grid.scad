include <plate.scad>;

$fn=60;

difference(){
  openbeam_plate([8, 8], 4);

  for (y = [openbeam_w:openbeam_w:90]) {
    for (x = [openbeam_w:openbeam_w:90]) {
      translate([x+openbeam_w/2, y+openbeam_w/2, 0])
        cylinder(r=4+hole_extra_size, h=5);
    }
  }
}
