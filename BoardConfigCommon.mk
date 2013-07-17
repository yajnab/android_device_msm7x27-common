# Copyright (C) 2007 The Android Open Source Project
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

# BoardConfigCommon.mk
#
# Product-common compile-time definitions.
#

## Define BOARD_HAVE_BLUETOOTH_BLUEZ before device/qcom/msm7x27/BoardConfigCommon.mk
## Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_BLUETOOTH_BLUEZ := true
BOARD_HAVE_SAMSUNG_BLUETOOTH := true
#BOARD_BLUEDROID_VENDOR_CONF := device/samsung/msm7x27-common/bluetooth/vnd_samsung.txt

# Use the Qualcomm common folder
include device/qcom/msm7x27/BoardConfigCommon.mk

## Kernel
BOARD_KERNEL_BASE := 0x13600000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_PAGE_SIZE := 0x00001000
TARGET_KERNEL_SOURCE := kernel/samsung/msm7x27
TARGET_PROVIDES_INIT_TARGET_RC := true

## Platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_SPECIFIC_HEADER_PATH := device/samsung/msm7x27-common/include

## Webkit
ENABLE_WEBGL := true
TARGET_WEBKIT_USE_MORE_MEMORY := true

## Camera
USE_CAMERA_STUB := false
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true

## Qualcomm, display
TARGET_NO_HW_VSYNC := false
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_QCOM
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
BOARD_EGL_NEEDS_LEGACY_FB := true
TARGET_GLOBAL_CPPFLAGS += -mfpu=vfp -mfloat-abi=softfp -Os

## GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27
BOARD_USES_QCOM_LIBRPC := true

## FM
BOARD_HAVE_QCOM_FM := true
BOARD_HAVE_FM_RADIO := true
COMMON_GLOBAL_CFLAGS += -DHAVE_FM_RADIO -DQCOM_FM_ENABLED
BOARD_FM_DEVICE := bcm2049

## Wi-Fi
BOARD_HOSTAPD_DRIVER := y
WPA_SUPPLICANT := true
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_WLAN_DEVICE := wlan0
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION := VER_0_6_X
WPA_BUILD_SUPPLICANT := true
WIFI_DRIVER_MODULE_PATH := /system/wifi/ar6000.ko
WIFI_DRIVER_MODULE_NAME := ar6000

## Wi-Fi Hotspot
BOARD_HAVE_LEGACY_HOSTAPD := true
BOARD_HOSTAPD_NO_ENTROPY := true

## RIL
TARGET_PROVIDES_LIBRIL := true
BOARD_USES_LEGACY_RIL := true
BOARD_FORCE_RILD_AS_ROOT := true
BOARD_MOBILEDATA_INTERFACE_NAME := "pdp0"
BOARD_RIL_CLASS := ../../../device/samsung/msm7x27-common/ril/

## UMS
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/vold/179:1
BOARD_SDEXT_DEVICE := /dev/block/vold/179:2
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_UMS_LUNFILE := /sys/devices/platform/usb_mass_storage/lun0/file

## Legacy touchscreen support
BOARD_USE_LEGACY_TOUCHSCREEN := true

## Device specific libs
TARGET_PROVIDES_LIBAUDIO := true
TARGET_PROVIDES_LIBLIGHT := true

## Audio: combo device supported
BOARD_COMBO_DEVICE_SUPPORTED := true

## Samsung has weird framebuffer
TARGET_NO_INITLOGO := true

## Fix colors in panorama mode
BOARD_CPU_COLOR_CONVERT := true

## Recovery
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 219938816
BOARD_USERDATAIMAGE_PARTITION_SIZE := 190054400
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_KERNEL_CMDLINE :=
BOARD_BML_BOOT := "/dev/block/bml9"
BOARD_BML_RECOVERY := "/dev/block/bml10"
BOARD_RECOVERY_HANDLES_MOUNT := true

## OTA script extras file (build/tools/releasetools)
TARGET_OTA_EXTRAS_FILE := device/samsung/msm7x27-common/releasetools-extras.txt
