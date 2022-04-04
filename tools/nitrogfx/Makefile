CC = gcc
LD = gcc

CFLAGS = -Wall -Wextra -Werror -Wno-sign-compare -std=c11 -O2 -DPNG_SKIP_SETJMP_CHECK $(shell pkg-config --cflags libpng)

LIBS = $(shell pkg-config --libs libpng)

SRCS = main.c convert_png.c gfx.c jasc_pal.c lz.c rl.c util.c font.c huff.c
OBJS = $(SRCS:%.c=%.o)

.PHONY: all clean

DEPDIR := .deps
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d

ifneq ($(DEBUG),)
CFLAGS += -DDEBUG
endif

all: nitrogfx
	@:

nitrogfx-debug: DEBUG = 1
nitrogfx-debug: nitrogfx

nitrogfx: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^ $(LIBS)

%.o: %.c
%.o: %.c $(DEPDIR)/%.d | $(DEPDIR)
	$(CC) $(CFLAGS) $(DEPFLAGS) -c -o $@ $<

clean:
	$(RM) nitrogfx nitrogfx.exe $(OBJS) $(DEPDIR)

$(DEPDIR): ; @mkdir -p $@

DEPFILES := $(SRCS:%.c=$(DEPDIR)/%.d)
$(DEPFILES):

include $(wildcard $(DEPFILES))
