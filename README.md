# android_device_xiaomi_xun

Device tree for the Xiaomi Redmi Pad SE (`xun`), maintained for the personal
LineageOS 22.2 port at <https://github.com/robsonsilv4/lineageos-xun>.

The repository is standalone. It started as a fork of
[Xiaomi-Redmi-Pad-SE-Resources/android_device_xiaomi_xun](https://github.com/Xiaomi-Redmi-Pad-SE-Resources/android_device_xiaomi_xun),
which is archived, and `lineage-22.2` continues from that tree at
`dcaaf04155eeee4ea2cde91ce9aca6dfd5e4f9b9`.

The branch carries the changes the port needs to boot and behave on the last
stock firmware, OS2.0.209.0.VMUMIXM:

- the vendor blobs regenerated from 209, plus the 32-bit `libmisight` and the
  209 `libgralloccore` that the source build cannot supply
- the product identity that names the 209 base
- the prebuilt `system_dlkm` modules, the gralloc handle layout and the
  boot-time SELinux labels
- the Updater URI for this port's OTA channel
- the removal of the Dolby manager and the dormant Dolby DAP engine
- the `usbotg` volume flag that makes a USB disk visible to apps
- the automatic brightness change, applied and then reverted because the
  device has no light sensor that updates while the camera is closed

The manifest pins the build commit, the parent of the commit that added this
README. Do not force-push `lineage-22.2`.

Each change has a rationale and a removal condition in the port's `patches/`
directory: <https://github.com/robsonsilv4/lineageos-xun/tree/main/patches>.
