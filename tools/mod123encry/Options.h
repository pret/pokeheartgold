#ifndef GUARD_OPTIONS_H
#define GUARD_OPTIONS_H
#include <iostream>
#include <string>
#include <cstring>
#include "NtrRom.h"
#include "Decrypt.h"
#include "Encrypt.h"

enum ExecMode {
    EXEC_DECRY = 0,
    EXEC_ENCRY = 1,
};

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
