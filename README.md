# OpenFlexure Delta Stage
A 3D Printable high-precision 3-axis delta-bot translation stage.

This project is a 3D printable design that enables very fine (sub-micron) mechanical positioning of a small moving stage, with surprisingly good mechanical stability.  It follows on from the [OpenFlexure Microscope](https://openflexure.org/projects/microscope/).

## License
This project is open-source and is released under the CERN open hardware license.  There is not yet any accompanying software, but if that changes please consider it GPL.  Any documentation contained in this project is licensed CC-BY International 4.0.  We are working on selling kits through OpenFlexure Industries, though we're not yet taking orders - however this will stay a fully open-source project.

## Printing and building it yourself

The best place to start with building a delta stage is with the [assembly instructions](https://build.openflexure.org/openflexure-delta-stage/latest). There you will the STLs you will need to download and print, and the non-printed parts you will need. Links to the STLs can also be found on our [build server](https://build.openflexure.org/openflexure-delta-stage/). The instructions also give you a step-by-step guide to building the delta stage. As well as a translation stage, you can also turn it into a fully-fledged microscope, based on the [OpenFlexure Microscope](https://openflexure.org/projects/microscope/). The key difference between using this stage for microscopy and the OpenFlexure Microscope is that the delta stage optics do not move.

There are several different designs, depending on what you want to use it for. The options are explained in the [assembly instructions](https://openflexure.gitlab.io/openflexure-delta-stage/), including for transmission and reflection illumination microscopy using the [OpenFlexure software](https://openflexure.org/downloads/).

## Customising it

You can customise the delta stage to suit your application.  All of the designs are made using [OpenSCAD](https://www.openscad.org/).  

To clone the repository, please note that we use "submodules" to include parameters and objects from the [OpenFlexure Microscope](https://openflexure.org/projects/microscope/). The easiest way to correctly clone the project is to run:
```
git clone --recurse-submodules https://gitlab.com/openflexure/openflexure-delta-stage.git
```
Therefore, you may need to run ``git submodule init`` to set the repository up for the first time, if your git client doesn't take care of that automatically. The easiest way to check this is to open the `openflexure-microscope` folder after cloning. If it's empty, in the main `openflexure-delta-stage` folder, run ``git submodule init`` to initialise your local configuration file, and ``git submodule update`` to fetch the required data. Alternatively, you can pass ``--recurse-submodules`` to the ``git clone`` command when you first clone the project.

To customise the design of the stage, you need to clone the repository and compile ``openscad/delta_stage.scad``. There are currently issues where OpenSCAD runs out of memory when previewing or compiling in the graphical interface. The complexity of the model will be reduced to fix this, but in the meantime it is still possible to compile it using the [command line](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Using_OpenSCAD_in_a_command_line_environment#Command_line_usage):
```
openscad -o delta_stage.stl delta_stage.scad
```
For the reflection and transmission illumination versions of the stage, you will need to change the values in ``openscad/parameters.scad``.  This is also where majority of the delta stage parameters reside, so you can easily change aspects of the design (height etc.).

The additional components are also located in the ``\openscad`` folder and can be compiled using the GUI or command line.  Some common components for the OpenFlexure Microscope and used from the `openflexure-microscope` folder.

To build every component you can run ``build.sh`` if you have a Bash shell (in either linux or Windows Subsystem Linux).  You may need to add ``openscad`` to your path if you want this to work in MinGW on Windows, or in the Mac OS Terminal.

The [assembly instructions](https://build.openflexure.org/openflexure-delta-stage/latest) cover the standard uses for the delta stage.  If you are trying something more complex with it then you may also need to refer to the [microscope instructions](https://openflexure.org/projects/microscope/build/).  

## Get Involved

It's already useful if you get involved by raising issues if there are things that aren't clear, and anyone who might want to help write better instructions would be very welcome. They are currently written using [gitbuilding](https://gitbuilding.io/) and stored in the `\docs` folder.  

Telling us about improvements to the code, or even just sharing parameters you used (if you customised it) and how well it worked would be great.  If you've built one, please post a photo and any comments - you could use the wiki, or raise an issue and we'll tag it as a "build report".
