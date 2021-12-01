#ifndef GUARD_OPTIONS_H
#define GUARD_OPTIONS_H

#include "global.h"
#include "CsvFile.h"
#include "Manifest.h"

enum ExecMode {
    EXEC_UNSET   = 0,
    EXEC_CSV2BIN = 1,
    EXEC_BIN2CSV = 2,
};

class argument_error : public std::runtime_error {
public:
    explicit argument_error(const char *s) : std::runtime_error(s) {}
    explicit argument_error(const std::string &s) : std::runtime_error(s) {}
};

class Options {
    ExecMode execMode = EXEC_UNSET;
    union {
        std::ifstream *in;
        std::ofstream *out;
    } binfile;
    CsvFile csvFile;
    Manifest manifest;
    std::vector<fs::path> include_paths;
    std::vector<std::string> posargs;
    bool narc_mode = false;
    bool naix_mode = false;
    unsigned char padval = 0;

    int main_compile();
    int main_disasm();
public:
    static void short_usage(std::ostream &strm = std::cout);
    static void usage(std::ostream &strm = std::cout);
    Options(int argc, char ** argv);
    ~Options();
    int main();
};


#endif //GUARD_OPTIONS_H
