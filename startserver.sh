#!/bin/bash
set -e

cd /home/developer/appinventor-sources/appinventor

ant RunLocalBuildServer > /dev/null &

/home/developer/appengine/bin/dev_appserver.sh --port=8888 --address=0.0.0.0 appengine/build/war/