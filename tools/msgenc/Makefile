CXXFLAGS := -std=c++17 -O2 -Wall -Wno-switch
CFLAGS   := -O2 -Wall -Wno-switch

ifeq ($(DEBUG),)
CXXFLAGS += -DNDEBUG
endif

DEPDIR := .deps
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d

SRCS := \
	msgenc.cpp \
	MessagesConverter.cpp \
	MessagesDecoder.cpp \
	MessagesEncoder.cpp

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
