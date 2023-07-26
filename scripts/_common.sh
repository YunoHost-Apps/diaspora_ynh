#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="cmake imagemagick ghostscript curl libmagickwand-dev git libpq-dev redis-server postgresql"
build_pkg_dependencies="libffi-dev libgdbm-dev libncurses5-dev libyaml-dev pkg-config sqlite3 libgmp-dev libssl-dev"

ruby_version=2.7
nodejs_version=14
bundler_version=2.1.4

# jemalloc seems to be better for ROR apps, let's use it
case $YNH_ARCH in
    amd64)
        arch="x86_64"
        ;;
    arm64)
        arch="aarch64"
        ;;
    armel|armhf)
        arch="arm"
        ;;
    i386)
        arch="i386"
        ;;
esac
ld_preload="LD_PRELOAD=/usr/lib/$arch-linux-gnu/libjemalloc.so"

#=================================================
# PERSONAL HELPERS
#=================================================

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
