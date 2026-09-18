#!/system/bin/sh
# late_start: persist props after boot.

MODDIR=${0%/*}
. "$MODDIR/setpropenabler.sh"

resetprop -w sys.boot_completed 0
apply_camera_fps
