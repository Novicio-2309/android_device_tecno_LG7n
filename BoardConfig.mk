# Include the common chipset BoardConfig
include device/tecno/mt6789-common/BoardConfigCommon.mk

# Path Definitions base sa manifest mo
KERNEL_PATH := device/tecno/LG7n-kernel
COMMON_KERNEL_PATH := device/millennium/common-kernel

# Boot image & DTB (Galing sa LG7n-kernel folder)
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/dtb

# Kernel Image (Dito galing sa common-kernel folder)
TARGET_NO_KERNEL_OVERRIDE := true
LOCAL_KERNEL := $(COMMON_KERNEL_PATH)/Image.gz

# I-copy ang kernel image para sa final build
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Kernel modules (Base sa screenshot mo: dtb, ramdisk, vendor_dlkm)
ifneq ($(wildcard $(KERNEL_PATH)/ramdisk/modules.load),)
    BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/ramdisk/modules.load))
    BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(KERNEL_PATH)/ramdisk/, $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD))
endif

ifneq ($(wildcard $(KERNEL_PATH)/vendor_dlkm/modules.load),)
    BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/vendor_dlkm/modules.load))
    BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(KERNEL_PATH)/vendor_dlkm/*.ko)
endif

# OTA Assertions
TARGET_OTA_ASSERT_DEVICE := LG7n,TECNO-LG7n,lg7n

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Inherit proprietary files
include vendor/tecno/LG7n/BoardConfigVendor.mk
