CC := gcc
CFLAGS := -O3

.PHONY: all clean

all: fixrom
	@:

fixrom: fixrom.c
	$(CC) $(CFLAGS) -o $@ $^

clean:
	$(RM) fixrom fixrom.exe
