ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
TARGET = iphone:clang:latest:10.0

include $(THEOS)/makefiles/common.mk

FRAMEWORK_NAME = BasicKey

$(FRAMEWORK_NAME)_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText
$(FRAMEWORK_NAME)_LDFLAGS += API/libBasicKey.a
$(FRAMEWORK_NAME)_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG -I. -fobjc-arc
$(FRAMEWORK_NAME)_FILES = Tweak.xm
$(FRAMEWORK_NAME)_OBJCFLAGS = -fobjc-arc -I.

include $(THEOS_MAKE_PATH)/framework.mk

after-install::
	install.exec "killall -9 kgvn || :"
	mkdir -p $(THEOS_STAGING_DIR)/Frameworks/$(FRAMEWORK_NAME).framework
	cp Info.plist $(THEOS_STAGING_DIR)/Frameworks/$(FRAMEWORK_NAME).framework
	mkdir -p $(THEOS_STAGING_DIR)/Frameworks/$(FRAMEWORK_NAME).framework/Headers
	cp -R Headers/. $(THEOS_STAGING_DIR)/Frameworks/$(FRAMEWORK_NAME).framework/Headers
	mkdir -p $(THEOS_STAGING_DIR)/Frameworks/$(FRAMEWORK_NAME).framework/Modules
	cp Modules/module.modulemap $(THEOS_STAGING_DIR)/Frameworks/$(FRAMEWORK_NAME).framework/Modules

clean::
	rm -rf ./packages/*
