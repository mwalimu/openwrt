include $(TOPDIR)/rules.mk

PKG_NAME:=luaevdev
PKG_VERSION:=0.0.1
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/ynezz/luaevdev.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=7f59e325f4528379d3a2436528d0ba2b278cdd8d
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MIRROR_MD5SUM:=b16d3a0c6e7ca55666dbd786ccadbbcf
CMAKE_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/luaevdev
  SUBMENU:=Lua
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:=+liblua
  TITLE:=Library for evdev access
  URL:=http://github.com/ynezz/luaevdev
  MAINTAINER:=Petr Stetiar <ynezz@true.cz>
endef

define Package/luaevdev/description
  Small library for comfortable access to Linux input subsystem
  (evdev particularly) from Lua.
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include

CMAKE_OPTIONS = \
	-DLUAPATH=/usr/lib/lua

define Package/luaevdev/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(CP) $(PKG_BUILD_DIR)/evdev_core.so $(1)/usr/lib/lua/
	$(CP) $(PKG_BUILD_DIR)/evdev.lua $(1)/usr/lib/lua/
endef

$(eval $(call BuildPackage,luaevdev))

