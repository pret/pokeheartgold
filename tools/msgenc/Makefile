FOUND_PUGIXML := $(shell pkg-config --exists pugixml && echo yes)
ifneq ($(FOUND_PUGIXML),yes)
$(error Missing required packages: "pugixml")
endif

CXXFLAGS := -std=c++17 -O2 -Wall -Wno-switch $(shell pkg-config --cflags pugixml)
CFLAGS   := -O2 -Wall -Wno-switch
LDFLAGS  := $(shell pkg-config --libs pugixml)

ifeq ($(DEBUG),)
CXXFLAGS += -DNDEBUG
endif

DEPDIR := .deps
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d

SRCS := \
	msgenc.cpp \
	MessagesConverter.cpp \
	MessagesDecoder.cpp \
	MessagesEncoder.cpp \
	Gmm.cpp

OBJS := $(SRCS:%.cpp=%.o)

.PHONY: all clean

all: msgenc
	@:

clean:
	$(RM) -r msgenc msgenc.exe $(OBJS) $(DEPDIR)

msgenc: $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $^

%.o: %.cpp
%.o: %.cpp $(DEPDIR)/%.d | $(DEPDIR)
	$(CXX) $(CXXFLAGS) $(DEPFLAGS) -c -o $@ $<

$(DEPDIR): ; @mkdir -p $@

DEPFILES := $(SRCS:%.cpp=$(DEPDIR)/%.d)
$(DEPFILES):

include $(wildcard $(DEPFILES))
