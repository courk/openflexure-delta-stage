# Reflection illumination

One of the best uses of the OpenFlexure Delta Stage is as a reflection illumination microscope.  These instructions show you how to assemble the optical components.

{{BOM}}

[M3x8mm screw]: "{cat:part}"
[M2.5x8mm screw]: "{cat:part}"
[M2.5 washer]: "{cat:part}"
[M2.5 nut]: "{cat:part}"
[M2 screw]: "{cat:part}"
[M3 nut]: "{cat:part}"
[Raspberry Pi camera v2]: models/raspberry_pi_camera_v2.md "{cat:part}"
[objective lens]: models/objective_lens.md "{cat:part}"
[tube lens]: models/tube_lens.md "{cat:part}"
[camera cover]: models/picamera_2_cover.stl "{cat:3DPrinted}"
[lens tool]: models/lens_tool.stl "{cat:3DPrinted_tool}"
[reflection optics module casing]: models/optics_picamera2_rms_f50d13_beamsplitter_delta.stl "{cat:3DPrinted}"
[reflection illumination holder]: models/reflection_illumination.md#holder "{cat:3DPrinted}"
[reflection illumination condenser]: models/reflection_illumination.md#condenser "{cat:3DPrinted}"
[star LED]: models/star_LED.md "{cat:part}"
[red 0.5A instrument wire]: models/0_5A_instrument_wire.md#red "{cat:part}"
[black 0.5A instrument wire]: models/0_5A_instrument_wire.md#black "{cat:part}"
[solder]: "{cat:part}"
[power supply]: models/power_supply.md "{cat:part}"
[banana plug]: models/banana_plugs.md "{cat:part}" 
[condenser lens]: models/condenser_lens.md "{cat:part}"
[excitation filter]: models/glass_filters.md#excitation "{cat:part}"
[emission filter]: models/glass_filters.md#emission "{cat:part}"
[beamsplitter filter]: models/glass_filters.md#beamsplitter "{cat:part}"
[electrical tape]: "{cat:part}"
[filter cube]: models/fl_cube.stl "{cat:3DPrinted}"


[oil glass cutter]: "{cat:tool}"
[soldering iron]: "{cat:tool}"

## Method

### Wire the star LED {pagestep}

Solder the [red 0.5A instrument wire]{qty:40cm} and the [black 0.5A instrument wire]{qty:40cm} to the [star LED]{qty:1}, following the manufacturer's instructions for which pad to solder to, using a [soldering iron]{qty:1} and some [solder]{qty:some}. Be careful to keep the solder joint as small as possible.  At the other end, attach connectors for connecting to your [power supply]{qty:1}.  In this example, we use [banana plug]{qty:2}.

![](images/reflection_illumination/star_LED.jpg)
![](images/reflection_illumination/star_LED_solder.jpg)
![](images/reflection_illumination/star_LED_wires.jpg)

### Insert the condenser lens {pagestep}

Put the [condenser lens]{qty:1} on the [lens tool]{qty:1} with the convex side face down.
![](images/reflection_illumination/condenser_lens.jpg)

Push the [reflection illumination condenser]{qty:1} down onto the lens.  Check it is pushed all the way in and it is flat.

![](images/reflection_illumination/push_condenser.jpg)
![](images/reflection_illumination/condenser_in_place.jpg)

### Attach the LED {pagestep}

Attach the [star LED] to the back of the [reflection illumination condenser] using [M3x8mm screw]{qty:2}.  Make sure the wires come out from near the bottom.

![](images/reflection_illumination/attach_led.jpg)

### Insert the slip plate screws {pagestep}

Push the [M2.5 nut]{qty:2} into the slots on the top of the [reflection illumination condenser].

![](images/reflection_illumination/condenser_nut1.jpg)
![](images/reflection_illumination/condenser_nut2.jpg)

### Cut the glass filters {pagestep}

Cut the [excitation filter]{qty:1}, [emission filter]{qty:1} and [beamsplitter filter]{qty:1} (it's easiest with an [oil glass cutter]{qty:1}). Currently there are only `.stl`s for 1.5mm thickness glass filters, although it possible to change this in the `.scad`.

|Filter type|Width (mm) | Length (mm) |
|-|-|-|
|Excitation | 12 | 15 |
|Emission | 12 | 15 |
|Beamsplitter | 12 | 18 |

### Slot the filters into the filter cube {pagestep}

Push the [emission filter] into the bottom of the filter cube.  It should be tight but be careful not to break the glass filter. You might need to file down the slot if there are printing errors.

Push the [beamsplitter filter] into the 45° slot. Again it might be tight, and you might need to use a file to ensure you can fit it in. 

![](images/reflection_illumination/filter_cube1.jpg)
![](images/reflection_illumination/filter_cube2.jpg)
![](images/reflection_illumination/filter_cube3.jpg)


### Clean the optics module casing {pagestep}

After printing the [reflection optics module casing]{qty:1} there may be strings or dust.  Clean these out so they won't block the light or fall onto the camera sensor.

![](images/reflection_illumination/clean_optics1.jpg)
![](images/reflection_illumination/clean_optics2.jpg)

### Attach the objective screw {pagestep}

Slide a [M3 nut]{qty:1} into the slot at the top of the [reflection optics module casing] and screw a [M3 screw]{qty:1} into it.

![](images/reflection_illumination/objective_screw1.jpg)
![](images/reflection_illumination/objective_screw2.jpg)
![](images/reflection_illumination/objective_screw3.jpg)

### Insert the tube lens {pagestep}

Put the [tube lens]{qty:1} onto the [lens tool]{qty:1}, with the more convex side down.

![](images/reflection_illumination/tube_lens1.jpg)

Push the [reflection optics module casing] down on top of the lens until it is flat and secure.

![](images/reflection_illumination/tube_lens2.jpg)
![](images/reflection_illumination/tube_lens3.jpg)

### Attach the objective lens {pagestep}

Screw the [objective lens]{qty:1} into the top of the [reflection optics module casing].  Be careful to screw it in straight, to avoid cross-threading.

![](images/reflection_illumination/objective_lens1.jpg)
![](images/reflection_illumination/objective_lens2.jpg)

### Attach the filter cube to the reflection illumination holder {pagestep}

Slide the [filter cube] into the dovetail of the [reflection illumination holder].

![](images/reflection_illumination/filter_cube_in_holder1.jpg)
![](images/reflection_illumination/filter_cube_in_holder2.jpg)
![](images/reflection_illumination/filter_cube_in_holder3.jpg)

### Insert the excitation filter {pagestep}

The [excitation filter] slides into the slot on top of the [reflection illumination holder].

![](images/reflection_illumination/excitation1.jpg)
![](images/reflection_illumination/excitation2.jpg)

### Attach the reflection illumination holder to the optics module {pagestep}

Slide the [filter cube] into the slot in the side of the [reflection optics module casing].

![](images/reflection_illumination/filter_cube_in_optics1.jpg)
![](images/reflection_illumination/filter_cube_in_optics2.jpg)
![](images/reflection_illumination/filter_cube_in_optics3.jpg)

Screw the [reflection illumination holder] to the [reflection optics module casing] using two [M2.5x8mm screw]{qty:2}s.

![](images/reflection_illumination/holder_screws1.jpg)
![](images/reflection_illumination/holder_screws2.jpg)
![](images/reflection_illumination/holder_screws3.jpg)
![](images/reflection_illumination/holder_screws4.jpg)

### Secure the excitation filter

Put some [electrical tape]{qty:some} over the excitation filter slot to keep the excitation filter in place.

![](images/reflection_illumination/excitation_tape1.jpg)
![](images/reflection_illumination/excitation_tape2.jpg)

### Attach the reflection illumination holder

Put two [M2.5 washer]{qty:2}s onto two [M2.5x8mm screw]{qty:2}s.  Screw through the slip plate on the [reflection illumination holder] into the [M2.5 nut] in the [reflection illumination condenser].  

![](images/reflection_illumination/slip_plate_screws1.jpg)
![](images/reflection_illumination/slip_plate_screws2.jpg)
![](images/reflection_illumination/slip_plate_screws3.jpg)

### Remove the camera lens {pagestep}

Remove the plastic film from the lens of the [Raspberry Pi camera v2]{qty:1}.

![](images/reflection_illumination/remove_film1.jpg)
![](images/reflection_illumination/remove_film2.jpg)

Unscrew the camera lens using the camera lens tool supplied with the camera.

![](images/reflection_illumination/lens_tool.jpg)
![](images/reflection_illumination/open_camera.jpg)

Once you've removed the lens, keep the camera face down or put some tape over the lens holder to stop dust settling on the sensor (which is difficult to clean!).

### Attach the camera to the optics tube {pagestep}

Attach the [Raspberry Pi camera v2] to the bottom of the [reflection optics module casing]. Put the [camera cover]{qty:1} over the top.  Secure everything in place with two [M2 screw]{qty:2}s.

![](images/reflection_illumination/camera.jpg)
![](images/reflection_illumination/camera_cover.jpg)
![](images/reflection_illumination/camera_cover_screw1.jpg)
![](images/reflection_illumination/camera_cover_screw2.jpg)

### Attach the optics module to the Delta Stage {pagestep}

Slot the objective screw into the mount inside the [main body](fromstep).

![](images/reflection_illumination/module_in_position1.jpg)

When the optics module is in roughly the correct position, the objective screw can be tightened through the access hole in the back.

![](images/reflection_illumination/module_in_position2.jpg)
![](images/reflection_illumination/module_in_position3.jpg)

You can move the position of the condenser by loosening these screws.

![](images/reflection_illumination/module_in_position4.jpg)
