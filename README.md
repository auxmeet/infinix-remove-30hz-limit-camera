# infinix-remove-30hz-limit-camera

Magisk module for **Infinix** on a **GSI** (for example Pixel Experience). Removes the **30 Hz / 30 fps** camera cap.

**v1.0** — Magisk **26.4+**  
Authors: **auxmeet** & **iromenero**

## What it does

The Unisoc HAL can lock preview/record at 30 fps. This module raises the cap:

- `persist.vendor.cam.preview.fps`
- `persist.vendor.cam.record.fps`

## config.sh

All settings live in **`config.sh`**. After editing, reinstall the module or reboot.

| Variable | Default | Purpose |
| --- | --- | --- |
| `MODID` | `infinix-remove-30hz-limit-camera` | Must match `id=` in `module.prop` |
| `CAM_PREVIEW_FPS` | `9999` | Preview FPS cap |
| `CAM_RECORD_FPS` | `9999` | Record FPS cap |
| `PROPFILE` | `true` | Install `system.prop` |
| `POSTFSDATA` | `true` | Run `post-fs-data.sh` |
| `LATESTARTSERVICE` | `true` | Run `service.sh` |

On install, `customize.sh` reads `config.sh` and writes the FPS values into `system.prop`.

## How it works

| File | When | Role |
| --- | --- | --- |
| `config.sh` | install and boot | settings, `print_modname`, permissions |
| `customize.sh` | install | Magisk 26.4+, applies `config.sh` |
| `post-fs-data.sh` | before Zygote | `resetprop -n` (do not use `setprop`) |
| `service.sh` | after boot | waits for `sys.boot_completed`, persists props |
| `setpropenabler.sh` | boot | reads `config.sh`, sets props |
| `system.prop` | post-fs-data | FPS values from `config.sh` |
| `skip_mount` | boot | no `/system` overlay (props only) |

## Install

1. Zip these files at the **root** of the archive:
   - `module.prop`
   - `config.sh`
   - `setpropenabler.sh`
   - `post-fs-data.sh`
   - `service.sh`
   - `system.prop`
   - `skip_mount`
   - `customize.sh`
   - `META-INF/com/google/android/update-binary`
   - `META-INF/com/google/android/updater-script` (must be exactly `#MAGISK`)
2. Magisk → **Modules** → **Install from storage** → reboot.

The Magisk app replaces `update-binary` with its own installer. That is expected. The 26.4+ check is in `customize.sh`.

## Tested on

- Device: Infinix Hot 12 Pro (X668C)
- ROM: Pixel Experience 12 (GSI)
- Magisk: 26.4

## Check after reboot

```sh
getprop persist.vendor.cam.preview.fps
getprop persist.vendor.cam.record.fps
```

Values should match `CAM_*` in `config.sh` (default `9999`).
