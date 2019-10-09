ARCHS = armv7 arm64 arm64e
TARGET = iphone:clang:11.2:9.0

INSTALL_TARGET_PROCESSES = Zebra

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ZebraAutoComplete

$(TWEAK_NAME)_FILES = Tweak.x
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
