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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a2 developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from nabu device
$(call inherit-product, device/xiaomi/nabu/device.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/xiaomi/nabu/recovery/root,recovery/root) \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root/vendor/firmware,$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware) \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root/system,$(TARGET_COPY_OUT_RECOVERY)/root/system) \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root/vendor/etc,$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc) \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root/vendor/lib,$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib) \
$(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root/vendor/lib64,$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := nabu
PRODUCT_NAME := twrp_nabu
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := 21051182G
PRODUCT_MANUFACTURER := xiaomi
PRODUCT_RELEASE_NAME := nabu