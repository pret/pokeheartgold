DEBUG    ?= 1

CC       ?= gcc
CXX      ?= g++
ifneq ($(DEBUG),1)
OPTFLAGS += -O3
DEFINES  += -DNDEBUG
endif
CFLAGS   := $(OPTFLAGS) $(DEFINES) -g
CXXFLAGS := $(OPTFLAGS) $(DEFINES) -g -std=c++17
LDFLAGS  :=

DEPDIR   := .deps
DEPFLAGS  = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d

PROGRAM  := mod123encry
CXXSRCS  := mod123encry.cpp NtrRom.cpp Decrypt.cpp Encrypt.cpp CryptoRc4.cpp Overlay.cpp
CXXOBJS  := $(CXXSRCS:%.cpp=%.o)
CSRCS    := ntruncompbw.c
COBJS    := $(CSRCS:%.c=%.o)
SRCS     := $(CXXSRCS) $(CSRCS)
OBJS     := $(CXXOBJS) $(COBJS)

.PHONY: all clean

all: $(PROGRAM)
	@:

$(PROGRAM): $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $^

clean:
	$(RM) $(PROGRAM) $(OBJS)
	$(RM) -r $(DEPDIR)

%.o: %.cpp
%.o: %.cpp $(DEPDIR)/%.d | $(DEPDIR)
	$(CXX) $(CXXFLAGS) $(DEPFLAGS) -c -o $@ $<

%.o: %.c
%.o: %.c $(DEPDIR)/%.d | $(DEPDIR)
	$(CC) $(CFLAGS) $(DEPFLAGS) -c -o $@ $<

$(DEPDIR): ; @mkdir -p $@

DEPFILES := $(CXXSRCS:%.cpp=$(DEPDIR)/%.d) $(CSRCS:%.c=$(DEPDIR)/%.d)
$(DEPFILES):

include $(wildcard $(DEPFILES))
