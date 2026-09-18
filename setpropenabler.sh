# Shared helper. Sourced by post-fs-data.sh and service.sh.

. "$MODDIR/config.sh"

apply_camera_fps() {
  if [ "$1" = "-n" ]; then
    resetprop -n persist.vendor.cam.preview.fps "$CAM_PREVIEW_FPS"
    resetprop -n persist.vendor.cam.record.fps "$CAM_RECORD_FPS"
  else
    resetprop persist.vendor.cam.preview.fps "$CAM_PREVIEW_FPS"
    resetprop persist.vendor.cam.record.fps "$CAM_RECORD_FPS"
  fi
}
