#!/system/bin/sh
# Before Zygote. setprop would deadlock — use resetprop -n only.

MODDIR=${0%/*}
. "$MODDIR/setpropenabler.sh"

apply_camera_fps -n
