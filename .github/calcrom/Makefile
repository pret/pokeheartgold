CXX := g++
CXXFLAGS := -g -O3 -std=c++11
ifeq ($(DEBUG),)
CXXFLAGS += -DNDEBUG
endif

ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

TARGET := calcrom$(EXE)

.PHONY: all

all: $(TARGET)

$(TARGET): calcrom.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^
