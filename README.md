# ADT
An updated version of the Android Developer Tools (ADT) plugin for the Eclipse IDE.

## About
Android Developer Tools (ADT) is a plugin for the Eclipse IDE that extends the capabilities of Eclipse to let the user create Android applications. It was originally developed by Google. Support for this plugin has ended when they started working on their new IDE project called Android Studio.

The Android Studio IDE is currently not as mature as the ADT Eclipse plugin was especially when it comes to compile and debug native C/C++ applications using the NDK. This update is based on the 24.2.0 version of ADT and adds support for native debugging on 64-bit CPU equipped devices.

## Changelog
#### Version 24.2.0-20160214
- Based on ADT version 24.2.0.
- Added support for native debugging of 64-bit applications on 64-bit CPU architectures (arm64-v8a, x86_64, mips64).
- Added support for native debugging of 32-bit applications on 64-bit CPU architectures.

## Frequently Asked Questions
> **How to patch the original source code?**

First, you will need to install the prerequisites for your platform. There are quite a few steps here, and it's all platform dependent, so go to the official build instructions:
- Establishing a Build Environment: http://source.android.com/source/initializing.html
- Building the Eclipse-Based Tools: http://tools.android.com/build/eclipse

Now, you need to get the source code of the ADT version 24.2.0 by checking-out the Android Studio 1.2 release "closed" branch:
```
repo init -u https://android.googlesource.com/platform/manifest -b studio-1.2-release
repo sync
```
After that, you must update the sources by applying a patch to the checked-out version. The patch is available at _src/ADT-24.2.0-YYYYMMDD.patch_ (where _YYYYMMDD_ is the release date of the patch). Make sure you place the patch file inside the Android Studio's root directory. Use the following command to patch the sources:
```
patch -p1 < ADT-24.2.0-YYYYMMDD.patch
```

> **Which Eclipse version do I need to use?**

The ADT plugin was tested with the latest Mars (4.5) version of the Eclipse IDE. It's also compatible with older versions starting from Juno (4.2).

> **Why GDB quits when I try to add a breakpoint?**

Enable the non-stop mode in GDB by activating the corresponding option at _Preferences_ -> _C/C++_ -> _Debug_ -> _GDB_.
