include <plate.scad>;

$fn=60;

openbeam_plate([1,4]);

translate([30,60,0])
  openbeam_plate([4,1], h=2);

translate([30,0,0])
  openbeam_plate([4,3]);

translate([30,90,0])
  openbeam_plate([4,3], solid_center=false);

translate([-105,0,0])
  openbeam_plate([6,7], solid_center=true);

