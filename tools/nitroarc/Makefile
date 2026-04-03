.PHONY: all clean

CFLAGS := -std=c99 -MMD -Ilib/include -O3 -DNDEBUG
CFLAGS += -Wall -Wextra -Wpedantic -Wconversion -Wno-sign-conversion -Werror

ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

LIB_O := lib/nitroarc.o
SRC_O := $(patsubst %.c,%.o,$(wildcard src/*.c))
LIB   := libnitroarc.a
TOOL  := nitroarc$(EXE)

all: $(LIB) $(TOOL)

clean:
	$(RM) -r $(LIB_O) $(SRC_O) $(LIB) $(TOOL)

$(LIB): $(LIB_O)
	$(AR) rcs $@ $^

$(TOOL): $(SRC_O) $(LIB)
	$(CC) $(LDFLAGS) -o $@ $^

-include nitroarc.d
-include $(SRC_O:%.o=%.d)
