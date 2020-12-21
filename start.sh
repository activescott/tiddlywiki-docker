#!/usr/bin/env sh
MYNAME=`basename "$0"`
MYFULLNAME="$PWD/$MYNAME"
MYDIR=`dirname "$MYFULLNAME"`

source ./.env

docker container rm tw

docker run \
  --name tw \
  --detach \
  -p 443:8000 \
  --mount "type=bind,source=$MYDIR/wikidata,destination=/mnt/wikidata" \
  --env TW_USERNAME=$TW_USERNAME \
  --env TW_PASSWORD=$TW_PASSWORD \
  tiddlywiki:latest
