# Copyright (C) 2017 The Android Open Source Project
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
#
# 2017/01/19
# Initial commit by daniel_hk (https://github.com/daniel_hk)
# BOARD_<color>_LED_PATH define the target path(s)

LOCAL_PATH:= $(call my-dir)

# add your device if not mt6752
ifneq ($(filter mt6752,$(TARGET_BOARD_PLATFORM)),)

# HAL module implemenation, not prelinked and stored in
# hw/<COPYPIX_HARDWARE_MODULE_ID>.<ro.board.platform>.so
include $(CLEAR_VARS)

ifdef BOARD_RED_LED_PATH
LOCAL_CFLAGS += -DRED_LED_PATH=\"$(BOARD_RED_LED_PATH)\"
endif

ifdef BOARD_GREEN_LED_PATH
LOCAL_CFLAGS += -DGREEN_LED_PATH=\"$(BOARD_GREEN_LED_PATH)\"
endif

ifdef BOARD_BLUE_LED_PATH
LOCAL_CFLAGS += -DBLUE_LED_PATH=\"$(BOARD_BLUE_LED_PATH)\"
endif

LOCAL_SRC_FILES := lights.c

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := liblog

LOCAL_MODULE := lights.$(TARGET_BOARD_PLATFORM)

include $(BUILD_SHARED_LIBRARY)

endif # mt6752
