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

# Installs gsi keys into ramdisk, to boot a2 developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Virtual A/B Inherits
#(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Inherit from nabu device
$(call inherit-product, device/xiaomi/nabu/device.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64bit.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/xiaomi/nabu/recovery/root,recovery/root) \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root/vendor/firmware,$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware) \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root/system,$(TARGET_COPY_OUT_RECOVERY)/root/system)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := nabu
PRODUCT_NAME := twrp_nabu
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := 21051182G
PRODUCT_MANUFACTURER := xiaomi
PRODUCT_RELEASE_NAME := nabu
