include <../openflexure-microscope/openscad/microscope_parameters.scad> //Generic microscope params
include <parameters.scad> //Delta-stage params
use <../openflexure-microscope/openscad/utilities.scad>;
use <../openflexure-microscope/openscad/compact_nut_seat.scad>;
use <delta_stage.scad>

module base_projection(){
    projection(cut=true) union(){
        // casing around the leg&lever
        each_lever() minkowski(){
            leg_and_lever_clearance();
            cylinder(r1=wall_t, r2=0.5, h=0.9);
        }

        // join the casings up, by adding a big block in the middle.
        hull() each_lever() intersection(){
            translate([-999,0,0]) cube([999*2,15,999]);
            leg_and_lever_clearance();
        }
    }
}

module feet_projection() {
    projection(cut=true){
        // casing for the actuator
        each_lever() translate([0, nut_y, -49]) screw_seat_shell(h=actuator_h + 99);
    }  
}

module base_extrusion() {
    linear_extrude(height=base_height) {
        union() {
            feet_projection();
            base_projection();
        }
    }
}

module base_hollow(wall_thickness=2, cutout_tollerance=1) {
    difference(){
        // Base extrusion, but with an outer wall wall_thickness thick
        minkowski(){
            base_extrusion();
            cylinder(r=wall_thickness+cutout_tollerance,h=1);
        }

        // Base extrusion, but with an outer wall cutout_tollerance thick
        translate([0, 0, wall_thickness]) minkowski(){
            base_extrusion();
            //cylinder(r=cutout_tollerance,h=1);
        }
        
    }

}

module foot_stands(cutout_tollerance=1) {
    minkowski() {
        // Extrusion of the feet projection
        linear_extrude(height=base_height-foot_height) {
            feet_projection();
        }

        // Outer wall cutout_tollerance thick
        cylinder(r=cutout_tollerance,h=1);
    }
}

module base() {
    union(){
        foot_stands(cutout_tollerance=base_cutout_tollerance);
        base_hollow(cutout_tollerance=base_cutout_tollerance);
    }
}

module window_cubes(window_width=25) {
    frame_height=5;
    rotate([0, 0, 60]) each_lever() translate([-window_width/2, 0, frame_height]) cube([window_width, base_height, base_height-(2*frame_height)]);

    each_lever() translate([-50, (window_width/2)+frame_height, frame_height]) cube([99, window_width, base_height-(2*frame_height)]);
}

module base_windowed() {
    difference() {
        base();
        window_cubes();
    }
}

base_windowed();
