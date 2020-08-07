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
1. [.](connecting_the_electronics.md){step}

### Software

1. You can control your microscope using the [OpenFlexure software](https://openflexure.org/projects/microscope/install).
2. You will need to adjust the configuration file, so that the software knows which stage you are using. More information coming soon..

### Bases 
There are three optional bases to choose from:

1. [.](simple_base.md){step}:  Short; matches the footprint of the OpenFlexure Delta stage.  Best suited if you have small motor controllers, or just want more stability.
2. [.](raspi_base.md){step}: Taller; Custom designed base to fit the Raspberry Pi and leaves room for a optics module. Best suited if you want to just use a Raspberry Pi for the camera and are controlling the stage by hand or with small motor controllers.
3. [.](raspi_sangaboard_base.md.){step}: Tallest; Custom designed base to fit the Raspberry Pi and Sangaboard.  Best suited if you want the fully automated OpenFlexure Delta Stage Microscope.


