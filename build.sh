#!/bin/bash

mkdir -p builds
openscad -o builds/base.stl openscad/base.scad
openscad -o builds/delta_stage.stl openscad/delta_stage.scad
openscad -o builds/feet.stl openscad/feet.scad

