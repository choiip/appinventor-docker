# Dockerfile to build app inventor environment and server

## About the files

### Dockerfile
Followed the [guide](https://github.com/mit-cml/appinventor-sources#setup-instructions-manual) to install all essentials.

### prod.Dockerfile
Clone source, build appinventor from source and run servers.

### Makefile
Handy way to build docker images and run containers.

## About Testing on device/emulator
The testing devices are required to install [MIT AI2 Companion](https://play.google.com/store/apps/details?id=edu.mit.appinventor.aicompanion3).

The simplest way is connecting through AI Companion.

aiStarter is required to be installed in the PC which connected the device through USB. aiStarter included the emulator and all esstential tools as well. More information can be found [here](https://appinventor.mit.edu/explore/ai2/setup).

