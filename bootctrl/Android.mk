ifeq ($(AB_OTA_UPDATER),true)
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_CFLAGS += -Wall -Werror
LOCAL_SHARED_LIBRARIES += liblog librecovery_updater_msm libcutils
LOCAL_HEADER_LIBRARIES += libhardware_headers
LOCAL_SRC_FILES := boot_control.cpp
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := bootctrl.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_OWNER := qti
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_CFLAGS += -Wall -Werror
LOCAL_SHARED_LIBRARIES += liblog librecovery_updater_msm libcutils
LOCAL_HEADER_LIBRARIES := libhardware_headers
LOCAL_SRC_FILES := boot_control.cpp
LOCAL_MODULE := bootctrl.$(TARGET_BOARD_PLATFORM)
include $(BUILD_STATIC_LIBRARY)

endif
