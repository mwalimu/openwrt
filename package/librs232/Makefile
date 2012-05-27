include $(TOPDIR)/rules.mk

PKG_NAME:=librs232
PKG_VERSION:=1.0.3
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/ynezz/librs232.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=5c7da7ddf5c162575642bfe2bcc6c87cd8d7194c
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MIRROR_MD5SUM:=b16d3a0c6e7ca55666dbd786ccadbbcf

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/librs232
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Library for serial communications over RS-232
  URL:=http://github.com/ynezz/librs232
  MAINTAINER:=Petr Stetiar <ynezz@true.cz>
endef

define Package/luars232
  SUBMENU:=Lua
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:=+liblua +librs232
  URL:=http://github.com/ynezz/librs232
  TITLE:=Library for serial communications over RS-232
  MAINTAINER:=Petr Stetiar <ynezz@true.cz>
endef

define Package/librs232/description
 Library for serial communications over RS-232 (serial port).
endef

define Package/luars232/description
 Library for serial communications over RS-232 (serial port).
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/librs232 $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librs232.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/librs232.pc $(1)/usr/lib/pkgconfig/
endef

define Package/librs232/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librs232.so.* $(1)/usr/lib/
endef

define Package/luars232/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/luars232.so.0.0.1 $(1)/usr/lib/lua/luars232.so
	$(CP) ./files/rs232.lua $(1)/usr/lib/lua
endef

$(eval $(call BuildPackage,librs232))
$(eval $(call BuildPackage,luars232))
