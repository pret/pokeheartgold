CC := gcc
CFLAGS := -O2 -g -Wno-unused-result

ifneq ($(DEBUG),1)
CFLAGS += -DNDEBUG
endif

programs := ntrextractfile ntruncompbw

.PHONY: all clean

all: $(programs)
	@:

clean:
	@$(RM) $(programs)

%: %.c
	$(CC) $(CFLAGS) -o $@ $<
