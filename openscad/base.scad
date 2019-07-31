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

        // casing for the actuator
        each_lever() translate([0, nut_y, -49]) screw_seat_shell(h=actuator_h + 99);

        // join the casings up, by adding a big block in the middle.
        hull() each_lever() intersection(){
            translate([-999,0,0]) cube([999*2,15,999]);
            leg_and_lever_clearance();
        }
    }
}

module base_extrusion() {
    linear_extrude(height=50) {
        base_projection();
    }
}

module base() {
    t=2;
    difference(){
        minkowski(){
            base_extrusion();
            cylinder(r=t,h=1);
        }
        translate([0, 0, t]) base_extrusion();
    }
}

base();
