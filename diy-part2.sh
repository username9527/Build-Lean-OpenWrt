#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
# sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# Modify tiny-tp-link
sed -i 's/tplink-4mlzma/tplink-8mlzma/' target/linux/ath79/image/tiny-tp-link.mk
sed -i 's/tplink-4m/tplink-8m/' target/linux/ath79/image/tiny-tp-link.mk

# Modify default theme
rm -rf package/feeds/luci/luci-theme-argon
rm -rf package/feeds/luci/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/feeds/luci/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git package/feeds/luci/luci-app-argon-config
sed -i 's/luci-theme-bootstrap/luci-theme-argon/' feeds/luci/collections/luci/Makefile

# Add Packages
# git clone -b Lede --single-branch https://github.com/shidahuilang/openwrt-package package/shidahuilang
# rm -rf package/feeds/luci/luci-app-easymesh
# git clone -b master --single-branch https://github.com/ntlf9t/luci-app-easymesh package/feeds/luci/luci-app-easymesh
rm -rf package/feeds/luci/luci-app-unblockmusic
git clone -b master --single-branch https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic package/feeds/luci/luci-app-unblockmusic
git clone -b main --single-branch https://github.com/username9527/openwrt-package package/custom
git clone -b main --single-branch https://github.com/siwind/luci-app-wolplus package/custom/luci-app-wolplus
git clone -b master --single-branch https://github.com/sirpdboy/luci-app-advanced package/custom/luci-app-advanced
git clone -b master --single-branch https://github.com/sirpdboy/luci-app-taskplan package/custom/luci-app-taskplan
git clone -b master --single-branch https://github.com/destan19/OpenAppFilter package/custom/OpenAppFilter
