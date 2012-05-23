define KernelPackage/ts72xx-sbcinfo
  SUBMENU:=$(OTHER_MENU)
  TITLE:=TS-72xx SBC information via proc entry
  DEPENDS:=@TARGET_ts72xx
  KCONFIG:=CONFIG_MACH_TS72XX_SBCINFO=m
  FILES:=$(LINUX_DIR)/arch/arm/mach-ep93xx/ts72xx_sbcinfo.ko
  AUTOLOAD:=$(call AutoLoad,62,ts72xx_sbcinfo)
endef

define KernelPackage/ts72xx-sbcinfo/description
  This driver adds possibility to read some useful information about
  SBC via /proc/driver/sbcinfo interface.
endef

$(eval $(call KernelPackage,ts72xx-sbcinfo))

define KernelPackage/spi-ep93xx
  SUBMENU:=$(SPI_MENU)
  TITLE:=Cirrus EP93xx SPI
  DEPENDS:=@TARGET_ts72xx
  KCONFIG:= \
        CONFIG_SPI=y \
        CONFIG_SPI_MASTER=y \
        CONFIG_SPI_EP93XX=m
  FILES:=$(LINUX_DIR)/drivers/spi/spi-ep93xx.ko
  AUTOLOAD:=$(call AutoLoad,90,spi-ep93xx)
endef

define KernelPackage/ts72xx-sbcinfo/description
  This enables using the Cirrus EP93xx SPI controller in master mode.
endef

$(eval $(call KernelPackage,spi-ep93xx))
