CXX := g++
CXXFLAGS := -O3 -std=c++11

all: o2narc
	@:

o2narc: o2narc.cpp elf.h
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
	$(RM) o2narc o2narc.exe
