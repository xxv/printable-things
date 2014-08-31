// A bunch of variations on cubes of various sorts.

/**
 * A hollowed-out cube, with an interior size specified and walls of a given
 * thickness. There's also an offset that shifts the position of the interior
 * cube by a specific amount. This could be used to make cups.
 */
module cube_hollow(interior, wall=[1,1,1], offset=[0,0,0]) {
  translate(wall * -1) {
    difference() {
      cube(interior + wall * 2);
      translate(offset + wall)
        cube(interior);
    }
  }
}

/**
 * A mesh with cube-shaped holes in it along the Z axis. (rotated 45°)
 */
module cube_mesh(size, hole_size=3, spacing=1) {
  hyp=sqrt(pow(hole_size,2) + pow(hole_size,2));
  spacing_hyp=sqrt(pow(spacing,2) + pow(spacing,2));

  difference() {
    cube(size);
    intersection() {
      translate([spacing, spacing, -0.5])
        cube(size + [-spacing * 2, -spacing * 2, 1]);
      translate([0,0,-0.5]) {
        for (i_y = [-hyp/2:hyp + spacing_hyp:size[1]]) {
          for (i_x = [0:hyp + spacing_hyp:size[0]+hyp]) {
            translate([i_x, i_y, 0]) {
              rotate([0,0,45]) {
                cube([hole_size,hole_size,size[2]+1]);
                translate([hole_size+spacing,0,0])
                  cube([hole_size, hole_size, size[2] + 1]);
              }
            }
          }
        }
      }
    }
  }
}

/**
 * A cube with rounded corners (in the x and y axes) of radius r.
 */
module cube_rounded_xy(size, r=1) {
  translate([r,r,0]) {
    minkowski() {
      cube(size - [r*2, r*2, 0]);
      cylinder(r=r, h=0.00001);
    }
  }
}


