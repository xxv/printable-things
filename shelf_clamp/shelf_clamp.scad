// the diameter of the center hole that this is clamping to
shelf_post_diameter=25.5;

// the extra amount added to the clamp diameter for wiggle room
clamp_diameter_extra=0;

//thickness of the clamp walls
clamp_thickness=2;

// overall height of the clamp
clamp_h=35;

// a nut trap. This is the size of the cavity
nut_trap_x=14;
nut_trap_y=7;

// distance to the center of the nut from the edge of the clamp
nut_offset=10;

// diameter of the bolt
bolt_diameter=8.4;

bolt_z_position=0.8;

// this is the nut+bolt that hold the two halves together
nut2_width=6.9;
bolt2_diameter=3.4;
bolt2_offset=4;

$fn=60;

// sample post
%translate([0,0,-25])
  cylinder(r=shelf_post_diameter/2,h=50);

clamp_diameter_o=shelf_post_diameter+clamp_diameter_extra+clamp_thickness*2;
clamp_diameter_i=shelf_post_diameter+clamp_diameter_extra;


half();
%rotate([0,0,180])
  half();

module half(){
  difference(){
    difference(){
      translate([-clamp_diameter_o/2,-clamp_diameter_o/2,0])
        base_form();
      cylinder(r=clamp_diameter_i/2, h=clamp_h);
    }
    rotate([0,0,-45])
      translate([-clamp_diameter_o*sqrt(2)/2,0,0])
        cube([clamp_diameter_o*sqrt(2),clamp_diameter_o*sqrt(2),clamp_h]);

    side_bolts(clamp_h * 0.20);
    side_bolts(clamp_h * 0.8);
  }
}

module side_bolts(z){
    // bolts to hold the two sides together
    rotate([0,0,90+45]){
      translate([clamp_diameter_o*sqrt(2)/2-nut2_width,2,z-nut2_width/2])
        cube([nut2_width,nut2_width/sqrt(2),nut2_width]);
      translate([-clamp_diameter_o*sqrt(2)/2,2,z-nut2_width/2])
        cube([nut2_width,nut2_width/sqrt(2),nut2_width]);
      translate([clamp_diameter_o*sqrt(2)/2-bolt2_offset,-1,z])
        rotate([-90,0,0])
          cylinder(r=bolt2_diameter/2,h=nut2_width/sqrt(2),$fn=60);
      translate([-clamp_diameter_o*sqrt(2)/2+bolt2_offset,-1,z])
        rotate([-90,0,0])
          cylinder(r=bolt2_diameter/2,h=nut2_width/sqrt(2),$fn=60);
    }
}

module base_form(){
  cube([clamp_diameter_o,clamp_diameter_o,clamp_h]);

    %translate([nut_offset,0,clamp_h * bolt_z_position]){
      rotate([90,0,0])
        cylinder(r=4,h=20);
     rotate([90,0,0])nut();
    }
    difference(){
     translate([nut_offset/2-clamp_thickness,-nut_trap_y,0])
       difference(){
        translate([-clamp_thickness,-clamp_thickness,0])
         cube([nut_trap_x+clamp_thickness*2,nut_trap_y+clamp_thickness,clamp_h]);
         cube([nut_trap_x,nut_trap_y,clamp_h]);

       }

    // bolt hole
    translate([nut_offset,0,clamp_h * bolt_z_position]){
      rotate([90,0,0])
        cylinder(r=bolt_diameter/2,h=20);
        }
     }

     translate([0,-nut_trap_y-clamp_thickness,0])
       cube([3,nut_trap_y+clamp_thickness,clamp_h]);
}

module nut(){
  cylinder(r=14.5/2,h=6.5,$fn=6);
 }
