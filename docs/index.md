# OpenFlexure Delta Stage

The delta stage is a 3D printed x-y-z translation stage. As the optics do not move it is particularly suited to more complex imaging (phase, reflection, fluorescence microscopy).

{{BOM}}

## Main steps

1. [.](printing_the_components.md){step}  
1. [.](assembling_the_actuators.md){step}

### Optional Components

1. [.](attaching_the_sample_clips.md){step}
1. [.](attaching_the_motors.md){step}  
1. [.](reflection_illumination.md){step}  
1. [.](transmission_illumination.md){step}
1. [.](LED_grid_illumination.md){step}
1. [.](raspi_sangaboard_base.md){step}


### Software

You can control your microscope using the [OpenFlexure software](https://openflexure.org/projects/microscope/install). The geometry of the Delta Stage is different to the standard OpenFlexure Microscope.  So that the movement of the stage is correct, you will need to change the stage configuration:

1. In OpenFlexure Connect, when connected to your Delta Stage microscope, click `Settings`.
2. Under `MICROSCOPE SETTINGS`, click `Stage`.
3. Change the `Stage geometry` dropdown to `SangaStage (Delta)`.
4. Click `CHANGE STAGE GEOMETRY`.

### Simple Base 


   [.](simple_base.md){step}:  Short; matches the footprint of the OpenFlexure Delta stage.

