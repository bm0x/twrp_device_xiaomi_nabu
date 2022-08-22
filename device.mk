#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/xiaomi/nabu

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/nabu/nabu-vendor.mk)

# API
PRODUCT_TARGET_VNDK_VERSION := 30
PRODUCT_SHIPPING_API_LEVEL := 30

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Virtual A/B OTA
$(call inherit-product, \
    $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

#A/B
BOARD_USES_RECOVERY_AS_BOOT := true
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot

# A/B
ENABLE_VIRTUAL_AB := true
TARGET_IS_VAB := true

#A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

#Settings for nabu (Rootdir)
PRODUCT_IS_XIAOMI_NABU := true

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
    
PRODUCT_PACKAGES_DEBUG += update_engine_client
PRODUCT_PACKAGES += \
  update_engine \
  update_engine_client \
  update_engine_sideload \
  update_verifier
  
PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script
    
# AVB
PRODUCT_PACKAGES += \
    q-gsi.avbpubkey \
    r-gsi.avbpubkey \
    s-gsi.avbpubkey
    
# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-impl-wrapper.recovery \
    android.hardware.boot@1.2-impl-wrapper \
    android.hardware.boot@1.2-impl.recovery \
    bootctrl.msmnile \
    bootctrl.msmnile.recovery \
    libgptutils \
    libz \
    libcutils
    
PRODUCT_PACKAGES_DEBUG += \
    bootctl

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# RenderScript
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl
    
# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    android.hardware.fastboot@1.1-impl-mock.recovery \
    fastbootd

# Filesystem
PRODUCT_PACKAGES += \
    fs_config_files

# tzdata
PRODUCT_PACKAGES_ENG += \
    tzdata_twrp
    
# Atrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service
    
# OTA
PRODUCT_HOST_PACKAGES += \
    signapk
    
# OEM otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
   $(LOCAL_PATH)/security/miui

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl.recovery

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.base@1.2 \
    android.hidl.base@1.2.vendor \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0.vendor \
    android.hidl.memory.block@1.0 \
    android.hidl.memory.block@1.0.vendor \
    libhidltransport.vendor \
    libhwbinder.vendor
    
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

PRODUCT_SOONG_NAMESPACES += \
    hardware/qcom-caf/sm8150/display

PRODUCT_SOONG_NAMESPACES += \
    hardware/google/interfaces \
    hardware/google/pixel

# Rootdir
PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.qti.chg_policy.sh \
    init.qti.dcvs.sh

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.nfc.rc \
    init.qcom.power.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.recovery.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc
    
# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.memtrack-service.example \
    vendor.qti.hardware.display.allocator@1.0 \
    vendor.qti.hardware.display.allocator@3.0 \
    vendor.qti.hardware.display.allocator@4.0 \
    vendor.qti.hardware.display.composer@1.0 \
    vendor.qti.hardware.display.composer@2.0 \
    vendor.qti.hardware.display.mapper@1.0 \
    vendor.qti.hardware.display.mapper@1.1 \
    vendor.qti.hardware.display.mapper@2.0 \
    vendor.qti.hardware.display.mapper@3.0 \
    vendor.qti.hardware.display.mapper@4.0 \
    vendor.qti.hardware.qdutils_disp@1.0 \
    vendor.qti.hardware.display.mapperextensions@1.0 \
    vendor.qti.hardware.display.mapperextensions@1.1 \
    vendor.display.postproc@1.0 \
    vendor.qti.hardware.qdutils_disp@1.0 \
    vendor.xiaomi.hardware.display@1.0 \
    displayfeature.default \
    vendor.xiaomi.hardware.displayfeature@1.0-impl \
    vendor.xiaomi.hardware.displayfeature@1.0 \
    vendor.xiaomi.hardware.displayfeature@1.0-service \
    vendor.xiaomi.hardware.displayfeature@1.0-service.rc

PRODUCT_PACKAGES += \
    vendor.display.config@1.10 \
    vendor.display.config@1.11 \
    vendor.display.config@2.0 \
    vendor.display.color@1.0 \
    vendor.display.color@1.1 \
    vendor.display.color@1.2 \
    vendor.display.color@1.3 \
    vendor.display.color@1.4 \
    vendor.display.color@1.5

PRODUCT_PACKAGES += \
    libdisplayconfig.qti \
    libdisplayconfig.qti.vendor \
    libqdMetaData \
    libsdmcore \
    libsdmutils \
    libtinyxml \
    libtinyxml.vendor \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    memtrack.msmnile \
    vndservicemanager \
    hwcomposer.msmnile \
    gralloc.msmnile \
    gralloc.default \
    a612_rgmu.bin \
    a618_gmu.bin \
    a630_gmu.bin \
    a630_sqe.fw \
    a640_gmu.bin \
    a640_zap.b00 \
    a640_zap.b01 \
    a640_zap.b02 \
    a640_zap.elf \
    a640_zap.mdt
    
#DISPLAY CONFIGS
PRODUCT_PACKAGES += \
    qdcm_calib_data_xiaomi_36_02_0b_video_mode_dual_dsi_cphy_panel.xml \
    qdcm_calib_data_xiaomi_42_02_0a_video_mode_dual_dsi_cphy_panel.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/snapdragon_color_libs_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/snapdragon_color_libs_config.xml

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.xiaomi
    
# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge
    
PRODUCT_PACKAGES += \
    libcurl

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti
    
# PowerStats
PRODUCT_PACKAGES += \
    android.hardware.power.stats@1.0-service.mock
    
# QMI
PRODUCT_PACKAGES += \
    libjson \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

# RIL
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librmnetctl \
    libxml2
    
# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.2-service-qti
   
# Vendor libstdc++
PRODUCT_PACKAGES += \
    libstdc++.vendor
    
#VNDK
PRODUCT_PACKAGES += \
    libgui_vendor \
    vndservicemanager 

# Vulkan
PRODUCT_PACKAGES += \
    libvulkan

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi
    
TARGET_RECOVERY_DEVICE_MODULES += \
    ashmemd \
    ashmemd_aidl_interface-cpp \
    bootctrl.$(TARGET_BOARD_PLATFORM).recovery \
    libashmemd_client \
    libcap \
    libpcrecpp \
    libxml2
    
TARGET_RECOVERY_DEVICE_MODULES += libion libandroidicu vendor.display.config@1.0 vendor.display.config@2.0 libdisplayconfig.qti

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/$(PRODUCT_RELEASE_NAME)/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so    
