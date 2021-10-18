#ifndef GUARD_OPTIONS_H
#define GUARD_OPTIONS_H
#include <iostream>
#include <string>
#include <cstring>
#include "NtrRom.h"

enum ExecMode {
    EXEC_DECRY = 0,
    EXEC_ENCRY = 1,
};

struct Options {
    Options(int argc, char ** argv) {};
    virtual ~Options() = default;
    virtual int main() = 0;
    static ExecMode TranslateExecMode(const char * value) {
        ExecMode mode;
        if (strcmp(value, "decry") == 0) {
            mode = EXEC_DECRY;
        } else if (strcmp(value, "encry") == 0) {
            mode = EXEC_ENCRY;
        } else {
            throw std::invalid_argument(std::string("invalid ExecMode value: expected 'encry' or 'decry'; got ") + value);
        }
        return mode;
    }
};

#endif //GUARD_OPTIONS_H
