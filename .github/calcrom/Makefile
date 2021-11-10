CXX := g++
CXXFLAGS := -g -O2 -std=c++17
ifeq ($(DEBUG),)
CXXFLAGS += -DNDEBUG
endif

ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

CXXSRCS := calcrom.cpp BuildAnalyzer.cpp ElfFile.cpp Glob.cpp
CXXOBJS := $(CXXSRCS:%.cpp=%.o)

DEPDIR := .deps
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d

TARGET := calcrom$(EXE)

.PHONY: all clean

all: $(TARGET)

clean:
	$(RM) -r $(TARGET) $(CXXOBJS) $(DEPDIR)

$(TARGET): $(CXXOBJS)
	$(CXX) $(LDFLAGS) -o $@ $^

%.o: %.cpp
%.o: %.cpp $(DEPDIR)/%.d | $(DEPDIR)
	$(CXX) $(CXXFLAGS) $(DEPFLAGS) -c -o $@ $<

$(DEPDIR): ; @mkdir -p $@

DEPFILES := $(CXXSRCS:%.cpp=$(DEPDIR)/%.d)
$(DEPFILES):

include $(wildcard $(DEPFILES))
