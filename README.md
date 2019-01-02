Animate Android App
===================

Introduction
------------

This demonstration will showcase the principles of continuous integration, continuous testing and continuous delivery of a simple mobile application.

Requirements
------------
 * A Jenkins master server up and running. See [here](https://github.com/viseo-asia/docker-enterprise-edition-2.0-demo/blob/master/install_continuous_integration_server.md) for set-up instructions.
 * A Jenkins agent(preferably running on MacOSX) with the following installed:
 1. Java
 2. [Android SDK](http://developer.android.com/sdk/index.html) with:
    Android [5.1 (API 22) ](http://developer.android.com/tools/revisions/platforms.html#5.1).
    Android SDK Tools
    Android SDK Build tools 23.0.0.0 rc3
    Android Support Repository
    Android Support libraries
 3. [Appium](http://appium.io/)

Building
--------

To build, install and run a debug version, run this from the root of the project:

    ./gradlew assembleDebug
