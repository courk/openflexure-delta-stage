#!/bin/bash

mkdir -p builds

# configurations for stages
## no brim
openscad -o builds/delta_stage.stl openscad/delta_stage.scad
openscad -o builds/delta_stage_microscope.stl -D 'transmission_illumination = true' -D 'reflection_illumination = true' -D 'stage_connectors = true' openscad/delta_stage.scad
## smart brim
openscad -o builds/delta_stage_smart_brim.stl -D 'brim_radius = 5'  openscad/delta_stage.scad
openscad -o builds/delta_stage_microscope_smart_brim.stl -D 'brim_radius = 5' -D 'transmission_illumination = true' -D 'reflection_illumination = true' -D 'stage_connectors = true' openscad/delta_stage.scad

# optics
openscad -o builds/optics_picamera2_rms_f50d13_delta.stl -D 'optics = "rms_f50d13"' -D 'camera = "picamera_2"' -D 'delta_stage = true' -D 'beamsplitter = false' openflexure-microscope/openscad/optics.scad
openscad -o builds/optics_picamera2_rms_f50d13_beamsplitter_delta.stl -D 'optics = "rms_f50d13"' -D 'camera = "picamera_2"' -D 'delta_stage = true' -D 'beamsplitter = true' openflexure-microscope/openscad/optics.scad

# common parts
openscad -o builds/base_raspi_sangaboard.stl openscad/base_raspi_sangaboard.scad
openscad -o builds/base.stl openscad/base.scad
openscad -o builds/feet.stl openscad/feet.scad
openscad -o builds/actuator_assembly_tools.stl openflexure-microscope/openscad/actuator_assembly_tools.scad
openscad -o builds/lens_tool.stl openflexure-microscope/openscad/lens_tool.scad
openscad -o builds/sample_clips.stl openflexure-microscope/openscad/sample_clips.scad
openscad -o builds/small_gears.stl openflexure-microscope/openscad/small_gears.scad
openscad -o builds/large_gears.stl openflexure-microscope/openscad/gears.scad
openscad -o builds/illumination_dovetail.stl openflexure-microscope/openscad/illumination_dovetail.scad
openscad -o builds/picamera_2_cover.stl openflexure-microscope/openscad/cameras/picamera_2_cover.scad
openscad -o builds/fl_cube.stl openflexure-microscope/openscad/fl_cube.scad
openscad -o builds/condenser.stl openflexure-microscope/openscad/condenser.scad
openscad -o builds/reflection_illuminator_LED_star.stl openflexure-microscope/openscad/reflection_illuminator_LED_star.scad

#optional parts
openscad -o builds/35mm_petri_dish_holder.stl openscad/35mm_petri_dish_holder.scad
openscad -o builds/LED_array_holder.stl openflexure-microscope/openscad/LED_array_holder.scad


# svg generators
openscad -o builds/bottom_of_stage.svg openscad/bottom_of_stage.scad

