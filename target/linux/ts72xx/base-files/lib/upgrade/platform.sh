platform_check_image() {
	local magic="$(cat "$1" | dd bs=4 count=1 2>/dev/null)"

	[ "$magic" != "ts72" ] && {
		echo "Invalid image type."
		return 1
	}

	return 0
}

platform_do_upgrade() {
	tar -xOf "$1" openwrt-ts72xx-zImage | mtd write - kernel
	tar -xOf "$1" openwrt-ts72xx-squashfs.img | mtd write - rootfs
}

disable_watchdog() {
	killall watchdog
	( ps | grep -v 'grep' | grep '/dev/watchdog' ) && {
		echo 'Could not disable watchdog'
		return 1
	}
}

append sysupgrade_pre_upgrade disable_watchdog
