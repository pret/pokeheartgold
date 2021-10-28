CXX := g++

CXXFLAGS := -std=c++17 -O2

DEPDIR := .deps
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d

CXX_SRCS := encdata-gs.cpp CsvFile.cpp ParseSpeciesHeader.cpp

CXX_OBJS := $(CXX_SRCS:%.cpp=%.o)
SRCS     := $(CXX_SRCS)
OBJS     := $(CXX_OBJS)

PROGRAM  := encdata-gs

.PHONY: all clean

all: $(PROGRAM)
	@:

clean:
	$(RM) -r msgenc msgenc.exe $(OBJS) $(DEPDIR)

$(PROGRAM): $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $^

%.o: %.cpp
%.o: %.cpp $(DEPDIR)/%.d | $(DEPDIR)
	$(CXX) $(CXXFLAGS) $(DEPFLAGS) -c -o $@ $<

$(DEPDIR): ; @mkdir -p $@

DEPFILES := $(SRCS:%.cpp=$(DEPDIR)/%.d)
$(DEPFILES):

include $(wildcard $(DEPFILES))
