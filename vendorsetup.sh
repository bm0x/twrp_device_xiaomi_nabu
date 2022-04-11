#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="nabu"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
        #Language
   	export TW_DEFAULT_LANGUAGE="en"

   	#Building
	export LC_ALL="C"
    export FOX_MANIFEST_VER="11.0"
 	export ALLOW_MISSING_DEPENDENCIES=true
	export OF_TARGET_DEVICES="nabu"
	export TARGET_DEVICE_ALT="nabu"
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER="1"

    #Debug
    export FOX_INSTALLER_DEBUG_MODE="1"
    export OF_IGNORE_LOGICAL_MOUNT_ERRORS="1"

    #Binaries
    export FOX_USE_SED_BINARY="1"
	export FOX_USE_XZ_UTILS="1"
	export FOX_USE_GREP_BINARY="1"
	export FOX_USE_BASH_SHELL="1"
	export FOX_ASH_IS_BASH="1"
    export FOX_USE_TAR_BINARY="1"
	export FOX_USE_NANO_EDITOR="1"

	#Magiskboot
	export OF_USE_MAGISKBOOT="1"
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"
	#export OF_PATCH_VBMETA_FLAG="1"

    # OTA & MIUI
    export OF_KEEP_DM_VERITY="1"
    export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES="1"
    export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR="1"
    export OF_DISABLE_MIUI_OTA_BY_DEFAULT="1"
    export OF_NO_MIUI_PATCH_WARNING="1"
    export OF_DONT_PATCH_ENCRYPTED_DEVICE="1"
    export OF_NO_TREBLE_COMPATIBILITY_CHECK="1"
    export OF_PATCH_AVB20="1"
    export FOX_BUGGED_AOSP_ARB_WORKAROUND="1616300800"

    #Backup
    export OF_SKIP_MULTIUSER_FOLDERS_BACKUP="1"
    export OF_QUICK_BACKUP_LIST="/boot;/data;"

	# screen settings
	export OF_SCREEN_H=1920
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
	export OF_CLOCK_POS="0"

	#Partitions
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export OF_VIRTUAL_AB_DEVICE="1"

    #Features
    export FOX_ENABLE_APP_MANAGER=0
    export FOX_DELETE_AROMAFM="1"
    export OF_USE_GREEN_LED="0"
	export OF_NO_SPLASH_CHANGE="1"
	export FOX_DELETE_MAGISK_ADDON="1"

    #Maintainer Stuff
    export OF_MAINTAINER="bm0x"
    export FOX_VERSION="R11.1_0"

	# run a process after formatting data to work-around MTP issues
	# export OF_RUN_POST_FORMAT_PROCESS="1"   disabling this since it causes issues with a12 decryption

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
#