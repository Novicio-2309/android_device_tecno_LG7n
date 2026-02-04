# RemovePkgs.mk
# Removing unwanted apps

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := RemovePkgs
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional

# Override to remove chromegay
LOCAL_OVERRIDES_PACKAGES := \
    Chrome \
    Chrome64 \
    Chrome-stub \
    Chrome-Stub \
    PlayAutoInstallConfig \
    com.android.chrome

# Optional:
LOCAL_OVERRIDES_PACKAGES += \
    YouTube \
    YTMusic \
    Browser2 \
    Personal Safety

LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := /dev/null

include $(BUILD_PREBUILT)
