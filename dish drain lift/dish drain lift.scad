length = 40;

width = 10;

height = 20;

recess_dip = 5;

recess_width = 2;

difference(){
cube([length, width, height]);
	translate([0,width/2-recess_width/2,(height-recess_dip)]){
		cube([length, recess_width, recess_dip]);
	}
}