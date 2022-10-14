# Copyright (C) 2014 The CyanogenMod Project
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

LOCAL_PATH := device/samsung/j1pop3g

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Keylayouts
KEYLAYOUT_FILES := \
	$(LOCAL_PATH)/keylayouts/ist30xx_ts_input.kl \
	$(LOCAL_PATH)/keylayouts/sci-keypad.kl

PRODUCT_COPY_FILES += \
	$(foreach f,$(KEYLAYOUT_FILES),$(f):system/usr/keylayout/$(notdir $(f)))

# Filesystem management tools
PRODUCT_PACKAGES += \
	setup_fs \
	e2fsck \
	f2fstat \
	fsck.f2fs \
	fibmap.f2fs \
	mkfs.f2fs
	
# TinyAlsa utils
PRODUCT_PACKAGES += \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo

# Media config
MEDIA_CONFIGS := \
	$(LOCAL_PATH)/media/media_codecs.xml \
	$(LOCAL_PATH)/media/media_profiles.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_CONFIGS),$(f):system/etc/$(notdir $(f)))

# Bluetooth
PRODUCT_PACKAGES += \
	libbluetooth_jni \
	bluetooth.default \
	bt_vendor.conf
	
# camera configs
USE_CAMERA_STUB := true
BOARD_USE_SPRD_COLORFORMAT := true
#back camera rotation capture
TARGET_BOARD_BACK_CAMERA_ROTATION := false
#front camera rotation capture
TARGET_BOARD_FRONT_CAMERA_ROTATION := false
# camera sensor type
CAMERA_SENSOR_TYPE_BACK := "s5k4h5yc_mipi"
CAMERA_SENSOR_TYPE_FRONT := "s5k5e3yx_mipi"
# select camera 2M,3M,5M,8M
CAMERA_SUPPORT_SIZE := 8M
FRONT_CAMERA_SUPPORT_SIZE := 5M
TARGET_BOARD_CAMERA_SMJ320 := true
TARGET_BOARD_NO_FRONT_SENSOR := false
TARGET_BOARD_CAMERA_FLASH_CTRL := false
#read otp method 1:from kernel 0:from user
TARGET_BOARD_CAMERA_READOTP_METHOD := 1
#face detect
TARGET_BOARD_CAMERA_FACE_DETECT := true
TARGET_BOARD_CAMERA_FD_LIB := omron
#hdr
TARGET_BOARD_CAMERA_HDR_CAPTURE := true
#sensor interface
TARGET_BOARD_BACK_CAMERA_INTERFACE := mipi
TARGET_BOARD_FRONT_CAMERA_INTERFACE := mipi
#select camera zsl cap mode
TARGET_BOARD_CAMERA_CAPTURE_MODE := true
#select camera zsl force cap mode
TARGET_BOARD_CAMERA_FORCE_ZSL_MODE := true
#sprd zsl feature
TARGET_BOARD_CAMERA_SPRD_PRIVATE_ZSL := false
#rotation capture
TARGET_BOARD_CAMERA_ROTATION_CAPTURE := false
#select camera not support autofocus
TARGET_BOARD_CAMERA_NO_AUTOFOCUS_DEV := false
#uv denoise enable
TARGET_BOARD_CAMERA_CAPTURE_DENOISE := false
#y denoise enable
TARGET_BOARD_CAMERA_Y_DENOISE := true
#select continuous auto focus
TARGET_BOARD_CAMERA_CAF := true
TARGET_BOARD_CAMERA_NO_FLASH_DEV := false
#image angle in different project
TARGET_BOARD_CAMERA_ADAPTER_IMAGE := 0
#pre_allocate capture memory
TARGET_BOARD_CAMERA_PRE_ALLOC_CAPTURE_MEM := true
#sc8830g isp ver 0;sc9630 isp ver 1;sp9832a_2h11 isp version 2
TARGET_BOARD_CAMERA_ISP_SOFTWARE_VERSION := 2
#set hal version to 1.0
TARGET_USES_MEDIA_EXTENSIONS := true
TARGET_BOARD_CAMERA_HAL_VERSION := 1.0
#support auto anti-flicker
TARGET_BOARD_CAMERA_ANTI_FLICKER := true
#multi cap memory mode
TARGET_BOARD_MULTI_CAP_MEM := true
#low capture memory
TARGET_BOARD_LOW_CAPTURE_MEM := true
#select the vcm chip driver BU64241GWZ
TARGET_VCM_BU64241GWZ := true
#select mipi d-phy mode(none, phya, phyb, phyab)
TARGET_BOARD_FRONT_CAMERA_MIPI := phyb
TARGET_BOARD_BACK_CAMERA_MIPI := phya
#select ccir pclk src(source0, source1)
TARGET_BOARD_FRONT_CAMERA_CCIR_PCLK := source0
TARGET_BOARD_BACK_CAMERA_CCIR_PCLK := source0
#third lib
TARGET_BOARD_USE_THRID_LIB := true
TARGET_BOARD_USE_THIRD_AWB_LIB_A := true
TARGET_BOARD_USE_ALC_AE_AWB := false
TARGET_BOARD_USE_THIRD_AF_LIB_A := true

# Doze
PRODUCT_PACKAGES += \
	SamsungDoze
	Snap \
	Torch
	
# Codecs
PRODUCT_PACKAGES += \
	libstagefrighthw \
	libstagefright_sprd_soft_mpeg4dec \
	libstagefright_sprd_soft_h264dec \
	libstagefright_sprd_mpeg4dec \
	libstagefright_sprd_mpeg4enc \
	libstagefright_sprd_h264dec \
	libstagefright_sprd_h264enc \
	libstagefright_sprd_vpxdec \
	libstagefright_sprd_aacdec \
	libstagefright_sprd_mp3dec \
	libomx_aacdec_sprd.so \
	libomx_avcdec_hw_sprd.so \
	libomx_avcdec_sw_sprd.so \
	libomx_avcenc_hw_sprd.so \
	libomx_m4vh263dec_hw_sprd.so \
	libomx_m4vh263dec_sw_sprd.so \
	libomx_m4vh263enc_hw_sprd.so \
	libomx_mp3dec_sprd.so \
	libomx_vpxdec_hw_sprd.so

# Lights
PRODUCT_PACKAGES += \
	lights.sc8830

# Device-specific packages
PRODUCT_PACKAGES += \
	SamsungServiceMode

# BT configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bluetooth/iop_bt.db:system/etc/bluetooth/iop_bt.db \
    $(LOCAL_PATH)/configs/bluetooth/iop_device_list.conf:system/etc/bluetooth/iop_device_list.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant/mcs.ini:system/etc/wifi/mcs.ini \
    $(LOCAL_PATH)/configs/wpa_supplicant/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wpa_supplicant/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wpa_supplicant/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf
	
# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.primary.sc8830 \
    audio_policy.sc8830 \
    libaudioresampler \
    audio.r_submix.default

# Use prebuilt webviewchromium
PRODUCT_PACKAGES += \
	webview \
	libwebviewchromium_loader.so \
	libwebviewchromium_plat_support.so

# Wifi
PRODUCT_PACKAGES += \
    hostapd \
    libwpa_client \
    wpa_supplicant

WIFI_CONFIGS := \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0

PRODUCT_COPY_FILES += \
	$(foreach f,$(WIFI_CONFIGS),$(f):system/etc/wifi/$(notdir $(f)))
	
# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Permissions
PERMISSION_XML_FILES := \
	$(LOCAL_PATH)/permissions/platform.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.software.sip.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml


PRODUCT_COPY_FILES += \
	$(foreach f,$(PERMISSION_XML_FILES),$(f):system/etc/permissions/$(notdir $(f)))

# Scripts
SCRIPTS_FILES := \
	$(LOCAL_PATH)/scripts/zram.sh

PRODUCT_COPY_FILES += \
	$(foreach f,$(SCRIPTS_FILES),$(f):system/bin/$(notdir $(f)))

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

# Device props
PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=false

# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-flags=--no-watch-dog \
	dalvik.vm.dex2oat-filter=everything \
	dalvik.vm.image-dex2oat-filter=everything \
	ro.sys.fw.dex2oat_thread_count=4

# Support for Browser's saved page feature. This allows
# for pages saved on previous versions of the OS to be
# viewed on the current OS.
PRODUCT_PACKAGES += \
	libskia_legacy

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_j1pop3g
PRODUCT_DEVICE := j1pop3g
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SM-J110H
