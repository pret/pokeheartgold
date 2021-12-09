CC := gcc
CFLAGS := -O2 -g

programs := ntrextractfile ntruncompbw

all: $(programs)
	@:

%: %.c
	$(CC) $(CFLAGS) -o $@ $<
