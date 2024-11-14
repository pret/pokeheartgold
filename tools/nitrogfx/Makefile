CC = gcc

HAVE_LIBPNG := $(shell pkg-config libpng; echo $?)

ifeq ($(HAVE_LIBPNG),1)
$(error No package 'libpng' found)
endif

CFLAGS = -Wall -Wextra -Werror -Wno-sign-compare -std=gnu17 -DPNG_SKIP_SETJMP_CHECK $(shell pkg-config --cflags libpng zlib)

LIBS = $(shell pkg-config --libs libpng zlib)

SRCS = main.c convert_png.c gfx.c jasc_pal.c lz.c rl.c util.c font.c huff.c json.c cJSON.c
OBJS = $(SRCS:%.c=%.o)

.PHONY: all clean

all: nitrogfx
	@:

nitrogfx-debug: $(SRCS) convert_png.h gfx.h global.h jasc_pal.h lz.h rl.h util.h font.h json.h cJSON.h
	$(CC) $(CFLAGS) -g -DDEBUG $(SRCS) -o $@ $(LDFLAGS) $(LIBS)

nitrogfx: $(SRCS) convert_png.h gfx.h global.h jasc_pal.h lz.h rl.h util.h font.h json.h cJSON.h
	$(CC) $(CFLAGS) -O2 $(SRCS) -o $@ $(LDFLAGS) $(LIBS)

clean:
	$(RM) -r nitrogfx nitrogfx.exe $(OBJS)
