#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),xun)
include $(call all-makefiles-under,$(LOCAL_PATH))

# Prebuilt modules for system_dlkm. Every source file gets its own copy rule
# into lib/modules, and the destinations are what the partition image is built
# from. A rule whose target is the staging directory is what shipped an empty
# image: make treats an existing directory as up to date, and the file list the
# image build filters with then carries the directory instead of the modules.
SYSTEM_DLKM_MODULES_SRC_DIR := $(KERNEL_PATH)/modules/system
SYSTEM_DLKM_MODULES_DST_DIR := $(TARGET_OUT_SYSTEM_DLKM)/lib/modules
SYSTEM_DLKM_MODULES_SRC := $(shell find $(SYSTEM_DLKM_MODULES_SRC_DIR) -type f)
SYSTEM_DLKM_MODULES_COPY_PAIRS := $(foreach f,$(SYSTEM_DLKM_MODULES_SRC),\
    $(f):$(SYSTEM_DLKM_MODULES_DST_DIR)/$(patsubst $(SYSTEM_DLKM_MODULES_SRC_DIR)/%,%,$(f)))
ALL_DEFAULT_INSTALLED_MODULES += $(call copy-many-files,$(SYSTEM_DLKM_MODULES_COPY_PAIRS))

endif
