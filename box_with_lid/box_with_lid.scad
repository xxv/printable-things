/**
 * A simple box with a lid. There's a lip with matching recess so that
 * they fit together.
 */

/**
 * One half of the box.
 *
 * inner_size - the interior size of the container [x,y,z]
 * ext_offset - the offset of the exterior wall, in mm
 * split_z - between 0.0 and 1.0, where this half is split in the z axis.
 * wall - wall thickness
 * clearance - clearance between 3D printed parts
 */
module half(inner_size, ext_offset, split_z, wall=2.5, clearance=0.2){
  // make it so the inner area is at 0,0
  translate([-wall/2, -wall/2, 0]) {
    difference() {
      union() {
        // The inner cube that surrounds the cavity
        cube([inner_size[0] + wall, inner_size[1] + wall, (inner_size[2] + wall) * split_z]);

        // The outer cube that makes the outer box
        translate([-wall/2,-wall/2,0]){
          cube([inner_size[0] + wall*2, inner_size[1] + wall*2, (inner_size[2] + wall) * split_z + ext_offset]);
        }
      }
      translate([-clearance, -clearance, (inner_size[2] + wall) * (split_z)]){
        cube([inner_size[0] + wall + clearance*2, inner_size[1] + wall + clearance*2, inner_size[2] * (1-split_z)]);
      }

      // the cavity
      translate([wall/2 -clearance/2, wall/2 -clearance/2, wall -clearance/2]){
        cube(inner_size + [clearance, clearance, clearance]);
      }
    }
  }
}

/**
 * One half of the box, with rounded corners.
 *
 * inner_size - the interior size of the container [x,y,z]
 * ext_offset - the offset of the exterior wall, in mm
 * split_z - between 0.0 and 1.0, where this half is split in the z axis.
 * wall - wall thickness
 * clearance - clearance between 3D printed parts
 */
module half_rounded(inner_size, ext_offset, split_z, wall=2.5, clearance=0.2, r=0){
  // make it so the inner area is at 0,0
  translate([-wall/2, -wall/2, 0]) {
    difference() {
      union() {
        // The inner cube that surrounds the cavity
        rounded_xy_cube([inner_size[0] + wall, inner_size[1] + wall, (inner_size[2] + wall) * split_z], r);

        // The outer cube that makes the outer box
        translate([-wall/2,-wall/2,0]){
          rounded_xy_cube([inner_size[0] + wall*2, inner_size[1] + wall*2, (inner_size[2] + wall) * split_z + ext_offset], r + wall);
        }
      }
      translate([-clearance, -clearance, (inner_size[2] + wall) * (split_z)]){
        rounded_xy_cube([inner_size[0] + wall + clearance*2, inner_size[1] + wall + clearance*2, inner_size[2] * (1-split_z)], r);
      }

      // the cavity
      translate([wall/2 -clearance/2, wall/2 -clearance/2, wall -clearance/2]){
        rounded_xy_cube(inner_size + [clearance, clearance, clearance], r);
      }
    }
  }
}

module rounded_xy_cube(size, r) {
  translate([r,r,0]) {
    minkowski() {
      cube(size - [r*2, r*2, 0]);
      cylinder(r=r, h=0.00001);
    }
  }
}

/**
 * Box top. Give the bottom and top the same parameters.
 */
module top(inner_size, overlap, split_ratio){
  half(inner_size, overlap, 1-split_ratio);
}

/**
 * Box bottom.
 */
module bottom(inner_size, overlap, split_ratio){
  half(inner_size, -overlap, split_ratio);
}

/**
 * A box with the top and bottom next to each other.
 */
module print_box(inner_size, overlap, split_ratio){
  translate([inner_size[0] + 10, 0, 0]){
    top(inner_size, overlap, split_ratio);
  }

  bottom(inner_size, overlap, split_ratio);
}

