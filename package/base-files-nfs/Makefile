#
# Copyright (C) 2012 OpenWrt.org
# Copyright (C) 2012 Lantiq
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=base-files-nfs
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=base
  CATEGORY:=Base system
  TITLE:=Base files and kernel settings for booting from NFS.
  KCONFIG:= \
            CONFIG_IP_PNP=y \
            CONFIG_IP_PNP_DHCP=y \
            CONFIG_IP_PNP_BOOTP=y \
            CONFIG_IP_PNP_RARP=y \
            CONFIG_LOCKD=y \
            CONFIG_NFS_FS=y \
            CONFIG_ROOT_NFS=y \
            CONFIG_SUNRPC=y
endef

define Package/$(PKG_NAME)/description
 This package contains files and system scripts to use a NFS root.
endef

define Build/Prepare
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	[ -d ./files ] && $(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))

