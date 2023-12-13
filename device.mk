# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 TeamWin Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/infinix/X6815D

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Api level
PRODUCT_SHIPPING_API_LEVEL := 30

# Virtual A/B OTA
ENABLE_VIRTUAL_AB := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    gz \
    lk \
    logo \
    md1img \
    preloader \
    product \
    scp \
    spmfw \
    sspm \
    system \
    system_ext \
    tee \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor
   
# fastboot/d hal
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

# Health Hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

PRODUCT_PACKAGES_DEBUG += \
    bootctl

PRODUCT_PACKAGES += \
    bootctrl.mt6877 \
    bootctrl.mt6877.recovery

PRODUCT_PACKAGES += \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# Recovery modules
TARGET_RECOVERY_DEVICE_MODULES += \
    libresetprop
    libgatekeeper_aidl

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libresetprop.so
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper_aidl.so

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libresetprop.so
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper_aidl.so

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

