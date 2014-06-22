// demo
// cube_mesh([50, 50, 1], 3, 1);

/**
 * A mesh with cube-shaped holes in it. (rotated 45°)
 */
module cube_mesh(size, hole_size=3, spacing=1){
  hyp=sqrt(pow(hole_size,2) + pow(hole_size,2));
  spacing_hyp=sqrt(pow(spacing,2) + pow(spacing,2));

  difference(){
    cube([size[0],size[1],size[2]]);
    intersection(){
      translate([spacing, spacing, -0.5])
        cube([size[0]-spacing*2,size[1]-spacing*2,size[2]+1]);
      translate([0,0,-0.5])
        for (i_y = [-hyp/2:hyp + spacing_hyp:size[1]]){
          for (i_x = [0:hyp + spacing_hyp:size[0]+hyp]){
            translate([i_x, i_y, 0])
              rotate([0,0,45]){
                cube([hole_size,hole_size,size[2]+1]);
                translate([hole_size+spacing,0,0])
                  cube([hole_size,hole_size,size[2]+1]);
              }
          }
       }
    }
  }
}
