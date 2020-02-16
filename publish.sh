#!/usr/bin/env bash

set -e

snapcraft push --release=stable erlang_22.2.6_arm64.snap
snapcraft push --release=stable erlang_22.2.6_armhf.snap
snapcraft push --release=stable erlang_22.2.6_i386.snap
snapcraft push --release=stable erlang_22.2.6_ppc64el.snap
snapcraft push --release=stable erlang_22.2.6_s390x.snap
snapcraft push --release=stable erlang_22.2.6_amd64.snap
