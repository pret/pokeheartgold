CC = gcc

CFLAGS = -Wall -Wextra -Werror -Wno-sign-compare -std=c11 -O2 -DPNG_SKIP_SETJMP_CHECK 

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
CFLAGS += -I $(HOMEBREW_PREFIX)/opt/libpng/include -L $(HOMEBREW_PREFIX)/opt/libpng/lib
endif

LIBS = -lpng -lz

SRCS = main.c convert_png.c gfx.c jasc_pal.c lz.c rl.c util.c font.c huff.c

.PHONY: all clean

all: nitrogfx
	@:

nitrogfx-debug: $(SRCS) convert_png.h gfx.h global.h jasc_pal.h lz.h rl.h util.h font.h
	$(CC) $(CFLAGS) -DDEBUG $(SRCS) -o $@ $(LDFLAGS) $(LIBS)

nitrogfx: $(SRCS) convert_png.h gfx.h global.h jasc_pal.h lz.h rl.h util.h font.h
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS) $(LIBS)

clean:
	$(RM) nitrogfx nitrogfx.exe
