CC := gcc
CFLAGS := -O3

SRCS = $(wildcard *.c)
OBJS = $(SRCS:%.c=%.o)

.PHONY: all clean

all: compstatic
	@:

compstatic: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	$(RM) compstatic compstatic.exe $(OBJS)
