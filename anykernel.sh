#!/sbin/sh
# AnyKernel3 Ramdisk Mod Script for Xiaomi Redmi Note 13 4G (sapphire / sapphiren)
# osm0sis @ xda-developers
### AnyKernel setup
properties() { '
kernel.string=Custom Kernel for Redmi Note 13 4G (sapphire)
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=sapphire
device.name2=sapphiren
device.name3=tapas
device.name4=topaz
device.name5=
supported.versions=13,14,15,16
supported.patchlevels=
'; } # end properties
### AnyKernel install
## boot shell variables
block=boot
is_slot_device=auto
ramdisk_compression=auto
patch_vbmeta_flag=auto
# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh
ui_print " "
ui_print "========================================="
ui_print "  Installing Sapphire Kernel..."
ui_print "  Target: Redmi Note 13 4G (SM6225)"
ui_print "========================================="
# Split and write boot partition
split_boot
if [ -f "$SPLITIMG/ramdisk.cpio" ]; then
  ui_print "-> Packing ramdisk..."
  unpack_ramdisk
  write_boot
else
  ui_print "-> Flashing raw boot..."
  flash_boot
fi
# Flash DTBO if present in zip
if [ -f "dtbo.img" ]; then
  ui_print "-> Flashing dtbo partition..."
  flash_dtbo
