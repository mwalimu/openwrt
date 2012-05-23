define Profile/ts72xx
  NAME:=Technologic Systems TS72xx
  PACKAGES:= \
        kmod-ts72xx-sbcinfo
endef

define Profile/ts72xx/Description
	Package set compatible with the Technologic Systems ts72xx board.
endef
$(eval $(call Profile,ts72xx))
