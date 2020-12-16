# Transmission illumination

These instructions show you how to add transmission illumination and optics module to your delta stage.

{{BOM}}

[LED]: models/led.md "{cat:part}"
[100Ω resistor]: models/resistor.md "{cat:part}"
[heat shrink]: "{cat:part}"
[electrical tape]: "{cat:part}"
[crimp]: "{cat:tool}"
[wire stripper]: "{cat:tool}"
[female crimp terminal contact]: models/female_crimp_terminal_contact.md "{cat:part}"
[female connector housing]: models/female_connector_housing.md "{cat:part}"
[condenser lens]: models/condenser_lens.md "{cat:part}"
[soldering iron]: "{cat:tool}"
[solder]: "{cat:part}"
[M3 washer]:"{cat:part}"
[M3x8 screw]: "{cat:part}"
[M2 screw]: "{cat:part}"
[M3 nut]: "{cat:part}"
[illumination dovetail]: models/illumination_dovetail.stl "{cat:3DPrinted}"
[Raspberry Pi camera v2]: models/raspberry_pi_camera_v2.md "{cat:part}"
[objective lens]: models/objective_lens.md "{cat:part}"
[tube lens]: models/tube_lens.md "{cat:part}"
[condenser housing]: models/condenser.stl "{cat:3DPrinted}"
[camera cover]: models/picamera_2_cover.stl "{cat:3DPrinted}"
[lens tool]: models/lens_tool.stl "{cat:3DPrinted_tool}"
[optics module casing]: models/optics_module_casing.md "{cat:3DPrinted}"
[wire cutters]: "{cat:tool}"
[red 0.5A instrument wire]: models/0_5A_instrument_wire.md#red "{cat:part}"
[black 0.5A instrument wire]: models/0_5A_instrument_wire.md#black "{cat:part}"
[heat gun]: "{cat:tool}"
[3.2mm heat shrink]: models/3_2mm_heat_shrink.md "{cat:part}"
[4.8mm heat shrink]: models/4_8mm_heat_shrink.md "{cat:part}"
## Illumination

### Wire the LED {pagestep}

Snip the longer (positive) leg of the [LED]{qty:1} using [wire cutters]{qty:1}.

![](images/transmission_illumination/LED.jpg)
![](images/transmission_illumination/LED_snipped.jpg)

Snip one leg of the [100Ω resistor]{qty:1} using [wire cutters]{qty:1}.

![](images/transmission_illumination/resistor.jpg)
![](images/transmission_illumination/resistor_snipped.jpg)

Solder the shorter leg of [100Ω resistor] to the positive leg of the [LED] with a [soldering iron]{qty:1} and [solder]{qty:some}. Snip the leg of the resistor so that the two legs are approximately the same length using [wire cutters]{qty:1}.

![](images/transmission_illumination/resistor_soldered.jpg)

Cut the [red 0.5A instrument wire]{qty:40cm} and the [black 0.5A instrument wire]{qty:40cm} to 40cm lengths using [wire cutters]{qty:1}.

![](images/transmission_illumination/LED_wires.jpg)

Strip both ends of the [red 0.5A instrument wire] and [black 0.5A instrument wire ] with a [wire stripper]{qty:1}.

![](images/transmission_illumination/red_wire_stripped.jpg)
![](images/transmission_illumination/black_wire_stripped.jpg)

Solder the [red 0.5A instrument wire] on to the free leg of the [330Ω resistor] using a [soldering iron]{qty:1} and [solder]{qty:some}.

![](images/transmission_illumination/red_wire_soldered.jpg)

Solder the [black 0.5A instrument wire] on to the free leg of the [LED] using a [soldering iron]{qty:1} and [solder]{qty:some}.

![](images/transmission_illumination/black_wire_soldered.jpg)

Cover each leg of the LED and resistor with some [3.2mm heat shrink]{qty:6cm} so that the exposed metal cannot short-circuit.  Use a [heat gun]{qty:1} to heat the [3.2mm heat shrink] on both legs.

![](images/transmission_illumination/LED_heatshrink1.jpg)
![](images/transmission_illumination/LED_heatshrink2.jpg)
![](images/transmission_illumination/LED_heatshrink3.jpg)

Slide some [4.6mm heat shrink]{qty:4cm} over both heat shrinks and heat with a [heat gun]{qty:1}.

![](images/transmission_illumination/LED_heatshrink_both1.jpg)
![](images/transmission_illumination/LED_heatshrink_both2.jpg)

Twist the two wires together. If they are not the same length then trim and re-strip.

![](images/transmission_illumination/LED_wire_twist.jpg)

Using a [crimp]{qty:1}, crimp a [female crimp terminal contact]{qty:2} on to the ends of both the wires.

![](images/transmission_illumination/LED_crimp1.jpg)
![](images/transmission_illumination/LED_crimp2.jpg)

Push both crimp terminals into a [female connector housing]{qty:1}.  

![](images/transmission_illumination/LED_terminal1.jpg)
![](images/transmission_illumination/LED_terminal2.jpg)

You have now made a wired LED.

![](images/transmission_illumination/finished_led.jpg)

### Insert the Condenser Lens {pagestep}

Take a [condenser lens]{qty:1} and place it on top of the [lens tool]{qty:1} with its flat side down.

![](images/transmission_illumination/condenser_lens.jpg)

Push the [condenser housing]{qty:1} down vertically on top of the lens. make sure it is flat, pushing again harder if necessary.

![](images/transmission_illumination/push_condenser.jpg)
![](images/transmission_illumination/finished_condenser_lens.jpg)

### Insert the LED {pagestep}

Push the LED into the top of the [condenser housing]. If it is loose, secure it in place with some [electrical tape]{qty:some}.

![](images/transmission_illumination/led_in_condenser.jpg)
![](images/transmission_illumination/condenser_tape.jpg)

### Attach the illumination dovetail

Put the [illumination dovetail]{qty:1} on the condenser mount of the [main body](fromstep).

![](images/transmission_illumination/dovetail_on_mount.jpg)

Put one [M3 washer]{qty:2} on to two [M3x8 screw]{qty:1}s.

![](images/transmission_illumination/dovetail_screws.jpg)

Insert two [M3 nut]{qty:2}s into the nut slots on the condenser mount.

![](images/transmission_illumination/dovetail_nuts.jpg)

Screw the [illumination dovetail] onto the [main body](fromstep).

![](images/transmission_illumination/dovetail_attach1.jpg)
![](images/transmission_illumination/dovetail_attach2.jpg)

### Attach the condenser on to the dovetail

Slide the [condenser housing] down the dovetail.  You can adjust its position up and down by sliding it on the dovetail.  You can move it back and forward by loosening the dovetail and and tightening it when it is the correct position.

![](images/transmission_illumination/dovetail_condenser1.jpg)
![](images/transmission_illumination/dovetail_condenser2.jpg)

## Optics Module

### Clean the optics module casing {pagestep}

After printing the [optics module casing]{qty:1} there may be strings or dust.  Clean these out so they won't block the light or fall onto the camera sensor.

![](images/transmission_illumination/optics_clean.jpg)

### Attach the objective screw {pagestep}

Slide a [M3 nut]{qty:1} into the slot at the top of the [optics module casing] and screw a [M3x8 screw]{qty:1} into it.

![](images/transmission_illumination/objective_screw.jpg)

### Insert the tube lens {pagestep}

Put the [tube lens]{qty:1} onto the [lens tool]{qty:1}, with the more convex side down.

![](images/transmission_illumination/tube_lens.jpg)

Push the [optics module casing] down on top of the lens until it is flat and secure.

![](images/transmission_illumination/push_objective_tube.jpg)
![](images/transmission_illumination/tube_lens_in_objective.jpg)

### Attach the objective lens {pagestep}

Screw the [objective lens]{qty:1} into the top of the [optics module casing].  Be careful to screw it in straight, to avoid cross-threading.

![](images/transmission_illumination/objective1.jpg)
![](images/transmission_illumination/objective2.jpg)
![](images/transmission_illumination/objective3.jpg)

### Remove the camera lens {pagestep}

Remove the plastic film from the lens of the [Raspberry Pi camera v2]{qty:1}.

![](images/transmission_illumination/remove_film1.jpg)
![](images/transmission_illumination/remove_film2.jpg)

Unscrew the camera lens using the camera lens tool supplied with the camera.

![](images/transmission_illumination/lens_tool.jpg)
![](images/transmission_illumination/camera_open.jpg)

Once you've removed the lens, keep the camera face down or put some tape over the lens holder to stop dust settling on the sensor (which is difficult to clean!).

![](images/transmission_illumination/camera_upside_down.jpg)

### Attach the camera to the optics tube {pagestep}

Attach the [Raspberry Pi camera v2] to the bottom of the [optics module casing]. Put the [camera cover]{qty:1} over the top.  Secure everything in place with two [M2 screws]{qty:1}.

![](images/transmission_illumination/camera_parts.jpg)
![](images/transmission_illumination/camera_in_place.jpg)
![](images/transmission_illumination/camera_screw.jpg)

### Attach the optics module to the Delta Stage {pagestep}

Slot the objective screw into the mount inside the [main body](fromstep).

![](images/transmission_illumination/optics_in_mount.jpg)

When the optics module is in roughly the correct position, the objective screw can be tightened through the access hole in the back.

![](images/transmission_illumination/objective_access_slot.jpg)
![](images/transmission_illumination/optics_in_position.jpg)
