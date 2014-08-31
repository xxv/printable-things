include <cubes/cubes.scad>;

// our demo cube!
demo=[50, 30, 20];

// A cube that has a grid of square holes in it along the z axis.
cube_mesh(demo, hole_size=4, spacing=0.5);

color("green")
translate([demo[0] + 5, 0, 0]){
  difference(){
    // A hollow box, whose interior volume is the cube with 1mm walls
    // surrounding it.
    cube_hollow(demo, wall=[1,1,1]);

    #translate([10,20,40])
      rotate([0,45,-45])
        cube(demo);
  }
}

color("red")
translate([0, demo[1] + 5, 0]){
  difference(){
    // a box without a top. The cube size is the interior volume container.
    cube_hollow(demo, wall=[1,1,0.5], offset=[0,0,0.6]);
    #translate([-3,-3,-2])
    rotate([0,0,45])
    cube([30,30,demo[2] + 3]);
  }
}

// make the rounded corners pretty.
$fn=60;

color("blue")
translate([demo[0] + 5, demo[1] + 5, 0]){
  // a cube with rounded corners. The Z axis is flat.
  cube_rounded_xy(demo, r=8);
}
