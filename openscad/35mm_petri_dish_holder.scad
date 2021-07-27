// Design for a 35mm diameter petri dish holder

use <./stage_adaptor_base.scad>;

difference(){
    stage_adaptor_base(height = 1+7.5), screws_center=false);
    cylinder(r=24/2, h=999);  //bottom hole
    translate([0,0,1])cylinder(r=35.5/2, h=999,$fn=200); //hole for dish
}