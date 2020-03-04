# OpenFlexure Delta Stage
A 3D Printable high-precision 3 axis delta-bot translation stage.

This project is a 3D printable design that enables very fine (sub-micron) mechanical positioning of a small moving stage, with surprisingly good mechanical stability.  It follows on from the [OpenFlexure Microscope](https://github.com/rwb27/openflexure_microscope) which is discussed in a [paper in Review of Scientific Instruments](http://dx.doi.org/10.1063/1.4941068) (open access).

## License
This project is open-source and is released under the CERN open hardware license.  There is not yet any accompanying software, but if that changes please consider it GPL.  Any documentation contained in this project is licensed CC-BY International 4.0.  We are working on selling kits through OpenFlexure Industries, though we're not yet taking orders - however this will stay a fully open-source project.

## Printing/building it yourself
To build the stage, you'll currently need to clone the repository and compile ``delta_stage.scad`` and print the model that it builds.  In the future, we intend to include all the bits you need - but at the moment it's just three of the tilted feet from the openflexure microscope.  You may fit an OpenFlexure microscope optics module (high-res version) to turn the deltabot stage into a microscope, if you want.

To clone the repository, please note that we use "submodules" to include parameters and objects from the [OpenFlexure Microscope](https://github.com/rwb27/openflexure_microscope). Therefore, you may need to run ``git submodule init`` to set the repository up for the first time, if your git client doesn't take care of that automatically. The easiest way to check this is to open the "openflexure-microscope" folder after cloning. It it's empty, in the main "openflexure-delta-stage" folder, run ``git submodule init`` to initialise your local configuration file, and ``git submodule update`` to fetch the required data. Alternatively, you can pass ``--recurse-submodules`` to the ``git clone`` command when you first clone the project.

Instructions for the delta stage are currently work-in-progress.  However, the assembly of the actuators is exactly the same as for the OpenFlexure Microscope, which has [online instructions](https://openflexure.org/projects/microscope/).

## Get Involved
It's already useful if you get involved by raising issues if there are things that aren't clear, and anyone who might want to help write better instructions would be very welcome.  Improvements to the code, or even just sharing parameters you used (if you customised it) and how well it worked would be great.  If you've built one, please post a photo and any comments - you could use the wiki, or raise an issue and we'll tag it as a "build report".

