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
rm -rf package/lean/luci-theme-argon
# git clone -b master https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
sed -i 's/luci-theme-bootstrap/luci-theme-argon/' feeds/luci/collections/luci/Makefile

# Add Packages
# git clone https://github.com/MapesxGM/luci-app-tencentddns package/luci-app-tencentddns
rm -rf package/lean/luci-app-easymesh
git clone https://github.com/ntlf9t/luci-app-easymesh.git package/lean/luci-app-easymesh
