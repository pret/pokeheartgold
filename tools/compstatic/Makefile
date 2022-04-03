CC := gcc
CFLAGS := -O3

SRCS = $(wildcard *.c)
INCLUDES = $(wildcard *.h)

.PHONY: all clean

all: compstatic
	@:

compstatic: $(SRCS) $(INCLUDES)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	$(RM) compstatic compstatic.exe
