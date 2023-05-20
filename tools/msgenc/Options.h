#ifndef GUARD_OPTIONS_H
#define GUARD_OPTIONS_H

#include <cstdint>
#include <iostream>
#include <string>
#include <vector>

using namespace std;

enum ConvertMode : uint8_t {
    CONV_ENCODE = 0,
    CONV_DECODE,
    CONV_INVALID = 0xFF,
};

struct Options {
    ConvertMode mode = CONV_INVALID;
    int key = 0;
    vector<string> posargs;
    string failReason;
    string charmap;
    bool printUsage = false;
    bool printVersion = false;
    string dumpBinary;
    string gmm_header = "";
    typedef int txtfmt;
    static const txtfmt PlainText = 0;
    static const txtfmt GamefreakGMM = 1;
    txtfmt textFormat = PlainText;
    Options(int argc, char ** argv);
};

#endif //GUARD_OPTIONS_H
