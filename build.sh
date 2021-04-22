#!/bin/bash

mkdir -p builds

# configurations for stages
## no brim
openscad -o builds/delta_stage.stl openscad/delta_stage.scad
openscad -o builds/delta_stage_microscope.stl -D 'transmission_illumination = true' -D 'reflection_illumination = true' openscad/delta_stage.scad
## smart brim
openscad -o builds/delta_stage_smart_brim.stl -D 'brim_radius = 5'  openscad/delta_stage.scad
openscad -o builds/delta_stage_microscope_smart_brim.stl -D 'brim_radius = 5' -D 'transmission_illumination = true' -D 'reflection_illumination = true' openscad/delta_stage.scad



# common parts
openscad -o builds/base_raspi_sangaboard.stl openscad/base_raspi_sangaboard.scad
openscad -o builds/base.stl openscad/base.scad
openscad -o builds/feet.stl openscad/feet.scad

#optional parts
openscad -o builds/35mm_petri_dish_holder.stl openscad/35mm_petri_dish_holder.scad

# accessories/adapters
openscad -o builds/bottom_of_stage.svg openscad/bottom_of_stage.scad