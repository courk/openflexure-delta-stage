#!/bin/bash

mkdir -p builds

# configurations for stages
openscad -o builds/delta_stage.stl openscad/delta_stage.scad
openscad -o builds/reflection_delta_stage.stl -D 'reflection_illumination = true'  openscad/delta_stage.scad
openscad -o builds/transmission_delta_stage.stl -D 'condenser_mount = true'  openscad/delta_stage.scad
openscad -o builds/reflection_transmission_delta_stage.stl -D 'condenser_mount = true' -D 'reflection_illumination = true' openscad/delta_stage.scad

# common parts
openscad -o builds/base_raspi_sangaboard.stl openscad/base_raspi_sangaboard.scad
openscad -o builds/base.stl openscad/base.scad
openscad -o builds/feet.stl openscad/feet.scad

# parts from the OFM repository
openscad -o builds/actuator_assembly_tools.stl openflexure-microscope/openscad/actuator_assembly_tools.scad
openscad -o builds/sample_clips.stl openflexure-microscope/openscad/sample_clips.scad
openscad -o builds/small_gears.stl openflexure-microscope/openscad/small_gears.scad
openscad -o builds/gears.stl openflexure-microscope/openscad/gears.scad
openscad -o builds/illumination_dovetail.stl openflexure-microscope/openscad/illumination_dovetail.scad