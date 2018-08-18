---
layout: page
title: Documents
sorttitle: 2
---

# API references

* [EV3RT C API](http://roboticsbrno.github.io/RB-ev3rt-hrp2-sdk/) [English version provided by [RoboticsBrno](https://github.com/RoboticsBrno), thanks] / [Japanese version](http://www.toppers.jp/ev3pf/EV3RT_C_API_Reference/)
* [EV3RT C++ API](http://www.toppers.jp/ev3pf/EV3RT_CXX_API_Reference/) [Japanese only for now]
* [TOPPERS HRP2 API](https://www.toppers.jp/docs/tech/ngki_spec-171.pdf) [Japanese only for now]
* [C Library Documentation](https://sourceware.org/newlib/libc.html) (Newlib)
* [C Math Library Documentation](https://sourceware.org/newlib/libm.html) (Newlib)

# FAQ and tips

## How to upload an application at runtime?

### Approach #1: Use a USB cable

You can access the SD card by connecting EV3 to PC with a USB cable. Just place the new application into the `ev3rt/apps` folder.

### Approach #2: Transfer via Bluetooth PAN

EV3RT supports user to effortlessly transfer an application wirelessly via Bluetooth PAN.
In order to do that, you should select `Load App`->`Bluetooth PAN` from the menu after connecting the EV3 brick to your PC.
Then, you can use `make upload` command under `sdk/workspace` to send the application from the PC.

By default, the `app` file under `sdk/workspace` will be sent to the EV3 with default IP address `10.0.10.1` and be stored under the `/ev3rt/apps` folder in the SD card.

You can also specify the IP address, file to be sent, file name to be stored. For example, following command will send `myapp` to the EV3 with IP address `10.0.11.1` and store it under `/ev3rt/apps` with the name `helloev3`.

~~~bash
make upload ip=10.0.11.1 from=myapp to=helloev3
~~~

---

## How to connect to Bluetooth?

Bluetooth will be enabled automatically when EV3RT is started by default.
The device name is `Mindstorms EV3` and PIN code is `0000` by default and can be changed by editing `ev3rt/etc/rc.conf.ini` in the SD card.

EV3RT supports standard Bluetooth SPP (Serial Port Profile) and PAN (Personal Area Network) services.
You can connect to it with the Bluetooth functionality provided by your OS (e.g. general Bluetooth support in Windows).

Following screenshots show how to use Bluetooth PAN in different OSes.

* Windows 10
![Bluetooth PAN in Windows 10](../images/pan-win10.png)

* Linux (with [Blueman](https://github.com/blueman-project/blueman) Bluetooth manager)
![Bluetooth PAN in Linux](../images/pan-linux.png)

* Mac OS X (El Captain)
![Bluetooth PAN in OS X](../images/pan-mac.png)

---

## How to program with Bluetooth?

Bluetooth can be accessed with file I/O functions (e.g. `fprintf()` and `fgetc()`).
The special file of Bluetooth can be opened by `ev3_serial_open_file(EV3_SERIAL_BT)`.

For example, you can implement a Bluetooth counter as follows:

~~~c
FILE *bt = ev3_serial_open_file(EV3_SERIAL_BT);
for (int i = 1;; i++) {
    fprintf(bt, "Bluetooth counter %d\n", i);
    tlsp_tsk(1000); // Sleep for 1 sec
}
~~~

## How to turn off Bluetooth?

Bluetooth can be turned off by editing `ev3rt/etc/rc.conf.ini` in the SD card as follows.

~~~bash
[Bluetooth]
TurnOff=1
~~~

On startup of EV3RT, log message `Bluetooth is turned off.` will be shown instead of Bluetooth device address.
