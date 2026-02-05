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
$(call inherit-product, vendor/miku/build/product/miku_product.mk)

BOARD_VENDOR := TECNO
PRODUCT_NAME := miku_LG7n
PRODUCT_DEVICE := LG7n
PRODUCT_MANUFACTURER := TECNO
PRODUCT_BRAND := TECNO
PRODUCT_MODEL := TECNO LG7n

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceName=LG7n \
    BuildFingerprint=TECNO/LG7n-GL/TECNO-LG7n:12/SP1A.210812.016/240530V1767:user/release-keys

# Miku Flag
TARGET_MIKU_BUILD_VARIANT := UNOFFICIAL
TARGET_BOOT_ANIMATION_RES := 720
TARGET_BUILD_APERTURE_CAMERA := false
MIKU_TYPE = GAPPS
PERF_ANIM_OVERRIDE := true
TARGET_MIKU_MASTER := Novicio MillenniumTeam
