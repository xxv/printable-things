include <plate.scad>;

$fn=60;

difference() {
  openbeam_plate([1,3]);
  translate([openbeam_w/2, openbeam_w/2,  -1])
    cylinder(r=4.25, h=6);
}
