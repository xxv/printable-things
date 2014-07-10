include <box_with_lid.scad>
include <cube_mesh.scad>

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

// Inner height of the box. moo minicards are 70mm.
inner_height=70;

inner_size = [inner_width, card_stack, inner_height];

// The amount of overlap between the lid and the body.
overlap=7;

// The location of the split, as a value between 0.0 and 1.0.
split_ratio=0.8;

module mesh_top(inner_size, overlap, split_ratio){
  translate([inner_size[0] + 10, 0,0])
    union(){
      translate([-0.2, -0.2, 0])
	cube_mesh(inner_size + [0.4, 0.4, -inner_height + 1]);
      difference(){
	top(inner_size, overlap, split_ratio);
	translate([-0.2,-0.2,-6])
	  cube(inner_size + [0.4, 0.4, 0.2 ]);
      }
    }
}

// Normal box
//print_box(inner_size, overlap, split_ratio);

// mesh on the lid.
mesh_top(inner_size, overlap, split_ratio);
bottom(inner_size, overlap, split_ratio);

/* test card */
% translate([wall,wall,wall]){
  cube([inner_width,0.5,70]);
}
