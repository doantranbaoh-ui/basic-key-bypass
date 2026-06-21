ARCHS = arm64
TARGET = iphone:clang:latest:10.0
include $(THEOS)/makefiles/common.mk
TWEAK_NAME = BasicKeyBypass
BasicKeyBypass_FILES = Tweak.xm
BasicKeyBypass_FRAMEWORKS = UIKit Foundation
BasicKeyBypass_CFLAGS = -fobjc-arc
include $(THEOS_MAKE_PATH)/tweak.mk
