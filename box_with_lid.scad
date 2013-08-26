// The width of a single card.
card_width=0.5;

// The number of cards to hold.
card_count=25;

// Extra room on top of the cards.
card_extra_room=2;

card_stack=card_count * card_width + card_extra_room;

// Extra space on the inside. This is added to the inner dimensions.
inner_padding=2;

// Inner width of the box. moo minicards are 28mm.
inner_width=28;

// Inner length of the box.
inner_length=card_stack;

// Inner height of the box. moo minicards are 70mm.
inner_height=70;

// The width of the walls.
wall=2.5;

// The amount of overlap between the lid and the body.
overlap=10;

// The location of the split, as a value between 0.0 and 1.0.
split_ratio=0.8;

// The amount of clearance between 3D printed parts that need to fit together.
clearance=0.2;


module bottom(i_x, i_y, i_z, ext_offset, split_z){
  difference(){
    union(){
      // The inner cube that surrounds the cavity
      cube([i_x + wall, i_y + wall, (i_z + wall) * split_z]);

      // The outer cube that makes the outer box
      translate([-wall/2,-wall/2,0]){
	cube([i_x + wall*2, i_y + wall*2, (i_z + wall) * split_z + ext_offset]);
      }
    }
    translate([-clearance, -clearance, (i_z + wall) * (split_z)]){
      cube([i_x + wall + clearance*2, i_y + wall + clearance*2, i_z * (1-split_z)]);
    }

    // the cavity
    translate([wall/2 -clearance/2, wall/2 -clearance/2, wall -clearance/2]){
      cube([i_x+clearance, i_y+clearance, i_z+clearance]);
    }
  }
}

// Top
translate([inner_width * 2, 0, 0]){
  bottom(inner_width + inner_padding, inner_length + inner_padding, inner_height + inner_padding, overlap, 1-split_ratio);
}

// Bottom
% bottom(inner_width + inner_padding, inner_length + inner_padding, inner_height + inner_padding, -overlap, split_ratio);

/* test card */
% translate([wall,wall,wall]){
  cube([inner_width,0.5,70]);
}
