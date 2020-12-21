#!/usr/bin/env sh

tail -n1000 /var/log/syslog | grep node
