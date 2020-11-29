# Transmission illumination

These instructions show you how to add transmission illumination and optics module to your delta stage.

{{BOM}}

[LED]: models/led.md "{cat:part}"
[25cm wire]: models/wire.md "{cat:part}"
[330Ω resistor]: models/resistor.md "{cat:part}"
[soldering iron]: "{cat:tool}"
[heat shrink]: "{cat:part}"
[electrical tape]: "{cat:part}"
[crimp]: "{cat:tool}"
[wire stripper]: "{cat:tool}"
[female crimp terminal contact]: models/female_crimp_terminal_contact.md "{cat:part}"
[female connector housing]: models/female_connector_housing.md "{cat:part}"
[condenser lens]: models/condenser_lens.md "{cat:part}"
[soldering iron]: "{cat:tool}"
[solder]: "{cat:part}"
[M3 washer]: models/m3_washer.md "{cat:part}"
[M3 screw]: models/m3_screw.md "{cat:part}"
[M2 screw]: models/m2_screw.md "{cat:part}"
[M3 nut]: models/m3_nut.md "{cat:part}"
[Raspberry Pi camera v2]: models/raspberry_pi_camera_v2.md "{cat:part}"
[objective lens]: models/objective_lens.md "{cat:part}"
[tube lens]: models/tube_lens.md "{cat:part}"
[condenser housing]: models/condenser_housing.stl "{cat:3DPrinted}"
[camera cover]: models/camera_cover.stl "{cat:3DPrinted}"
[lens tool]: models/lens_tool.stl "{cat:3DPrinted}"
[optics module casing]: models/optics_module_casing.md "{cat:3DPrinted}"


## Illumination

### Solder the LED {pagestep}

Solder  one [330Ω resistor]{qty:1} on one leg of the [LED]{qty:1} with a [soldering iron]. 

Strip both ends of the [25cm wires]{qty:2} with a [wire stripper]{qty:1}. 

Solder the two wires on to the free end of the [330Ω resistor] and the other leg of the [LED] using a [soldering iron]{qty:1} and [solder]{qty:some}.  

Cover each leg of the LED and resistor with some [heat shrink]{qty:some} or [electrical tape]{qty:some} so that the exposed metal cannot short-circuit. 

Twist the two wires together and trim so that they are the same length.  

Using a [crimp]{qty:1}, crimp a [female crimp terminal contact] on to the ends of both the wires. 

Push both crimp terminals into a [female connector housing]{qty:1}.  

You have now made a [wired LED]{output, qty:1}. 

### Insert the Condenser Lens {pagestep}

Take a [condenser lens]{qty:1} and place it on top of the [lens tool]{qty:1} with its flat side down.  

Push the [condenser housing]{qty:1} down vertically on top of the lens. make sure it is flat, pushing again harder if necessary.

### Insert the LED {pagestep}

Push the LED into the top of the [condenser housing]. If it is loose, secure it in place with some [electrical tape]{qty:some}.

### Attach the illumination dovetail

Put the [illumination dovetail]{qty:1} on the condenser mount of the [main body](fromstep).

Put one [M3 washer]{qty:2} on to two [M3 screws]{qty:1}. 

Insert two [M3 nut]{qty:2}s into the nut slots on the condenser mount.

Screw the [illumination dovetail] onto the [main body](fromstep).

### Attach the condenser on to the dovetail

Slide the [condenser housing] down the dovetail.  You can adjust its position up and down by sliding it on the dovetail.  You can move it back and forward by loosening the dovetail and and tightening it when it is the correct position.


## Optics Module

### Clean the optics module casing {pagestep}

After printing the [optics module casing]{qty:1} there may be strings or dust.  Clean these out so they won't block the light or fall onto the camera sensor.

### Attach the objective screw {pagestep}

Slide a [M3 nut]{qty:1} into the slot at the top of the [optics module casing] and screw a [M3 screw]{qty:1} into it.

### Insert the tube lens {pagestep}

Put the [tube lens]{qty:1} onto the [lens tool], with the more convex side down.

Push the [optics module casing] down on top of the lens until it is flat and secure.

### Attach the objective lens {pagestep}

Screw the [objective lens]{qty:1} into the top of the [optics module casing].  Be careful to screw it in straight, to avoid cross-threading.

### Remove the camera lens {pagestep}

Remove the plastic film from the lens of the [Raspberry Pi camera v2]{qty:1}.

Unscrew the camera lens using the camera lens tool supplied with the camera.

Once you've removed the lens, keep the camera face down or put some tape over the lens holder to stop dust settling on the sensor (which is difficult to clean!).

### Attach the camera to the optics tube {pagestep}

Attach the [Raspberry Pi camera v2] to the bottom of the [optics module casing]. Put the [camera cover]{qty:1} over the top.  Secure everything in place with two [M2 screws]{qty:1}.
