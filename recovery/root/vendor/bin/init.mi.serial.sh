#!/vendor/bin/sh

setprop ro.vendor.ril.oem.psno `cat /mnt/vendor/persist/serialno/.psno`
setprop ro.vendor.ril.oem.sno `cat /mnt/vendor/persist/serialno/.sno`
