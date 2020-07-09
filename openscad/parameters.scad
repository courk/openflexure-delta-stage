/*
  Useful settings/parameters for the OpenFlexure fibre stage
*/
version_numstring = "0.0.0";

// Set the overall geometry
leg_strut_l = 32; // inner width of the legs
stage_r = 25; // distance from the centre to the edge of the stage
flex_z1 = 0; // height of lower flexures
flex_z2 = 70; // height of upper flexures

// Thickness of legs
leg_t = 5;

// Set the length of the actuating levers
xy_gain = 2; // ratio of stage motion to Z motion
lever_l = (flex_z2 - flex_z1)/xy_gain;
nut_y = lever_l + 12;

// Motor lugs
motor_lugs = true;

// Condenser mount
condenser_mount = false;

// Reflection illumination - The hole cut out the side for the reflection illuminator
reflection_illumination = false; 

// Flexure dimensions - good for PLA and ~0.5mm nozzle
zflex = [6, 1.5, 0.75]; //dimensions of flexure
flex_a = 0.1; //angle through which flexures are bent, radians
dz = 0.5; //thickness before a bridge is printable-on

actuator_h = 30; //height of actuator columns (~screw length)
actuator_travel = (nut_y - zflex[1]/2)*flex_a;

wall_t = 1.6;
d=0.05;

// Mounting stuff
// Mounting holes should be 60 degrees out from the legs (i.e. in between)
// If you extend the line of the solid anchor part in the middle (where each leg
// joins the casing) out sideways, to the middle of the vertical part of the
// leg, then take the midpoint of the line joining each pair, that's the hole)
mounting_hole_r = sin(30)*stage_r + sin(60)*(leg_strut_l/2+zflex[1]+leg_t/2);

// Objective mount
objective_mount_y = 18; // y position of clip for optics
objective_mount_back_y = stage_r + wall_t; //back of objective mount
objective_mount_nose_w = 6; // width of the pointy end of the mount

sample_z = 65; // height of the top of the stage
z_flexures_z1 = 8; // height of the lower Z flexure
z_flexures_z2 = min(sample_z - 12, 35); // " upper "

// Feet
feet_endstops = false;
foot_height=feet_endstops?15:15; //the endstops need a bit of extra height (or not)
endstop_extra_ringheight=feet_endstops?1:0;

//Casing 
casing_height = flex_z2-24; //the maximum height of the lever casing and 'joining together' casing
casing_radius = nut_y; //the outside radius of the hexagon used to join the casing together

// Base
base_height = 30;
base_cutout_tollerance = 1;
