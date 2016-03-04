---
layout: page
title: What is EV3RT?
sortttitle: 0
---

EV3RT is an RTOS-based software platform that enables you to develop applications with tough timing constraints for the [LEGO® MINDSTORMS EV3](http://www.lego.com/en-us/mindstorms/products/31313-mindstorms-ev3).

# Features

* TOPPERS/HRP2 real-time operating system
  - Preemptive multitasking with low context-switch overhead (approx. 8 μs)
  - Memory protection (MMU) support to provide high reliability and robustness
  - [µITRON](https://en.wikipedia.org/wiki/ITRON_project)-like API based on [the TOPPERS NGK specification](https://www.toppers.jp/docs/tech/ngki_spec-171.pdf) (Japanese only for now)
* Programming using C/C++
  - [GCC ARM Embedded](https://launchpad.net/gcc-arm-embedded) toolchain
  - C standard library ([Newlib](http://www.sourceware.org/newlib/))
  - Dynamic memory allocation (e.g. malloc) powered by [TLSF](http://www.gii.upv.es/tlsf/) O(1) allocator
  - EV3RT C API and EV3RT C++ API for sensors, motors, e.t.c.
* Current supported devices
  - UART, I2C and analog sensors
  - EV3 medium/large servo motors
  - Bluetooth (serial port profile)
  - USB (as mass storage device)
  - Speaker, LEDs, LCD and SD card
* Small, light and fast!
  - Platform image < 700 KB, memory footprint < 5 MB, boot time < 5 seconds
* Developer assistant
  - Workspace to manage and build application projects more easily
  - Loader to receive and execute app from USB or Bluetooth at run time
  - Many sample programs (e.g. HelloEV3, Self-balancing robot, Line follower)
  - Multi-platform: Linux, Windows and Mac OS X

=================DUMMY BELOW THIS LINE=================

<p class="message">
  Hey there! This page is included as an example. Feel free to customize it for your own use upon downloading. Carry on!
</p>

* 2
In the novel, *The Strange Case of Dr. Jeykll and Mr. Hyde*, Mr. Poole is Dr. Jekyll's virtuous and loyal butler. Similarly, Poole is an upstanding and effective butler that helps you build Jekyll themes. It's made by [@mdo](https://twitter.com/mdo).

There are currently two themes built on Poole:

* [Hyde](http://hyde.getpoole.com)
* [Lanyon](http://lanyon.getpoole.com)

Learn more and contribute on [GitHub](https://github.com/poole).

## Setup

Some fun facts about the setup of this project include:

* Built for [Jekyll](http://jekyllrb.com)
* Developed on GitHub and hosted for free on [GitHub Pages](https://pages.github.com)
* Coded with [Sublime Text 2](http://sublimetext.com), an amazing code editor
* Designed and developed while listening to music like [Blood Bros Trilogy](https://soundcloud.com/maddecent/sets/blood-bros-series)

Have questions or suggestions? Feel free to [open an issue on GitHub](https://github.com/poole/issues/new) or [ask me on Twitter](https://twitter.com/mdo).

Thanks for reading!
