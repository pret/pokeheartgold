CXX := g++
CXXFLAGS := -O3 -std=c++11 -g

CXXSRCS := o2narc.cpp Options.cpp RelocElfReader.cpp
CXXOBJS := $(CXXSRCS:%.cpp=%.o)

.PHONY: all clean

all: o2narc
	@:

o2narc: $(CXXOBJS)
	$(CXX) $(LDFLAGS) -o $@ $^

DEPDIR := .deps
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d
$(DEPDIR): ; @mkdir -p $@

%.o: %.cpp
%.o: %.cpp $(DEPDIR)/%.d | $(DEPDIR)
	$(CXX) $(CXXFLAGS) $(DEPFLAGS) -c -o $@ $<

clean:
	$(RM) o2narc o2narc.exe

DEPFILES := $(CXXSRCS:%.cpp=$(DEPDIR)/%.d)
$(DEPFILES):

include $(wildcard $(DEPFILES))
