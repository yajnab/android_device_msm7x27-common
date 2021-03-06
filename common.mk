# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## Audio
PRODUCT_PACKAGES += \
    audio_policy.msm7x27 \
    audio.primary.msm7x27

## Camera
PRODUCT_PACKAGES += \
    libcamera \
    LegacyCamera

# FM Radio
PRODUCT_PACKAGES += \
    Effem \
    libfmradio.bcm2049

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/com.stericsson.hardware.fm.receiver.xml:system/etc/permissions/com.stericsson.hardware.fm.receiver.xml

## GPS
PRODUCT_PACKAGES += \
    librpc

## HW Composer
PRODUCT_PACKAGES += \
    hwcomposer.msm7x27

## Other
PRODUCT_PACKAGES += \
    lights.msm7x27 \
    power.msm7x27 \
    make_ext4fs \
    brcm_patchram_plus \
    setup_fs

## Vold config
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/etc/vold.fstab:system/etc/vold.fstab

## Hardware properties
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## Wi-Fi & networking
PRODUCT_COPY_FILES += \
device/samsung/msm7x27-common/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/msm7x27-common/prebuilt/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/msm7x27-common/prebuilt/etc/wifi/dhcpcd.conf:system/etc/wifi/dhcpcd.conf \
    device/samsung/msm7x27-common/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/msm7x27-common/prebuilt/bin/get_macaddrs:system/bin/get_macaddrs

## Media
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/msm7x27-common/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/msm7x27-common/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/msm7x27-common/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/msm7x27-common/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml

## Touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# GPS conf
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/etc/gps.conf:system/etc/gps.conf

## Loop ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=3000

## Ramdisk
## SAMSUNG_BOOTLOADER is the product model changed into appropriate string parsed by init.
## Example: -GT-I5500 becomes gt-i5500board, -GT-S5830 becomes gt-s5830board, and so on.
PRODUCT_COPY_FILES += \
    device/samsung/callisto/ramdisk/CALLISTO.rle:root/CALLISTO.rle \
    device/samsung/callisto/ramdisk/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/callisto/ramdisk/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/callisto/ramdisk/modules/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/callisto/ramdisk/modules/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/callisto/ramdisk/modules/rfs_glue.ko:root/lib/modules/rfs_glue.ko


## ICS GPS blob
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/lib/hw/gps.msm7x27.so:system/lib/hw/gps.msm7x27.so

# Inherit qcom/msm7x27
$(call inherit-product, device/qcom/msm7x27/msm7x27.mk)

# Install/Uninstall google apps
$(call inherit-product, vendor/google/gapps_armv6_tiny.mk)

# Common assets
PRODUCT_AAPT_CONFIG := normal ldpi mdpi
PRODUCT_LOCALES += en

# Samsung msm7x27-common overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/callisto/overlay

# Build.prop overrides
PRODUCT_PROPERTY_OVERRIDES += \
    hwui.render_dirty_regions=false \
    pm.sleep_mode=1
