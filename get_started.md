---
layout: page
title: Get started
sorttitle: 1
---

This step-by-step guide will show you how to install EV3RT, build a sample program and run it on your EV3 brick.

# Step 0: Check your environment

Some packages are required to be installed before installing EV3RT:

* GCC (for host)
* GCC ARM Embedded (6-2017-q2 is best, 7.x may have some issues)
* make
* diffutils
* perl
* U-Boot mkimage utility
* libboost (if you want to build the configurator from source code)

You can refer to following guides to install these dependencies:

* Ubuntu LTS

~~~bash
wget http://ev3rt-git.github.io/public/ev3rt-prepare-ubuntu.sh
sudo bash ev3rt-prepare-ubuntu.sh
~~~

* [Windows (Cygwin)](http://dev.toppers.jp/trac_user/ev3pf/wiki/DevEnvWin) [Japanese only for now]
* [Mac OS X (El Captain)](http://dev.toppers.jp/trac_user/ev3pf/wiki/DevEnvMac) [Japanese only for now]

# Step 1: Get the source code

~~~bash
git clone https://github.com/ev3rt-git/ev3rt-hrp2
cd ev3rt-hrp2
git submodule init
git submodule update
~~~

# Step 2: Prepare the configurator

Build the configurator from source code by:

~~~bash
cd ev3rt-hrp2/cfg
make
~~~
Alternatively, pre-built binaries are also available for Windows and Mac OS X users:

* [cfg 1.9.5 for Windows](https://www.toppers.jp/download.cgi/cfg-mingw-static-1_9_5.zip)
* [cfg 1.9.5 for Mac OS X](https://www.toppers.jp/download.cgi/cfg-osx-static-1_9_5.tar.gz)

Extract the downloaded package and put the configurator binary (cfg or cfg.exe) under the folder `ev3rt-hrp2/cfg/cfg`.

# Step 3: Install EV3RT to the SD card

Following command will generate a `uImage` file if build succeeded.
`uImage` is the bootable system image of EV3RT which includes components such as RTOS kernel, device drivers and the application loader.

~~~bash
cd ev3rt-hrp2/base-workspace
make app=loader
~~~

Copy `uImage` to the root directory of your SD card, and the installation of EV3RT is finished!

# Step 4: Build a sample program (HelloEV3)

Each folder in `ev3rt-hrp2/sdk/workspace` contains an application project. Application can be built by the command `make app=<folder name>`.

HelloEV3 in `helloev3` is a sample program which can be used to test many functions (e.g. sensors and motors) of EV3RT. Let's build it by:

~~~bash
cd ev3rt-hrp2/sdk/workspace
make app=helloev3
~~~

An `app` file will be generated if build succeeded. It is an [ELF](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format) binary of your program, which can be executed by the application loader. Copy `app` to the `ev3rt/apps` folder (create it if not exists) on your SD card and, of course, you can rename the `app` file as you like.

# Step 5: Try it out!

Launch HelloEV3:

1. Insert the SD card into your EV3 brick and power it on.
2. After a few seconds, you will see the EV3RT console.
3. Press buttons to select `Load App`->`SD card`, and files in `ev3rt/apps` will be listed.
4. Now choose the file of HelloEV3 to launch it.

After HelloEV3 is started, a menu will appear.
At first, the device connection must be configured.
For example, if a ultrasonic sensor is connected to port 1, you should select `Connect device`->`Connect sensor`->`Sensor port 1`->`Ultrasonic` from the menu.
Then you can choose `Test sensor`->`Sensor port 1` to test your sensor on EV3RT.

EV3RT console can be shown again by pressing and holding the `BACK` button. You can view system log, launch another application or shutdown the EV3 from the console.
