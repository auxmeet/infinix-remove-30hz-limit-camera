#!/system/bin/sh

MODID=infinix-remove-30hz-limit-camera
CAM_PREVIEW_FPS=9999
CAM_RECORD_FPS=9999
AUTOMOUNT=true
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=true

REPLACE="
"

print_modname() {
  ui_print " "
  ui_print "=============================="
  ui_print "  Remove 30Hz camera limit"
  ui_print "=============================="
  ui_print "  by @auxmeet & @iromenero"
  ui_print " "
}

on_install() {
  ui_print "- Installing module files..."
}

set_permissions() {
  set_perm_recursive "$MODPATH" 0 0 0755 0644
  set_perm "$MODPATH/post-fs-data.sh" 0 0 0755
  set_perm "$MODPATH/service.sh" 0 0 0755
  set_perm "$MODPATH/setpropenabler.sh" 0 0 0644
  set_perm "$MODPATH/config.sh" 0 0 0644
}
