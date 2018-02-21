/*
  Useful settings/parameters for the OpenFlexure fibre stage
*/
version_numstring = "0.0.0";

// Set the overall geometry
leg_strut_l = 40; // inner width of the legs
stage_r = 25; // distance from the centre to the edge of the stage
flex_z1 = 0; // height of lower flexures
flex_z2 = 100; // height of upper flexures

// Thickness of legs
leg_t = 5;

// Set the length of the actuating levers
xy_gain = 2; // ratio of stage motion to Z motion
lever_l = (flex_z2 - flex_z1)/xy_gain;
nut_y = lever_l + 12;

// Motor lugs
motor_lugs = true;

// Flexure dimensions - good for PLA and ~0.5mm nozzle
zflex = [6, 1.5, 0.75]; //dimensions of flexure
// X flexures are not currently used...
//xflex = [5,5.5,5]; //default bounding box of x flexure
//xflex_t = 1; //thickness of bendy bit in x
flex_a = 0.1; //angle through which flexures are bent, radians
dz = 0.5; //thickness before a bridge is printable-on

actuator_h = 30; //height of actuator columns (~screw length)
actuator_travel = (nut_y - zflex[1]/2)*flex_a;

wall_t = 1.6;
d=0.05;

// Mounting stuff
mounting_bolts = [[-1,0,0],[0,-1,0],[1,0,0]]*25*1*1.41; //bolt to the bench
