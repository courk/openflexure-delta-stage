/*

OpenFlexure Delta Stage

This project aims to be a high-performance flexure stage, with
long-ish travel in 3D.

*/
use <utilities.scad>;
use <compact_nut_seat.scad>;
include <parameters.scad>;

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
        translate([-cbr/2, lever_l+zflex[1], 0]) 
            cube([cbr, nut_y+zflex[1]/2+d - lever_l-zflex[1], 6]);
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
        hull(){
            leg_swept();
            lever_swept();
        }
        translate([0,0,-d]) cylinder(h=2,r=zflex[1]);
    }
}

intersection(){
    difference(){
        union(){
            // casing around the leg&lever
            each_lever() minkowski(){
                leg_and_lever_clearance();
                cylinder(r1=wall_t,r2=0.5, h=0.9);
            }
            // casing for the actuator
            each_lever() translate([0,nut_y,0]) screw_seat_shell(h=actuator_h+actuator_travel);
            // join the casings up, by adding a big block in the middle.
            hull() each_lever() intersection(){
                translate([-999,0,0]) cube([999*2,15,999]);
                leg_and_lever_clearance();
            }
        }
        // hollow out space for the levers and legs and actuators
        each_lever() leg_and_lever_clearance(); //hole for the leg&lever
        each_lever() translate([0,nut_y,0]) nut_seat_void(h=actuator_h+actuator_travel);
        // hollow out space in the centre
        hull() each_lever() reflect([1,0,0]){
            translate([leg_strut_l/2, -10,-99]) cylinder(h=999,r=5);
        }
    }
    cylinder(r=999, h=flex_z2-20, $fn=4); //ensure it doesn't go below the bottom
}


each_lever(){
    leg();
    lever_flexures();
    lever();
    translate([0,nut_y,0]) actuator_column(actuator_h);
}
moving_stage();


module mechanism_void(){
    //cut-out in the centre of the casing for the mechanism
    difference(){
        sequential_hull(){
            union(){
                cube(stage + [2,2,0]*(xy_bottom_travel + zflex[1] + zflex[0] + 0.5), center=true);
                translate([0,z_stage_base_y-zflex[1]-z_lever+d,0]) 
                        cube([stage[0],2*d,stage[2]*2], center=true);
            }
            translate([0,0,shelf_z1]) union(){
                cube(stage + [2,2,0]*(zflex[1] + zflex[0] + 1.0), center=true); 
                translate([0,-stage[1]/2-zflex[1]-z_lever+d,0]) 
                        cube([stage[0],2*d,d], center=true);
            }
            translate([0,0,shelf_z2]) 
                    cube(stage + [2,2,0]*(zflex[1] + zflex[0] + 1.0 + xy_travel)
                         + [0,0,stage[2]+z_travel*2+6], center=true); 
        }
        
        // take a chunk out to allow for Z actuator reinforcement
       translate([0,z_actuator_pivot_y, 0]) mirror([0,1,0]) hull(){
            w = 2*(z_actuator_pivot_y - pushstick[0]/sqrt(2) - xy_bottom_travel*sqrt(2)) - 1;
            //w = z_actuator_pivot_w;
            translate([-w/2,0,-d]) cube([w, wall_t, shelf_z2]);
            translate([-w/2 + 8,0,-d]) cube([w-8*2, wall_t+6, shelf_z2]);
        }
    }
}

module casing_outline(cubic=true){
    // Once the mechanism void is subtracted, this makes a minimal wall around the structure.
    // NB you need to chop off the top and bottom too.
    if(cubic){
        s = xy_bottom_travel + zflex[1] + zflex[0] + 0.5 + wall_t;
        translate([-stage[0]/2-s, z_anchor_bottom_y-wall_t, 0])
                cube(stage + [2*s,s + (-z_anchor_bottom_y-stage[1]/2) + wall_t,shelf_z2]);
    }else{
        minkowski(){
            hull() mechanism_void();
            cylinder(r=wall_t, h=d, center=true, $fn=8);
        }
    }
}
module casing_outline_top(){
    // 2D object for the top of the casing
    projection(cut=true) translate([0,0,-casing_top + d]) difference(){
        casing_outline();
        mechanism_void();
    }
}

module casing(mechanism_void=true){
    // This is the cuboidal casing and actuator housings.  It's the
    // main structural component.
    difference(){
        union(){
            //minimal wall around the mechanism (will be hollowed out later)
            casing_outline();
            
            //NB the arguments here are repeated below
            //covers and screw seats for the XY actuators
            each_pushstick() translate([0,pushstick[1]-zflex[1],0]) actuator_shroud_shell(shelf_z1, pw, xy_actuator_pivot_w, xy_lever*xy_reduction, tilted=true, extend_back=pushstick[1]-10);
            //cover and screw seat for the Z actuator
            translate([0,z_actuator_pivot_y,0]) actuator_shroud_shell(z_pushstick_z+pushstick[2]+1, z_actuator_pivot_w, pw, z_lever*z_reduction, tilted=false, extend_back=wall_t);
            
            //Mounting bolts
            for(bolt_pos=mounting_bolts){
                hull(){
                    translate(bolt_pos) cylinder(r=10,h=8);
                    cylinder(r=20, h=18);
                }
            }
        }
        // limit the wall in Z
        translate([0,0,shelf_z2 + stage[2] - z_travel]) cylinder(r=999,h=999,$fn=8);
        translate([0,0,-99]) cylinder(r=999,h=99,$fn=8);
        // mounting bolt holes        
        for(bolt_pos=mounting_bolts) translate(bolt_pos+[0,0,3]){
            sequential_hull(){
                translate([0,0,0]) cylinder(r=6,h=d);
                translate([0,0,8]) cylinder(r=6,h=d);
                translate([0,0,250]+bolt_pos) cylinder(r=6,h=d);
            }
            cylinder(r=6/2*1.1,h=999,center=true);
        }
        
        // make it a wall not a block - clearance for the mechanism
        if(mechanism_void){
            mechanism_void();
        
            //inside of covers and screw seats for the XY actuators
            each_pushstick() translate([0,pushstick[1]-zflex[1],0]) actuator_shroud_core(shelf_z1, pw, xy_actuator_pivot_w, xy_lever*xy_reduction, tilted=true, extend_back=pushstick[1]-10, anchor=true);
            //cover and screw seat for the Z actuator
            translate([0,z_actuator_pivot_y,0]) actuator_shroud_core(z_pushstick_z+pushstick[2]+1, z_actuator_pivot_w, pw, z_lever*z_reduction, tilted=false, extend_back=flex_a*(z_pushstick_z+pushstick[2]+1)+0.5, anchor=true);
            //clearance for the Z pushstick
            translate([-pw/2-1.5,0,z_pushstick_z-3]) cube([pw+3,z_actuator_pivot_y+d, pushstick[2]+3+3]);
        }
        
        inter_shelf_spaghetti_slots(); //access ports to clean up poor bridging inside
    }
}

// Overall structure
module main_body(){
    difference(){
        union(){
            xy_table();
        }
        
    }
    // Casing (also provides a lot of the structural integrity)
//    casing();
        
    
}//*/


module thick_section(h, z=0, center=false){
    linear_extrude(h, center=center) #projection(cut=true){
        translate([0,0,-z]) children();
    }
} 

difference(){
    //main_body();
    //rotate([0,90,0]) cylinder(r=999,h=999,$fn=8);
}

//base();