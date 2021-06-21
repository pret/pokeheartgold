# Supply a GNU ARM Embedded toolchain for objcopy, ar, etc.

ifdef DEVKITARM
TOOLCHAIN := $(DEVKITARM)
endif

ifdef TOOLCHAIN
export PATH := $(TOOLCHAIN)/bin:$(PATH)
endif

PREFIX := arm-none-eabi-

OBJCOPY := $(PREFIX)objcopy
AR      := $(PREFIX)ar
