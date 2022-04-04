#!/sbin/sh
#
# TODO: this kludge is needed to fix issues with
# miui ROMs not flashing.

resetprop "ro.dynamic.full_size" "9126805504"

exit 0
#