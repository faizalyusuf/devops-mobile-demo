Animate Android App
===================

Introduction
------------

This demonstration will showcase the principles of continuous integration, continuous testing and continuous delivery of a simple mobile application.

Requirements
------------
 1. A Jenkins master server up and running. See [here](https://github.com/viseo-asia/docker-enterprise-edition-2.0-demo/blob/master/install_continuous_integration_server.md) for set-up instructions.
 
 2. A Jenkins agent(preferably running on MacOSX) with the following installed:
 * Java
 * [Android SDK](http://developer.android.com/sdk/index.html) with:
    - Android [5.1 (API 22) ](http://developer.android.com/tools/revisions/platforms.html#5.1).
    - Android SDK Tools
    - Android SDK Build tools 23.0.0.0 rc3
    - Android Support Repository
    - Android Support libraries
 * [Appium](http://appium.io/)
 
 3. Android mobile test device running Android >=5.0
