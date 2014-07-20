include <../MCAD/shapes/boxes.scad>;
include <tools.scad>;

hole_extra_size=0.50;
bottom_thickness=2;

module openbeam_plate(grid_size, h=4, solid_center=true) {
  size = [grid_size[0] * openbeam_w, grid_size[1] * openbeam_w, h];
  difference() {
    rounded_xy_cube(size, 4);

    // holes on the sides
    for (x = [0 : grid_size[0] - 1],
         y = [0 : grid_size[1] - 1]) {
      if (!solid_center
          || x == 0 || x == grid_size[0] - 1
          || y == 0 || y == grid_size[1] - 1) {
        translate([x * openbeam_w + openbeam_w/2,
                   y * openbeam_w + openbeam_w/2, 0]) {
          translate([0, 0, bottom_thickness]) {
            openbeam_screw_hole();
          }
        }
      }
    }
  }
}
