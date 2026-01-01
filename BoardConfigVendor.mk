# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Path to proprietary files
PROPRIETARY_PATH := /home/thiwa21062016/EvolutionQ1/vendor/samsung/a15/proprietary

# Copy vendor/system/etc, lib, lib64, system_ext, vendor, odm
BOARD_VENDOR_PROPRIETARY_FILES := \
    $(PROPRIETARY_PATH)/etc \
    $(PROPRIETARY_PATH)/lib \
    $(PROPRIETARY_PATH)/lib64 \
    $(PROPRIETARY_PATH)/system_ext \
    $(PROPRIETARY_PATH)/vendor \
    $(PROPRIETARY_PATH)/odm

# Include proprietary files in the build
$(foreach file,$(BOARD_VENDOR_PROPRIETARY_FILES),$(eval $(call inherit-product-if-exists,$(file)/Android.mk)))

