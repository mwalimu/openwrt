#!/bin/sh
# Copyright (C) 2007 OpenWrt.org

# This setup gives us 4 distinguishable states:
#
# Solid OFF:  Bootloader running, or kernel hung (timer task stalled)
# Solid ON:   Kernel hung (timer task stalled)
# 5Hz blink:  preinit
# 10Hz blink: failsafe

led="platform:rdled"
set_state() {
        case "$1" in
                preinit)
                        [ -d /sys/class/leds/$led ] && {
                                echo timer >/sys/class/leds/$led/trigger
                                echo 100 >/sys/class/leds/$led/delay_on
                                echo 100 >/sys/class/leds/$led/delay_off
                        }
                ;;
                failsafe)
                        [ -d /sys/class/leds/$led ] && {
                                echo timer >/sys/class/leds/$led/trigger
                                echo 50 >/sys/class/leds/$led/delay_on
                                echo 50 >/sys/class/leds/$led/delay_off
                        }
                ;;
                done)
                        [ -d /sys/class/leds/$led ] && {
                                echo none >/sys/class/leds/$led/trigger
                        }
                ;;
        esac
}
