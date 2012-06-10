include $(TOPDIR)/rules.mk

PKG_NAME:=fbtest-app
PKG_VERSION:=1.0.0
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/prpplague/fb-test-app.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=1547b55320db31eba7af4020f0ca0298ec42cef1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MIRROR_MD5SUM:=b16d3a0c6e7ca55666dbd786ccadbbcf

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Test suite for Linux framebuffer
  DEPENDS:=@DISPLAY_SUPPORT
  URL:=https://github.com/prpplague/fb-test-app
  MAINTAINER:=Petr Stetiar <ynezz@true.cz>
endef

define Build/Configure
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/fb-test $(1)/usr/sbin/fbtest
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/perf $(1)/usr/sbin/fbtest-perf
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/rect $(1)/usr/sbin/fbtest-rect
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/offset $(1)/usr/sbin/fbtest-offset
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
