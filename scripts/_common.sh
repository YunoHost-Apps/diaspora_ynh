#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

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

_ynh_add_systemd_target() {
    ynh_add_config --template="diaspora.target" --destination="/etc/systemd/system/${app}.target"
    systemctl daemon-reload
    systemd-tmpfiles --create
    systemctl enable "${app}.target" --quiet
}
_ynh_remove_systemd_target() {
    systemctl stop "${app}.target"
    systemctl disable "${app}.target" --quiet
    ynh_secure_remove --file="/etc/systemd/system/${app}.target"
    systemctl daemon-reload
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
