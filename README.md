# ADT
An updated version of the Android Developer Tools (ADT) plugin for the Eclipse IDE.

## About
Android Developer Tools (ADT) is a plugin for the Eclipse IDE that extends the capabilities of Eclipse to let the user create Android applications. It was originally developed by Google. Support for this plugin has ended when they started working on their new IDE project called Android Studio.

The Android Studio IDE is currently not as mature as the ADT Eclipse plugin was especially when it comes to compile and debug native C/C++ applications using the NDK. This update is based on an unreleased 24.2.0 version of ADT and adds support for native development and debugging with the latest NDK releases supporting all known CPU architectures.

## Changelog
#### Version [24.2.0-20160729]
- Fixed output parsing of adb shell commands on Android Nougat. ADT now recognizes devices with Android 7.0 and lets you debug applications on the latest Android preview release.
- Tested with the latest beta version of the NDK (r13 beta 1).

#### Version [24.2.0-20160716]
- Added support for the latest Eclipse version (Neon).
- Added some missing paths to the generated gdb command file _gdb.init_.
- Tested with the latest NDK version (r12b).
- Used the GitHub release feature to upload binary files.

#### Version [24.2.0-20160515]
- Added support for the upcoming NDK r12 (tested with r12 beta 1). Do not use r11 for native debugging as it came with a broken gdb support.
- [gdb] Added a new generated gdb command file _gdb.init_ replacing the old _gdb.setup_. The file adds the "set solib-absolute-prefix" command to support newer versions of gdb. You can also switch back to the old generated command file or use a custom one.
- [gdb] Added pulling of additional files from the device: linker, libm.so and libdl.so.
- Disabled rendering the graphical layouts when using an unsupported API level (Marshmallow and above). Use a different API level to design your UI.
- Reduced the package size down to ~16MB by only keeping the recompiled files. Eclipse will download the needed files just like a boss :)
- Added a shell script _src/optimize-adt.sh_ to optimize the package size once it is generated.
- Compiled with JDK 1.8 (1.6 previously).

#### Version [24.2.0-20160319]
- Added support for NDK r11.
- Improved the installation procedure of gdbserver on device.
- Removed binary files from Git LFS and added an external download link for each release.

#### Version [24.2.0-20160214]
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

The ADT plugin was tested with the latest Neon (4.6) version of the Eclipse IDE. It should also be compatible with older versions starting from Juno (4.2).

> **Why GDB quits when I try to add a breakpoint?**

Enable the non-stop mode in GDB by activating the corresponding option at _Preferences_ -> _C/C++_ -> _Debug_ -> _GDB_.

> **Why do I get the message "com.android.ddmlib.SyncException: Permission denied"?**

This is because the ADT plugin was unable to get the application installation directory on your device. The "run-as" adb shell command used to get the application path fails on some known devices such as those from Samsung. See the related issue on the Android issue tracker at: https://code.google.com/p/android/issues/detail?id=206581. We suggest you to use another device to debug your application.

> **Where do I get the download link of the latest release?**

You can download it from GitHub in the _releases_ section. The file name format is _ADT-24.2.0-YYYYMMDD.zip_.

> **Where do I get the download link of an older release?**

You can find all of the plugin releases archived on my personal server at: http://khaled-lakehal.com/ADT/.
