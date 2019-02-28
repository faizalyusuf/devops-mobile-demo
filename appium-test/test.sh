#!/bin/bash

#$ANDROID_HOME/platform-tools/adb uninstall com.hitherejoe.animate
cd ../
$ANDROID_HOME/platform-tools/adb uninstall app/build/outputs/apk/app-debug.apk
$ANDROID_HOME/platform-tools/adb install app/build/outputs/apk/app-debug.apk
appium &
