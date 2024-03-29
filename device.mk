#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

TARGET_HAS_NFC := true
TARGET_HAS_UDFPS := true

# Inherit from sdm710-common
$(call inherit-product, device/xiaomi/sdm710-common/sdm710.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_PACKAGES += \
    com.google.android.GoogleCameraEng \
    GoogleCameraENG \
    GoogleCamera_6gb_ram

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-aosp

# QDCM
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/qdcm/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# VNDK
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-vendorcompat

# WiFi
PRODUCT_PACKAGES += \
    TargetWifiOverlay

# Inherit from the proprietary version
$(call inherit-product, vendor/xiaomi/grus/grus-vendor.mk)
