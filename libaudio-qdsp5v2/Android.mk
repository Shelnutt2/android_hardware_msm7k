ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),ace)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := audio.primary.qdsp5v2
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_STATIC_LIBRARIES += libmedia_helper
LOCAL_WHOLE_STATIC_LIBRARIES := libaudiohw_legacy

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libutils \
    libmedia \
    libhardware_legacy \
    libsysutils \
    libdl

ifeq ($TARGET_OS)-$(TARGET_SIMULATOR),linux-true)
LOCAL_LDLIBS += -ldl
endif


LOCAL_SRC_FILES += AudioHardware.cpp

LOCAL_CFLAGS += -fno-short-enums

LOCAL_STATIC_LIBRARIES += A2dpAudioInterface

ifeq ($(BOARD_HAVE_BLUETOOTH),true)
   LOCAL_SHARED_LIBRARIES += audio.a2dp.default libbinder
endif

include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)

LOCAL_SRC_FILES:=   AudioPolicyManager.cpp

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libutils \
    libmedia



LOCAL_MODULE:= audio_policy.qdsp5v2
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_STATIC_LIBRARIES := libmedia_helper
LOCAL_WHOLE_STATIC_LIBRARIES := libaudiopolicy_legacy
LOCAL_MODULE_TAGS := optional

LOCAL_STATIC_LIBRARIES += libaudiointerface
ifeq ($(BOARD_HAVE_BLUETOOTH),true)
  LOCAL_SHARED_LIBRARIES += audio.a2dp.default
endif

include $(BUILD_SHARED_LIBRARY)

endif # TARGET_BOOTLOADER_BOARD_NAME

