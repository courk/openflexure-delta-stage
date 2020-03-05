/*

OpenFlexure Delta Stage

This project aims to be a high-performance flexure stage, with
long-ish travel in 3D.

*/
include <parameters.scad> //Delta-stage params
use <z_axis.scad>;
use <../openflexure-microscope/openscad/utilities.scad>;
use <../openflexure-microscope/openscad/compact_nut_seat.scad>;
use <../openflexure-microscope/openscad/reflection_illuminator.scad>;

module lever(){
    // The levers go from the centre to the actuator columns
    // We anchor to the y=0 plane.
    w = leg_strut_l; // width of strut part

    // Flexures that join the lever to the leg
    reflect([1,0,0]) translate([-w/2, lever_l-d, dz]) cube(zflex + [0,2*d,0]);
    
    // This is the main horizontal lever
    difference(){
        hull(){
            translate([-w/2, zflex[1], 0]) cube([w, d, 2]); // flexures attach here
            translate([-w/2+1, zflex[1], 0]) cube([w-2, d, 6]); // flexures attach here
            translate([0, lever_l/2, 12]) cube([10,20,d],center=true); //top
            reflect([1,0,0]) translate([w/2-4, lever_l+zflex[1], 0]) cylinder(r=4, h=2);
            reflect([1,0,0]) translate([w/2-4-3, lever_l+zflex[1], 0]) cylinder(r=4, h=12);
        }
        // cut out a hole for the strut that joins the outer parts of the leg
        translate([-99, lever_l-zflex[0]-1.5, -1]) cube([999, zflex[0]+1.5+zflex[1], 6.5]);
    }
    
    // This part connects to the actuator column
    difference(){
        cbr = column_base_radius(); // from compact_nut_seat.scad
        translate([-cbr, lever_l+zflex[1], 0]) 
            cube([cbr*2, nut_y+zflex[1]/2+d - lever_l-zflex[1], 6]);
        translate([0,nut_y,0]) actuator_end_cutout();
    }
}

module lever_swept(){
    hull() for(a=[-1,1]*asin(flex_a)) rotate([a,0,0]) lever();
}

module lever_flexures(){
    // The flexures that form the main hinge for the leg
    w = leg_strut_l; // width of strut part
    reflect([1,0,0]) hull(){
        translate([-w/2-zflex[1]*tan(30), -d, dz]) cube([zflex[0],d,zflex[2]]);
        translate([-w/2, zflex[1], dz]) cube([zflex[0],d,zflex[2]]);
    }
}

module leg(){
    // The parallelogram leg that connects each lever to the moving stage
    w = leg_strut_l; // width of strut part
    iw = w + 2*zflex[1]; // distance between outer parts of leg
    ow = w + 2*leg_t; // outside width of whole leg
    
    // Start with the bridges between the sides, at top and bottom
    for(p=[[-d, zflex[1], flex_z2], 
            [-d, lever_l-zflex[0], 0]]) reflect([1,0,0]) translate(p){
        cube([w/2+d, zflex[0], 4]); //strut
        cube([iw/2+2*d, zflex[0], zflex[2]]); //flexure
    }
    
    // Now make the sides
    reflect([1,0,0]) hull(){
        translate([w/2+zflex[1], lever_l-zflex[0], 0]) cube([d, zflex[0], 4]); //bottom flexure
        translate([iw/2+leg_t/2, lever_l-leg_t/2, 0]) cylinder(d=leg_t, h=4); //bottom corner near the flexure
        translate([iw/2+leg_t/2, 15, 0]) cylinder(d=leg_t, h=4); //bottom corner near centre
        translate([iw/2, zflex[1], flex_z2]) cube([leg_t, zflex[0], 4]); //top
    }
    
    // Tie the outer bits together - some of these ties may need to be snipped later.
    translate([0,15,4]) cube([ow, 2, dz], center=true);
    for(p=[0.25,0.5,0.75]) translate([0, zflex[0]/2 + (1-p)*(lever_l-zflex[0]), flex_z2*p]) cube([ow, 2, dz], center=true);
}

module leg_swept(){
    hull() for(d=[-1,1]) translate([0,lever_l,d*lever_l*flex_a]){
        rotate([-d*asin(flex_a), 0, 0]) for(e=[-1,1]){
            smatrix(xz=flex_a*e) translate([0,-lever_l,0]) leg();
        }
    }
}

module stage_flexures(h=zflex[2], z=flex_z2+dz){
    // flexures bridging between the tops of the legs
    w = leg_strut_l; // width of strut part
    for(a=[0,120,240]) hull(){
        r = stage_r+zflex[1];
        s = [zflex[0], d, h];
        rotate(a) mirror([1,0,0]) translate([-w/2, r, z]) cube(s);
        rotate(a-120) translate([-w/2, r, z]) cube(s);
    }
}

module each_lever(){
    // Repeat 3 times, each time starting at the base of a lever.
    for(a=[0,120,240]){
        rotate(a) translate([0,stage_r,0]) children();
        
    }
}
module each_mounting_hole(){
    // Repeat 3 times, in between the levers (i.e. 60 degrees out).
    for(a=[0,120,240]){
        rotate(a+60) translate([0,mounting_hole_r,0]) children();
        
    }
}
    

module stage_edges(h=5-2*dz, z=flex_z2+2*dz){
    // The edges of the moving stage
    w = leg_strut_l+zflex[0]*2*tan(60); // width
    each_lever(){
        translate([-w/2, -zflex[0], z]) cube([w, zflex[0], h]);
    }
}

module moving_stage(){
    // the moving stage is printed suspended between the legs.
    // we start by joining the legs together
    stage_flexures();
    
    // start to join the flexure bridges together
    intersection(){
        hull() stage_flexures(h=999);
        stage_edges();
    }
    // continue building up the bridges between the legs
    intersection(){
        stage_flexures(h=999);
        hull() stage_edges();
    }
}

module leg_and_lever_clearance(){
    // A convex space big enough for the leg and lever to move in
    minkowski(){
        union(){
            leg_swept();
            lever_swept();
        }
        translate([0,0,-d]) cylinder(h=2,r=zflex[1]);
    }
}
module motor_and_small_gear_clearance(h=actuator_h+actuator_travel){
    // Cylinders for the small gear and the motor
    gear_pos = [0, nut_y-20, h+2];
    motor_pos = gear_pos + [0, 7.8, 10];
    translate(gear_pos) cylinder(d=20, h=999);
    translate(motor_pos) cylinder(d=29, h=999);
}

// Cut out hole for reflection illuminator
module fl_cube_cutout(){
    // size of cutout for fl cube
    top_cutout_w = stage_r/2 + 2*wall_t;
    bottom_cutout_w = illuminator_width() + 2;

    // Create a trapezoid with min width (cube_width) at top
    hull() {
        translate([-(bottom_cutout_w)/2, -49, -0.5]) cube([bottom_cutout_w, 49, 1]);
        translate([-top_cutout_w/2, -49, 20]) cube([top_cutout_w, 49, 1]);
    }
}

module casing(){
    difference(){
        union(){
            // casing around the leg&lever
            each_lever() minkowski(){
                leg_and_lever_clearance();
                cylinder(r1=wall_t,r2=0.5, h=0.9);
            }
            // casing for the actuator
            each_lever() translate([0,nut_y,0]) screw_seat(h=actuator_h, travel=actuator_travel, motor_lugs=true, lug_angle=180);
            // join the casings up, by adding a big block in the middle.
            hull() each_lever() intersection(){
                translate([-999,0,0]) cube([999*2,15,999]);
                leg_and_lever_clearance();
            }
        }
        // hollow out space for the levers and legs and actuators
        each_lever() leg_and_lever_clearance(); //hole for the leg&lever
        each_lever() translate([0,nut_y,0]) nut_seat_void(h=actuator_h+actuator_travel);
        // clearance for gears and motors
        each_lever() motor_and_small_gear_clearance();

        // hollow out space in the centre
        difference(){
            union() {
                // Through-to-bottom cutout
                intersection() {
                    hull() each_lever(){
                        translate([0, stage_r, -99]) cylinder(h=999,r=wall_t);
                    }
                    hull() rotate(60) each_lever(){
                        translate([0, stage_r/2, -99]) cylinder(h=999,r=wall_t);
                    }
                }
                intersection() {
                    top_cutout_h=(flex_z2/2)+5;
                    hull() each_lever(){
                        translate([0, stage_r, top_cutout_h]) cylinder(h=999,r=wall_t);
                    }
                    hull() rotate(60) each_lever(){
                        translate([0, stage_r, top_cutout_h]) cylinder(h=999,r=wall_t);
                    }
                }

            }


            // make the objective mount by not hollowing it out
            translate([0, 0, -5]) {
                objective_mount();
            }
        }
        

        // bolt slot access slot
        translate([0, 0, -5]) hull(){
            translate([0, objective_mount_y+wall_t, z_flexures_z1+6]) rotate([-90,0,0]) cylinder(d=6.5,h=20);
            translate([0, objective_mount_y+wall_t, z_flexures_z2-0]) rotate([-90,0,0]) cylinder(d=6.5,h=20);
        }
        
        fl_cube_cutout();

        mirror([0,0,1]) cylinder(r=999, h=999, $fn=4); //ensure it doesn't go below the bottom
        translate([0,0,flex_z2-20]) cylinder(r=999, h=999, $fn=4); //ensure it doesn't go too high

        // mounting holes (screw through from bottom)
        each_mounting_hole() {
            trylinder_selftap(nominal_d=3, h=40, center=true);
            translate([15, 5, 0]) trylinder_selftap(nominal_d=3, h=40, center=true);
            translate([-15, 5, 0]) trylinder_selftap(nominal_d=3, h=40, center=true);
        }
    }
}

module main_body(){
    each_lever(){
        leg();
        lever_flexures();
        lever();
        translate([0,nut_y,0]) actuator_column(actuator_h);
    }
    moving_stage();
    casing();
}

exterior_brim(r=0) {
    main_body();
}

module thick_section(h, z=0, center=false){
    linear_extrude(h, center=center) #projection(cut=true){
        translate([0,0,-z]) children();
    }
} 

// Best to put echo statements here, so they only happen once...
echo("Radius of mounting holes is", mounting_hole_r);
