#!/system/bin/sh

MIN_MAGISK=26400

if [ -z "$MAGISK_VER_CODE" ] || [ "$MAGISK_VER_CODE" -lt "$MIN_MAGISK" ]; then
  abort "! Requires Magisk 26.4+ (current: ${MAGISK_VER:-unknown})"
fi

. "$MODPATH/config.sh"

print_modname
ui_print "- Magisk $MAGISK_VER"
ui_print "- Camera FPS: preview=$CAM_PREVIEW_FPS record=$CAM_RECORD_FPS"

printf 'persist.vendor.cam.preview.fps=%s\n' "$CAM_PREVIEW_FPS" > "$MODPATH/system.prop"
printf 'persist.vendor.cam.record.fps=%s\n' "$CAM_RECORD_FPS" >> "$MODPATH/system.prop"

on_install
set_permissions
