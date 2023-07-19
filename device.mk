LOCAL_PATH := device/infinix/X6827

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Api level
PRODUCT_SHIPPING_API_LEVEL := 30

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# Platform
PRODUCT_PLATFORM := mt6781

# Virtual A/B
ENABLE_VIRTUAL_AB := true

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
    android.hidl.base@1.0 \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-impl.recovery 

PRODUCT_PACKAGES += \
    bootctrl.mt6781 \
    libgptutils \
    libz \
    libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \



