#!/bin/bash

mkdir -p builds

# configurations for stages
openscad -o builds/delta_stage.stl openscad/delta_stage.scad
openscad -o builds/delta_stage_microscope.stl -D 'condenser_mount = true' -D 'reflection_illumination = true' openscad/delta_stage.scad

# common parts
openscad -o builds/base_raspi_sangaboard.stl openscad/base_raspi_sangaboard.scad
openscad -o builds/base.stl openscad/base.scad
openscad -o builds/feet.stl openscad/feet.scad

#optional parts
openscad -o builds/35mm_petri_dish_holder.stl openscad/35mm_petri_dish_holder.scad

# TODO:
# New parts from OFM repository
# This is temporary.  Once these parts have been released on a tag on the OFM repository,
# the delta stage has been updated to work with the new OFM repository,
# the submodule should be updated to that tag and the parts can be built without checking out to this commit.

cd openflexure-microscope/
git checkout 4dfc357ee2cffe9bf95603c26d42fa8b9b22fec6
cd ../

openscad -o builds/actuator_assembly_tools.stl openflexure-microscope/openscad/actuator_assembly_tools.scad
openscad -o builds/sample_clips.stl openflexure-microscope/openscad/sample_clips.scad
openscad -o builds/small_gears.stl openflexure-microscope/openscad/small_gears.scad
openscad -o builds/large_gears.stl openflexure-microscope/openscad/large_gears.scad
openscad -o builds/illumination_dovetail.stl openflexure-microscope/openscad/illumination_dovetail.scad
openscad -o builds/picamera_2_cover.stl openflexure-microscope/openscad/cameras/picamera_2_cover.scad
openscad -o builds/fl_cube.stl openflexure-microscope/openscad/fl_cube.scad
openscad -o builds/condenser.stl openflexure-microscope/openscad/condenser.scad
openscad -o builds/optics_picamera2_rms_f50d13_delta.stl -D 'optics = "rms_f50d13"' -D 'camera = picamera_2' -D 'delta_stage = true' openflexure-microscope/openscad/optics.scad
openscad -o builds/optics_picamera2_rms_f50d13_beamsplitter_delta.stl -D 'optics = "rms_f50d13"' -D 'camera = picamera_2' -D 'delta_stage = true' -D 'beamsplitter = true' openflexure-microscope/openscad/optics.scad
openscad -o builds/LED_array_holder.stl openflexure-microscope/openscad/LED_array_holder.scad
openscad -o builds/reflection_illuminator_LED_star.stl openflexure-microscope/openscad/reflection_illuminator_LED_star.scad

cd openflexure-microscope/
git checkout d4b73bbb5de523235a97d4277fd1d197f9b1997f
cd ../