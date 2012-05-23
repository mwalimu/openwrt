# ts72xx flash layout 32M
#
# start		end		size		name
# -----------------------------------------------------
# 0 		0x4000 		0x4000 		bootrom
# 0x4000	0x1d04000	0x1d00000	rootfs
# 0x1d04000	0x1d44000	0x40000		redboot
# 0x1d44000	0x1ffc000	0x2b8000	kernel
# 0x1ffc000	0x1fff000	0x3000		redboot fis
# 0x1fff000	0x2000000	0x1000		redboot config
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

define align/kernel-nand
	bs=512 conv=sync
endef

ZIMAGE:=$(BIN_DIR)/$(IMG_PREFIX)-zImage
fs_squash:=squashfs-only

define Image/BuildKernel
	dd if=$(LINUX_DIR)/arch/arm/boot/zImage $(call align/kernel-nand) > $(ZIMAGE)
endef

define Image/Build/squashfs
	$(call prepare_generic_squashfs,$(KDIR)/root.squashfs)
	dd if=$(KDIR)/root.$(1) of=$(BIN_DIR)/$(IMG_PREFIX)-$(1).img bs=128k conv=sync
endef

define Image/Build/Sysupgrade
	echo ts72xx > $(BIN_DIR)/ts72xx
	tar -C $(BIN_DIR) -cvf $(BIN_DIR)/$(IMG_PREFIX)-sysupgrade.bin ts72xx $(IMG_PREFIX)-squashfs.img $(IMG_PREFIX)-zImage
	rm $(BIN_DIR)/ts72xx
endef

define Image/Build
	$(call Image/Build/$(1),$(1))
	$(call Image/Build/Sysupgrade)
endef

$(eval $(call BuildImage))
