ARCHS = armv7 armv7s arm64 arm64e
TARGET = iphone:clang:11.2:9.0

INSTALL_TARGET_PROCESSES = Zebra

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ZebraAutoComplete

ZebraAutoComplete_FILES = Tweak.x
ZebraAutoComplete_FRAMEWORKS = UIKit
ZebraAutoComplete_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
