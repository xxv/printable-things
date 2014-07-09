include <box_with_lid.scad>

$fn=60;
// Normal box
id=[39,47.5,5];
wall=2;
difference() {
half_rounded(id, 0, 1, wall=wall, r=4);

translate([-wall-0.5,18.5,wall])
  cube([wall + 1,10,6]);

}

