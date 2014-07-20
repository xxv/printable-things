include <plate.scad>;

$fn=60;

difference(){
  openbeam_plate([8, 8], 4);

  for(y= [-45:openbeam_w:30]){
    for(x= [-45:openbeam_w:30]){
    translate([x+openbeam_w/2,y+openbeam_w/2,0])
      cylinder(r=4+hole_extra_size,h=5, center=true);
    }
  }
}
