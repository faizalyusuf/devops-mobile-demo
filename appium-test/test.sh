#!/bin/bash

adb uninstall com.hitherejoe.animate
cd ../
adb install app/build/outputs/apk/app-debug.apk
appium &
