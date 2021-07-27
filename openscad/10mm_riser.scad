// Design for a 10mm riser

use <./stage_adaptor_base.scad>;

difference(){
    stage_adaptor_base(height = 10, screws_center = true);
    cylinder(r=19, h=999,$fn=200); //hole for dish
}