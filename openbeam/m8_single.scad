include <../MCAD/shapes/boxes.scad>;
include <tools.scad>;

$fn=60;
size=[openbeam_w, openbeam_w * 3, 4];

difference() {
  roundedBox(size, 4, true);
  translate([0, openbeam_w,  0])
    openbeam_screw_hole();
  openbeam_screw_hole();
  translate([0, -openbeam_w,  0])
    cylinder(r=4.25, h=5,center=true);
}
