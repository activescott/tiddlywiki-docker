#!/usr/bin/env sh

cp -f ./tiddlywiki.service /lib/systemd/system/
sudo systemctl daemon-reload
