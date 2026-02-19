MODULES = jailed
include $(THEOS)/makefiles/common.mk

ARCHS = arm64 arm64e
TWEAK_NAME = PirateSky
DISPLAY_NAME = PirateSky
BUNDLE_ID = com.jawshoeadan.piratesky

PirateSky_FILES = Tweak.xm
PirateSky_IPA = /path/to/darksky.ipa
PirateSky_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk
