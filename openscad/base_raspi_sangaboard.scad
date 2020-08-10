include <parameters.scad> //Delta-stage params
use <../openflexure-microscope/openscad/utilities.scad>;
use <../openflexure-microscope/openscad/compact_nut_seat.scad>;
use <../openflexure-microscope/openscad/microscope_stand.scad>;
use <delta_stage.scad>

module base_projection(){
    projection(cut=true){
        union(){
            difference(){
                union(){    // casing around the leg&lever
                    each_lever() minkowski(){
                        leg_and_lever_clearance();
                        cylinder(r1=wall_t, r2=0.5, h=0.9);
                    }
                translate([-(casing_radius+1),0,0])cube([(casing_radius+1),casing_apothem,10]); // This fills in space in the side that are then later cut to give access to side RPi connections.
                }
            translate([-(casing_radius+1),2.5,0])cube([(casing_radius+1),casing_apothem,10]); // This squares off the side wall for access to RPi connections
            translate(raspi_center+[0,-(raspi_board[1]+2),-raspi_standoff])cube(raspi_board+[10,0,0],center=true); //This squares off the back wall for access to RPi connections
            }
            // This puts in a quarter of the hexagon that is in the center of the microscope
            intersection(){
                cylinder(r=casing_radius, h=casing_height, $fn=6);   
                cube([100,100,100]);
            }
            // This fills in where the RPi goes with extra space at the front of the microscope as the Sangaboard is bigger that the RPi in that dimension
            translate(raspi_center-[0,-2,raspi_standoff]) cube(raspi_board + [1,8,0], center =true);
            
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

module base_hollow(wall_thickness=2, cutout_tolerance=1) {
    difference(){
        // Base extrusion, but with an outer wall wall_thickness thick
        minkowski(){
            base_extrusion();
            cylinder(r=wall_thickness+cutout_tolerance,h=1);
        }

        // Base extrusion, but with an outer wall cutout_tolerance thick
        translate([0, 0, wall_thickness]) minkowski(){
            base_extrusion();
            cylinder(r=cutout_tolerance,h=1);
        }
        
    }

}

module foot_stands(cutout_tolerance=1) {
    minkowski() {
        // Extrusion of the feet projection
        linear_extrude(height=base_height-foot_height) {
            feet_projection();
        }

        // Outer wall cutout_tolerance thick
        cylinder(r=cutout_tolerance,h=1);
    }
}

//The walls and floor of the base
module base() {
    union(){
        foot_stands(cutout_tolerance=base_cutout_tolerance);
        base_hollow(cutout_tolerance=base_cutout_tolerance);
    }
}

// All the windows to pass cables through
module window_cubes() {
    //RPi windows
    // Back window
    translate(raspi_center+[0,-50,-raspi_board[2]/2+USB_ethernet_window[2]/2-3]) cube(USB_ethernet_window,center=true);

    //Side window
    translate(raspi_center+[-power_HDMI_window[0]/2,raspi_board[1]/2-power_HDMI_window[1]/2-3.5,-raspi_board[2]/2+power_HDMI_window[2]/2-1]) cube(power_HDMI_window,center = true);

    //Sangaboard windows
    // Back window
    translate(sangaboard_center-[0,50,0]) rotate([0,0,90])cube(sangaboard_window, center=true);

    //Side window
    translate(sangaboard_center+[-sangaboard_window[0]/2,sangaboard[1]/2-sangaboard_window[1],0]) cube(sangaboard_window, center = true);

    //Reflection gap
    rotate([0,0,-60])translate([0,50,base_height-9])cube([bottom_cutout_w,100,20],center=true);

}

module pi_supports(){
    // position supports for each of the pi's mounting screws
    translate(raspi_center+[0,raspi_center[1],-raspi_center[2]]) repeat([49,0,0],2, center=true) repeat([0,58,0], 2,center=true) children();
}

// The four mounting holes underneath the Raspberry Pi.  
module raspi_supports(){
    difference(){
        pi_supports() cylinder(h=raspi_standoff, d=7);
        pi_supports() trylinder_selftap(2.5, h=999, center=true);
    }
}

// Used to show position of sangaboard
module sangaboard(){
    translate(sangaboard_center) cube(sangaboard, center =true);
}

//Used to show position of raspberry pi
module raspi(){
    translate(raspi_center)cube(raspi_board, center = true);
}

module base_windowed() {
    union(){
        difference() {
            base();
            window_cubes();
            translate([-(casing_radius+2),0,base_height-3])cube([casing_radius+2,sangaboard_center[1]+sangaboard[1]/2-sangaboard_window[1]/2,10]); // cutout at top for the base to pass under the mircoscope (side)
            translate(raspi_center+[0,-(raspi_board[1]+2),base_height-3-raspi_standoff])cube(raspi_board+[10,0,0],center=true); //cutout at top for the base to pass under the mircoscope (back)
        }
        raspi_supports();
    }
}


// To build the raspberry pi and sangaboard base
base_windowed();


//#raspi();  // uncomment to see where the raspberry pi fits
//#sangaboard(); //uncomment to see where the sangaboard fits
