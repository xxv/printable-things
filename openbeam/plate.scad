include <../MCAD/shapes/boxes.scad>;
include <tools.scad>;

hole_extra_size=0.50;

module openbeam_plate(grid_size, h=4) {
  size = [grid_size[0] * openbeam_w, grid_size[1] * openbeam_w, h];
  difference() {
    roundedBox(size, 4, true);
    //cube(size,center=true);

    // holes on the sides
    for (x = [-size[0]/2+openbeam_w/2:size[0]-openbeam_w:size[0]/2-openbeam_w/2]) {
      for (y = [-size[1]/2:openbeam_w:size[1]/2-openbeam_w]) {
        translate([x, y+openbeam_w/2, 0]) {
          translate([0, 0, size[2]/2 - 2])
            openbeam_screw_hole();
        }
      }
    }

    for (y = [-size[1]/2+openbeam_w/2:size[1]-openbeam_w:size[1]/2-openbeam_w/2]) {
      for (x = [-size[0]/2:openbeam_w:size[0]/2-openbeam_w]) {
        translate([x+openbeam_w/2, y, 0]) {
          translate([0, 0, size[2]/2 - 2])
            openbeam_screw_hole();
        }
      }
    }
  }
}
