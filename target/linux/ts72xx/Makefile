include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=ts72xx
BOARDNAME:=Technologic Systems TS72xx
FEATURES:=squashfs jffs2 ext4 targz usb
CFLAGS:=-Os -pipe -march=armv4t -fno-caller-saves
MAINTAINER:=Petr Stetiar <ynezz@true.cz>

LINUX_VERSION:=3.3.8

include $(INCLUDE_DIR)/target.mk

KERNELNAME:="uImage"

define Target/Description
	Build firmware images for Technologic Systems TS72xx boards.
endef

$(eval $(call BuildTarget))
