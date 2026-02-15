#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile.
$(call inherit-product, device/tecno/LG7n/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

BOARD_VENDOR := TECNO
PRODUCT_NAME := lineage_LG7n
PRODUCT_DEVICE := LG7n
PRODUCT_MANUFACTURER := TECNO
PRODUCT_BRAND := TECNO
PRODUCT_MODEL := TECNO LG7n

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceName=LG7n \
    BuildFingerprint=TECNO/LG7n-GL/TECNO-LG7n:12/SP1A.210812.016/240530V1767:user/release-keys

# Lunaris-Aosp Flag
LUNARIS_BUILD_TYPE := Community
TARGET_BOOT_ANIMATION_RES := 720
TARGET_CUSTOM_UDFPS := false
TARGET_DISABLE_EPPE := true
WITH_GMS := true
WITH_BCR := true
TARGET_SUPPORTED_REFRESH_RATES := 60,90
