.PHONY: all clean

CC := gcc
CFLAGS := -O3

.PHONY: all clean

all: mwasmarm_patcher
	@:

clean: ; $(RM) mwasmarm_patcher$(EXE)

mwasmarm_patcher: mwasmarm_patcher.c
	$(CC) $(CFLAGS) -o $@ $<
