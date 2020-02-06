#!/usr/bin/env bash

set -e

OTP_VERSION=${1:-22.2.6}
REBAR3_VERSION=${2:-3.13.0}

OTP_VERSION=$OTP_VERSION REBAR3_VERSION=$REBAR3_VERSION \
           envsubst '${OTP_VERSION} ${REBAR3_VERSION}' < snapcraft.yaml.tmpl > snap/snapcraft.yaml

echo "Building OTP-${OTP_VERSION} with rebar3 ${REBAR3_VERSION}"

snapcraft remote-build --build-on=amd64,arm64,armhf,i386,s390x,ppc64el
