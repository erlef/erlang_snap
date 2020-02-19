#!/usr/bin/env bash

set -e

OTP_VERSION=${1:-22.2.7}
ERTS_VERSION=${2:-10.6.4}
REBAR3_VERSION=${3:-3.13.0}

OTP_VERSION=$OTP_VERSION REBAR3_VERSION=$REBAR3_VERSION ERTS_VERSION=$ERTS_VERSION \
           envsubst '${OTP_VERSION} ${ERTS_VERSION} ${REBAR3_VERSION}' < snapcraft.yaml.tmpl > snap/snapcraft.yaml

ERTS_VERSION=$ERTS_VERSION \
           envsubst '${ERTS_VERSION}' < erl.tmpl > snap/local/erl1

ERTS_VERSION=$ERTS_VERSION \
           envsubst '${ERTS_VERSION}' < erl1.tmpl > snap/local/erl2

ERTS_VERSION=$ERTS_VERSION \
           envsubst '${ERTS_VERSION}' < erl2.tmpl > snap/local/erl3

chmod +x snap/local/erl1
chmod +x snap/local/erl2
chmod +x snap/local/erl3

echo "Building OTP-${OTP_VERSION} with rebar3 ${REBAR3_VERSION}"

snapcraft remote-build --build-on=amd64,arm64,armhf,i386,s390x,ppc64el
