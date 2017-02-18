#
# Lenovo aio_otfp hardwares
#
# by: daniel_hk (https://github.com/danielhk)
#
LOCAL_PATH := $(my-dir)
ifeq ($(TARGET_DEVICE),aio_otfp)
include $(call first-makefiles-under,$(LOCAL_PATH))
endif
