//base design for stage adaptors for the delta stage.  Use this module and create holes/shapes for the sample holder you wish to use with the delta stage.

use <./delta_stage.scad>;


module stage_adaptor_base(height = 10){
difference(){
    union(){
        // Fill in the stage
        hull(){
            intersection(){
                hull() stage_flexures(h=999,z=0);
                stage_edges(z=0, h = height);
            }
            intersection(){
                stage_flexures(h=999,z=0);
                hull() stage_edges(z=0, h = height);
            }
        }
    }
    stage_mounting_holes(z_translate = 0); // mounting holes
    each_stage_mounting_hole_without_center(z_translate = 5){cylinder(r=5.7, h=999);} //space for head of screw, middle holes are left incase you want to use sample clips
    }
}