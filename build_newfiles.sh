# TODO:
# New parts from OFM repository
# This is temporary.  Once these parts have been released on a tag on the OFM repository,
# the delta stage has been updated to work with the new OFM repository,
# the submodule should be updated to that tag and the parts can be built without checking out to this commit in the gitlab-ci.


#openscad -o builds/optics_picamera2_rms_f50d13_delta.stl -D 'optics = "rms_f50d13"' -D 'camera = "picamera_2"' -D 'delta_stage = true' -D 'beamsplitter = false' openflexure-microscope/openscad/optics.scad
#openscad -o builds/optics_picamera2_rms_f50d13_beamsplitter_delta.stl -D 'optics = "rms_f50d13"' -D 'camera = "picamera_2"' -D 'delta_stage = true' -D 'beamsplitter = true' openflexure-microscope/openscad/optics.scad
#openscad -o builds/LED_array_holder.stl openflexure-microscope/openscad/LED_array_holder.scad
#openscad -o builds/reflection_illuminator_LED_star.stl openflexure-microscope/openscad/reflection_illuminator_LED_star.scad
