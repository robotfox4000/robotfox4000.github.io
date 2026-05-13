export ARCHS = armv6 armv7
export TARGET = iphone:clang:latest:6.0

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = RFoxObscura
RFoxObscura_FILES = main.m RFAppDelegate.m RFRootViewController.m
RFoxObscura_FRAMEWORKS = UIKit CoreGraphics
RFoxObscura_RESOURCE_FILES = Icon.png Info.plist
RFoxObscura_CFLAGS = -fno-objc-arc

include $(THEOS_MAKE_PATH)/application.mk
