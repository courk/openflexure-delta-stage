# OpenFlexure Delta Stage

A 3D Printable high-precision 3-axis delta-bot translation stage.

This project is a 3D printable design that enables very fine (sub-micron) mechanical positioning of a small moving stage, with surprisingly good mechanical stability.  It follows on from the [OpenFlexure Microscope](https://openflexure.org/projects/microscope/). The main advantage of this design is that the optics remain in a fixed position, allowing more complex and heavier optics modalities, as well as coupling into external optics.

## Printing and building it

The [Delta Stage home page](https://openflexure.org/projects/deltastage/) is the best place to start with making your own Delta Stage.

### Assembly instructions

The [assembly instructions](https://build.openflexure.org/openflexure-delta-stage/latest) contain all the STLs you need to download and print, and a bill of materials for the non printed parts.  There is also guidance on 3D printer settings.  

The assembly instructions give a step by step guide to building the Delta Stage, as both a translation stage and a complete microscope (transmission and reflection illumination).

## Software

The Delta Stage can be powered by [Raspbian-OpenFlexure](https://openflexure.org/projects/deltastage/build#install-the-os).  You can control the Delta Stage either on the Raspberry Pi itself or from a different computer using [OpenFlexure Connect](https://openflexure.org/projects/deltastage/install).

## Customising it

You can customise the delta stage to suit your application.  All of the designs are made using [OpenSCAD](https://www.openscad.org/). Currently we use [OpenSCAD 2019.05](https://openscad.org/news.html#20190518).

### Cloning the repository

The Delta Stage repository uses additional git features which can require extra steps. For this reason, it is recommended that you clone it, rather than download it.  

* The repository uses [submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) to include parameters, objects and components from the [OpenFlexure Microscope repository](https://gitlab.com/openflexure/openflexure-microscope).

* The repository uses [git-lfs](https://git-lfs.github.com/) for version control of image (and other large) files. If git-lfs is not installed, cloning the repository will only download placeholders of these files.

#### Visual Studio Code

The easiest way to clone the repository is with [Visual Studio (VS) Code](https://code.visualstudio.com/), with [git-lfs installed](https://git-lfs.github.com/).  If you [clone the repository using VS Code](https://code.visualstudio.com/docs/editor/versioncontrol#_cloning-a-repository) these additional features should work automatically.

You can then make changes using VS Code and use OpenScad with the editor hidden and the `automatic reload and compile` option ticked for compiling.

#### Cloning using the command line

1. Download and install [git-lfs](https://git-lfs.github.com/).

2. The easiest way to correctly clone the project is to run:

    ```bash
    git clone --recurse-submodules https://gitlab.com/openflexure/openflexure-delta-stage.git
    ```

    If the `openflexure-microscope` folder is empty, you should run the following in the main `openflexure-delta-stage` folder:
    1. `git submodule init` (to set the repository up for the first time).
    2. `git submodule update` (to fetch the required data).

 > With git-lfs installed, git will download the latest version of the large files.  If they are still missing run:

```bash
git lfs fetch 
git lfs checkout
```

  > To make Git always download everything in the repository run the following commands in your terminal:

```bash
git config --local lfs.fetchexclude ""
git lfs fetch
git lfs checkout
```

### Downloading the repository

1. Download the `openflexure-delta-stage` repository.
2. In the OpenFlexure Delta Stage repository on GitLab, click on the 8 characters (the commit ref) after the `@` on the folder named `openflexure-microscope @ ...`. This will take you to the OpenFlexure Microscope repository at the correct commit.
     > :warning: It is important that the submodule is at the correct commit, it will not work if it is on a different commit.
3. Download the OpenFlexure Microscope repository and copy these files in the folder called `openflexure-microscope` in the Delta Stage folder.

### Guide to repository

#### Delta Stage components

The Delta Stage components are found in the `openscad` folder. For example the main body is compiled from `openscad/delta_stage.scad`.  The majority of parameters reside in `openscad/parameters.scad`, so you can easily change aspects of the design (height etc.). Some parts of the design borrow objects from the `openflexure-microscope` submodule.

> :warning: There are currently issues where OpenSCAD runs out of memory when previewing or compiling `delta_stage.scad` in the graphical interface. The complexity of the model will be reduced to fix this, but in the meantime it is still possible to compile it using the [command line](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Using_OpenSCAD_in_a_command_line_environment#Command_line_usage):

```bash
openscad -o delta_stage.stl delta_stage.scad
```

#### OpenFlexure Microscope components

The `openflexure-microscope` folder is a submodule containing a version of the [OpenFlexure Microscope repository](https://gitlab.com/openflexure/openflexure-microscope) at a specific commit. The components common to both devices are compiled from there.  If you make changes to these components that you feel should be merged in for others to use, then you should make a merge request to that repository (bearing in mind that it will be ahead of the specific commit that this repository uses).

#### Building the components

To build every component you can run ``build.sh`` if you have a Bash shell (in either linux or Windows Subsystem Linux).  You may need to add ``openscad`` to your path if you want this to work in MinGW on Windows, or in the Mac OS Terminal.

It is also useful to look in ``build.sh`` to see how the components are compiled (and from which OpenSCAD file) as some use command line variables.

#### Writing assembly instructions

The [assembly instructions](https://build.openflexure.org/openflexure-delta-stage/latest) cover the standard uses for the delta stage. They are compiled using [gitbuilding](https://gitbuilding.io/) and stored in the `\docs` folder.

### Release flow

We use the [OpenFlexure workflow](https://openflexure.org/contribute/) for development.

We use GitLab CI to manage builds and deployment.

The CI will build STL files that will remain on GitLab for 1 week when:

* A merge request is submitted
* A merge request is modified

The CI will build and deploy STL files and documentation to [build.openflexure.org](https://build.openflexure.org/openflexure-delta-stage) when:

* A build is manually triggered from GitLab web
* A release is tagged

The build server will mark a release as "latest"( [build.openflexure.org/openflexure-delta-stage/latest](https://build.openflexure.org/openflexure-delta-stage/latest) ) when a release is tagged, with a full semantic version and no suffix. For example:

* v6.0.0 will replace "latest"

However, incomplete semantic versions will not replace latest. For example:

* v6.0.1-beta.1 will **not** replace "latest" (pre-release suffix)
* v6.1 will **not** replace "latest" (no patch version specified)
* 6.0.1a will **not** replace "latest" (non-standard suffix)

## Get Involved

It'll be great if you are able to contribute to the OpenFlexure Delta Stage. If you have any issues, questions or suggestions we would love to hear them.

You can:

* Join the discussion in the [forum](https://openflexure.discourse.group/).
* Make an [issue](https://gitlab.com/openflexure/openflexure-delta-stage/-/issues/new).
* Make a merge request.
* [Tweet us](https://twitter.com/openflexure) with your completed projects.

## License

This project is open-source and is released under the CERN open hardware license.  There is not yet any accompanying software, but if that changes please consider it GPL.  Any documentation contained in this project is licensed CC-BY International 4.0.  We are working on selling kits through OpenFlexure Industries, though we're not yet taking orders - however this will stay a fully open-source project.
