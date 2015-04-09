$fn=100;
r=119/2;

notch=6;
difference(){
  cylinder(r=r, h=1);
  translate([0,0,-1])
    union(){
      rotate([0,0,-40])
        translate([37.3,0,0])
          cylinder(r=15, h=3);
      translate([0,r-18,0]){
      translate([-notch/2,0,0])
        cube([notch,19,3]);
        cylinder(r=notch/2,h=3);
        }
    }
}

color("red")
translate([16,-7,1.25])
linear_extrude(height = 1, center = true, convexity = 10)
   import (file = "grind.dxf");
