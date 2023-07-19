LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),X6827)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
include $(CLEAR_VARS)