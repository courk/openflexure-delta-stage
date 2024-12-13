include <../openflexure-microscope/openscad/microscope_parameters.scad>;
use <../openflexure-microscope/openscad/dovetail.scad>;
use <../openflexure-microscope/openscad/optics.scad>;
use <../openflexure-microscope/openscad/utilities.scad>;
use <threads.scad>;

extra_space = 2.8;
slip_plate_thickness = 2;
plate_clearance_length = 24;
plate_transition_length = 12;
top_filter_cube = 19 / 2 - fl_cube_w / 2 + extra_space;
beam_z = top_filter_cube + fl_cube_w / 2;
roc = 0.6;
w = illuminator_width(); // nominal width of the mount (is the width between the outsides of the dovetail clip points)
dovetail_pinch = fl_cube_w - 4 * roc - 1 - 3;      // width between the pinch-points of the dovetail
fl_cube_mount_h = fl_cube_w + top_filter_cube + 2; // should probably be fl_cube_w
filter = [ 10, 14, 1.5 ];
beamsplit = [ 0, 0, w / 2 ]; // NB different to fl_cube because we're printing with z=z here.

front_t = 2;
back_y = fl_cube_w / 2 + roc + 1.5; // flat of dovetail (we actually start 1.5mm behind this)
first_plate_y = back_y + 3;
front_y = first_plate_y + front_t;

pcb_contact_size = [ 39.337, 6.985 * 2 ];

lens_pocket_depth = 8;

mounting_holes_spacing = pcb_contact_size.x / 2 + 3;

link_diameter_1 = 10;
link_diameter_2 = 4;

link_begin_y = first_plate_y + 2.5;
link_length = 32;

plate_y = link_begin_y + link_length + 5;

module fl_cube_mount(beam_d = 5.8)
{
    // This part clips on to the filter cube, to allow a light source (generally LED) to be coupled in using the
    // beamsplitter.
    $fn = 8;
    difference()
    {
        union()
        {
            translate([ 0, back_y, 0 ]) mirror([ 0, 1, 0 ])
                dovetail_m([ fl_cube_w - 1, 1, fl_cube_mount_h ], t = 2 * roc);
            sequential_hull()
            {
                translate([ -w / 2, back_y - 2 * d, -2 ]) cube([ w, d, fl_cube_mount_h + 2 ]);
                reflect([ 1, 0, 0 ]) translate([ w / 2 - roc, first_plate_y, -2 ])
                    cylinder(r = roc, h = fl_cube_mount_h + 2, $fn = 16);
                hull()
                {
                    translate([ 0, link_begin_y, beam_z ]) rotate([ 90, 0, 0 ])
                        cylinder(h = d, r = link_diameter_1 / 2, $fn = 32);
                    translate([ 0, link_begin_y, -1 ]) rotate([ 90, 0, 0 ])
                        cylinder(h = d, r = link_diameter_2 / 2, $fn = 32);
                }
                hull()
                {
                    translate([ 0, link_begin_y + link_length, beam_z ]) rotate([ 90, 0, 0 ])
                        cylinder(h = d, r = link_diameter_1 / 2, $fn = 32);
                    translate([ 0, link_begin_y + link_length, -1 ]) rotate([ 90, 0, 0 ])
                        cylinder(h = d, r = link_diameter_2 / 2, $fn = 32);
                }
                hull()
                {
                    translate([ 0, plate_y, beam_z ])
                        cube([ pcb_contact_size.x, d, pcb_contact_size.y ], center = true);
                    // add heated thread inserts support
                    reflect([ 1, 0, 0 ]) translate([ mounting_holes_spacing, plate_y - 4, beam_z ])
                    {
                        cylinder_with_45deg_top(h = 4, r = 7.5 / 2, $fn = 32, extra_height = 0);
                    }
                    // add pocket support
                    translate([ 0, plate_y - lens_pocket_depth - 1, beam_z ])
                    {
                        cylinder_with_45deg_top(h = lens_pocket_depth + 1, r = 8, $fn = 32, extra_height = 0);
                    }
                }
            }
        }

        // add a hole for the LED
        translate([ 0, 0, beam_z ])
        {
            cylinder_with_45deg_top(h = 999, r = beam_d / 2, $fn = 16, extra_height = 0, center = true); // LED
        }

        // add a pocket for the lens
        translate([ 0, plate_y - lens_pocket_depth, beam_z ])
        {
            cylinder_with_45deg_top(h = lens_pocket_depth + d, r = 12.5 / 2, $fn = 32, extra_height = 0);
        }

        // add heated thread inserts
        reflect([ 1, 0, 0 ]) translate([ mounting_holes_spacing, plate_y - 3, beam_z ])
        {
            cylinder_with_45deg_top(h = 3 + d, r = 3.1 / 2, $fn = 32, extra_height = 0);
        }
    }
}

// Function we can import to get width of illuminator holder
function illuminator_width() = 17;

module slip_plate(w)
{
    translate([ 0, 8, -slip_plate_thickness ])
    {
        difference()
        {
            union()
            {
                reflect([ 90, 0, 0 ])
                {
                    translate([ (fl_cube_w / 2 + 3), 0, 0 ])
                    {
                        hull()
                        {
                            // bottom of mounting point
                            translate([ 0, 2, 2 ])
                            {
                                cube([ 5, 4, 4 ], center = true);
                            }
                            // mounting point to optics module
                            translate([ 1, 0, (top_filter_cube) + slip_plate_thickness + 2 ])
                            {
                                rotate([ -90, 0, 0 ])
                                {
                                    cylinder(r = 4, h = 4); // mounting point to optics module
                                }
                            }
                            // top of mounting point
                            translate([ -2.5, 2, fl_cube_mount_h + slip_plate_thickness - 0.05 ])
                            {
                                cube([ 0.01, 4, 0.1 ], center = true);
                            }
                        }
                    }
                }
                translate([ -illuminator_width() / 2 - 4, 0, 0 ])
                    cube([ illuminator_width() + 8, 2, top_filter_cube + slip_plate_thickness + 2 ]);
            }
            translate([ -999 / 2, 0, 0 ])
            {
                hull()
                {
                    cube([ 999, 2, d ]);
                    translate([ 0, 0, 2 ]) cube([ 999, d, d ]);
                }
            }
            reflect([ 1, 0, 0 ])
            {
                // mounting hole to optics module
                translate([ (fl_cube_w / 2 + 3) + 1, 0, (top_filter_cube) + slip_plate_thickness + 2 ])
                {
                    cylinder_with_45deg_top(r = 2.2 / 2, h = 6, extra_height = 0);
                    translate([ 0, 2 + d, 0 ]) cylinder_with_45deg_top(r = 3.9 / 2, h = 2, extra_height = 0);
                }
            }
        }
    }
}

// Geometry of illuminator holder
module illuminator_holder()
{
    w = illuminator_width(); // Illuminator holder width
    difference()
    {
        union()
        {
            fl_cube_mount();
            slip_plate(w);
        }

        translate([ 0, first_plate_y, -slip_plate_thickness ]) reflect([ 1, 0, 0 ])
        {
            // mounting hole to optics module
            translate([ (fl_cube_w / 2 + 4), 0, (top_filter_cube) + slip_plate_thickness + 2 ])
            {
                cylinder_with_45deg_top(r = 4.5 / 2, h = 99, extra_height = 0);
            }
        }

        // Flatten bottom
        translate([ 0, 0, -250 - 2 ]) cube([ 500, 500, 500 ], center = true);
    }
}

module lens_thread_cutout(tolerance = 0.15, height, no_thread_height)
{
    outer_diam = 9;
    union()
    {
        ScrewThread(outer_diam = 1.01 * outer_diam + 1.25 * tolerance, height = height, pitch = 0.5, tooth_angle = 30,
                    tolerance = tolerance, tip_height = 0, tooth_height = 0, tip_min_fract = 0);
        translate([ 0, 0, height ]) cylinder(h = 1.9 + 3.6 + 0.2 * 2 + d - 1, r = 7.2 / 2, $fn = 128);
        translate([ 0, 0, height + 3.6 + 0.2 + d - 1]) cylinder(h = 1.9 + 0.2, r = 11 / 2, $fn = 128);
        translate([ 0, 0, 0]) cylinder(h = 4, r = 25 / 2, $fn = 128);
    }
}

module focus_plate()
{
    thread_thickness = 5 + 4;
    no_thread_thickness = 1.9 + 0.2 + 3.6 + 0.2 - 1;
    plate_thickness = thread_thickness + no_thread_thickness;
    screw_depth = plate_thickness - 3.4;

    threaded_insert_positions = [
        [ 9, 3.5 ],
        [ -9, 3.5 ],
        [ -9, -3.5 ],
        [ 9, -3.5 ],
    ];

    mounting_holes_positions = [
        [ mounting_holes_spacing, 0 ],
        [ -mounting_holes_spacing, 0 ],
    ];

    difference()
    {
        hull()
        {
            cube([ pcb_contact_size.x, pcb_contact_size.y, plate_thickness ], center = true);
            for (p = mounting_holes_positions)
            {
                translate([ p.x, p.y, 0 ]) cylinder(h = plate_thickness, r = 7.0 / 2, center = true);
            }
        }
        for (p = threaded_insert_positions)
        {
            translate([ p.x, p.y, plate_thickness / 2 - 3 ]) cylinder(h = 3 + d, r = 3.1 / 2);
        }
        for (p = mounting_holes_positions)
        {
            translate([ p.x, p.y, 0 ]) cylinder(h = plate_thickness * 2, r = 2.2 / 2, center = true);
            translate([ p.x, p.y, plate_thickness / 2 - screw_depth ]) cylinder(h = screw_depth + d, r = 4.5 / 2);
        }
        translate([ 0, 0, -plate_thickness / 2 - d ])
            lens_thread_cutout(height = thread_thickness + d, no_thread_height = no_thread_thickness + d);
    }
}

illuminator_holder();
translate([ 0, 80, 0 ]) rotate([180, 0, 0]) focus_plate();