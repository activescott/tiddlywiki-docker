#!/usr/bin/env sh
MYNAME=`basename "$0"`
MYFULLNAME="$PWD/$MYNAME"
MYDIR=`dirname "$MYFULLNAME"`

#####
# This file runs within the docker container to start TiddlyWiki
#####

die () {
  echo ""
	echo >&2 "$@"
	exit 1
}

# -e: Exit immediately if a command exits with a non-zero status.
set -e

tiddlywiki_exe=$(readlink -f $(which tiddlywiki))

[ -n "$TW_USERNAME" ] || die "ERROR: TW_USERNAME not specified!"
[ -n "$TW_PASSWORD" ] || die "ERROR: TW_PASSWORD not specified!"

# Check and see that both cert files we'll be using are present:
[ -f "/mnt/wikidata/cert.crt" -a -f "/mnt/wikidata/cert-key.pem" ] || die "ERROR: Certificate files don't exist. Did you run create-certs.sh?"

exec /usr/bin/env node $tiddlywiki_exe \
  /mnt/wikidata \
  --listen \
  username=${TW_USERNAME} \
  password=${TW_PASSWORD} \
  readers=${TW_USERNAME} \
  writers=${TW_USERNAME} \
  port=8000 \
  host=0.0.0.0 \
  tls-key=cert-key.pem \
  tls-cert=cert.crt \
  root-tiddler=$:/core/save/lazy-all
