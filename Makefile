INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Bana

Bana_FILES = Bana.xm
Bana_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
