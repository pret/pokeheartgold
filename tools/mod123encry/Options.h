#ifndef GUARD_OPTIONS_H
#define GUARD_OPTIONS_H
#include <iostream>
#include <string>
#include <cstring>
#include "NtrRom.h"
#include "Decrypt.h"

enum ExecMode {
    EXEC_DECRY = 0,
    EXEC_ENCRY = 1,
};

struct ExecMode_s {
    ExecMode _;
    ExecMode_s(const char * value) {
        if (strcmp(value, "decry") == 0) {
            _ = EXEC_DECRY;
        } else if (strcmp(value, "encry") == 0) {
            _ = EXEC_ENCRY;
        } else {
            throw std::invalid_argument(std::string("invalid ExecMode value ") + value);
        }
    }
};

struct EncryptOptions {};

struct Options {
    ExecMode mode;
    union {
        DecryptOptions * decrypt;
        EncryptOptions * encrypt;
    };

    Options(int argc, char ** argv);
    ~Options();
    int main();
private:
    bool TranslateExecMode(const char * value);
};

#endif //GUARD_OPTIONS_H
