#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/tecno/mt6789-common/BoardConfigCommon.mk

# DITO NATIN I-FIX: Gagamit tayo ng path sa loob ng LG7n folder
# Siguraduhin na may folder ka na 'prebuilts' sa device/tecno/LG7n/
KERNEL_PATH := device/tecno/LG7n/prebuilts

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := luminance

# Boot image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Display
TARGET_SCREEN_DENSITY := 296

# DTB
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/dtb

# Kernel
TARGET_NO_KERNEL_OVERRIDE := true
LOCAL_KERNEL := $(KERNEL_PATH)/Image.gz

# Verify and Copy Kernel Image
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Kernel modules (Safe check para sa Miku UI)
ifneq ($(wildcard $(KERNEL_PATH)/ramdisk/modules.load),)
    BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/ramdisk/modules.load))
    BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(KERNEL_PATH)/ramdisk/, $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD))
endif

ifneq ($(wildcard $(KERNEL_PATH)/ramdisk/modules.load.recovery),)
    BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/ramdisk/modules.load.recovery))
    RECOVERY_MODULES := $(addprefix $(KERNEL_PATH)/ramdisk/, $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD))
    BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(sort $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES) $(RECOVERY_MODULES))
endif

ifneq ($(wildcard $(KERNEL_PATH)/vendor_dlkm/modules.load),)
    BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/vendor_dlkm/modules.load))
    BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(KERNEL_PATH)/vendor_dlkm/*.ko)
endif

# OTA assert
TARGET_OTA_ASSERT_DEVICE := LG7n,TECNO-LG7n,lg7n

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/properties/vendor.prop

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Workaround para sa Soong (i-comment out kung wala kang kernel-headers folder)
# TARGET_KERNEL_SOURCE := $(KERNEL_PATH)/kernel-headers

# Inherit the proprietary files
include vendor/tecno/LG7n/BoardConfigVendor.mk
