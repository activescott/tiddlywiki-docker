#!/usr/bin/env sh
MYNAME=`basename "$0"`
MYFULLNAME="$PWD/$MYNAME"
MYDIR=`dirname "$MYFULLNAME"`

set -e
set -x

./stop.sh
./build.sh
./start.sh
./logs.sh
