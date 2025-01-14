# Motor controller (Sangaboard)

The stage can be powered by a Raspberry Pi and a motor controller.

{{BOM}}

[Raspberry Pi power supply]: ../components/raspi_power.md "{cat:part}"
[red 4A instrument wire]: ../components/4A_instrument_wire.md#red "{cat:part}"
[black 4A instrument wire]: ../components/4A_instrument_wire.md#black "{cat:part}"
[4.8mm heat shrink]: ../components/4_8mm_heat_shrink.md "{cat:part}"
[6.4mm heat shrink]: ../components/6_4mm_heat_shrink.md "{cat:part}"
[soldering iron]: "{cat:tool}"
[wire stripper]: "{cat:tool}"
[craft knife]: "{cat:tool}"
[heat gun]: "{cat:tool}"
[wire cutters]: "{cat:tool}"

# Method

## The Sangaboard {pagestep}

[These instructions](https://build.openflexure.org/openflexure-microscope/v6.1.5/docs/#/6_motor_controllers) show the different ways of controlling the motors. The base currently works with the Sangaboard v0.2 and v0.3.

## Powering the motors for Sangaboard v0.2 {pagestep}

Do not power the motors from the pins on the Raspberry Pi.  Instead split the [Raspberry Pi power supply] cable.  

Cut the [Raspberry Pi power supply]{qty:1} cable approximately 20cm from the USB plug end using [wire cutters]{qty:1}.

![](../images/motor_controller/cut_power.jpg)

Carefully separate the two cables using a [craft knife]{qty:1} on the USB plug cable for approximately 3cm and strip both wires using a [wire stripper]{qty:1}. Check which wire is positive and negative.  On this official [Raspberry Pi power supply] cable, the wire with long lines printed on is the negative wire.

![](../images/motor_controller/separate_wires.jpg)
![](../images/motor_controller/USB_strip.jpg)

Cut a 20cm length of [red 4A instrument wire]{qty:20cm} and [black 4A instrument wire]{qty:20cm} using [wire cutters]{qty:1}. Strip one end using a [wire stripper]. Wrap the red wire around the positive wire of the [Raspberry Pi power supply] cable. Solder in place with a [soldering iron]{qty:1} and [solder]{qty:some}.

![](../images/motor_controller/wrap_positive_usb.jpg)
![](../images/motor_controller/solder_positive_usb.jpg)

Repeat for the [black 4A instrument wire] on the negative wire of the [Raspberry Pi power supply] cable.

![](../images/motor_controller/USB_both_solder.jpg)

Cut two [4.8mm heat shrink]{qty:6cm} tubes approximately 3cm long.  Cut one [6.4mm heat shrink]{qty:6cm} tube approximately 6cm long.

![](../images/motor_controller/cut_heat_shrink.jpg)

Carefully separate the two cables using a [craft knife]{qty:1} on the longer end of the [Raspberry Pi power supply] cable for approximately 5cm and strip both wires using a [wire stripper]. Push the longer [6.4mm heat shrink] tube over both wires and the two shorter [4.8mm heat shrink] tubes over each of the wires.

![](../images/motor_controller/USB_wire_with_heatshrink.jpg)

Wrap the negative wire from the longer cable with the already soldered negative wire from the USB end.  Solder in place with a [soldering iron]{qty:1} and [solder]{qty:some}.

![](../images/motor_controller/solder_third.jpg)

Repeat for the positive wire.

![](../images/motor_controller/solder_third_repeat.jpg)

Move the two [4.8mm heat shrink] tubes over the joints and heat in place using a [heat gun]{qty:1} or [soldering iron]{qty:1}.

![](../images/motor_controller/heatshrink_in_place.jpg)
![](../images/motor_controller/heatshrink_shrunk.jpg)

Move the [6.4mm heat shrink] tube over both joints and heat in place using a [heat gun]{qty:1} or [soldering iron]{qty:1}.

![](../images/motor_controller/large_heatshrink_in_place.jpg)
![](../images/motor_controller/large_heatshrink_shrunk.jpg)

You can then attach the connector of your choice to connect to the Sangaboard v0.2.

![](../images/motor_controller/connector.jpg)

## Powering the motors for Sangaboard v0.3 {pagestep}

The Sangaboard v0.3 is powered by micro USB.  It should not be powered from a USB port on the Raspberry Pi, but by a separate power source.
