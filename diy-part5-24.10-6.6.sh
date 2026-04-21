#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part5-24.10-6.6.sh
# Description: OpenWrt DIY script part 5 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 1. 强制在内核配置中启用 MTD 写支持
echo "CONFIG_MTD_WRITEABLE_TABLE=y" >> .config

# 2. 确保 kmod-mtd-rw 选上了
echo "CONFIG_PACKAGE_kmod-mtd-rw=y" >> .config

# 3. 强制开启 initramfs 生成（如果你需要这个文件）
echo "CONFIG_TARGET_ROOTFS_INITRAMFS=y" >> .config

# 4. 删除 DTS 里的 read-only 限制
# 请根据你的实际路径微调，通常是 target/linux/mediatek/dts/...
sed -i '/read-only;/d' target/linux/mediatek/dts/mt7986a-netcore-n60-pro.dts
