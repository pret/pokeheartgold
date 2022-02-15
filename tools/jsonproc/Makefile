CXXFLAGS := -Wall -std=c++11 -O2

INCLUDES := -I .

SRCS := jsonproc.cpp

HEADERS := jsonproc.h \
	inja.hpp \
	config.hpp \
	environment.hpp \
	exceptions.hpp \
	function_storage.hpp \
	lexer.hpp \
	node.hpp \
	parser.hpp \
	renderer.hpp \
	statistics.hpp \
	string_view.hpp \
	template.hpp \
	token.hpp \
	utils.hpp \
 	nlohmann/json.hpp

.PHONY: all clean

all: jsonproc
	@:

jsonproc: $(SRCS) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(SRCS) -o $@ $(LDFLAGS)

clean:
	$(RM) jsonproc jsonproc.exe
