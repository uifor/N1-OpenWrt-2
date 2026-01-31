#!/bin/bash
# Adjust source code
patch -p1 -f < $(dirname "$0")/luci.patch

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic
git clone https://github.com/nikkinikki-org/OpenWrt-nikki --depth=1 clone/nikki
git clone https://github.com/sirpdboy/luci-app-lucky --depth=1 clone/lucky
git clone https://github.com/sbwml/luci-app-openlist2 --depth=1 clone/openlist

# Update packages
cp -rf clone/amlogic/luci-app-amlogic clone/nikki/luci-app-nikki feeds/luci/applications/
cp -rf clone/lucky feeds/luci/applications/luci-app-lucky
cp -rf clone/openlist feeds/luci/applications/luci-app-openlist
sed -i '/luci-app-attendedsysupgrade/d' feeds/luci/collections/luci/Makefile

# Clean packages
rm -rf clone
