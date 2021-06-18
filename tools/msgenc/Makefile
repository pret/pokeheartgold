CXXFLAGS := -std=c++17 -O2 -Wall -Wno-switch
CFLAGS   := -O2 -Wall -Wno-switch

.PHONY: all clean

all: msgenc
	@:

clean:
	$(RM) msgenc msgenc.exe

msgenc: msgenc.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^
