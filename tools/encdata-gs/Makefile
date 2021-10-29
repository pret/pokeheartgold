CXX := g++

CXXFLAGS := -std=c++17 -O2 -g

DEPDIR := .deps
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d

CXX_SRCS := encdata-gs.cpp CsvFile.cpp ParseSpeciesHeader.cpp EncDataCsv.cpp

CXX_OBJS := $(CXX_SRCS:%.cpp=%.o)
SRCS     := $(CXX_SRCS)
OBJS     := $(CXX_OBJS)

PROGRAM  := encdata-gs

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
