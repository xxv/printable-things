// Copyright 2015 Steve Pomeroy
// Licensed under the CC-BY-SA 4.0 License
// http://creativecommons.org/licenses/by-sa/4.0/

//////////////////////////////////////////////////////////////////////
/////////////////////// Configuration Options ////////////////////////
//////////////////////////////////////////////////////////////////////
// tidy up the curves
$fn=120;
$fs=0.5;

// measured dimensions of the pebblebee
pebblebee=[40,40,5.8];

// wall thickness
wall=1;

// radius of the crossbars
curve_r=2;

// the crossbars to wind your cord around
bar=[3,60,pebblebee[2]];

// the bit that touches the actual pebblebee
spacer=[0.5,4,pebblebee[2]];

// A small clip above the spacer to hold the pebblebee in
clip=[0.5 + spacer[0],4,0.5];

// hole for accessing the button
button=8;

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

translate([0,0,pebblebee[2]+wall])
  rotate([180,0,0]) {
    difference(){
      union() {
        minkowski(){

        union(){
        rotate([0,0,-45])
            translate([-bar[0]/2,-bar[1]/2,0])
                cube(bar);

        rotate([0,0,45])
            translate([-bar[0]/2,-bar[1]/2,0])
                cube(bar);
        }

        cylinder(r=curve_r,h=wall);
        }

        cylinder(r=pebblebee[0]/2+wall+spacer[0],h=pebblebee[2]+wall);
      }
        // Hole for pebblebee + spacer
        translate([0,0,-0.1])
          cylinder(r=pebblebee[0]/2 + spacer[0],h=pebblebee[2]);
      // notch for the button + to remove the Pebblebee
      translate([pebblebee[0]/2,-button/2,-0.1])
      cube([wall*2,button,pebblebee[2]+0.1]);
    }

    for (rot = [45 : 90 : 360]) {
      rotate([0,0,rot]) {
        translate([pebblebee[0]/2-clip[0]+spacer[0],-clip[1]/2,0])
          cube(clip);

        translate([pebblebee[0]/2,-spacer[1]/2,0])
          cube(spacer);
      }
    }
}
