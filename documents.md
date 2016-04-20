---
layout: page
title: Documents
sorttitle: 2
---

# API references

* [EV3RT C API](http://www.toppers.jp/ev3pf/EV3RT_C_API_Reference/) [Japanese only for now]
* [EV3RT C++ API](http://www.toppers.jp/ev3pf/EV3RT_CXX_API_Reference/) [Japanese only for now]
* [TOPPERS HRP2 API](https://www.toppers.jp/docs/tech/ngki_spec-171.pdf) [Japanese only for now]
* [C Library Documentation](https://sourceware.org/newlib/libc.html) (Newlib)
* [C Math Library Documentation](https://sourceware.org/newlib/libm.html) (Newlib)

# FAQ and tips

## How to upload an application at runtime?

You can access the SD card by connecting EV3 to PC with a USB cable. Just place the new application into the `ev3rt/apps` folder.

## How to connect to Bluetooth?

Bluetooth will be enabled automatically when EV3RT is started. The device name is `Mindstorms EV3` and PIN code is `0000` by default and can be changed by editing `ev3rt/etc/rc.conf.ini` in the SD card.

EV3RT supports standard Bluetooth serial port profile, and you can connect to it with the Bluetooth functionality provided by your OS (e.g. general Bluetooth support in Windows).

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

