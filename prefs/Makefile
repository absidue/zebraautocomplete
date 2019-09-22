ARCHS = armv7 arm64 arm64e
TARGET = iphone:clang:11.2:9.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ZebraAutoCompletePrefs

ZebraAutoCompletePrefs_FILES = Preferences.m
ZebraAutoCompletePrefs_INSTALL_PATH = /Library/PreferenceBundles
ZebraAutoCompletePrefs_FRAMEWORKS = UIKit
ZebraAutoCompletePrefs_PRIVATE_FRAMEWORKS = Preferences
ZebraAutoCompletePrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ZebraAutoComplete.plist$(ECHO_END)
