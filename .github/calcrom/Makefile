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

TARGET := calcrom$(EXE)

.PHONY: all clean

all: $(TARGET)

$(TARGET): calcrom.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^

clean:
	$(RM) $(TARGET)
