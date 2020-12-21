#!/usr/bin/env sh
MYNAME=`basename "$0"`
MYFULLNAME="$PWD/$MYNAME"
MYDIR=`dirname "$MYFULLNAME"`

source ./.env

docker container stop tw
# always return 0 because we don't care if this succeeds
exit 0