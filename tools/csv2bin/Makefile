CXX ?= g++

CXXFLAGS := -std=c++17 -g

ifeq ($(DEBUG),)
CXXFLAGS += -O2 -DNDEBUG
endif

DEPDIR := .deps
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d

CXX_SRCS := main.cpp CsvFile.cpp Manifest.cpp Options.cpp

CXX_OBJS := $(CXX_SRCS:%.cpp=%.o)
SRCS     := $(CXX_SRCS)
OBJS     := $(CXX_OBJS)

PROGRAM  := csv2bin

.PHONY: all clean

all: $(PROGRAM)
	@:

clean:
	$(RM) -r $(PROGRAM) $(PROGRAM).exe $(OBJS) $(DEPDIR)

$(PROGRAM): $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $^

%.o: %.cpp
%.o: %.cpp $(DEPDIR)/%.d | $(DEPDIR)
	$(CXX) $(CXXFLAGS) $(DEPFLAGS) -c -o $@ $<

$(DEPDIR): ; @mkdir -p $@

DEPFILES := $(SRCS:%.cpp=$(DEPDIR)/%.d)
$(DEPFILES):

include $(wildcard $(DEPFILES))
