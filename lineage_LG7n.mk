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

# Avium Flag
AVIUM_VERSION_APPEND_TIME_OF_DAY := true
AVIUM_MAINTAINER := Novicio301129
AVIUM_SETTINGS_SOC_MODEL_NAME := MT6789/MtkHelioG99
AVIUM_SETTINGS_DEVICE_CODENAME := TECNO POVA 4
TARGET_BOOT_ANIMATION_RES := 720
WITH_GMS := true
TARGET_INCLUDE_GOOGLEIME := true
TARGET_GOOGLEIME_OVERRIDE_IME := true
AVIUM_FORCE_SET_FAKE_PROP := true
TARGET_FORCE_ENABLE_BLUR := false
AVIUM_IS_OFFICIAL := false
