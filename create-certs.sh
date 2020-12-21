#!/usr/bin/env sh
MYNAME=`basename "$0"`
MYFULLNAME="$PWD/$MYNAME"
MYDIR=`dirname "$MYFULLNAME"`

die () {
  echo ""
	echo >&2 "$@"
	exit 1
}

source "$MYDIR/.env"

[ -n "$CERT_HOST" ] || die "ERROR: CERT_HOST not specified!"
[ -n "$CERT_OU" ] || die "ERROR: CERT_OU not specified!"
[ -n "$CERT_ORG" ] || die "ERROR: CERT_ORG not specified!"
[ -n "$CERT_CITY" ] || die "ERROR: CERT_CITY not specified!"
[ -n "$CERT_STATE" ] || die "ERROR: CERT_STATE not specified!"
[ -n "$CERT_COUNTRY" ] || die "ERROR: CERT_COUNTRY not specified!"

WIKI_FOLDER=$MYDIR/wikidata

FNAME_KEY=cert-key.pem
FNAME_CSR=cert-csr.pem
FNAME_CERT=cert.crt

[ -f "$WIKI_FOLDER/$FNAME_KEY" ]  && rm -i "$WIKI_FOLDER/$FNAME_KEY"
[ -f "$WIKI_FOLDER/$FNAME_CSR" ]  && rm -i "$WIKI_FOLDER/$FNAME_CSR"
[ -f "$WIKI_FOLDER/$FNAME_CERT" ] && rm -i "$WIKI_FOLDER/$FNAME_CERT"

openssl req \
  -newkey rsa:2048 \
    -subj "/CN=$CERT_HOST/OU=$CERT_OU/O=$CERT_ORG/L=$CERT_CITY/ST=$CERT_STATE/C=$CERT_COUNTRY" \
    -new \
    -nodes \
    -keyout "$WIKI_FOLDER/$FNAME_KEY" \
    -out "$WIKI_FOLDER/$FNAME_CSR"

openssl x509 \
  -req \
  -days 365 \
  -in "$WIKI_FOLDER/$FNAME_CSR" \
  -signkey "$WIKI_FOLDER/$FNAME_KEY" \
  -out "$WIKI_FOLDER/$FNAME_CERT"
