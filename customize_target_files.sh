#/bin/bash
PWD=`pwd`
METADATA_DIR=$PWD/metadata
OUT_DIR=$PWD/out
TARGET_FILES_DIR=$OUT_DIR/target_files
build_prop_file=$TARGET_FILES_DIR/SYSTEM/build.prop
OTHER_DIR=$PWD/other
KERNEL_DIR=$PWD/overlay/boot

#Use custom updater bin file
if [ -e $METADATA_DIR/updater ]
then
   echo "Use custom updater bin file"
   cp $METADATA_DIR/updater $TARGET_FILES_DIR/OTA/bin
fi

#Added file_contexts to ROM
cp -f other/file_contexts out/target_files/META/
rm -rf out/target_files/SYSTEM/vendor/preinstall

#Added device features
echo "Added new devices features"
cp -f other/j5lte.xml out/target_files/SYSTEM/etc/device_features
