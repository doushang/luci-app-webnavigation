#!/bin/sh

sed -i 's/git\.openwrt\.org\/project\/luci/github\.com\/openwrt\/luci/g' ./feeds.conf.default
./scripts/feeds update luci
./scripts/feeds install luci
mv ./bin/luci-app-webnavigation ./package/
make defconfig
make package/luci-app-webnavigation/compile V=s -j$(nproc) BUILD_LOG=1

tar -cJf logs.tar.xz logs
mv logs.tar.xz bin
