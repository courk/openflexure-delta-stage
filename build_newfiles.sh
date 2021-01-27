# TODO:
# New parts from OFM repository
# This is temporary.  Once these parts have been released on a tag on the OFM repository,
# the delta stage has been updated to work with the new OFM repository,
# the submodule should be updated to that tag and the parts can be built without checking out to this commit in the gitlab-ci.

openscad -o builds/actuator_assembly_tools.stl openflexure-microscope/openscad/actuator_assembly_tools.scad
openscad -o builds/lens_tool.stl openflexure-microscope/openscad/lens_tool.scad
openscad -o builds/sample_clips.stl openflexure-microscope/openscad/sample_clips.scad
openscad -o builds/small_gears.stl openflexure-microscope/openscad/small_gears.scad
openscad -o builds/large_gears.stl openflexure-microscope/openscad/large_gears.scad
openscad -o builds/illumination_dovetail.stl openflexure-microscope/openscad/illumination_dovetail.scad
openscad -o builds/picamera_2_cover.stl openflexure-microscope/openscad/picamera_2_cover.scad
openscad -o builds/fl_cube.stl openflexure-microscope/openscad/fl_cube.scad
openscad -o builds/condenser.stl openflexure-microscope/openscad/condenser.scad
openscad -o builds/optics_picamera2_rms_f50d13_delta.stl -D 'optics = "rms_f50d13"' -D 'camera = "picamera_2"' -D 'delta_stage = true' -D 'beamsplitter = false' openflexure-microscope/openscad/optics.scad
openscad -o builds/optics_picamera2_rms_f50d13_beamsplitter_delta.stl -D 'optics = "rms_f50d13"' -D 'camera = "picamera_2"' -D 'delta_stage = true' -D 'beamsplitter = true' openflexure-microscope/openscad/optics.scad
openscad -o builds/LED_array_holder.stl openflexure-microscope/openscad/LED_array_holder.scad
openscad -o builds/reflection_illuminator_LED_star.stl openflexure-microscope/openscad/reflection_illuminator_LED_star.scad
