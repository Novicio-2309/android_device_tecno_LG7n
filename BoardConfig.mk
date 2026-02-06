#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/tecno/mt6789-common/BoardConfigCommon.mk

# Path Definitions - Dito natin i-fix para hindi mag-null sa Miku UI
# Siguraduhin na ang mga folder na ito ay tumutugma sa actual files mo.
COMMON_GKI_PATH := device/tecno/mt6789-common/ILAGAY_DITO_KUNG_NASAAN_ANG_KERNEL
KERNEL_PATH := $(COMMON_GKI_PATH)

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
LOCAL_KERNEL := $(COMMON_GKI_PATH)/Image.gz

# I-verify kung nage-exist ang kernel bago i-copy para maiwasan ang packaging error
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Kernel modules
# Ginamitan natin ng wildcard check para hindi mag-crash ang build kung walang makitang file
ifeq ($(wildcard $(KERNEL_PATH)/ramdisk/modules.load),)
    $(warning WARNING: modules.load not found in $(KERNEL_PATH)/ramdisk/)
else
    BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/ramdisk/modules.load))
    BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(KERNEL_PATH)/ramdisk/, $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD))
endif

# Recovery modules
ifeq ($(wildcard $(KERNEL_PATH)/ramdisk/modules.load.recovery),)
    $(warning WARNING: modules.load.recovery not found!)
else
    BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/ramdisk/modules.load.recovery))
    RECOVERY_MODULES := $(addprefix $(KERNEL_PATH)/ramdisk/, $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD))
    BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(sort $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES) $(RECOVERY_MODULES))
endif

# Vendor modules (vendor_dlkm)
ifeq ($(wildcard $(KERNEL_PATH)/vendor_dlkm/modules.load),)
    $(warning WARNING: vendor_dlkm modules.load not found!)
else
    BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/vendor_dlkm/modules.load))
    BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(KERNEL_PATH)/vendor_dlkm/*.ko)
endif

# OTA assert
TARGET_OTA_ASSERT_DEVICE := LG7n,TECNO-LG7n,lg7n

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/properties/vendor.prop

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Workaround to make lineage's soong generator work
TARGET_KERNEL_SOURCE := $(COMMON_GKI_PATH)/kernel-headers

# Inherit the proprietary files
include vendor/tecno/LG7n/BoardConfigVendor.mk
