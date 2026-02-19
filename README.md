# DarkSkyReborn

A simple iOS tweak to make Dark Sky work again (written with the help of Qwen 2.5 Coder)

It uses the PirateWeather API as a drop-in replacement for the Dark Sky API. Not all of the features work, but the important ones do!

## Building

1. Install [theos](https://github.com/theos/theos/) and [theos-jailed](https://github.com/kabiroberai/theos-jailed)
2. Modify the IPA path in the makefile and the variable in the Tweak.xm file for your PirateWeather API key
3. Run `make package CODESIGN_IPA=0` to build the IPA, sideload with your preferred method
