#!/usr/bin/env sh
MYNAME=`basename "$0"`
MYFULLNAME="$PWD/$MYNAME"
MYDIR=`dirname "$MYFULLNAME"`

source ./.env

docker build -t tiddlywiki .
