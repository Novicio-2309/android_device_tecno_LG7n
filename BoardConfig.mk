# Include common chipset config
include device/tecno/mt6789-common/BoardConfigCommon.mk

# PATHS BASE SA MANIFEST MO
# LG7n-kernel = DTB, DTBO, at Modules
# common-kernel = Image.gz
KERNEL_PATH := device/tecno/LG7n-kernel
COMMON_KERNEL_PATH := device/millennium/common-kernel

# Boot image & DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/dtb

# Kernel Image Location
TARGET_NO_KERNEL_OVERRIDE := true
LOCAL_KERNEL := $(COMMON_KERNEL_PATH)/Image.gz

# Copy the image so the build system sees it as the kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Modules Safety Check (Para hindi sumablay ang zip packaging)
ifneq ($(wildcard $(KERNEL_PATH)/ramdisk/modules.load),)
    BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/ramdisk/modules.load))
    BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(KERNEL_PATH)/ramdisk/, $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD))
endif

ifneq ($(wildcard $(KERNEL_PATH)/vendor_dlkm/modules.load),)
    BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/vendor_dlkm/modules.load))
    BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(KERNEL_PATH)/vendor_dlkm/*.ko)
endif

# OTA & SEPolicy
TARGET_OTA_ASSERT_DEVICE := LG7n,TECNO-LG7n,lg7n
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Inherit proprietary files
include vendor/tecno/LG7n/BoardConfigVendor.mk
