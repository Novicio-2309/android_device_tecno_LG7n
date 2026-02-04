#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/tecno/LG7n
KERNEL_PATH := $(DEVICE_PATH)-kernel
COMMON_GKI_PATH := device/millennium/common-kernel

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1640
TARGET_SCREEN_WIDTH := 720

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1.vendor:64

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Overlays
PRODUCT_PACKAGES += \
	FrameworksResOverlayLG7n \
    SettingsProviderOverlayLG7n \
    SystemUIOverlayLG7n

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 31

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.mediatek

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/tecno/mt6789-common/common.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/tecno/LG7n/LG7n-vendor.mk)

# Signingkey
-include vendor/infinity-priv/keys/keys.mk
