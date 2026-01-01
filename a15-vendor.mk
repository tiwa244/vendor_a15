# vendor/samsung/a15/a15-vendor.mk
#
# Hardcore vendor makefile for Samsung a15
# All proprietary paths are hardcoded

LOCAL_PATH := /home/thiwa21062016/EvolutionQ1/vendor/samsung/a15

# --- SYSTEM EXT ---
PRODUCT_COPY_FILES += \
# #     $(LOCAL_PATH)/proprietary/system_ext/*:system_ext/

# --- VENDOR ---
PRODUCT_COPY_FILES += \
# #     $(LOCAL_PATH)/proprietary/vendor/*:vendor/

# --- ODM ---
PRODUCT_COPY_FILES += \
# #     $(LOCAL_PATH)/proprietary/odm/*:odm/

# --- ETC ---
PRODUCT_COPY_FILES += \
# #     # # $(LOCAL_PATH)/proprietary/etc/*:etc/

# --- LIB ---
PRODUCT_COPY_FILES += \
# #     $(LOCAL_PATH)/proprietary/lib/*:lib/

# --- LIB64 ---
PRODUCT_COPY_FILES += \
# #     $(LOCAL_PATH)/proprietary/lib64/*:lib64/

