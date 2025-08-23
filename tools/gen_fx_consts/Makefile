CC = gcc
CFLAGS := -O3 -g -DNDEBUG -DSOURCE_DIR="\"$(CURDIR)\""

SRCS := main.c fx_encode.c fx_data.c
OBJS := $(SRCS:%.c=%.o)

prog := gen_fx_consts

.PHONY: all clean

DEPDIR := .deps
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d

all: $(prog)
	@:

clean: ; $(RM) -r $(DEPDIR) $(OBJS) $(prog) $(prog).exe

$(prog): $(OBJS)
	$(CC) $(LDFLAGS) -lm -o $@ $^

$(OBJS): %.o: %.c
$(OBJS): %.o: %.c $(DEPDIR)/%.d | $(DEPDIR)
	$(CC) $(CFLAGS) $(DEPFLAGS) -c -o $@ $<

$(DEPDIR): ; mkdir -p $@

DEPFILES := $(SRCS:%.c=$(DEPDIR)/%.d)
$(DEPFILES):

include $(wildcard $(DEPFILES))
